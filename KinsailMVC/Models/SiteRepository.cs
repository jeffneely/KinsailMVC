using NPoco;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;

namespace KinsailMVC.Models
{
    // Database repository handler for sites
    //
    // TODO: refactor db connection as a factory?
    public class SiteRepository
    {
        private IDatabase db;
        private long siteItemTypeId = 0;
        private long locationItemTypeId = 0;
        private long galleryImageTypeId = 0;
        private long siteTypeFeatureId = 0;
        private Dictionary<string, SqlCriteria> allFeatures = new Dictionary<string, SqlCriteria>();
        private static string br = Environment.NewLine;

        // SQL SELECT fragment for SiteBasic
        private static string selectSiteBasic =
            "SELECT i.ItemID, i.Name, l.ItemID AS LocationID, f0.Value AS Type," + br +
            "       ixm.CoordinateX AS X, ixm.CoordinateY AS Y, g.ImageID, g.IconURL, g.FullURL";

        // SQL SELECT fragment for SiteDetail
        private static string selectSiteDetail =
            "SELECT i.ItemID, i.Name, i.Description, l.ItemID AS LocationID, f0.Value AS Type," + br +
            "       av.MaxAccommodatingUnits, av.MinDuration, av.MaxDuration, av.AdvancedReservationPeriod," + br +
            "       ixm.CoordinateX AS X, ixm.CoordinateY AS Y, g.ImageID, g.IconURL, g.FullURL";

        // SQL FROM/JOIN fragment for SiteBasic
        private static string fromJoinSiteBasic =
            "  FROM Items i" + br +
            "  LEFT OUTER JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID" + br +             // location
            "  LEFT OUTER JOIN Items l ON ixi.ParentItemID = l.ItemID" + br +
            "  LEFT OUTER JOIN (SELECT ItemID, Value" + br +                                // site type
            "                     FROM ItemsXFeatures" + br +
            "                    WHERE FeatureID = @0) f0 ON i.ItemID = f0.ItemID" + br +
            "  LEFT OUTER JOIN ItemsXMaps ixm ON i.ItemID = ixm.ItemID" + br +              // maps
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID" + br +
            "  LEFT OUTER JOIN ItemsXFirstGalleryImage ixg ON l.ItemID = ixg.ItemID" + br + // first gallery image 
            "  LEFT OUTER JOIN Images g ON g.ImageID = ixg.ImageID";

//          "  LEFT OUTER JOIN ItemsXImages ixg ON i.ItemID = ixg.ItemID" + br +            // images
//          "  LEFT OUTER JOIN (SELECT i.ImageID, i.IconURL, i.FullURL" + br +              // only gallery images
//          "                     FROM Images i" + br +
//          "                     JOIN ImageTypes it ON i.ImageTypeID = it.ImageTypeID" + br +
//          "                    WHERE it.ImageTypeID = @1) g ON ixg.ImageID = g.ImageID" + br +
//          "             JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder" + br +    // only the first image
//          "                     FROM ItemsXImages" + br +
//          "                    GROUP BY ItemID) g1 ON ixg.ItemID = g1.ItemID" + br +
//          "                      AND ixg.DisplayOrder = g1.DisplayOrder";

        // SQL FROM/JOIN fragment for SiteDetail
        private static string fromJoinSiteDetail = fromJoinSiteBasic + br +
            "  LEFT OUTER JOIN (SELECT ixa.ItemID, MIN(ixa.MaxUnits) AS MaxAccommodatingUnits," + br +  // availability info
            "                          MIN(a.MinDurationDays) AS MinDuration, MAX(MaxDurationDays) AS MaxDuration," + br +
            "                          MIN(a.AvailBeforeDays) AS AdvancedReservationPeriod" + br +
            "                     FROM ItemsXAvailability ixa" + br +
            "                     LEFT OUTER JOIN Availability a ON ixa.AvailID = a.AvailID" + br +
            "                    GROUP BY ixa.ItemID" + br +
            "                   ) av ON i.ItemID = av.ItemID";

//          "  LEFT OUTER JOIN ItemsXAvailability ixa ON i.ItemID = ixa.ItemID" + br +      // availability info
//          "  LEFT OUTER JOIN Availability a ON ixa.AvailID = a.AvailID";

