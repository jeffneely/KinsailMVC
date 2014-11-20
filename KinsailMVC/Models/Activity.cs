using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * An Activity specifies something a customer can "do" while at a given location
     */
    public class Activity {
        public long activityId { get; set; }        // database identifier - never displayed to a user
        public long locationId { get; set; }        // database identifier for the location where this activity is accessible

        public string title { get; set; }           // name of an activity
        public string descriptionHtml { get; set; } // block of text with a detailed description of an activity
        public GalleryImage image { get; set; }     // image for the activity

        //TODO: Costs?
        //TODO: Event Calendar?
    }
}