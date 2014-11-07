using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace KinsailMVC.Controllers
{
    using KinsailMVC.Models;

    public class PartnerController : ApiController
    {

        static readonly PartnerRepository repository = new PartnerRepository();


        [HttpGet]
        [ActionName("Partners")]
        public IEnumerable<DataAccess.Partner> GetPartners()
        {
            var objPartner = repository.GetAll();

            foreach (DataAccess.Partner objl in objPartner)
            {
                var name = objl.PartnerName;
            }

            return objPartner;
        }

        [HttpGet]
        [ActionName("Partner")]
        public IEnumerable<DataAccess.Partner> GetPartner(int IdPartner)
        {
            var objPartner = repository.GetbyId(IdPartner);

            foreach (DataAccess.Partner objl in objPartner)
            {
                var name = objl.PartnerName;
            }

            return objPartner;
        }
    }
}
