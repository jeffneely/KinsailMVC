using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Details for a site, such as description, features, cost information, etc...
     */
    public class SiteDetail : SiteBasic
    {
        // attributes
        public int maxAccommodatingUnits { get; set; }           // number of tents/rvs/horses/etc supported, depending on site type
        public int minDuration { get; set; }                     // the minimum number of days this site is reservable (Example: 1)
        public int maxDuration { get; set; }                     // the maximum number of days this site is reservable (Example: 15)
        public int advancedReservationPeriod { get; set; }       // the number of days before the desired reservation startDate customers are allowed to make a reservation
        public int reservable { get; set; }                      // whether the site is reservable in advance
        public FeatureAttribute<object>[] features { get; set; } // list of features associated with this site

        // non-queryable attributes 
        public CostStructure cost { get; set; }                  // costs associated with the site
        public GalleryImage[] photos { get; set; }               // more photos of the site
    }
}