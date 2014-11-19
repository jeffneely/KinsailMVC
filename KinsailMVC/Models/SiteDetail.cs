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
        public string description { get; set; }                  // verbose description of the site
        public int maxAccommodatingUnits { get; set; }           // number of tents/rvs/horses/etc supported, depending on site type
        public int minDuration { get; set; }                     // the minimum number of days this site is reservable. Eg 1
        public int maxDuration { get; set; }                     // the maximum number of days this site is reservable. Eg 15
        public int advancedReservationPeriod { get; set; }       // The number of days before the desired reservation startDate customers are allowed to make a reservation.
        //  Eg. If this value is 30, and I desired to make a reservation started on May 31th, I can make a reservation anytime 
        //    between May 1st and May 30th.
        // TODO - refactor reservation rules - need to move these into a contained object that can be shared by multiple resources

        public FeatureAttribute<object>[] features { get; set; } // list of features associated with this site.

        // possible feature attributes which may be available in the collection above:
        //new FeatureAttribute<boolean>("handicapAccessible", false); // is this site handicap-accessible 
        //new FeatureAttribute<boolean>("electricHookup", false);     // does this site have an electric hookup
        //new FeatureAttribute<boolean>("septicHookup", false);       // does this site have a sewage / septic hookup
        //new FeatureAttribute<boolean>("generatorsAllowed", false);  // does this site permit the use of generators
        //new FeatureAttribute<string>("generatorRules", "Generators are permitted between 9am and sunset"); // general rules for the use of a generator
        //new FeatureAttribute<number>("maxOccupants", 5);            // maximum number of people who may stay at this site
        //new FeatureAttribute<number>("minOccupants", 1);            // mimimum number of people who may stay at this site
        //new FeatureAttribute<SurfaceType>("parkingSurface", SurfaceType.gravel);  // parking surface type
        //new FeatureAttribute<boolean>("parkingLevel", false);       // whether the parking area is level
        //new FeatureAttribute<number>("parkingLength", 25);          // length in feet of the parking area
        //new FeatureAttribute<boolean>("boatAccessible", false);     // is this site adjacent to a boat slip
        //new FeatureAttribute<boolean>("horseAccomodation", false);  // supports the stay of horses
        //new FeatureAttribute<ShadeType>("shade", ShadeType.full);   // type of shade available at the site
        //new FeatureAttribute<boolean>("petsAllowed", false);        // whether pets are allowed during the stay at the site

        // non-queryable attributes 
        public CostStructure cost;                               // costs associated with the site
    }
}