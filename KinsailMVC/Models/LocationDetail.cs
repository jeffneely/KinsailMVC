using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Details about a location, including features, availability, policies, map tiles, etc...
     * Locations represent campgrounds or other recreation facilities or spaces
     * 
     * TODO: add more- reviews, events, activities, ...
     */
    public class LocationDetail : LocationBasic
    {
        // attributes
        public string reservationPolicies { get; set; }            // a very large string which describes all the legal policies/restrictions when reserving or canceling a reservation
        public int cancellationDaysBeforeReservation { get; set; } // example: 5 - Cancellation must occur before 5 days from the date of reservervation.
        public int availabilityStartMonth { get; set; }            // calendar month which defines the first month a reservation can be made (example: 5 - May)
        public int availabilityStartDay { get; set; }              // calendar day (within respective calendar month) which defines the first date which reservations can be made (example: 1 - First day of May)
        public int availabilityEndMonth { get; set; }              // calendar month which defines the last month for which reservations can be made (example 12 - December)
        public int availabilityEndDay { get; set; }                // calendar day (within respective calendar month) which defines the last day in which reservations can be made (example: 31 - Last day of December)
        public int priceMin { get; set; }                          // defines the minimum cost for a stay overnight - denormalized from site's cost structure to facilitate searching for "affordable" location to stay
        public int priceMax { get; set; }                          // defines the maximum cost for a stay overnight - denormalized from site's cost structure to facilitate searching for "affordable" location to stay
        public FeatureAttribute<object>[] features { get; set; }   // collection of Feature/Attributes for the location

        // non-queryable attributes
        public string baseURL { get; set; }                        // base URL for all resources (example: "http://www.someurl.com/")
        public string mapTilesBaseURL { get; set; }                // base URL to a set of map tiles (example: "http://www.someurl.com/tiles/")
        public BannerImage banner { get; set; }                    // banner image to use in branding
        public GalleryImage[] photos { get; set; }                 // more photos of the location
    }
}