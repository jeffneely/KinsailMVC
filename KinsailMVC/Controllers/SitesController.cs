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
    
    //using System.Web.Http.Cors;
    //[EnableCors("*", "*", "*")]  // EnableCors(OriginDomainAllowed, RequireHeader, AcceptVerbs)
    
    public class SitesController : ApiController
    {
        static readonly SiteRepository repository = new SiteRepository();

        [Route("sites")]
        [HttpGet]
        public  QueryResults<SiteBasic> GetSites()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            List<SiteBasic> results = repository.GetAll(queryParams);
            return new QueryResults<SiteBasic>(results.ToArray(), 0, results.Count);
        }

        [Route("maps")]
        [HttpGet]
        public QueryResults<Map> GetMaps()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            List<Map> results = repository.GetMaps();
            return new QueryResults<Map>(results.ToArray(), 0, results.Count);
        }

        [Route("SitesBasicInfo")]
        [HttpGet]
        public QueryResults<SiteBasicInfo> GetSitesBasicInfo()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            List<SiteBasicInfo> results = repository.GetSiteBasicInfo();
            return new QueryResults<SiteBasicInfo>(results.ToArray(), 0, results.Count);
        }

        [Route("SiteImages")]
        [HttpGet]
        public QueryResults<ImageBasic> GetImagesBasicInfo()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            List<ImageBasic> results = repository.GetImages();
            return new QueryResults<ImageBasic>(results.ToArray(), 0, results.Count);
        }

        [Route("sites/details")]
        [HttpGet]
        public QueryResults<SiteDetail> GetSitesDetails()
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllDetails(queryParams);
            return new QueryResults<SiteDetail>(results.ToArray(), 0, results.Count);
        }

        [Route("locations/{idLocation}/sites")]
        [HttpGet]
        
        public QueryResults<SiteBasic> GetSitesForLocation(long idLocation)
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllForLocation(idLocation, queryParams);
            return new QueryResults<SiteBasic>(results.ToArray(), 0, results.Count);
        }

        [Route("locations/{idLocation}/sites/details")]
        [HttpGet]
        public QueryResults<SiteDetail> GetSitesDetailsForLocation(long idLocation)
        {
            Dictionary<string, string> queryParams = System.Web.Http.HttpRequestMessageExtensions.GetQueryStrings(this.Request);
            var results = repository.GetAllDetailsForLocation(idLocation, queryParams);
            return new QueryResults<SiteDetail>(results.ToArray(), 0, results.Count);
        }

        [Route("sites/{idSite}")]
        [HttpGet]    
        public SiteBasic GetSite(long idSite)
        {
            var result = repository.GetbyId(idSite);
            return result;
        }

        [Route("locations/{idLocation}/sites/{idSite}")]
        [HttpGet]
        public SiteBasic GetSiteForLocation(long idSite)
        {
            var result = repository.GetbyId(idSite);
            return result;
        }

        [Route("sites/{idSite}/availability")]
        [HttpGet]
        public SiteAvailability GetSiteAvailability(long idSite)
        {
            var result = repository.GetAvailabilitybyId(idSite);
            return result;
        }

        [Route("sites/{idSite}/details")]
        [HttpGet]
        public SiteDetail GetSiteDetail(long idSite)
        {
            var result = repository.GetDetailbyId(idSite);
            return result;
        }

        [Route("locations/{idLocation}/sites/{idSite}/availability")]
        [HttpGet]
        public SiteAvailability GetSiteAvailabilityForLocation(long idLocation, long idSite)
        {
            // TODO: don't ignore locationId
            var result = repository.GetAvailabilitybyId(idSite);
            return result;
        }

        [Route("locations/{idLocation}/sites/{idSite}/details")]
        [HttpGet]
        public SiteDetail GetSiteDetailForLocation(long idLocation, long idSite)
        {
            // TODO: don't ignore locationId
            var result = repository.GetDetailbyId(idSite);
            return result;
        }

        [Route("Addsites")]
        [HttpPost]
        public HttpResponseMessage AddSite([FromBody]SiteBasic objSite)
        {
            try
            {
                
                
                repository.AddSite(objSite);
                return Request.CreateResponse(HttpStatusCode.Created);   
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        
        }

        [Route("Addsites/details")]
        [HttpPost]
        public void AddSiteDetail([FromBody]string value)
        {
            //TODO: add method to SiteRepository for adding a SiteDetail
        }

        [Route("Updsites")]
        [HttpPut]
        public HttpResponseMessage UpdateSite([FromBody] SiteBasic objSiteBasic)
        {
            try
            {
                
                repository.AddSite(objSiteBasic);
                
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        [Route("Updsites/details")]
        [HttpPut]
        public void UpdateSiteDetail(long idSite, [FromBody]string value)
        {
            //TODO: add method to SiteRepository for updating a SiteDetail
        }

        [Route("Delsites")]
        [HttpDelete]
        public HttpResponseMessage Delete([FromBody] SiteBasic objSiteBasic)
        {
            try
            {
                repository.DeleteSite(objSiteBasic.siteId, objSiteBasic.locationId);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}
