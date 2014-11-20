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
        public ActionResult Index()
        {
            IDatabase db = new Database("DB1/Kinsail_JNeely");
            List<Address> addrList = db.Fetch<Address>("SELECT Name AS Street, OutputColumns AS State FROM ItemTypes");

            string output = String.Join("<br/>", addrList.Select(x => x.street + " | " + x.state));

            return Content(output);
        }
    }
}
