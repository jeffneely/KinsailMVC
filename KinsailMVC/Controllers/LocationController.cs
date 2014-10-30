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
        static readonly ILocationRepository repository = new LocationRepository();

        public String Index()
        {
            return "Hello World";
        }

        public JsonResult  GetAllLocations()
        {
            var objLocations = repository.GetAll();
            JsonResult locationJson = new JsonResult();
            locationJson.Data = objLocations;

            return locationJson;
        }

        


    }
}
