using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Represents a review of something, like a Location
     */
    public class SiteReview : Review
    {
        public long siteId { get; set; }  // database identifier - never displayed to the user
    }
}