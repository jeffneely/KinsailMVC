using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Http;
using AttributeRouting.Web.Http;

namespace KinsailMVC.Controllers
{
    using KinsailMVC.Models;

    public class SitesController : ApiController
    {
        static readonly SiteRepository repository = new SiteRepository();

        [GET("sites")]
        public List<SiteBasic> GetSites()
        {
            var results = repository.GetAll();
            return results;
        }

        [GET("sites/details")]
        public List<SiteDetail> GetSitesDetails()
        {
            var results = repository.GetAllDetails();
            return results;
        }

        [GET("sites/{idSite}")]
        public SiteBasic GetSite(long idSite)
        {
            var result = repository.GetbyId(idSite);
            return result;
        }

        [GET("sites/{idSite}/details")]
        public SiteBasic GetSiteDetail(long idSite)
        {
            var result = repository.GetDetailbyId(idSite);
            return result;
        }
    }
}
