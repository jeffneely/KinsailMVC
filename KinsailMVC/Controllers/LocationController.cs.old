using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using KinsailMVC.Models;
using System.Web.Mvc;


namespace KinsailMVC.Controllers
{
    public class LocationController : ApiController
    {
        static readonly LocationRepository repository = new LocationRepository();

        public String Index()
        {
            return "Hello World";
        }

    [System.Web.Mvc.HttpGet]
        public IEnumerable<DataAccess.Location>  GetAllLocations()
        {
            var objLocations = repository.GetAll();
            JsonResult locationJson = new JsonResult();
            locationJson.Data = objLocations;

            foreach (DataAccess.Location objl in objLocations)
            {
                var name = objl.LocationName;
            }

            return objLocations;
        }


    [System.Web.Mvc.HttpGet]
    public IEnumerable<DataAccess.Location> Locations()
    {
        var objLocations = repository.GetAll();
        JsonResult locationJson = new JsonResult();
        locationJson.Data = objLocations;

        foreach (DataAccess.Location objl in objLocations)
        {
            var name = objl.LocationName;
        }

        return objLocations;
    }


        


    }
}
