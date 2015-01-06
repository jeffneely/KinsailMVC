using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /** 
     * Defines basic information about a reservable site
     */
    [NPoco.TableName("Items")]
    [NPoco.PrimaryKey("ItemID")]
    public class SiteBasic
    {
        // identifiers
        [NPoco.Column("ItemID")]
        public long siteId { get; set; }            // database identifier, never displayed to user
        public long locationId { get; set; }        // database identifier for the location to which the site belongs

        // attributes
        public int type { get; set; }               // type of site
        //public SiteType type { get; set; }        // couldn't get this to map via NPoco (need support for enum mapping)
        [NPoco.Column("Name")]
        public string siteIdentifier { get; set; }  // short identifier, eg: "A001"
        public MapCoordinates coords { get; set; }  // where this site is located on the map

        // non queryable attributes 
        public GalleryImage image { get; set; }     // primary image to display for the site
    }
}