using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.Http;
using AttributeRouting.Web.Http;
using KinsailMVC.Models;
using System.Net.Http;
using System.Net.Http.Formatting;

namespace KinsailMVC.Controllers
{
    
    public class LocationsController : ApiController
    {
        static readonly LocationRepository repository = new LocationRepository();

        [HttpGet]
        [Route("locations")]
        public QueryResults<LocationBasic> GetLocations()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAll(queryParams);
            return new QueryResults<LocationBasic>(results.ToArray(), 0, results.Count);
        }

        [HttpGet]
        [Route("locationsBasicInfo")]
        public QueryResults<LocationBasicInfo> GetLocationsBasicInfo()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetBasicInfo();
            return new QueryResults<LocationBasicInfo>(results.ToArray(), 0, results.Count);
        }


        [HttpGet]
        [Route("locations/details")]
        public QueryResults<LocationDetail> GetLocationsDetails()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllDetails(queryParams);
            return new QueryResults<LocationDetail>(results.ToArray(), 0, results.Count);
        }

        [GET("locations/{idLocation}")]
        public LocationBasic GetLocation(long idLocation)
        {
            var result = repository.GetbyId(idLocation);
            return result;
        }

        [GET("locations/{idLocation}/details")]
        public LocationBasic GetLocationDetail(long idLocation)
        {
            var result = repository.GetDetailbyId(idLocation);
            return result;
        }


    }
}