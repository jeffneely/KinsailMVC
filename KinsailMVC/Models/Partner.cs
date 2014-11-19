using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    public class Partner
    {
        // identifiers
        public long partnerId { get; set; }  // database identifier, never displayed to the user

        // attributes
        public string code { get; set; }     // example: "FS"
        public string name { get; set; }     // example: "Forestry Service"
    }
}