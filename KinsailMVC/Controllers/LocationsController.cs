using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using AttributeRouting.Web.Http;
using KinsailMVC.Models;

namespace KinsailMVC.Controllers
{
    

    public class LocationsController : ApiController
    {
        static readonly LocationRepository repository = new LocationRepository();

        [GET("locations")]
        public List<LocationBasic> GetSites()
        {
            var results = repository.GetAll();
            return results;
        }

        [GET("locations/details")]
        public List<LocationDetail> GetSitesDetails()
        {
            var results = repository.GetAllDetails();
            return results;
        }

        [GET("locations/{idLocation}")]
        public LocationBasic GetSite(long idLocation)
        {
            var result = repository.GetbyId(idLocation);
            return result;
        }

        [GET("locations/{idLocation}/details")]
        public LocationBasic GetSiteDetail(long idLocation)
        {
            var result = repository.GetDetailbyId(idLocation);
            return result;
        }
    }
}