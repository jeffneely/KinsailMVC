using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Core information about a location, such as its name, address, phone, icon, etc...
     * Locations represent campgrounds or other recreation facilities or spaces
     */
    [NPoco.TableName("Items")]
    [NPoco.PrimaryKey("ItemID")]
    public class LocationBasic
    {
        // identifiers
        [NPoco.Column("ItemID")]
        public long locationId { get; set; }                       // database identifier, never displayed to the user
        
        // attributes
        [NPoco.Column("Name")]
        public string title { get; set; }                          // the name of a camp ground or recreation facility
        public Address address { get; set; }                       // primary address of the location (see Address class)
        public string operatingOrganization { get; set; }          // example: "Department of Forestry"
        public string operatingOrganizationPhone { get; set; }     // main phone number to the organization which operates the site (example: "(703) 555-1234")
        public string reservationPhone { get; set; }               // phone number to call for making a reservation at the location (example: "(703) 555-1324")
        public long totalReservableSites { get; set; }             // defines how many sites the location has, which can be reserved; includes camp sites, rv sites, shelters, etc (example: 33)

        // non-queryable attributes
        public GalleryImage image { get; set; }                    // primary image to display for the location
    }
    //
    // DB MAPPING NOTES
    //
    // Kinsail DB Groups table maps to LocationBasic:
    //
    // dbo.Groups.GroupTypeID = (SELECT dbo.GroupTypeID from dbo.GroupTypes WHERE Name = 'Recreation Location')
    // dbo.Groups.GroupID = locationId
    // dbo.Groups.Name = title
    // dbo.Groups.Sponsor = operatingOrganization
    //
    // dbo.Groups.LocationID -> dbo.Locations.LocationID
    //   dbo.Location.LocationName = address.name
    //   dbo.Location.StreetAddress = address.street
    //   dbo.Location.StreetAddress2 = address.street2
    //   dbo.Location.City = address.city
    //   dbo.Location.State = address.state
    //   dbo.Location.ZipCode = address.zip
    //   dbo.Location.Country = address.country
    //   dbo.Location.Active = 1
    // 
    // dbo.Groups.GroupID -> dbo.GroupsXImages.GroupID
    // dbo.GroupsXImages.ImageID -> dbo.Images.ImageID
    // dbo.GroupsXImages.DisplayOrder = 0
    //   dbo.Images.IconURL = image.IconUrl
    //   dbo.Images.FullURL = image.fullImageUrl
    //   dbo.Images.Active = 1
    //   
    // ---the following attributes are not currently mapped to DB columns---
    //   operatingOrganizationPhone
    //   reservationPhone
    //   totalReservableSites

}