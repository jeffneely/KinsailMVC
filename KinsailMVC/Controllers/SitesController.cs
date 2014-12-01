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

        // GET api/values
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

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

        [POST("sites")]
        public void AddSite([FromBody]string value)
        {
            //TODO: add method to SiteRepository for adding a SiteBasic
        }

        [POST("sites/details")]
        public void AddSiteDetail([FromBody]string value)
        {
            //TODO: add method to SiteRepository for adding a SiteDetail
        }

        [PUT("sites")]
        public void UpdateSite(long idSite, [FromBody]string value)
        {
            //TODO: add method to SiteRepository for updating a SiteBasic
        }

        [PUT("sites")]
        public void UpdateSiteDetail(long idSite, [FromBody]string value)
        {
            //TODO: add method to SiteRepository for updating a SiteDetail
        }

        [DELETE("sites")]
        public void Delete(long siteId)
        {
            //TODO: add method to SiteRepository for deleting a site
        }
    }
}
