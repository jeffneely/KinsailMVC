using NPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    // TODO refactor as factory
    public class LocationRepository
    {
        private IDatabase _db;
        private long locationItemTypeId = 0;

        public LocationRepository()
        {
            _db = new Database("DB1/Kinsail_JNeely");
            setup();
        }

        public LocationRepository(IDatabase database)
        {
            _db = database;
            setup();
        }

        private void setup()
        {
            locationItemTypeId = _db.ExecuteScalar<long>("SELECT ItemTypeID from ItemTypes WHERE Name = 'Recreation Location'");
        }
        
        public List<LocationBasic> GetAll()
        {
            List<LocationBasic> locations = _db.Fetch<LocationBasic>("SELECT i.ItemID, i.Name " +
                                                                      " FROM Items i" +
                                                                     " WHERE i.ItemTypeID = " + locationItemTypeId +
                                                                     " ORDER BY i.Name");
            return locations;
        }

        public List<LocationDetail> GetAllDetails()
        {
            // TODO
            List<LocationDetail> locations = _db.Fetch<LocationDetail>("SELECT i.ItemID, i.Name " +
                                                                      " FROM Items i" +
                                                                     " WHERE i.ItemTypeID = " + locationItemTypeId +
                                                                     " ORDER BY i.Name");
            return locations;
        }

        public LocationBasic GetbyId(long locationId)
        {
            LocationBasic location = _db.Single<LocationBasic>("SELECT i.ItemID, i.Name " +
                                                                " FROM Items i " +
                                                               " WHERE i.ItemTypeID = " + locationItemTypeId +
                                                                 " AND i.ItemID = " + locationId);
            return location;
        }

        public LocationDetail GetDetailbyId(long locationId)
        {
            LocationDetail location = _db.Single<LocationDetail>("SELECT i.ItemID, i.Name " +
                                                                  " FROM Items i " +
                                                                 " WHERE i.ItemTypeID = " + locationItemTypeId +
                                                                   " AND i.ItemID = " + locationId);
            return location;
        }




        /* Old
         * 
        public class LocationRepository 
        {
            private List<Location> locations = new List<Location>();
            private int _nextId = 1;

            public LocationRepository()
            {
            
            }

            public IEnumerable<DataAccess.Location> GetAll()
            {
                DataAccess.DataClassesDataContext objData = new DataAccess.DataClassesDataContext();
                System.Data.Linq.Table<DataAccess.Location> objTest = objData.GetTable<DataAccess.Location>();
                return objTest.AsEnumerable<DataAccess.Location>();    
    
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
        }
         */
    }   
}