using NPoco;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    //TODO: refactor db connection as a factory?
    //TODO: handle multiple itemsxlocations/addresses per location
    //TODO: handle multiple itemsxorgs/orgs per location
    //TODO: handle multiple itemsxavail/availability rows per location
    //TODO: handle multiple itemsxmaps/maps rows per location
    //TODO: UKs to constrain intersections??
    //
    public class LocationRepository
    {
        private IDatabase db;
        private long siteItemTypeId = 0;
        private long locationItemTypeId = 0;
        private long galleryImageTypeId = 0;
        private long bannerImageTypeId = 0;

        private static string selectLocationBasic =
            "SELECT l.ItemID, l.Name, " +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone, " +
            "       COALESCE(agg.Count, 0) AS TotalReservableSites, " +
            "       la.LocationID AS AddressId, la.LocationName AS Name, la.StreetAddress AS Street, la.StreetAddress2 AS Street2, " +
            "       la.City, la.State, la.ZipCode AS Zip, la.Country, la.Longitude, la.Latitude, " +
            "       ig.ImageID, ig.IconURL, ig.FullURL";

        private static string selectLocationDetail =
            "SELECT l.ItemID, l.Name, " +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone, " +
            "       m.TilesURL AS MapTilesURL, " +
            "       a.Policies AS reservationPolicies, a.CancelBeforeDays AS CancellationDaysBeforeReservation, " +
            "       a.AvailStartMonth AS AvailabilityStartMonth, a.AvailStartDay AS AvailabilityStartDay, " +
            "       a.AvailEndMonth AS AvailabilityEndMonth, a.AvailEndDay AS AvailabilityEndDay, " +
            "       CASE WHEN agg.MinWeekday < agg.MinWeekend THEN agg.MinWeekday ELSE agg.MinWeekend END AS PriceMin, " +
            "       CASE WHEN agg.MaxWeekday > agg.MaxWeekend THEN agg.MaxWeekday ELSE agg.MaxWeekend END AS PriceMax, " +
            "       COALESCE(agg.Count, 0) AS TotalReservableSites, " +
            "       la.LocationID AS AddressId, la.LocationName AS Name, la.StreetAddress AS Street, la.StreetAddress2 AS Street2, " +
            "       la.City, la.State, la.ZipCode AS Zip, la.Country, la.Longitude, la.Latitude, " +
            "       ig.ImageID, ig.IconURL, ig.FullURL, " +
            "       ib.ImageID, ib.IconURL, ib.FullURL";

        private static string fromJoinLocationBasic =
            "  FROM Items l " +
            "  LEFT OUTER JOIN ItemsXOrganizations ixo on l.ItemID = ixo.ItemID " +  // organization
            "  LEFT OUTER JOIN Organizations o ON ixo.OrgID = o.OrgID " +
            "  LEFT OUTER JOIN (SELECT i.ItemID AS LocationID, MIN(mmc.MinWeekday) AS MinWeekday, " + // child site aggregate info by location
            "                          MIN(mmc.MinWeekend) AS MinWeekend, MAX(mmc.MaxWeekday) AS MaxWeekday, " +
            "                          MAX(mmc.MaxWeekend) AS MaxWeekend, COUNT(*) AS Count " +
            "                     FROM Items i " +
            "                     LEFT OUTER JOIN ItemsXItems ixi ON i.ItemID = ixi.ParentItemID " +  // child sites
            "                     LEFT OUTER JOIN Items s ON ixi.ItemID = s.ItemID " +
            "                          INNER JOIN (SELECT ixa.ItemID, " +            // min/max site costs (for any number of associated availability rows)
            "                                             MIN(ixa.WeekdayRate) AS MinWeekday, MIN(ixa.WeekendRate) AS MinWeekend, " +
            "                                             MAX(ixa.WeekdayRate) AS MaxWeekday, MAX(ixa.WeekendRate) AS MaxWeekend " +
            "                                        FROM ItemsXAvailability ixa " +
            "                                       GROUP BY ixa.ItemID) mmc ON s.ItemID = mmc.ItemID " +
            "                    WHERE i.ItemTypeID = @0 " +
            "                      AND s.ItemTypeID = @1 " +
            "                    GROUP BY i.ItemID) agg ON l.ItemID = agg.LocationID " +
            "  LEFT OUTER JOIN ItemsXLocations ixl on l.ItemID = ixl.ItemID " +      // address
            "  LEFT OUTER JOIN Locations la ON ixl.LocationID = la.LocationID " +
            "  LEFT OUTER JOIN ItemsXImages ixgg ON l.ItemID = ixgg.ItemID " +       // gallery image
            "  LEFT OUTER JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder " + // only include the first gallery image
            "                     FROM ItemsXImages x " +
            "                     JOIN (SELECT i.ImageID " +
            "                             FROM Images i " +
            "                            WHERE i.ImageTypeID = @2) gi ON x.ImageID = gi.ImageID " +
            "                    GROUP BY x.ItemID) gi1 ON l.ItemID = gi1.ItemID " +
            "              AND ixgg.DisplayOrder = gi1.DisplayOrder " +
            "  LEFT OUTER JOIN Images ig ON ig.ImageID = ixgg.ImageID ";


        private static string fromJoinLocationDetail = fromJoinLocationBasic + 
            "  LEFT OUTER JOIN ItemsXMaps ixm ON l.ItemID = ixm.ItemID " +           // maps
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID " +
            "  LEFT OUTER JOIN ItemsXAvailability ixa ON l.ItemID = ixa.ItemID " +   // availability info
            "  LEFT OUTER JOIN Availability a ON ixa.AvailID = a.AvailID " +
            "  LEFT OUTER JOIN ItemsXImages ixgb ON l.ItemID = ixgb.ItemID " +       // banner image
            "  LEFT OUTER JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder " + // only include the first image 
            "                     FROM ItemsXImages x " +
            "                     JOIN (SELECT i.ImageID " +
            "                             FROM Images i " +
            "                            WHERE i.ImageTypeID = @3) bi ON x.ImageID = bi.ImageID " +
            "                    GROUP BY x.ItemID) bi1 ON l.ItemID = bi1.ItemID " +
            "              AND ixgb.DisplayOrder = bi1.DisplayOrder " +
            "  LEFT OUTER JOIN Images ib ON ib.ImageID = ixgb.ImageID";

        private static string whereOrderLocations =
            " WHERE l.ItemTypeID = @0" +
            " ORDER BY l.Name";

        private static string whereOrderLocationById =
            " WHERE l.ItemTypeID = @0" +
            "   AND l.ItemID = @1" +
            " ORDER BY l.Name";

        private static string selectFeatures =
            "SELECT ixf.ID AS FeatureID, f.Abbreviation AS Name, f.Description, ixf.Value " +
            "  FROM ItemsXFeatures ixf " +
            "  LEFT OUTER JOIN Features f ON ixf.FeatureID = f.FeatureID " +
            " WHERE ixf.ItemID = @0";

        public LocationRepository()
        {
            db = new Database("DB1/Kinsail_JNeely");
            setup();
        }

        public LocationRepository(IDatabase database)
        {
            db = database;
            setup();
        }

        // retrieve some important key values, so we don't have to keep querying for them each time
        private void setup()
        {
            siteItemTypeId = db.ExecuteScalar<long>("SELECT ItemTypeID from ItemTypes WHERE Name = 'Recreation Site'");
            locationItemTypeId = db.ExecuteScalar<long>("SELECT ItemTypeID from ItemTypes WHERE Name = 'Recreation Location'");
            galleryImageTypeId = db.ExecuteScalar<long>("SELECT ImageTypeID from ImageTypes WHERE Name = 'Gallery Image'");
            bannerImageTypeId = db.ExecuteScalar<long>("SELECT ImageTypeID from ImageTypes WHERE Name = 'Banner Image'");
        }


        public List<LocationBasic> GetAll()
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic, locationItemTypeId, siteItemTypeId, galleryImageTypeId)
                .Append(whereOrderLocations, locationItemTypeId);
            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            return locations;
        }

        public List<LocationDetail> GetAllDetails()
        {
            // get locations
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail, locationItemTypeId, siteItemTypeId, galleryImageTypeId, bannerImageTypeId)
                .Append(whereOrderLocations, locationItemTypeId);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);

            foreach (LocationDetail location in locations)
            {
                // get features for each location
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, location.locationId);
                location.features = features.ToArray();
            }
            return locations;
        }

        public LocationBasic GetbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic, locationItemTypeId, siteItemTypeId, galleryImageTypeId)
                .Append(whereOrderLocationById, locationItemTypeId, locationId);
            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            Debug.Print("Result set (locations) has {0} elements", locations.Count);
            return locations.ElementAtOrDefault(0);
        }

        public LocationDetail GetDetailbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail, locationItemTypeId, siteItemTypeId, galleryImageTypeId, bannerImageTypeId)
                .Append(whereOrderLocationById, locationItemTypeId, locationId);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);
            Debug.Print("Result set (locations) has {0} elements", locations.Count);
            LocationDetail location = locations.ElementAtOrDefault(0);

            // get features for location
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, location.locationId);
            location.features = features.ToArray();

            return location;
        }
    }   
}