        // SQL WHERE fragment for Site Features (prefix)
        private static string andWhereSiteHasFeatures_pre =
            "   AND i.ItemID IN (SELECT i.ItemID" + br +
            "                      FROM Items i" + br +
            "                      JOIN ItemsXFeatures ixf ON i.ItemID = ixf.ItemID" + br +
            "                      JOIN Features f ON f.FeatureID = ixf.FeatureID" + br +
            "                     WHERE ItemTypeID = {0}" + br +
            "                       AND ( " + br;

        // SQL WHERE fragment for Site Features
        private static string andWhereSiteFeature =
            "                             (ixf.FeatureID = {0} AND ixf.Value {1})" + br;

        // SQL WHERE fragment for Site Features (suffix)
        private static string andWhereSiteHasFeatures_post =
            "                           )" + br +
            "                     GROUP BY i.ItemID" + br +
            "                    HAVING COUNT(f.FeatureID) >= {0})" + br;

        // SQL WHERE fragment for Site Reservations (prefix)
        private static string andWhereSiteReserved_pre =
            "   AND i.ItemID NOT IN (SELECT i.ItemID" + br +
            "                          FROM Items i" + br +
            "                          JOIN ReservationResources rr ON i.ItemID = rr.ItemID" + br +
            "                         WHERE i.ItemTypeID = {0}" + br;

        // SQL WHERE fragment for Site Reservations (suffix)
        private static string andWhereSiteReserved_post =
            "                         GROUP BY i.ItemID, i.Name)" + br;

        // SQL WHERE fragment for Sites
        private static string whereSites =
            " WHERE i.ItemTypeID = @0" + br +
            "   AND l.ItemTypeID = @1";

        // SQL WHERE/ORDER fragment for Sites (by location)
        private static string whereSitesForLocation =
            " WHERE i.ItemTypeID = @0" + br +
            "   AND l.ItemTypeID = @1" + br +
            "   AND l.ItemID = @2";

        // SQL WHERE fragment for Sites (by ID)
        private static string whereSiteById =
            " WHERE i.ItemTypeID = @0" + br +
            "   AND l.ItemTypeID = @1" + br +
            "   AND i.ItemID = @2";

        // SQL ORDER fragment for Sites
        private static string orderSites =
            " ORDER BY i.Name";


        private static string selectFeatures =
            "SELECT ixf.ID AS FeatureID, f.Abbreviation AS Name, f.Description, ixf.Value" + br +
            "  FROM ItemsXFeatures ixf" + br +
            "  LEFT OUTER JOIN Features f ON ixf.FeatureID = f.FeatureID" + br +
            " WHERE f.FeatureID <> @0" + br +
            "   AND ixf.ItemID = @1";

        // SQL query for list of all features
        private static string queryAllFeatures =
            "SELECT LOWER(f.Abbreviation) AS Name, f.FeatureID, ft.Category" + br +
            "  FROM Features f" + br +
            "  JOIN FeatureTypes ft ON f.FeatureTypeID = ft.FeatureTypeID";

        private static string selectCostPeriods =
            "SELECT a.AvailStartMonth AS StartMonth, a.AvailStartDay AS StartDay, a.AvailEndMonth AS EndMonth," + br +
            "       a.AvailEndDay AS EndDay, a.MinDurationDays AS MinimumDuration, ixa.WeekdayRate, ixa.WeekendRate," + br +
            "       0 AS NotAvailable" + br +
            "  FROM Items i" + br +
            "  LEFT OUTER JOIN ItemsXAvailability ixa ON i.ItemID = ixa.ItemID" + br +
            "  LEFT OUTER JOIN Availability a ON ixa.AvailID = a.AvailID" + br +
            " WHERE i.ItemID = @0";

