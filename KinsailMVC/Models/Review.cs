using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Represents a review of something, like a Location
     * subclasses will decorate this with an appropriate source object id
     */
    public class Review
    {
        public long reviewId { get; set; }        // database identifier - never displayed to the user
        public string summary { get; set; }       // the short summary review
        public int rating { get; set; }           // value between 1 and 5 where 5 is the best rating
        public string description { get; set; }   // verbose review write-up
        public RecUser reviewBy { get; set; }     // user who submitted the review
        public DateTime reviewDate { get; set; }  // when reviewed
    }
}