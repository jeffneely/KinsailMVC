using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * An address within the United States
     */
    public class Address
    {
        public string name { get; set; }     // example: "Home address"
        public string street { get; set; }   // example: "1234 Sesame Street"
        public string street2 { get; set; }  // example: "Suite 100"
        public string city { get; set; }     // example: "McLean"
        public string state { get; set; }    // example: "Virginia"
        public string zip { get; set; }      // example: "22101" or "22101-1234" in case of full zips
        public string country { get; set; }  // example: "US"

        public float longitude { get; set; } // geospacial coordinates
        public float latitude { get; set; }  // geospacial coordinates
    }
}