        // return list of gallery images, excluding the first
        private static string selectPhotos =
            "SELECT ImageID, ImageTypeID, IconURL, FullURL, Caption, Source, Active" + br +
            "  FROM (SELECT i.*, ROW_NUMBER() OVER (ORDER BY ixi.DisplayOrder) AS RowNum" + br +
            "          FROM Images i" + br +
            "          JOIN ItemsXImages ixi ON ixi.ImageID = i.ImageID" + br +
            "         WHERE ixi.ItemID = @0" + br +
            "           AND i.ImageTypeID = (SELECT ImageTypeID FROM ImageTypes WHERE Name = 'Gallery Image')) img" + br +
            " WHERE RowNum > 1" + br +
            " ORDER BY RowNum";

        // return list of reserved data ranges for site (> today)
        private static string selectReservedRanges =
            "SELECT rr.ResourceID, rr.ResourceName, rr.ResourceDescription, rr.StartDateTime AS StartDate, rr.EndDateTime AS EndDate" + br +
            "  FROM ReservationResources rr" + br +
            " WHERE rr.ItemID = @0" + br +
            "   AND rr.EndDateTime > getDate()" + br +
            " ORDER BY StartDateTime";


        // map the SiteBasic properties to columns and default criteria conditions to be used in filtered queries
        public static Dictionary<string, SqlCriteria> mapSiteBasicProps = new Dictionary<string, SqlCriteria>()
        { 
          // property                                     column             data type            default operator
            {"siteid",                    new SqlCriteria("i.ItemID",        CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"locationid",                new SqlCriteria("l.ItemID",        CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"type",                      new SqlCriteria("f0.Value",        CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"siteidentifier",            new SqlCriteria("i.Name",          CriteriaType.TEXT,   SqlOperator.EQUAL)},
            {"x",                         new SqlCriteria("ixm.CoordinateX", CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"y",                         new SqlCriteria("ixm.CoordinateY", CriteriaType.NUMBER, SqlOperator.EQUAL)},
        };

        // map SiteDetail properties to columns and default criteria conditions to be used in filtered queries
        public static Dictionary<string, SqlCriteria> mapSiteDetailProps = new Dictionary<string, SqlCriteria>()
        { 
          // property                                     column                          data type            default operator
            {"description",               new SqlCriteria("i.Description",                CriteriaType.TEXT,   SqlOperator.CONTAINS)},  // find descriptions containing VALUE
            {"maxaccommodatingunits",     new SqlCriteria("av.MaxAccommodatingUnits",     CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"minduration",               new SqlCriteria("av.MinDuration",               CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"maxduration",               new SqlCriteria("av.MaxDuration",               CriteriaType.NUMBER, SqlOperator.EQUAL)},
            {"advancedreservationperiod", new SqlCriteria("av.AdvancedReservationPeriod", CriteriaType.NUMBER, SqlOperator.EQUAL)},
        };

        // map Reservation properties to columns and default criteria conditions to be used in filtered queries
        public static Dictionary<string, SqlCriteria> mapSiteReservationProps = new Dictionary<string, SqlCriteria>()
        { 
          // property                                     column              data type          default operator
            {"availablestartdate",        new SqlCriteria("rr.StartDateTime", CriteriaType.DATE, SqlOperator.GREATER)},  // find start dates greater than VALUE
            {"availableenddate",          new SqlCriteria("rr.EndDateTime",   CriteriaType.DATE, SqlOperator.LESSEQUAL)} // find end dates less than or equal to value
        };

        public SiteRepository()
        {
            db = new Database("DB1/Kinsail_JNeely");
            setup();
        }

        public SiteRepository(IDatabase database)
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
            siteTypeFeatureId = db.ExecuteScalar<long>("SELECT FeatureID FROM Features WHERE Name = 'Site Type'");

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


        // return list of SiteBasic objects
        public List<SiteBasic> GetAll(Dictionary<string, string> queryParams = null)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteBasic)
                .Append(fromJoinSiteBasic, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSites, siteItemTypeId, locationItemTypeId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams, false, true));
            }

            sql = sql.Append(orderSites);

            List<SiteBasic> sites = db.Fetch<SiteBasic, MapCoordinates, GalleryImage>(sql);
            return sites;
        }

        // return list of SiteBasic objects for a Location
        public List<SiteBasic> GetAllForLocation(long locationId, Dictionary<string, string> queryParams = null)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteBasic)
                .Append(fromJoinSiteBasic, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSitesForLocation, siteItemTypeId, locationItemTypeId, locationId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams, false, true));
            }

