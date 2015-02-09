using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A map feature represents a set of markers that are displayed on a map
     */
    public class MapFeature
    {
        // identifiers
        public long? mapId { get; set; }            // database identifiers,
        public long? featureId { get; set; }        //   never displayed to the user

        // attributes
        public int displayOrder { get; set; }       // order in which to display this set of markers
        public bool customMarkerFlag { get; set; }  // use custom markers?
        public string matchFeature { get; set; }    // show markers for sites with features that match the selected
        public string matchOperator { get; set; }   //   feature, operation and value
        public string matchValue { get; set; }      //   (e.g., "siteType GT 16" or "handicapAccess EQ 1")
        public string marker { get; set; }          // optional marker text (could identify the custom marker to be used)
        public string description { get; set; }     // displayed in a pop-up on the marker
        public int offsetX { get; set; }            // offset (in pixels) in which to display the marker, measured
        public int offsetY { get; set; }            //   from the base position of the associated site
        
        // ctors
        public MapFeature()
        {
            this.mapId = null;
            this.featureId = null;
            
            this.displayOrder = 0;
            this.customMarkerFlag = false;
            this.matchOperator = string.Empty;
            this.matchValue = string.Empty;
            this.marker = null;
            this.description = null;
            this.offsetX = 0;
            this.offsetY = 0;
        }

    }
}