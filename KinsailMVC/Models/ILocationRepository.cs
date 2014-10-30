using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KinsailMVC.Models
{
    interface ILocationRepository
    {
        IEnumerable<Location> GetAll();
        Location Get(int id);
        Location Add(Location item);
        void Remove(int id);
        bool Update(Location item);
    }
}
