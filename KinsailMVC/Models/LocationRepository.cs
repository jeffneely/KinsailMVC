﻿using NPoco;
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
    // Database repository handler for locations
    //
    // TODO: refactor db connection as a factory?
    public class LocationRepository
    {
        private IDatabase db;
        private long siteItemTypeId = 0;
        private long locationItemTypeId = 0;
        private long galleryImageTypeId = 0;
        private long bannerImageTypeId = 0;
        private long baseURLFeatureId = 0;
        
        private Dictionary<string, SqlCriteria> allFeatures = new Dictionary<string, SqlCriteria>();
        private static string br = Environment.NewLine;

        // SQL query for list of all available features
        private static string queryAllFeatures =
            "SELECT LOWER(f.Abbreviation) AS Name, f.FeatureID, ft.Category" + br +
            "  FROM Features f" + br +
            "  JOIN FeatureTypes ft ON f.FeatureTypeID = ft.FeatureTypeID";


        // -- Locations --------------------

        // SQL SELECT fragment for LocationBasic
        private static string selectLocationBasic =
            "SELECT l.ItemID, l.Name, l.Description," + br +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone," + br +
            "       COALESCE(r.SiteCount, 0) AS TotalReservableSites," + br +
            "       a.LocationID AS AddressId, a.LocationName AS Name, a.StreetAddress AS Street, a.StreetAddress2 AS Street2," + br +
            "       a.City, a.State, a.ZipCode AS Zip, a.Country, a.Longitude, a.Latitude," + br +
            "       g.ImageID, g.IconURL AS thumbUrl, g.FullURL";

        // SQL SELECT fragment for LocationDetail
        private static string selectLocationDetail =
            "SELECT l.ItemID, l.Name, l.Description," + br +
            "       o.Name AS OperatingOrganization, o.Phone AS OperatingOrganizationPhone, o.Phone2 AS ReservationPhone," + br +
            "       m.TilesURL AS MapTilesBaseURL," + br +
            "       f1.Value AS BaseURL," + br +
            "       l.GroupID, p.PartnerID, p.PartnerCode, pt.PartnerTypeName AS PartnerType," + br +
            "       av.Policies AS reservationPolicies, av.CancelBeforeDays AS CancellationDaysBeforeReservation," + br +
            "       MONTH(r.MinAvailStartDate) AS AvailabilityStartMonth, DAY(r.MinAvailStartDate) AS AvailabilityStartDay," + br +
            "       MONTH(r.MaxAvailEndDate) AS AvailabilityEndMonth, DAY(r.MaxAvailEndDate) AS AvailabilityEndDay," + br +
            "       CASE WHEN r.MinWeekdayRate < r.MinWeekendRate THEN r.MinWeekdayRate ELSE r.MinWeekendRate END AS PriceMin," + br +
            "       CASE WHEN r.MaxWeekdayRate > r.MaxWeekendRate THEN r.MaxWeekdayRate ELSE r.MaxWeekendRate END AS PriceMax," + br +
            "       COALESCE(r.SiteCount, 0) AS TotalReservableSites," + br +
            "       a.LocationID AS AddressId, a.LocationName AS Name, a.StreetAddress AS Street, a.StreetAddress2 AS Street2," + br +
            "       a.City, a.State, a.ZipCode AS Zip, a.Country, a.Longitude, a.Latitude," + br +
            "       g.ImageID, g.IconURL AS thumbUrl, g.FullURL," + br +
            "       b.ImageID, b.IconURL AS thumbUrl, b.FullURL";

        // SQL FROM/JOIN fragment for LocationBasic
        private static string fromJoinLocationBasic =
            "  FROM Items l" + br +
            "  LEFT OUTER JOIN ItemsXOrganizations ixo ON l.ItemID = ixo.ItemID" + br +      // organization
            "  LEFT OUTER JOIN Organizations o ON ixo.OrgID = o.OrgID" + br +
            "  LEFT OUTER JOIN RatesAtLocations r ON l.ItemID = r.LocationID" + br +         // aggregate site rate/availability info
            "  LEFT OUTER JOIN ItemsXLocations ixl ON l.ItemID = ixl.ItemID" + br +          // location/address
            "  LEFT OUTER JOIN Locations a ON ixl.LocationID = a.LocationID" + br + 
            "  LEFT OUTER JOIN ItemsXFirstGalleryImage ixg ON l.ItemID = ixg.ItemID" + br +  // first gallery image
            "  LEFT OUTER JOIN Images g ON g.ImageID = ixg.ImageID";

        // SQL FROM/JOIN fragment for LocationDetail
        private static string fromJoinLocationDetail = fromJoinLocationBasic + br +
            "  LEFT OUTER JOIN ItemsXFirstMap ixm ON l.ItemID = ixm.ItemID" + br +           // maps
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID" + br +
            "  LEFT OUTER JOIN ItemsXFirstAvailRate ixa ON l.ItemID = ixa.ItemID" + br +     // availability info
            "  LEFT OUTER JOIN Availability av ON ixa.AvailID = av.AvailID" + br +
            "  LEFT OUTER JOIN PartnersXGroups pxg ON pxg.GroupID = l.GroupID" + br +        // partner/group
            "  LEFT OUTER JOIN Partners p ON pxg.PartnerID = p.PartnerID" + br +
            "  LEFT OUTER JOIN PartnerTypes pt ON p.PartnerTypeID = pt.PartnerTypeID" + br +
            "  LEFT OUTER JOIN ItemsXFirstBannerImage ixb ON l.ItemID = ixb.ItemID" + br +   // first banner image 
            "  LEFT OUTER JOIN Images b ON b.ImageID = ixb.ImageID" + br +
            "  LEFT OUTER JOIN (SELECT ItemID, Value" + br +                                 // base url
            "                     FROM ItemsXFeatures" + br +
            "                    WHERE FeatureID = @0) f1 ON l.ItemID = f1.ItemID";

        // SQL WHERE fragment for Locations
        private static string whereLocations =
            " WHERE l.ItemTypeID = @0";

        // SQL WHERE fragment for Locations (by ID)
        private static string whereLocationById =
            " WHERE l.ItemTypeID = @0" + br +
            "   AND l.ItemID = @1";

        // SQL WHERE fragment for Location Features (prefix)
        private static string andWhereLocationHasFeatures_pre =
            "   AND l.ItemID IN (SELECT i.ItemID" + br +
            "                      FROM Items i" + br +
            "                      JOIN ItemsXFeatures ixf ON i.ItemID = ixf.ItemID" + br +
            "                      JOIN Features f ON f.FeatureID = ixf.FeatureID" + br +
            "                     WHERE ItemTypeID = {0}" + br +
            "                       AND ( " + br;

        // SQL WHERE fragment for Location Features
        private static string andWhereLocationFeature =
            "                             (ixf.FeatureID = {0} AND ixf.Value {1})" + br;

        // SQL WHERE fragment for Location Features (suffix)
        private static string andWhereLocationHasFeatures_post =
            "                           )" + br +
            "                     GROUP BY i.ItemID" + br +
            "                    HAVING COUNT(f.FeatureID) >= {0})";

        // SQL ORDER fragment for Locations
        private static string orderLocations =
            " ORDER BY l.Name";


        // -- Location Features --------------------
        
        // SQL query for list of location features (by locationId)
        private static string queryFeatures =
            "SELECT ixf.ID AS id, f.Abbreviation AS name, f.Name AS label, f.Description AS description, ixf.Value AS value, " + br +
            "       dbo.fGetFeatureBullet(f.Name, f.NameNegative, ft.Name, ixf.Value) AS Bullet" + br +
        //  "       CASE ft.Name" + br +
        //  "           WHEN 'Boolean' THEN" + br +
        //  "               CASE ixf.Value" + br +
        //  "                   WHEN 1 THEN f.Name" + br +
        //  "                   ELSE f.NameNegative" + br +
        //  "               END" + br +
        //  "           ELSE f.Name + ': ' + ixf.Value" + br +
        //  "       END AS Bullet" + br +
            "  FROM ItemsXFeatures ixf" + br +
            "  JOIN Features f ON ixf.FeatureID = f.FeatureID" + br +
            "  JOIN FeatureTypes ft ON ft.FeatureTypeID = f.FeatureTypeID" + br +
            " WHERE ixf.ItemID = @0" + br + 
            "   AND f.Active = 1" + br +
            "   AND f.Hidden = 0" + br +
            " ORDER BY ixf.DisplayOrder";

        // SQL query for list of location features (for ALL locations)
        private static string queryLocationFeatures =
            "SELECT i.ItemID AS locationId, ixf.ID AS id, f.Abbreviation AS name, f.Name AS label, f.Description AS description, ixf.Value AS value," + br +
            "       dbo.fGetFeatureBullet(f.Name, f.NameNegative, ft.Name, ixf.Value) AS Bullet" + br +
            "  FROM Items i" + br +
            "  LEFT OUTER JOIN ItemsXFeatures ixf ON ixf.ItemID = i.ItemID" + br +
            "  JOIN Features f ON ixf.FeatureID = f.FeatureID" + br +
            "  JOIN FeatureTypes ft ON ft.FeatureTypeID = f.FeatureTypeID" + br +
            " WHERE i.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location')" + br +
            "   AND f.Active = 1" + br +
            "   AND f.Hidden = 0" + br +
            " ORDER BY i.ItemID, ixf.DisplayOrder";


        // -- Location Photos --------------------

        // SQL query for list of location gallery images, excluding the first for each (by locationId)
        private static string queryPhotos =
            "SELECT g.ImageID AS imageId, g.IconURL AS thumbUrl, g.FullURL AS fullImageUrl, g.Caption AS caption, g.Source AS source" + br +
            "  FROM ItemsXImages ixi" + br +
            "  LEFT OUTER JOIN Images g ON ixi.ImageID = g.ImageID" + br +
            " WHERE ixi.ItemID = @0" + br + 
            "   AND g.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')" + br +
            "   AND NOT EXISTS (SELECT * FROM ItemsXFirstGalleryImage WHERE ixi.ID = ID)" + br +
            "   AND g.Active = 1" + br +
            " ORDER BY ixi.DisplayOrder";
        
        // SQL query for list of location gallery images, excluding the first for each (for ALL locations)
        private static string queryLocationPhotos =
            "SELECT i.ItemID AS locationId, g.ImageID AS imageId, g.IconURL AS thumbUrl, g.FullURL AS fullImageUrl, g.Caption AS caption, g.Source AS source" + br +
            "  FROM Items i" + br +
            "  LEFT OUTER JOIN ItemsXImages ixi ON ixi.ItemID = i.ItemID" + br +
            "  JOIN Images g ON ixi.ImageID = g.ImageID" + br +
            " WHERE i.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location')" + br +
            "   AND g.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')" + br +
            "   AND NOT EXISTS (SELECT * FROM ItemsXFirstGalleryImage WHERE ixi.ID = ID)" + br +
            "   AND g.Active = 1" + br +
            " ORDER BY i.ItemID, ixi.DisplayOrder";

        // SQL query for list of gallery images, excluding the first
        //private static string queryPhotos =
        //    "SELECT ImageID, ImageTypeID, IconURL, FullURL, Caption, Source, Active" + br +
        //    "  FROM (SELECT i.*, ROW_NUMBER() OVER (ORDER BY ixi.DisplayOrder) AS RowNum" + br +
        //    "          FROM Images i" + br +
        //    "          JOIN ItemsXImages ixi ON ixi.ImageID = i.ImageID" + br +
        //    "         WHERE ixi.ItemID = @0" + br +
        //    "           AND i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')) img" + br +
        //    " WHERE RowNum > 1" + br +
        //    " ORDER BY RowNum" + br;


        // -- Location Maps --------------------

        // SQL query for list of location maps (by locationId)
        private static string queryMaps =
            "SELECT m.MapID AS mapId, m.Name, m.Description, m.TilesURL, m.Width, m.Height," + br +
            "       m.CenterX, m.CenterY, m.ZoomMin, m.ZoomMax, m.ZoomDefault," + br +
            "       m.LatitudeNorth, m.LatitudeSouth, m.LongitudeEast, m.LongitudeWest" + br +
            "  FROM ItemsXFirstMap ixm" + br +   // view only returns the first Active map, so no need to include an explicit condition for Active in this query
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID" + br +
            " WHERE ixm.ItemID = @0" + br +
            " ORDER BY ixm.DisplayOrder";  // only returns one row, but leaving this in for the future

        // SQL query for list of location maps (for ALL locations)
        private static string queryLocationMaps =
            "SELECT i.ItemID AS locationId, m.MapID AS mapId, m.Name, m.Description, m.TilesURL, m.Width, m.Height," + br +
            "       m.CenterX, m.CenterY, m.ZoomMin, m.ZoomMax, m.ZoomDefault," + br +
            "       m.LatitudeNorth, m.LatitudeSouth, m.LongitudeEast, m.LongitudeWest" + br +
            "  FROM Items i" + br +
            "  LEFT OUTER JOIN ItemsXFirstMap ixm ON ixm.ItemID = i.ItemID" + br +   // view only returns the first Active map, so no need to include an explicit condition for Active in this query
            "  JOIN Maps m ON ixm.MapID = m.MapID" + br +
            " WHERE i.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location')" + br +
            " ORDER BY i.ItemID, ixm.DisplayOrder";


        // -- Location MapFeatures --------------------

        // SQL query for list of location map features (by locationId)
        private static string queryMapFeatures =
            "SELECT ixm.MapID AS mapId, mxf.FeatureID AS featureId, mxf.DisplayOrder, mxf.CustomMarkerFlag," + br +
            "       f.Abbreviation AS MatchFeature, mxf.MatchOperator, mxf.MatchValue, mxf.Marker, mxf.Description, mxf.OffsetX, mxf.OffsetY" + br +
            "  FROM ItemsXFirstMap ixm" + br +   // view only returns the first Active map, so no need to include an explicit condition for Active in this query
            "  LEFT OUTER JOIN MapsXFeatures mxf ON mxf.MapID = ixm.MapID" + br +
            "  JOIN Features f ON mxf.FeatureID = f.FeatureID" + br +
            " WHERE ixm.ItemID = @0" + br +
            " ORDER BY mxf.DisplayOrder";

        // SQL query for list of location map features (for ALL locations)
        private static string queryLocationMapFeatures =
            "SELECT i.ItemID AS locationId, ixm.MapID AS mapId, mxf.FeatureID AS featureId, mxf.DisplayOrder, mxf.CustomMarkerFlag," + br +
            "       f.Abbreviation AS MatchFeature, mxf.MatchOperator, mxf.MatchValue, mxf.Marker, mxf.Description, mxf.OffsetX, mxf.OffsetY" + br +
            "  FROM Items i" + br +
            "  LEFT OUTER JOIN ItemsXFirstMap ixm ON ixm.ItemID = i.ItemID" + br +   // view only returns the first Active map, so no need to include an explicit condition for Active in this query
            "  JOIN MapsXFeatures mxf ON mxf.MapID = ixm.MapID" + br +
            "  JOIN Features f ON mxf.FeatureID = f.FeatureID" + br +
            " WHERE i.ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Location')" + br +
            " ORDER BY i.ItemID, mxf.DisplayOrder";

        
        // map the LocationBasic properties to columns and default criteria conditions to be used in filtered queries
        public static Dictionary<string, SqlCriteria> mapLocationBasicProps = new Dictionary<string, SqlCriteria>()
        { 
          // property                                      column                 data type            default operator
            {"locationid",                 new SqlCriteria("l.ItemID",            CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"title",                      new SqlCriteria("l.Name",              CriteriaType.TEXT,   SqlOperator.CONTAINS)},  // find location names containing VALUE
            {"street",                     new SqlCriteria("a.StreetAddress",     CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"street2",                    new SqlCriteria("a.StreetAddress2",    CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"city",                       new SqlCriteria("a.City",              CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"state",                      new SqlCriteria("a.State",             CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"zip",                        new SqlCriteria("a.ZipCode",           CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"country",                    new SqlCriteria("a.Country",           CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"longitude",                  new SqlCriteria("a.Longitude",         CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"latitude"            ,       new SqlCriteria("a.Latitude",          CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"operatingorganization",      new SqlCriteria("o.Name",              CriteriaType.TEXT,   SqlOperator.CONTAINS)},  // find org names containing VALUE
            {"operatingorganizationphone", new SqlCriteria("o.Phone",             CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"reservationphone",           new SqlCriteria("o.Phone2",            CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"totalreservablesites",       new SqlCriteria("agg.SiteCount",       CriteriaType.NUMBER, SqlOperator.EQUAL)}
        };

        // map LocationDetail properties to columns and default criteria conditions to be used in filtered queries
        public static Dictionary<string, SqlCriteria> mapLocationDetailProps = new Dictionary<string, SqlCriteria>()
        { 
          // property                                      column                 data type            default operator
            {"reservationpolicies",        new SqlCriteria("av.Policies",         CriteriaType.TEXT,   SqlOperator.CONTAINS)},  // find policies containing VALUE
            {"availabilitystartmonth",     new SqlCriteria("av.AvailStartMonth",  CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"availabilitystartday",       new SqlCriteria("av.AvailStartDay",    CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"availabilityendmonth",       new SqlCriteria("av.AvailEndMonth",    CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"availabilityendday",         new SqlCriteria("av.AvailEndDay",      CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"pricemin",                   new SqlCriteria("agg.MinWeekdayRate",  CriteriaType.NUMBER, SqlOperator.GREATEREQUAL)},  // find PriceMin >= VALUE
            {"pricemax",                   new SqlCriteria("agg.MaxWeekendRate",  CriteriaType.NUMBER, SqlOperator.LESSEQUAL)},  // find PriceMax <= VALUE
            {"cancellationdaysbeforereservation", 
                                           new SqlCriteria("av.CancelBeforeDays", CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"groupid",                    new SqlCriteria("l.GroupID",           CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"partnerid",                  new SqlCriteria("p.PartnerID",         CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"partnercode",                new SqlCriteria("p.PartnerCode",       CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"partnertype",                new SqlCriteria("pt.PartnerTypeName",  CriteriaType.TEXT,   SqlOperator.EQUAL)}
        };


        public LocationRepository()
        {
            db = new Database("Kinsail");
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
            baseURLFeatureId = db.ExecuteScalar<long>("SELECT FeatureID FROM Features WHERE Name = 'Base URL'");

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
                allFeatures.Add((string)row[0], new SqlCriteria((string)row[0], t, SqlOperator.NONE, (long)row[1]));
            }
        }


        // return list of LocationBasic objects
        public List<LocationBasic> GetAll(Dictionary<string, string> queryParams = null)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic) 
                .Append(whereLocations, locationItemTypeId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams, false, true));
            }
            
            sql = sql.Append(orderLocations);
            //Debug.Print(sql.SQL);

            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            return locations;
        }


        // return list of LocationDetail objects
        public List<LocationDetail> GetAllDetails(Dictionary<string, string> queryParams = null)
        {
            // get locations
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail, baseURLFeatureId)
                .Append(whereLocations, locationItemTypeId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams, true, true));
            }
            
            sql = sql.Append(orderLocations);
            //Debug.Print(sql.SQL);

            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);

            /* SLOW METHOD - issuing child queries for each row in the result set to retrieve children
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
            */

            // FASTER METHOD - retrieve children for all locations in separate Lists, then loop through and connect them to the parent
            // (fewer SQL queries)
            var features2 = db.FetchOneToMany<LocationDTO, FeatureAttribute<object>>(x => x.locationId, x => x.id, queryLocationFeatures);
            var photos2 = db.FetchOneToMany<LocationDTO, GalleryImage>(x => x.locationId, x => x.imageId, queryLocationPhotos);
            var maps = db.Fetch<LocationDTO, MapDetail>(queryLocationMaps);
            var markers = db.FetchOneToMany<LocationDTO, MapFeature>(x => x.locationId, queryLocationMapFeatures);

            foreach (LocationDetail location in locations)
            {
                var f = features2.Find(x => x.locationId == location.locationId);
                if (f != null) {
                    location.features = f.features.ToArray();
                }

                var p = photos2.Find(x => x.locationId == location.locationId);
                if (p != null)
                {
                    location.photos = p.photos.ToArray();
                }

                var m = maps.Find(x => x.locationId == location.locationId);
                if (m != null)
                {
                    location.map = m.map;
                }

                var r = markers.Find(x => x.locationId == location.locationId);
                if (r != null)
                {
                    location.map.markers = r.markers.ToArray();
                }
            }
            return locations;
        }


        // return LocationBasic by ID
        public LocationBasic GetbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationBasic)
                .Append(fromJoinLocationBasic) 
                .Append(whereLocationById, locationItemTypeId, locationId)
                .Append(orderLocations);

            //Debug.Print(sql.SQL);
            List<LocationBasic> locations = db.Fetch<LocationBasic, Address, GalleryImage>(sql);
            //Debug.Print("Result set (locations) has {0} elements", locations.Count);
            return locations.ElementAtOrDefault(0);
        }


        // return LocationDetail by ID
        public LocationDetail GetDetailbyId(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectLocationDetail)
                .Append(fromJoinLocationDetail, baseURLFeatureId) 
                .Append(whereLocationById, locationItemTypeId, locationId)
                .Append(orderLocations);
            
            //Debug.Print(sql.SQL);
            List<LocationDetail> locations = db.Fetch<LocationDetail, Address, GalleryImage, BannerImage>(sql);
            //Debug.Print("Result set (locations) has {0} elements", locations.Count);
            LocationDetail location = locations.ElementAtOrDefault(0);

            // get features for location
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(queryFeatures, location.locationId);
            location.features = features.ToArray();

            // get gallery images for location, excluding the first one
            List<GalleryImage> photos = db.Fetch<GalleryImage>(queryPhotos, location.locationId);
            location.photos = photos.ToArray();

            // get map for location
            List<MapDetail> maps = db.Fetch<MapDetail>(queryMaps, location.locationId);
            location.map = maps.ElementAtOrDefault(0);

            // get map markers for location
            List<MapFeature> markers = db.Fetch<MapFeature>(queryMapFeatures, location.locationId);
            location.map.markers = markers.ToArray();

            return location;
        }


        public List<FeatureAttributeStat<object>> GetSiteFeaturesbyId(long idLocation)
        {

            /*
            public long? id { get; set; }           // database identifier, never displayed to the user
            public string name { get; set; }        // example: "primaryColor"
            public string label { get; set; }       // example: "Primary Color"
            public string description { get; set; } // example: "The primary exterior color and shade"
            public string type { get; set;  }       // example: "String"
            public int count { get; set;  }         // example: 3
            public List<T> value { get; set; }      // example: "Red"
             */
            //"SELECT ixf.ID AS id, f.Abbreviation AS name, f.Name AS label, f.Description AS description, ixf.Value AS value, " + br +


            var sql = NPoco.Sql.Builder
                .Append("SELECT f.FeatureID AS id, MAX(f.Abbreviation) AS name, MAX(f.Name) AS label, " + br +
                        "       MAX(f.Description) AS description, MAX(ft.Name) AS type, MAX(c.Count) AS count, " + br +
                        "       f.featureID AS id, ixf.Value AS [value], COUNT(f.Name) AS [count]" + br)
                .Append("  FROM Items s" + br +
                        "  JOIN ItemsXItems ixi ON s.ItemID = ixi.ItemID" + br +
                        "  JOIN Items l ON ixi.ParentItemID = l.ItemID" + br +
                        "  JOIN ItemsXFeatures ixf ON s.ItemID = ixf.ItemID" + br +
                        "  JOIN Features f ON f.FeatureID = ixf.FeatureID" + br +
                        "  JOIN FeatureTypes ft ON f.FeatureTypeID = ft.FeatureTypeID" + br +
                        "  JOIN (SELECT _sxf.FeatureID, COUNT(_sxf.ItemID) AS [Count]" + br +
                        "          FROM Items _s" + br +
                        "          JOIN ItemsXItems _sxl ON _s.ItemID = _sxl.ItemID" + br +
                        "          JOIN ItemsXFeatures _sxf ON _s.ItemID = _sxf.ItemID" + br +
                        "         WHERE _sxl.ParentItemID = @0" + br +
                        "         GROUP BY _sxf.FeatureID) c ON f.FeatureID = c.FeatureID" + br, idLocation)
                .Append(" WHERE l.ItemID = @0" + br +
                        " GROUP BY f.FeatureID, ixf.Value" + br +
                        " ORDER BY COUNT(ixf.Value) OVER (PARTITION BY f.FeatureID) DESC, MAX(f.Name), COUNT(f.Name) DESC", idLocation);
            
            var features = db.FetchOneToMany<FeatureAttributeStat<object>, ValueCount<object>>(x => x.id, sql);
            
            return features;
        }


        // generate additional WHERE clauses based on the passed in URI querystring parameters
        // handles:
        // - unknown params (skip them in the SQL, for now)
        // - params for object properties (including a default operator that makes sense)
        // - params for feature children, including multiples
        // - params for mixed sets of object properties and feature children
        // - params with mixed case
        // - empty params (e.g., restrooms=)
        // - quoting for string-valued params (prevents sql injection)
        // - parsing for all criteria values (prevents sql injection for types other than strings)
        // - support for operators, including mixed case
        private string generateFilterClauses(Dictionary<string, string> queryParams, bool detailsFlag, bool featuresFlag)
        {
            Dictionary<string, SqlCriteria> filterProperties = new Dictionary<string, SqlCriteria>();
            Dictionary<string, SqlCriteria> filterFeatures = new Dictionary<string, SqlCriteria>();
            Dictionary<string, SqlCriteria> filterOther = new Dictionary<string, SqlCriteria>();
            StringBuilder s = new StringBuilder();

            string columnPart;
            string operatorPart;
            
            // parse the query params into separate groups (properties, features, other)
            foreach (var item in queryParams)
            {
                columnPart = SqlCriteria.getColumnPart(item.Key);
                operatorPart = SqlCriteria.getOperatorPart(item.Key);
                SqlOperator op;

                if (mapLocationBasicProps.ContainsKey(columnPart) |                  // is the parameter name a property of LocationBasic object?
                    (detailsFlag & mapLocationDetailProps.ContainsKey(columnPart)))  // is the parameter name a property of LocationDetail object?
                {
                    // copy the criteria object from the lookup map
                    if (mapLocationBasicProps.ContainsKey(columnPart))
                    {
                        filterProperties.Add(columnPart, mapLocationBasicProps[columnPart].clone());
                    }
                    else
                    {
                        filterProperties.Add(columnPart, mapLocationDetailProps[columnPart].clone());
                    }

                    // override the default operator, if the user has specified one
                    op = SqlCriteria.getOperator(operatorPart);
                    if (op != SqlOperator.NONE)
                    {
                        filterProperties[columnPart].oper = op;
                    }

                    // inject the user-supplied data value(s) into the copied criteria
                    filterProperties[columnPart].value = item.Value;

                    Debug.Print("Find locations WHERE: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
                }
                else  
                {
                    if (featuresFlag & allFeatures.ContainsKey(item.Key))  // is the parameter name a Feature associated with the LocationDetail object?
                    {
                        // copy the criteria object from the feature lookup map
                        filterFeatures.Add(columnPart, allFeatures[columnPart].clone());

                        // override the default operator, if the user has specified one
                        op = SqlCriteria.getOperator(operatorPart);
                        if (op != SqlOperator.NONE)
                        {
                            filterFeatures[columnPart].oper = op;
                        }

                        // inject the user-supplied data value(s) into the copied criteria
                        filterFeatures[columnPart].value = item.Value;

                        Debug.Print("Find locations WHERE feature [FeatureID=" + allFeatures[item.Key].id + "]: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
                    }
                    else  // parameter does not match a property or feature
                    {
                        op = SqlCriteria.getOperator(operatorPart);
                        filterOther.Add(columnPart, new SqlCriteria(columnPart, CriteriaType.TEXT, SqlCriteria.getOperator(operatorPart), item.Value));

                        Debug.Print("Ignoring unknown parameter: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
                    }
                }
            }

            // generate WHERE clauses for properties
            foreach (var criteria in filterProperties)
            {
                s.AppendFormat("   AND " + criteria.Value.getSql());
            }

            // generate WHERE clauses for features
            if (filterFeatures.Count > 0)
            {
                s.AppendFormat(andWhereLocationHasFeatures_pre, locationItemTypeId);
                foreach (var criteria in filterFeatures)
                {
                    s.AppendFormat(andWhereLocationFeature, allFeatures[criteria.Key].id, criteria.Value.getSql(false));
                    if (filterFeatures.Last().Key != criteria.Key)
                    {
                        s.Append(" OR ");
                    }
                }
                s.AppendFormat(andWhereLocationHasFeatures_post, filterFeatures.Count);
            }

            return s.ToString();
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