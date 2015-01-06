using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Itinerary detail provides more information about an itinerary which would not be readily available
     */
    public class ItineraryDetail : ItineraryBasic
    {
        public LocationDetail location { get; set; } // complete information about the location of their stay
        public SiteDetail site { get; set; }         // complete information about the site of their stay
        public Activity[] activity { get; set; }     // collection of activities selected by the customer
    }
}