using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    public class LocationReview : Review
    {
        public long locationId { get; set; }  // database identifier - never displayed to the user
    }
}