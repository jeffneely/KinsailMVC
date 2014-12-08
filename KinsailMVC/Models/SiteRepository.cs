using NPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    // TODO refactor db connection as a factory?
    // TODO refactor this class to eliminate duplication of code
    // TODO account for multiples on JOINs to ItemsXItems
    // TODO account for multiples on JOINs to ItemsXMaps/Maps
    // TODO account for multiples on JOINs to ItemsXAvailability/Availability
    // TODO Apply DB unique constraints to limit some of the above??
    public class SiteRepository
    {
        private IDatabase db;
        private long siteItemTypeId = 0;
        private long locationItemTypeId = 0;
        private long galleryImageTypeId = 0;
        private long siteTypeFeatureId = 0;
        
        private static string selectSiteBasic = 
            "SELECT i.ItemID, i.Name, l.ItemID AS LocationID, f0.Value AS Type, " +
                   "ixm.CoordinateX AS X, ixm.CoordinateY AS Y, g.ImageID, g.IconURL, g.FullURL";

        private static string selectSiteDetail =
            "SELECT i.ItemID, i.Name, i.Description, l.ItemID AS LocationID, f0.Value AS Type, " +
                   "ixa.MaxUnits AS MaxAccomodatingUnits, " +
                   "a.MinDurationDays AS MinDuration, a.MaxDurationDays AS MaxDuration, a.AvailBeforeDays AS AdvancedReservationPeriod, " +
                   "ixm.CoordinateX AS X, ixm.CoordinateY AS Y, g.ImageID, g.IconURL, g.FullURL";

        private static string fromJoinSiteBasic = 
            "  FROM Items i " +
            "  LEFT OUTER JOIN ItemsXItems ixi ON i.ItemID = ixi.ItemID " +          // location
            "  LEFT OUTER JOIN Items l ON ixi.ParentItemID = l.ItemID " +
            "  LEFT OUTER JOIN (SELECT ItemID, Value " +                             // site type
            "                     FROM ItemsXFeatures " +
            "                    WHERE FeatureID = @0) f0 ON i.ItemID = f0.ItemID " + 
            "  LEFT OUTER JOIN ItemsXMaps ixm ON i.ItemID = ixm.ItemID " +           // maps
            "  LEFT OUTER JOIN Maps m ON ixm.MapID = m.MapID " + 
            "  LEFT OUTER JOIN ItemsXImages ixg ON i.ItemID = ixg.ItemID " +         // images
            "  LEFT OUTER JOIN (SELECT i.ImageID, i.IconURL, i.FullURL " +           // only gallery images
            "                     FROM Images i " +
            "                     JOIN ImageTypes it ON i.ImageTypeID = it.ImageTypeID " +
            "                    WHERE it.ImageTypeID = @1) g ON ixg.ImageID = g.ImageID " +
            "             JOIN (SELECT ItemID, MIN(DisplayOrder) AS DisplayOrder " + // only the first image
            "                     FROM ItemsXImages " +
            "                    GROUP BY ItemID) g1 ON ixg.ItemID = g1.ItemID " +
            "                      AND ixg.DisplayOrder = g1.DisplayOrder ";

        private static string fromJoinSiteDetail = fromJoinSiteBasic +
            "  LEFT OUTER JOIN ItemsXAvailability ixa ON i.ItemID = ixa.ItemID " +   // availability info
            "  LEFT OUTER JOIN Availability a ON ixa.AvailID = a.AvailID"; 

        private static string whereOrderSites = 
            " WHERE i.ItemTypeID = @0" + 
            "   AND l.ItemTypeID = @1" + 
            " ORDER BY i.Name";

        private static string whereOrderSitesForLocation =
            " WHERE i.ItemTypeID = @0" +
            "   AND l.ItemTypeID = @1" +
            "   AND l.ItemID = @2" +
            " ORDER BY i.Name";
        
        private static string whereOrderSiteById =
            " WHERE i.ItemTypeID = @0" +
            "   AND l.ItemTypeID = @1" +
            "   AND i.ItemID = @2" +
            " ORDER BY i.Name";

        private static string selectFeatures =
            "SELECT ixf.ID AS FeatureID, f.Abbreviation AS Name, f.Description, ixf.Value " +
            "  FROM ItemsXFeatures ixf " +
            "  LEFT OUTER JOIN Features f ON ixf.FeatureID = f.FeatureID " +
            " WHERE f.FeatureID <> @0 " +
            "   AND ixf.ItemID = @1";

        private static string selectCostPeriods =
            "SELECT a.AvailStartMonth AS StartMonth, a.AvailStartDay AS StartDay, a.AvailEndMonth AS EndMonth, " +
            "       a.AvailEndDay AS EndDay, a.MinDurationDays AS MinimumDuration, ixa.WeekdayRate, ixa.WeekendRate, " +
            "       0 AS NotAvailable " +
            "  FROM Items i " +
            "  LEFT OUTER JOIN ItemsXAvailability ixa ON i.ItemID = ixa.ItemID " +
            "  LEFT OUTER JOIN Availability a ON ixa.AvailID = a.AvailID " +
            " WHERE i.ItemID = @0";

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
        }

        public List<SiteBasic> GetAll()
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteBasic)
                .Append(fromJoinSiteBasic, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereOrderSites, siteItemTypeId, locationItemTypeId);
            List<SiteBasic> sites = db.Fetch<SiteBasic, MapCoordinates, GalleryImage>(sql);
            return sites;
        }

        public List<SiteBasic> GetAllForLocation(long locationId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteBasic)
                .Append(fromJoinSiteBasic, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereOrderSitesForLocation, siteItemTypeId, locationItemTypeId, locationId);
            List<SiteBasic> sites = db.Fetch<SiteBasic, MapCoordinates, GalleryImage>(sql);
            return sites;
        }
        
        public List<SiteDetail> GetAllDetails()
        {
            // get sites
            var sql = NPoco.Sql.Builder
                .Append(selectSiteDetail)
                .Append(fromJoinSiteDetail, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereOrderSites, siteItemTypeId, locationItemTypeId);
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

        public List<SiteDetail> GetAllDetailsForLocation(long locationId)
        {
            // get sites
            var sql = NPoco.Sql.Builder
                .Append(selectSiteDetail)
                .Append(fromJoinSiteDetail, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereOrderSitesForLocation, siteItemTypeId, locationItemTypeId, locationId);
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
                .Append(whereOrderSiteById, siteItemTypeId, locationItemTypeId, siteId);
            List<SiteBasic> sites = db.Fetch<SiteBasic, MapCoordinates, GalleryImage>(sql);
            return sites.ElementAtOrDefault(0);
        }

        public SiteDetail GetDetailbyId(long siteId)
        {
            var sql = NPoco.Sql.Builder
                .Append(selectSiteDetail)
                .Append(fromJoinSiteDetail, siteTypeFeatureId, galleryImageTypeId)
                .Append(whereOrderSiteById, siteItemTypeId, locationItemTypeId, siteId);
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
        
/*
 * example of fetching one to many:
 * 
var sql = "select a.*, b.* from tablea a " +
              "inner join tableb b on a.id = b.id " +
              "where EffectiveDate = @0";

List<TableA> results = 
    db.FetchOneToMany<TableA,TableB>(x=>x.Id, sql, new DateTime(2012,10,18));
*/


/*
        public IEnumerable<DataAccess.Partner> GetbyId(int IdPartner)
        {
            DataAccess.DataClassesDataContext objData = new DataAccess.DataClassesDataContext();
            IQueryable<DataAccess.Partner> objTest = objData.GetTable<DataAccess.Partner>().Where<DataAccess.Partner>(t => t.PartnerID == IdPartner);
            return objTest.AsEnumerable<DataAccess.Partner>();

        }


        public Location Get(int id)
        {
            return locations.Find(p => p.LocationID == id);
        }

        public Location Add(Location item)
        {
            if (item == null)
            {
                throw new ArgumentNullException("item");
            }
            item.LocationID = _nextId++;
            locations.Add(item);
            return item;
        }

        public void Remove(int id)
        {
            locations.RemoveAll(p => p.LocationID == id);
        }

        public bool Update(Location item)
        {
            if (item == null)
            {
                throw new ArgumentNullException("item");
            }
            int index = locations.FindIndex(p => p.LocationID == item.LocationID);
            if (index == -1)
            {
                return false;
            }
            locations.RemoveAt(index);
            locations.Add(item);
            return true;
        }
     * */
    }
}