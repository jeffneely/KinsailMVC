using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Http;

namespace KinsailMVC.Controllers
{
    using KinsailMVC.Models;

    public class LocationsController : ApiController
    {
        static readonly LocationRepository repository = new LocationRepository();

        [GET("locations")]
        public QueryResults<LocationBasic> GetLocations()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAll(queryParams);
            return new QueryResults<LocationBasic>(results.ToArray(), 0, results.Count);
        }

        [GET("locations/details")]
        public QueryResults<LocationDetail> GetLocationsDetails()
        {
            var results = repository.GetAllDetails();
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