            sql = sql.Append(orderSites);

            List<SiteBasic> sites = db.Fetch<SiteBasic, MapCoordinates, GalleryImage>(sql);
            return sites;
        }

        public List<SiteDetail> GetAllDetails(Dictionary<string, string> queryParams = null)
        {
            // get sites
            var sql = NPoco.Sql.Builder
                .Append(selectSiteDetail)
                .Append(fromJoinSiteDetail, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSites, siteItemTypeId, locationItemTypeId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams, true, true));
            }

            sql = sql.Append(orderSites);
            Debug.Print(sql.SQL);

            List<SiteDetail> sites = db.Fetch<SiteDetail, MapCoordinates, GalleryImage>(sql);

            foreach (SiteDetail site in sites)
            {
                // get features for each site
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, siteTypeFeatureId, site.siteId);
                site.features = features.ToArray();

                // get cost periods for each site
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<CostPeriod> costPeriods = db.Fetch<CostPeriod>(selectCostPeriods, site.siteId);
                site.cost = new CostStructure(costPeriods.ToArray());

                // get gallery images for each location, excluding the first one
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<GalleryImage> photos = db.Fetch<GalleryImage>(selectPhotos, site.siteId);
                site.photos = photos.ToArray();
            }
            return sites;
        }

        public List<SiteDetail> GetAllDetailsForLocation(long locationId, Dictionary<string, string> queryParams = null)
        {
            // get sites
            var sql = NPoco.Sql.Builder
                .Append(selectSiteDetail)
                .Append(fromJoinSiteDetail, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSitesForLocation, siteItemTypeId, locationItemTypeId, locationId);

            // any URI filter parameters to add to the query?
            if (queryParams != null)
            {
                sql = sql.Append(generateFilterClauses(queryParams, true, true));
            }

            sql = sql.Append(orderSites);
            
            List<SiteDetail> sites = db.Fetch<SiteDetail, MapCoordinates, GalleryImage>(sql);

            foreach (SiteDetail site in sites)
            {
                // get features for each site
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, siteTypeFeatureId, site.siteId);
                site.features = features.ToArray();

                // get cost periods for each site
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<CostPeriod> costPeriods = db.Fetch<CostPeriod>(selectCostPeriods, site.siteId);
                site.cost = new CostStructure(costPeriods.ToArray());

                // get gallery images for each location, excluding the first one
                // can't automatically include this in the primary query since NPoco can't do both 
                // nested and one-to-many properties in a single automatic mapping
                List<GalleryImage> photos = db.Fetch<GalleryImage>(selectPhotos, site.siteId);
                site.photos = photos.ToArray();
            }
            return sites;
        }

        public SiteBasic GetbyId(long siteId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteBasic)
                .Append(fromJoinSiteBasic, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSiteById, siteItemTypeId, locationItemTypeId, siteId)
                .Append(orderSites);

            List<SiteBasic> sites = db.Fetch<SiteBasic, MapCoordinates, GalleryImage>(sql);
            return sites.ElementAtOrDefault(0);
        }

        public SiteDetail GetDetailbyId(long siteId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteDetail)
                .Append(fromJoinSiteDetail, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSiteById, siteItemTypeId, locationItemTypeId, siteId)
                .Append(orderSites);

            List<SiteDetail> sites = db.Fetch<SiteDetail, MapCoordinates, GalleryImage>(sql);
            SiteDetail site = sites.ElementAtOrDefault(0);

            // get features for site
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<FeatureAttribute<object>> features = db.Fetch<FeatureAttribute<object>>(selectFeatures, siteTypeFeatureId, siteId);
            site.features = features.ToArray();

            // get cost periods for site
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<CostPeriod> costPeriods = db.Fetch<CostPeriod>(selectCostPeriods, siteId);
            site.cost = new CostStructure(costPeriods.ToArray());

            // get gallery images for each location, excluding the first one
            // can't automatically include this in the primary query since NPoco can't do both 
            // nested and one-to-many properties in a single automatic mapping
            List<GalleryImage> photos = db.Fetch<GalleryImage>(selectPhotos, site.siteId);
            site.photos = photos.ToArray();

            return site;
        }

        public SiteAvailability GetAvailabilitybyId(long siteId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteBasic)
                .Append(fromJoinSiteBasic, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereSiteById, siteItemTypeId, locationItemTypeId, siteId)
                .Append(orderSites);

            List<SiteAvailability> sites = db.Fetch<SiteAvailability, MapCoordinates, GalleryImage>(sql);
            SiteAvailability site = sites.ElementAtOrDefault(0);

            // Get Availability
            List<DateRange> dates = db.Fetch<DateRange>(selectReservedRanges, site.siteId);
            site.bookedRanges = dates.ToArray();

            return site;
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
            Dictionary<string, SqlCriteria> filterReserved = new Dictionary<string, SqlCriteria>();
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

                if (mapSiteBasicProps.ContainsKey(columnPart) |                  // is the parameter name a property of SiteBasic object?
                    (detailsFlag & mapSiteDetailProps.ContainsKey(columnPart)))  // is the parameter name a property of SiteDetail object?
                {
                    // copy the criteria object from the lookup map
                    if (mapSiteBasicProps.ContainsKey(columnPart))
                    {
                        filterProperties.Add(columnPart, mapSiteBasicProps[columnPart].clone());
                    }
                    else
                    {
                        filterProperties.Add(columnPart, mapSiteDetailProps[columnPart].clone());
                    }

                    // override the default operator, if the user has specified one
                    op = SqlCriteria.getOperator(operatorPart);
                    if (op != SqlOperator.NONE)
                    {
                        filterProperties[columnPart].oper = op;
                    }

                    // inject the user-supplied data value(s) into the copied criteria
                    filterProperties[columnPart].value = item.Value;

                    //Debug.Print("Find sites WHERE: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
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

                        //Debug.Print("Find sites WHERE feature [FeatureID=" + allFeatures[item.Key].id + "]: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
                    }
                    else 
                    {
                        if (mapSiteReservationProps.ContainsKey(columnPart))  // is the parameter name a property of a Reservation object?
                        {
                            filterReserved.Add(columnPart, mapSiteReservationProps[columnPart].clone());

                            // override the default operator, if the user has specified one
                            op = SqlCriteria.getOperator(operatorPart);
                            if (op != SqlOperator.NONE)
                            {
                                filterReserved[columnPart].oper = op;
                            }

                            // inject the user-supplied data value(s) into the copied criteria
                            filterReserved[columnPart].value = item.Value;

                            //Debug.Print("Find sites WHERE not reserved: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
                        }
                        else // parameter does not match a property or feature
                        {
                            op = SqlCriteria.getOperator(operatorPart);
                            filterOther.Add(columnPart, new SqlCriteria(columnPart, CriteriaType.TEXT, SqlCriteria.getOperator(operatorPart), item.Value));

                            //Debug.Print("Ignoring unknown parameter: " + columnPart + " " + Enum.GetName(op.GetType(), op) + " " + item.Value);
                        }
                    }
                }
            }

            // generate WHERE clauses for properties
            foreach (var criteria in filterProperties)
            {
                s.AppendFormat("   AND " + criteria.Value.getSql() + br);
            }

            // generate WHERE clauses for features
            if (filterFeatures.Count > 0)
            {
                s.AppendFormat(andWhereSiteHasFeatures_pre, siteItemTypeId);
                foreach (var criteria in filterFeatures)
                {
                    s.AppendFormat(andWhereSiteFeature, allFeatures[criteria.Key].id, criteria.Value.getSql(false));
                    if (filterFeatures.Last().Key != criteria.Key)
                    {
                        s.Append(" OR ");
                    }
                }
                s.AppendFormat(andWhereSiteHasFeatures_post, filterFeatures.Count);
            }

            // generate WHERE clauses for reservation properties
            if (filterReserved.Count > 0)
            {
                s.AppendFormat(andWhereSiteReserved_pre, siteItemTypeId);
                foreach (var criteria in filterReserved)
                {
                    s.AppendFormat("                           AND " + criteria.Value.getSql() + br);
                }
                s.AppendFormat(andWhereSiteReserved_post);
            }

            //Debug.Print(s.ToString());
            return s.ToString();
        }

    }
}