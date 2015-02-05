using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A map has several sets of coordinates and other properties which define a bounded area
     */
    public class MapDetail
    {
        // identifiers
        public long? mapId { get; set; }            // database identifier, never displayed to the user

        // attributes
        public string name { get; set; }
        public string description { get; set; }
        public string tilesURL { get; set; }        // base URL to a set of map tiles (example: "http://www.someurl.com/tiles/")
        public float width { get; set; }
        public float height { get; set; }
        public float centerX { get; set; }
        public float centerY { get; set; }
        public float latitudeNorth { get; set; }
        public float latitudeSouth { get; set; }
        public float longitudeEast { get; set; }
        public float longitudeWest { get; set; }
        public int zoomMin { get; set; }
        public int zoomMax { get; set; }
        public int zoomDefault { get; set; }

        // ctors
        public MapDetail()
        {
            this.name = string.Empty;
            this.description = string.Empty;
            this.tilesURL = string.Empty;
            this.width = 0;
            this.height = 0;
            this.centerX = 0;
            this.centerY = 0;
            this.latitudeNorth = 0;
            this.latitudeSouth = 0;
            this.longitudeEast = 0;
            this.longitudeWest = 0;
            this.zoomMin = 0;
            this.zoomMax = 0;
            this.zoomMin = 0;
        }

    }
}