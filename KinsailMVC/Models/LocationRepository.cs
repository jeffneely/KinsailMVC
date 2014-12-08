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
            "       COALESCE(agg.SiteCount, 0) AS TotalReservableSites, " +
            "       a.LocationID AS AddressId, a.LocationName AS Name, a.StreetAddress AS Street, a.StreetAddress2 AS Street2, " +
            "       a.City, a.State, a.ZipCode AS Zip, a.Country, a.Longitude, a.Latitude, " +
            "       g.ImageID, g.IconURL, g.FullURL";

        private static string selectLocationDetail =
            "SELECT l.ItemID, l.Name, " +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone, " +
            "       m.TilesURL AS MapTilesBaseURL, " +
            "       av.Policies AS reservationPolicies, av.CancelBeforeDays AS CancellationDaysBeforeReservation, " +
            "       av.AvailStartMonth AS AvailabilityStartMonth, av.AvailStartDay AS AvailabilityStartDay, " +
            "       av.AvailEndMonth AS AvailabilityEndMonth, av.AvailEndDay AS AvailabilityEndDay, " +
            "       CASE WHEN agg.MinWeekdayRate < agg.MinWeekendRate THEN agg.MinWeekdayRate ELSE agg.MinWeekendRate END AS PriceMin, " +
            "       CASE WHEN agg.MaxWeekdayRate > agg.MaxWeekendRate THEN agg.MaxWeekdayRate ELSE agg.MaxWeekendRate END AS PriceMax, " +
            "       COALESCE(agg.SiteCount, 0) AS TotalReservableSites, " +
            "       a.LocationID AS AddressId, a.LocationName AS Name, a.StreetAddress AS Street, a.StreetAddress2 AS Street2, " +
            "       a.City, a.State, a.ZipCode AS Zip, a.Country, a.Longitude, a.Latitude, " +
            "       g.ImageID, g.IconURL, g.FullURL, " +
            "       b.ImageID, b.IconURL, b.FullURL";

        private static string fromJoinLocationBasic =
            "  FROM Items l " +
            "  LEFT OUTER JOIN ItemsXOrganizations ixo on l.ItemID = ixo.ItemID " +     // organization
            "  LEFT OUTER JOIN Organizations o ON ixo.OrgID = o.OrgID " +
            "  LEFT OUTER JOIN LocationsSitesRates agg ON l.ItemID = agg.LocationID " + // child site aggregate info by location
            "  LEFT OUTER JOIN ItemsXLocations ixl on l.ItemID = ixl.ItemID " +         // address
            "  LEFT OUTER JOIN Locations a ON ixl.LocationID = a.LocationID " +
            "  LEFT OUTER JOIN ItemsXFirstGalleryImage ixg ON l.ItemID = ixg.ItemID" +  // first gallery image
            "  LEFT OUTER JOIN Images g ON g.ImageID = ixg.ImageID ";


        private static string fromJoinLocationDetail = fromJoinLocationBasic + 
            "  LEFT OUTER JOIN ItemsXMaps ixm ON l.ItemID = ixm.ItemID " +              // maps
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID " +
            "  LEFT OUTER JOIN ItemsXAvailability ixa ON l.ItemID = ixa.ItemID " +      // availability info
            "  LEFT OUTER JOIN Availability av ON ixa.AvailID = av.AvailID " +
            "  LEFT OUTER JOIN ItemsXFirstBannerImage ixb ON l.ItemID = ixb.ItemID " +  // first banner image 
            "  LEFT OUTER JOIN Images b ON b.ImageID = ixb.ImageID";

        private static string whereOrderLocations =
            " WHERE l.ItemTypeID = @0" +
            " ORDER BY l.Name";

        private static string whereOrderLocationById =
            " WHERE l.ItemTypeID = @0" +
            "   AND l.ItemID = @1" +
            " ORDER BY l.Name";

        // return list of features
        private static string selectFeatures =
            "SELECT ixf.ID AS FeatureID, f.Abbreviation AS Name, f.Description, ixf.Value " +
            "  FROM ItemsXFeatures ixf " +
            "  LEFT OUTER JOIN Features f ON ixf.FeatureID = f.FeatureID " +
            " WHERE ixf.ItemID = @0";

        // return list of gallery images, excluding the first
        private static string selectPhotos =
            "SELECT ImageID, ImageTypeID, IconURL, FullURL, Caption, Source, Active " +
            "  FROM (SELECT i.*, ROW_NUMBER() OVER (ORDER BY ixi.DisplayOrder) AS RowNum " +
            "          FROM Images i " +
            "          JOIN ItemsXImages ixi ON ixi.ImageID = i.ImageID " +
            "         WHERE ixi.ItemID = @0 " +
            "           AND i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')) img " +
            " WHERE RowNum > 1 " +
            " ORDER BY RowNum";

        
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
                .Append(fromJoinLocationBasic) 
                .Append(whereOrderLocations, locationItemTypeId);
            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            return locations;
        }

        public List<LocationDetail> GetAllDetails()
        {
            // get locations
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail) 
                .Append(whereOrderLocations, locationItemTypeId);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);

            foreach (LocationDetail location in locations)
            {
                // get features for each location
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, location.locationId);
                location.features = features.ToArray();

                // get gallery images for each location, excluding the first one
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<GalleryImage> photos = db.Fetch<GalleryImage>(selectPhotos, location.locationId);
                location.photos = photos.ToArray();
            }
            return locations;
        }

        public LocationBasic GetbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic) 
                .Append(whereOrderLocationById, locationItemTypeId, locationId);
            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            Debug.Print("Result set (locations) has {0} elements", locations.Count);
            return locations.ElementAtOrDefault(0);
        }

        public LocationDetail GetDetailbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail) 
                .Append(whereOrderLocationById, locationItemTypeId, locationId);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);
            Debug.Print("Result set (locations) has {0} elements", locations.Count);
            LocationDetail location = locations.ElementAtOrDefault(0);

            // get features for location
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, location.locationId);
            location.features = features.ToArray();

            // get gallery images for each location, excluding the first one
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<GalleryImage> photos = db.Fetch<GalleryImage>(selectPhotos, location.locationId);
            location.photos = photos.ToArray();

            return location;
        }
    }   
}