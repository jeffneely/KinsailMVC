using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Specifies a collection of date ranges on which the site is booked/available
     */
    public class SiteAvailability : SiteBasic
    {
        public DateRange[] bookedRanges { get; set; }     // dates which are already booked
        public DateRange[] availableRanges { get; set; }  // dates which are available for booking
    }
}