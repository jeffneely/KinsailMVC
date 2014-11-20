using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Specifies a leg on an itinerary, where a customer is staying, and for how long
     * also keeps track of selected activities
     */
    public class ItineraryBasic
    {
        public DateTime start { get; set; }     // beginning date of an Itinerary
        public DateTime end { get; set; }       // end date of an Itinerary

        public long locationId { get; set; }    // location where a customer will be staying during the start/end dates
        public long siteId { get; set; }        // site within a location where a customer will be staying
        public long[] activityId { get; set; }  // collection of activities the customer wishes to particpate with during their stay
    }
}