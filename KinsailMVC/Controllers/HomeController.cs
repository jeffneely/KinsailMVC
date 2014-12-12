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
            List<SiteBasic> sites = db.Fetch<SiteBasic>("SELECT ItemID AS siteId, Name AS siteIdentifier FROM Items WHERE ItemTypeID = (SELECT ItemTypeID FROM ItemTypes WHERE Name = 'Recreation Site')");

            string output = "<h2>Recreation POC Server</h2>Testing DB connectivity...<br/>" +
                "<table width=100%>" +
                "<tr valign=top><td><b>Sites:</b><br/>" + String.Join("<br/>", sites.Select(x => x.siteId + " | " + x.siteIdentifier)) +
                "</td><td>";

            // REST API note
            output = output +
                "<b>Supported REST API:</b> <br/>" +
                "<table>" +
                "<tr><td>/Campsites/locations </td><td>List of Locations (LocationBasic)</td></tr>" +
                "<tr><td>/Campsites/locations/details </td><td>List of Locations (LocationDetail)</td></tr>" +
                "<tr><td>/Campsites/locations/712689 </td><td>Location 712689 (LocationBasic)</td></tr>" +
                "<tr><td>/Campsites/locations/712689/details </td><td>Location 712689 (LocationDetail)</td></tr>" +
                "<tr><td>/Campsites/locations/712689/sites </td><td>List of Sites for Location 712689 (SiteBasic)</td></tr>" +
                "<tr><td>/Campsites/locations/712689/sites/details </td><td>List of Sites for Location 712689 (SiteDetail)</td></tr>" +
                "<tr><td>/Campsites/locations/712689/sites/713989 </td><td>Site 713989 (SiteBasic)</td></tr>" +
                "<tr><td>/Campsites/locations/712689/sites/713989/availability </td><td>Availability info for Site 713989 (SiteAvailability)</td></tr>" +
                "<tr><td>/Campsites/locations/712689/sites/713989/details </td><td>Site 713989 (SiteDetail)</td></tr>" +
                "<tr><td>/Campsites/sites/713989 </td><td>Site 713989 (SiteBasic)</td></tr>" +
                "<tr><td>/Campsites/sites/713989/availability </td><td>Availability info for Site 713989 (SiteAvailability)</td></tr>" +
                "<tr><td>/Campsites/sites/713989/details </td><td>Site 713989 (SiteDetail)</td></tr>" +
                "</table>";

            output = output + "</td></tr></table>";

            return Content(output);
        }
    }
}
