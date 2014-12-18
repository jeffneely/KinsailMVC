using NPoco;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Text;
using KinsailMVC.Models;
using System.Net.Http;
using System.Globalization;

namespace KinsailMVC.Models
{
    //TODO: refactor db connection as a factory?
    //TODO: handle multiple itemsxlocations/addresses per location
    //TODO: handle multiple itemsxorgs/orgs per location
    //TODO: handle multiple itemsxavail/availability rows per location
    //TODO: handle multiple itemsxmaps/maps rows per location
    //TODO: UKs to constrain intersections??
    //
    //TODO: handle query string for locations/details calls
    //TODO: copy all handling to sites calls
    //
    public class LocationRepository
    {
        private IDatabase db;
        private long siteItemTypeId = 0;
        private long locationItemTypeId = 0;
        private long galleryImageTypeId = 0;
        private long bannerImageTypeId = 0;
        private Dictionary<string, SqlCriteria> allFeatures = new Dictionary<string, SqlCriteria>();
        private static string br = Environment.NewLine;

        private static string selectLocationBasic =
            "SELECT l.ItemID, l.Name," + br +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone," + br +
            "       COALESCE(agg.SiteCount, 0) AS TotalReservableSites," + br +
            "       a.LocationID AS AddressId, a.LocationName AS Name, a.StreetAddress AS Street, a.StreetAddress2 AS Street2," + br +
            "       a.City, a.State, a.ZipCode AS Zip, a.Country, a.Longitude, a.Latitude," + br +
            "       g.ImageID, g.IconURL, g.FullURL";

        private static string selectLocationDetail =
            "SELECT l.ItemID, l.Name," + br +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone," + br +
            "       m.TilesURL AS MapTilesBaseURL," + br +
            "       av.Policies AS reservationPolicies, av.CancelBeforeDays AS CancellationDaysBeforeReservation," + br +
            "       av.AvailStartMonth AS AvailabilityStartMonth, av.AvailStartDay AS AvailabilityStartDay," + br +
            "       av.AvailEndMonth AS AvailabilityEndMonth, av.AvailEndDay AS AvailabilityEndDay," + br +
            "       CASE WHEN agg.MinWeekdayRate < agg.MinWeekendRate THEN agg.MinWeekdayRate ELSE agg.MinWeekendRate END AS PriceMin," + br +
            "       CASE WHEN agg.MaxWeekdayRate > agg.MaxWeekendRate THEN agg.MaxWeekdayRate ELSE agg.MaxWeekendRate END AS PriceMax," + br +
            "       COALESCE(agg.SiteCount, 0) AS TotalReservableSites," + br +
            "       a.LocationID AS AddressId, a.LocationName AS Name, a.StreetAddress AS Street, a.StreetAddress2 AS Street2," + br +
            "       a.City, a.State, a.ZipCode AS Zip, a.Country, a.Longitude, a.Latitude," + br +
            "       g.ImageID, g.IconURL, g.FullURL," + br +
            "       b.ImageID, b.IconURL, b.FullURL";

        private static string fromJoinLocationBasic =
            "  FROM Items l" + br +
            "  LEFT OUTER JOIN ItemsXOrganizations ixo on l.ItemID = ixo.ItemID" + br +     // organization
            "  LEFT OUTER JOIN Organizations o ON ixo.OrgID = o.OrgID" + br +
            "  LEFT OUTER JOIN LocationsSitesRates agg ON l.ItemID = agg.LocationID" + br + // child site aggregate info by location
            "  LEFT OUTER JOIN ItemsXLocations ixl on l.ItemID = ixl.ItemID" + br +         // address
            "  LEFT OUTER JOIN Locations a ON ixl.LocationID = a.LocationID" + br + 
            "  LEFT OUTER JOIN ItemsXFirstGalleryImage ixg ON l.ItemID = ixg.ItemID" + br + // first gallery image
            "  LEFT OUTER JOIN Images g ON g.ImageID = ixg.ImageID";


