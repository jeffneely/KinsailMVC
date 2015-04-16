using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Information about feature attributes and an array of assigned values
     */
    public class FeatureAttributeStat<T>
    {
        // identifiers
        public long? id { get; set; }           // database identifier, never displayed to the user

        // attributes
        public string name { get; set; }        // example: "primaryColor"
        public string label { get; set; }       // example: "Primary Color"
        public string description { get; set; } // example: "The primary exterior color and shade"
        public string type { get; set; }        // example: "String"
        public int count { get; set; }          // example: 3
        public List<ValueCount<T>> values { get; set; }     // example: ["Red", "Blue"]
        
        // ctors
        public FeatureAttributeStat()
        {
            this.id = null;
            this.name = string.Empty;
            this.label = string.Empty;
            this.description = string.Empty;
            this.type = "Boolean";
            this.count = 0;
            this.values = null;
        }

    }

}