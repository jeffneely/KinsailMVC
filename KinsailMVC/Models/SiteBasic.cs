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
        public long siteId { get; set; }           // database identifier, never displayed to user
        public long locationId { get; set; }       // database identifier for the location to which the site belongs

        // attributes
        public SiteType type { get; set; }          // type of site
        public string siteIdentifier { get; set; }  // short identifier, eg: "A001"
        public MapCoordinates coords { get; set; }  // where this site is located on the map

        // non queryable attributes 
        public GalleryImage image;                  // primary image to display for the site

        //
        // DB MAPPING NOTES
        //
        // Kinsail DB Items table maps to SiteBasic:
        //
        // dbo.Items.ItemTypeID = (SELECT dbo.ItemTypeID from dbo.ItemTypes WHERE Name = 'Recreation Site')
        // dbo.Items.ItemID = siteId
        // dbo.Items.GroupID = locationId
        //
        // dbo.Items.Name = siteIdentifier
        //
        // dbo.Items.ItemID -> dbo.ItemsXImages.ItemID
        // dbo.ItemsXImages.ImageID -> dbo.Images.ImageID
        // dbo.ItemsXImages.DisplayOrder = 0
        //   dbo.Images.IconURL = image.IconUrl
        //   dbo.Images.FullURL = image.fullImageUrl
        //   dbo.Images.Active = 1
        //   
        // ---the following attributes are not currently mapped to DB columns---
        //   operatingOrganizationPhone
        //   reservationPhone
        //   totalReservableSites
    }
}