        private static string fromJoinLocationDetail = fromJoinLocationBasic + br +
            "  LEFT OUTER JOIN ItemsXMaps ixm ON l.ItemID = ixm.ItemID" + br +             // maps
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID" + br +
            "  LEFT OUTER JOIN ItemsXAvailability ixa ON l.ItemID = ixa.ItemID" + br +     // availability info
            "  LEFT OUTER JOIN Availability av ON ixa.AvailID = av.AvailID" + br +
            "  LEFT OUTER JOIN ItemsXFirstBannerImage ixb ON l.ItemID = ixb.ItemID" + br + // first banner image 
            "  LEFT OUTER JOIN Images b ON b.ImageID = ixb.ImageID";

        private static string whereLocations =
            " WHERE l.ItemTypeID = @0";

        private static string whereLocationById =
            " WHERE l.ItemTypeID = @0" + br +
            "   AND l.ItemID = @1";

        private static string andWhereLocationHasFeatures_pre =
            "   AND l.ItemID IN (SELECT i.ItemID" + br +
            "                      FROM Items i" + br +
            "                      JOIN ItemsXFeatures ixf ON i.ItemID = ixf.ItemID" + br +
            "                      JOIN Features f ON f.FeatureID = ixf.FeatureID" + br +
            "                     WHERE ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location')" + br +
            "                       AND ( " + br;

        private static string andWhereLocationFeature =
            "                             (ixf.FeatureID = {0} AND ixf.Value = {1})" + br;

        private static string andWhereLocationHasFeatures_post =
            "                           )" + br +
            "                     GROUP BY i.ItemID" + br +
            "                    HAVING COUNT(f.FeatureID) >= {0})";

        private static string orderLocations =
            " ORDER BY l.Name";

        // return list of features
        private static string queryFeatures =
            "SELECT ixf.ID AS FeatureID, f.Abbreviation AS Name, f.Description, ixf.Value" + br +
            "  FROM ItemsXFeatures ixf" + br +
            "  LEFT OUTER JOIN Features f ON ixf.FeatureID = f.FeatureID" + br +
            " WHERE ixf.ItemID = @0";

        // return list of all defined features (to cache)
        private static string queryAllFeatures =
            "SELECT LOWER(f.Abbreviation) AS Name, f.FeatureID, ft.Category" + br +
            "  FROM Features f" + br +
            "  JOIN FeatureTypes ft ON f.FeatureTypeID = ft.FeatureTypeID";

        
        // return list of gallery images, excluding the first
        private static string queryPhotos =
            "SELECT ImageID, ImageTypeID, IconURL, FullURL, Caption, Source, Active" + br +
            "  FROM (SELECT i.*, ROW_NUMBER() OVER (ORDER BY ixi.DisplayOrder) AS RowNum" + br +
            "          FROM Images i" + br +
            "          JOIN ItemsXImages ixi ON ixi.ImageID = i.ImageID" + br +
            "         WHERE ixi.ItemID = @0" + br +
            "           AND i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')) img" + br +
            " WHERE RowNum > 1" + br +
            " ORDER BY RowNum" + br;

