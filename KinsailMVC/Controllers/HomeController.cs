using KinsailMVC.Models;
using NPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KinsailMVC.Controllers
{
    public class HomeController : Controller
    {
        public ViewResult Index()
        {
            IDatabase db = new Database("DB1/Kinsail_JNeely");
            List<SiteBasic> sites = db.Fetch<SiteBasic>("SELECT ItemID AS siteId, Name AS siteIdentifier FROM Items WHERE ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site')");

            string output = "<h2>Testing DB connectivity...</h2>" + String.Join("<br/>", sites.Select(x => x.siteId + " | " + x.siteIdentifier));
            ViewBag.Message = output;

            return View();
        }

    }
}
