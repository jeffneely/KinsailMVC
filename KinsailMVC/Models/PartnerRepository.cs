using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    public class PartnerRepository
    {
        private List<Location> locations = new List<Location>();
        private int _nextId = 1;

        public PartnerRepository()
        {

        }

        public IEnumerable<DataAccess.Partner> GetAll()
        {
            DataAccess.DataClassesDataContext objData = new DataAccess.DataClassesDataContext();
            IQueryable<DataAccess.Partner> objTest = objData.GetTable<DataAccess.Partner>().Take<DataAccess.Partner>(10);
            return objTest.AsEnumerable<DataAccess.Partner>();

        }

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
    }

}