        // map the LocationDetail properties to WHERE clause conditions to be used in the query
        // this includes aliases/columns and default comparison operators
        public static Dictionary<string, SqlCriteria> mapLocationProps = new Dictionary<string, SqlCriteria>()
        {
            {"locationid",                 new SqlCriteria("   AND l.ItemID = {0}" + br, CriteriaType.NUMBER)},
            {"title",                      new SqlCriteria("   AND l.Name LIKE N'%{0}%'" + br, CriteriaType.TEXT)},
            {"street",                     new SqlCriteria("   AND a.StreetAddress = N'{0}'" + br, CriteriaType.TEXT)},
            {"street2",                    new SqlCriteria("   AND a.StreetAddress2 = N'{0}'" + br, CriteriaType.TEXT)},
            {"city",                       new SqlCriteria("   AND a.City = N'{0}'" + br, CriteriaType.TEXT)},
            {"state",                      new SqlCriteria("   AND a.State = N'{0}'" + br, CriteriaType.TEXT)},
            {"zip",                        new SqlCriteria("   AND a.ZipCode = N'{0}'" + br, CriteriaType.TEXT)},
            {"country",                    new SqlCriteria("   AND a.Country = N'{0}'" + br, CriteriaType.TEXT)},
            {"longitude",                  new SqlCriteria("   AND a.Longitude = {0}" + br, CriteriaType.NUMBER)},
            {"latitude"            ,       new SqlCriteria("   AND a.Latitude = {0}" + br, CriteriaType.NUMBER)},
            {"operatingorganization",      new SqlCriteria("   AND o.Name LIKE N'%{0}%'" + br, CriteriaType.TEXT)},
            {"operatingorganizationphone", new SqlCriteria("   AND o.Phone = N'{0}'" + br, CriteriaType.TEXT)},
            {"reservationphone",           new SqlCriteria("   AND o.Phone2 = N'{0}'" + br, CriteriaType.TEXT)},
            {"totalreservablesites",       new SqlCriteria("   AND agg.SiteCount = {0}" + br, CriteriaType.NUMBER)},
            {"reservationpolicies",        new SqlCriteria("   AND av.Policies LIKE N'%{0}%'" + br, CriteriaType.TEXT)},  // find policies containing VALUE
            {"availabilitystartmonth",     new SqlCriteria("   AND av.AvailStartMonth = {0}" + br, CriteriaType.NUMBER)},
            {"availabilitystartday",       new SqlCriteria("   AND av.AvailStartDay = {0}" + br, CriteriaType.NUMBER)},
            {"availabilityendmonth",       new SqlCriteria("   AND av.AvailEndMonth = {0}" + br, CriteriaType.NUMBER)},
            {"availabilityendday",         new SqlCriteria("   AND av.AvailEndDay = {0}" + br, CriteriaType.NUMBER)},
            {"pricemin",                   new SqlCriteria("   AND PriceMin >= {0}" + br, CriteriaType.NUMBER)},           // find PriceMin >= VALUE
            {"pricemax",                   new SqlCriteria("   AND PriceMax <= {0}" + br, CriteriaType.NUMBER)},           // find PriceMax <= VALUE
            {"cancellationdaysbeforereservation", new SqlCriteria("   AND av.CancelBeforeDays = {0}" + br, CriteriaType.NUMBER)},
        };


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

            // load the complete list of all features that are defined in the database
            List<object[]> features = db.Fetch<object[]>(queryAllFeatures);
            foreach (object[] row in features)
            {
                CriteriaType t;
                switch ((string)row[2])
                {
                    case "NUMBER":
                    case "ENUM":
                        t = CriteriaType.NUMBER;
                        break;
                    case "DATE":
                        t = CriteriaType.DATE;
                        break;
                    case "TEXT":
                    default:
                        t = CriteriaType.TEXT;
                        break;
                }
                allFeatures.Add((string)row[0], new SqlCriteria("", t, (long)row[1]));
            }
        }


