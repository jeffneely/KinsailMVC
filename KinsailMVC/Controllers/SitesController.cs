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

    //using System.Web.Http.Cors;
    //[EnableCors("*", "*", "*")]  // EnableCors(OriginDomainAllowed, RequireHeader, AcceptVerbs)
    
    public class SitesController : ApiController
    {
        static readonly SiteRepository repository = new SiteRepository();

        [GET("sites")]
        public QueryResults<SiteBasic> GetSites()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            List<SiteBasic> results = repository.GetAll(queryParams);
            return new QueryResults<SiteBasic>(results.ToArray(), 0, results.Count);
        }

        [GET("sites/details")]
        public QueryResults<SiteDetail> GetSitesDetails()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllDetails(queryParams);
            return new QueryResults<SiteDetail>(results.ToArray(), 0, results.Count);
        }

        [GET("locations/{idLocation}/sites")]
        public QueryResults<SiteBasic> GetSitesForLocation(long idLocation)
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllForLocation(idLocation, queryParams);
            return new QueryResults<SiteBasic>(results.ToArray(), 0, results.Count);
        }

        [GET("locations/{idLocation}/sites/details")]
        public QueryResults<SiteDetail> GetSitesDetailsForLocation(long idLocation)
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllDetailsForLocation(idLocation, queryParams);
            return new QueryResults<SiteDetail>(results.ToArray(), 0, results.Count);
        }

        [GET("sites/{idSite}")]
        public SiteBasic GetSite(long idSite)
        {
            var result = repository.GetbyId(idSite);
            return result;
        }

        [GET("locations/{idLocation}/sites/{idSite}")]
        public SiteBasic GetSiteForLocation(long idSite)
        {
            var result = repository.GetbyId(idSite);
            return result;
        }

        [GET("sites/{idSite}/availability")]
        public SiteAvailability GetSiteAvailability(long idSite)
        {
            var result = repository.GetAvailabilitybyId(idSite);
            return result;
        }

        [GET("sites/{idSite}/details")]
        public SiteDetail GetSiteDetail(long idSite)
        {
            var result = repository.GetDetailbyId(idSite);
            return result;
        }

        [GET("locations/{idLocation}/sites/{idSite}/availability")]
        public SiteAvailability GetSiteAvailabilityForLocation(long idSite)
        {
            // TODO: don't ignore locationId
            var result = repository.GetAvailabilitybyId(idSite);
            return result;
        }

        [GET("locations/{idLocation}/sites/{idSite}/details")]
        public SiteDetail GetSiteDetailForLocation(long idSite)
        {
            // TODO: don't ignore locationId
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
