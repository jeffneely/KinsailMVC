using NPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    public class SiteRepository
    {

        private IDatabase _db = new Database("DB1/Kinsail_JNeely");

        public SiteRepository()
        {
        }

        public List<SiteBasic> GetAll()
        {
            List<SiteBasic> sites = _db.Fetch<SiteBasic>("SELECT i.itemID, i.Name AS siteIdentifier " +
                                                           "FROM Items i " +
                                                          "WHERE i.itemTypeID = (SELECT ItemTypeID from ItemTypes WHERE Name = 'Recreation Site') " +
                                                          "ORDER BY i.Name");
            return sites;
        }

        public List<SiteDetail> GetAllDetails()
        {
            List<SiteDetail> sites = _db.Fetch<SiteDetail>("TBD");
            return sites;
        }
        
        public SiteBasic GetbyId(long SiteId)
        {
            SiteBasic site = _db.Single<SiteBasic>("SELECT i.itemID, i.Name AS siteIdentifier " +
                                                     "FROM Items i " +
                                                    "WHERE i.itemTypeID = (SELECT ItemTypeID from ItemTypes WHERE Name = 'Recreation Site') " +
                                                      "AND i.itemID = " + SiteId);
            return site;
        }

        public SiteDetail GetDetailbyId(long SiteId)
        {
            SiteDetail site = _db.Single<SiteDetail>("SELECT i.itemID, i.Name AS siteIdentifier " +
                                                       "FROM Items i " +
                                                      "WHERE i.itemTypeID = (SELECT ItemTypeID from ItemTypes WHERE Name = 'Recreation Site') " +
                                                        "AND i.itemID = " + SiteId);
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