        public List<LocationBasic> GetAll(Dictionary<string, string> queryParams = null)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic) 
                .Append(whereLocations, locationItemTypeId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams));
            }
            
            sql = sql.Append(orderLocations);

            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            return locations;
        }

        public List<LocationDetail> GetAllDetails()
        {
            // get locations
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail)
                .Append(whereLocations, locationItemTypeId)
                .Append(orderLocations);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);

            foreach (LocationDetail location in locations)
            {
                // get features for each location
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(queryFeatures, location.locationId);
                location.features = features.ToArray();

                // get gallery images for each location, excluding the first one
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<GalleryImage> photos = db.Fetch<GalleryImage>(queryPhotos, location.locationId);
                location.photos = photos.ToArray();
            }
            return locations;
        }

        public LocationBasic GetbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic) 
                .Append(whereLocationById, locationItemTypeId, locationId)
                .Append(orderLocations);
            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            //Debug.Print("Result set (locations) has {0} elements", locations.Count);
            return locations.ElementAtOrDefault(0);
        }

        public LocationDetail GetDetailbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail) 
                .Append(whereLocationById, locationItemTypeId, locationId)
                .Append(orderLocations);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);
            //Debug.Print("Result set (locations) has {0} elements", locations.Count);
            LocationDetail location = locations.ElementAtOrDefault(0);

            // get features for location
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(queryFeatures, location.locationId);
            location.features = features.ToArray();

            // get gallery images for each location, excluding the first one
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<GalleryImage> photos = db.Fetch<GalleryImage>(queryPhotos, location.locationId);
            location.photos = photos.ToArray();

            return location;
        }

        // generate additional WHERE clauses based on the passed in URI querystring parameters
        // handles:
        // - unknown params (skip them in the SQL)
        // - params for object properties (including a default operator that makes sense)
        // - params for feature children
        // - params for multiple feature children
        // - params for mixed sets of object properties anbd feature children
        // - params with mixed case
        // - empty params (e.g., restrooms=)
        // - quoting for string-valued params
        // - prevents sql injection for types other than strings
        private string generateFilterClauses(Dictionary<string, string> queryParams)
        {
            Dictionary<string, string> filterProperties = new Dictionary<string, string>();
            Dictionary<string, string> filterFeatures = new Dictionary<string, string>();
            Dictionary<string, string> filterOther = new Dictionary<string, string>();
            StringBuilder s = new StringBuilder();
            
            // parse the query params into separate groups (properties, features, other)
            foreach (var item in queryParams)
            {
                if (mapLocationProps.ContainsKey(item.Key))  // is the parameter name a property of LocationDetail object?
                {
                    Debug.Print("Find locations WHERE: " + mapLocationProps[item.Key]);
                    filterProperties.Add(item.Key, item.Value);
                }
                else  
                {
                    if (allFeatures.ContainsKey(item.Key))  // is the parameter name a Feature associated with the LocationDetail object?
                    {
                        Debug.Print("Find locations WHERE feature [FeatureID=" + allFeatures[item.Key].id + "]: " + item.Key + " = " + item.Value);
                        filterFeatures.Add(item.Key, item.Value);
                    }
                    else  // parameter does not match a property or feature
                    {
                        Debug.Print("Unknown param: " + item.Key + " = " + item.Value);
                        filterOther.Add(item.Key, item.Value);
                    }
                }
            }

            // generate WHERE clauses for properties
            foreach (var criteria in filterProperties)
            {
                s.AppendFormat(mapLocationProps[criteria.Key].clause, escapeFilterValue(criteria.Value, mapLocationProps[criteria.Key].type));
            }

            // generate WHERE clauses for features
            if (filterFeatures.Count > 0)
            {
                s.Append(andWhereLocationHasFeatures_pre);
                foreach (var criteria in filterFeatures)
                {
                    s.AppendFormat(andWhereLocationFeature, allFeatures[criteria.Key].id, escapeFilterValue(criteria.Value, mapLocationProps[criteria.Key].type));
                    if (filterFeatures.Last().Key != criteria.Key)
                    {
                        s.Append(" OR ");
                    }
                }
                s.AppendFormat(andWhereLocationHasFeatures_post, filterFeatures.Count);
            }

            return s.ToString();
        }

        // escape values and account for empty values
        // TBD: should these throw HTTP exceptions when a value fails to parse??
        private string escapeFilterValue(string value, CriteriaType type)
        {
            switch (type)
            {
                case CriteriaType.TEXT:
                    return value.Replace("'", "''");

                case CriteriaType.NUMBER:
                    float num;
                    if (Single.TryParse(value, NumberStyles.Number, CultureInfo.CurrentCulture, out num))
                        return value;
                    else
                        return "0";
                case CriteriaType.DATE:
                    DateTime date;
                    if (DateTime.TryParseExact(value, "D", CultureInfo.CurrentCulture, DateTimeStyles.None, out date))
                        return "N'" + value + "'";
                    else
                        return "GETDATE()";
                default:
                    break;
            }
            return "''";
        }
    }   
}

/*
UnsupportedQueryParameter
Bad Request (400)
One of the query parameters specified in the request URI is not supported.

InvalidQueryParameterValue
Bad Request (400)
An invalid value was specified for one of the query parameters in the request URI.

OutOfRangeQueryParameterValue
Bad Request (400)
A query parameter specified in the request URI is outside the permissible range.
*/