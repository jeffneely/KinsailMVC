using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A map has several sets of coordinates and other properties which define a bounded geogrphic area
     */
    public class MapDetail
    {
        // identifiers
        public long? mapId { get; set; }            // database identifier, never displayed to the user

        // attributes
        public string name { get; set; }            // friendly name of the map
        public string description { get; set; }     // description (could be used for administrative purposes)
        public string tilesURL { get; set; }        // base URL to a set of map tiles (example: "http://www.someurl.com/tiles/")
        public float width { get; set; }            // overall width of the map
        public float height { get; set; }           // overall height of the map
        public float centerX { get; set; }          // horizontal map center point
        public float centerY { get; set; }          // vertical map center point
        public float latitudeNorth { get; set; }    // latitude of the top edge of the map
        public float latitudeSouth { get; set; }    // latitude of the bottom edge of the map
        public float longitudeEast { get; set; }    // longitude of the left edge of the map
        public float longitudeWest { get; set; }    // longitude of the right edge of the map
        public int zoomMin { get; set; }            // minium zoom level
        public int zoomMax { get; set; }            // maximum zoom level
        public int zoomDefault { get; set; }        // initial zoom level

        public MapFeature[] markers { get; set; }   // markers to display on the map

        // ctors
        public MapDetail()
        {
            this.mapId = null;

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

            this.markers = null;
        }

    }
}