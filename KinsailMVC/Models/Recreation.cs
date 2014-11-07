using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    //Recreation Server API
/**
 * Represents an address within the United States
 */
class Address {
 
    public Int64 longitude; //Geospacial coordinates
    public Int64 latitude; //Geospacial coordinates
    public String street; //Exmaple: 1234 Sesame St.
    public String city; //Example: McLean
    public String state; //Example: Virginia
    public String zip; //Example: 22101 or "22101-1234" in case of full zips.
   
}

/**
 * A Gallery Image has an Icon representation for a full sized image
 */
class GalleryImage {

    //constructor();
    GalleryImage(string iconUrl, string fullImgUrl) {
        this.icon = iconUrl;
        this.fullImage = fullImgUrl;
    }
    

    string icon; //URL to Icon image
    string fullImage; //URL to full image
}

/**
 * Captures information about the attribute of a Site or Location
 */
public class FeatureAttribute<T> {

    public FeatureAttribute(string name, Boolean value) { //preset common parameters
        this.name = name;
        
        
    }

    public FeatureAttribute(string name, string value, string desc) { //preset common parameters
        this.name = name;
        this.value = value;
        this.description = desc;
    }

    String name;
    String description;
    String value ;
}

/**
 * A LocationDetail contains all the information for a given location.
 * For example: A Campground's name, address, etc
 */
class LocationDetail {
   
    Int64 objectId; //Database identifier. Never displayed to the user.

    String title; //Example the name of a camp ground
    Address address; //See Address class
    String operatingOrganization; //Example: Department of Forestry
    String operatingOrganizationPhone; //Example: (703) 555-1234 - The phone number to the organization which operates the site
    String reservationPhone; //Example: (703) 555-1324 - The phone number to the organization which can reserve a given site
    Int64 totalReservableSites; //Example 33 - defines how many sites the location has which can be reserved (includes camp sites, rv sites, shelters, etc)
    String reservationPolicies; //A very large string which describes all the legal mumbojumbo of reserving or canceling a reservation.
    int cancellationDaysBeforeReservation; //Example: 5 - Cancellation must occur before 5 days from the date of reservervation.
    int availabilityStartMonth; //The calendar month which defines the first month a reservation can be made. Example 5 - May
    int availabilityStartDay; ////The calendar day (within respective calendar month) which defines the first date which reservations can be made. Example: 1 - First day of May
    int availabilityEndMonth; //The calendar month which defines the last month for whcih reservations can be made. Example 12 - December
    int availabilityEndDay; ////The calendar day (with in respective calendar month) which defines the last day in which reservations can be made. Example: 31 - Last day of December
    float priceMin; //defines the minimum cost for a stay overnight - denormalized from site's cost structure to facilitate searching for "affordable" location to stay.
    float priceMax; //defines the maximum cost for a stay overnight - denormalized from site's cost structure to facilitate searching for "affordable" location to stay.
    
     FeatureAttribute<Boolean>[] features; // Collection of Feature/Attributes for a location
    
    //Known features attributes with sample values that may appear in the above collection.
    //new FeatureAttribute<boolean>("Equestrian", false); //Has an equestrian course or horse riding trails
    //new FeatureAttribute<boolean>("equestrianRental",false); //Can rent horses
    //new FeatureAttribute<boolean>("golfCourse",false); //Has a golf course
    //new FeatureAttribute<boolean>("discCourse",false); //Has a disc golf course
    //new FeatureAttribute<boolean>("fishing",false); //Has opportunities to fish
    //new FeatureAttribute<boolean>("miniGolf",false); //Has a minigolf course
    //new FeatureAttribute<boolean>("boatLaunch",false); //Has a boat launch
    //new FeatureAttribute<boolean>("boatRentals",false); //Has boat rentals
    //new FeatureAttribute<boolean>("motorBoatsPermitted",false); //Boats with gasoline engines are permitted
    //new FeatureAttribute<boolean>("waterSkiing",false); //Water feature supports water skiing.
    //new FeatureAttribute<boolean>("skiing",false); //Has skiing slope. 
    //new FeatureAttribute<boolean>("snowboarding",false); //Has snowboarding slope
    //new FeatureAttribute<boolean>("marina",false);  //Has a Marina
    //new FeatureAttribute<boolean>("kayakOrCanoeRentals",false); //Rents Kayaks or Canoes
    //new FeatureAttribute<boolean>("swimmingPool",false); //Has a swimming pool
    //new FeatureAttribute<boolean>("swimmingBeach",false); //Has a beach and swimming in a natural water feature
    //new FeatureAttribute<boolean>("picnicShelters",false); //Has picnic shelters
    //new FeatureAttribute<boolean>("playground",false); //Has a playgound
    //new FeatureAttribute<boolean>("meetingRoom",false); //Has a common/shared meeting room
    //new FeatureAttribute<boolean>("campStore",false); //Has a camp store
    //new FeatureAttribute<boolean>("playingFields",false); //has large fields for baseball/football/soccer
    //new FeatureAttribute<boolean>("tennis",false); //Has tennis courts
    //new FeatureAttribute<boolean>("hikingTrails",false); //Has hiking trails
    //new FeatureAttribute<boolean>("mountainBikeTrails",false); //Has mountain biking trails
    //new FeatureAttribute<boolean>("atvTrail",false); //Has ATV Trail riding
    //new FeatureAttribute<boolean>("restrooms",false); //Location supports enclosed restrooms
    //new FeatureAttribute<boolean>("showers",false); //Location has showers
    //new FeatureAttribute<boolean>("hotwater",false); //Location supports hot water of some sort
    //new FeatureAttribute<boolean>("guidedPrograms",false); //location has programs guided by someone. Eg guided hikes, wildlife programs, etc
    //new FeatureAttribute<boolean>("resturant",false); //The location has a resturant/cafe with prepared foods
    //new FeatureAttribute<boolean>("ampitheatre",false); //The location has a ampitheatre
    //new FeatureAttribute<boolean>("groupTenting",false); //Has group camping sites
    //new FeatureAttribute<boolean>("tentSites",false); //Has sites for tents
    //new FeatureAttribute<boolean>("cabinLodging",false); //Has cabins for rent
    //new FeatureAttribute<boolean>("hotelLodging",false); //Has lodging in a hotel type of facility
    //new FeatureAttribute<boolean>("picnicShelterRentals",false); // can rent picnic shelters
    //new FeatureAttribute<boolean>("recreationalVehicleSites",false); //location has sites for RVs

    //non queryable attributes
    String mapTilesBaseURL; // the base URL to a set of map tiles, eg: http://www.someurl.com/tiles/
    GalleryImage image; // The primary image to display for the site
    GalleryImage banner ; // The banner image to use in branding

}

/**
 * Defines a reservable type of site
 */
enum SiteType {
    tentSite = 1,      // Tent Site
    rvSite = 2,        // Recreational Vehicle (RV) Site
    picnicShelter = 4, // Picnic Shelter
    groupTentSite = 8, // Group Tent Site
    trailerSite = 16,  // Trailer site
    cabin = 32,        // Cabin Site
    boat = 64,         // Boat Site --?
    yurt = 128         // Yurt Site
}

/**
 * A Cost Period defines a period of time within a calendar year,
 *   and the associated rates to reserve the site on a daily basis. 
 */
class CostPeriod {

    CostPeriod(int startMonth, int startDay, int endMonth, int endDay, int minDur, float weekdayRate, float weekendRate, Boolean notAvailable) {
        this.startMonth = startMonth;
        this.startDay = startDay;
        this.endMonth = endMonth;
        this.endDay = endDay;
        this.minimumDuration = minDur;
        this.weekdayRate = weekdayRate;
        this.weekendRate = weekendRate;
        this.notAvailable = notAvailable;
    }

    int startMonth; // The calendar month which defines the beginning of this period.
    int startDay; // The day of the startMonth which defines the beginning of this period.
    int endMonth; // The calendar month which defines the end of this period.
    int endDay; // The day of the calendar month which defines the end of this period.
    int minimumDuration; // the miniumum duration stay which is applicable in this cost period.
    float weekdayRate; // The price in USD for spending the night during a weeknight (Sunday - Thursday). 
    float weekendRate; // The price in USD for spending the night during a weekend night (Friday and Saturday).
    Boolean notAvailable; // Indicates that the site is not available during this period.
}

/**
 * A Cost Structure defines several CostPeriods and the available rates.
 * A Cost Structure may have one or more overlapping CostPeriods if the CostPeriod's
 *  Distinguish themselves with different minimumDuration values. 
 * When calculating a total cost, it is necessary to select the appropriate cost period
 *  based on the duration of the reservation.
 */
class CostStructure {

     CostPeriod[] periods;

    CostStructure(CostPeriod[] periods) {
        this.periods = periods;
    }
    
    /**
     * Calculates the cost of a reservation based on the reservation Start/End dates
     *  and the defined CostPeriods of the Site.
     */
    float calculateCost(DateTime startDate, DateTime endDate) {
        //TODO: Implement correctly
        DateTime st = new DateTime(1970,1,1);

        return (GetTime(endDate) - GetTime(startDate)) * 25;
    }

    private Int64 GetTime(DateTime exDate)
  {
      Int64 retval=0;
      var  st=  new DateTime(1970,1,1);
      TimeSpan t= (exDate.ToUniversalTime()-st);
       retval= (Int64)(t.TotalMilliseconds+0.5);
      return retval;
  }
}

/**
 * Represents the X and Y cordinate values on a map where 0,0 is the top,left most coordinate.
 */
class MapCoordinates {
    float X;
    float Y;
}

/**
 * Defines a type of surface, for drive ways, tent pads, etc.
 */
enum SurfaceType {
    gravel = 0,
    pavement = 1,
    dirt = 2
}

/**
 * Defines the type of shade available at a particular site.
 */
enum ShadeType {
    none = 0, // no share is available
    full = 1, // the site is completely covered in shade
    partial = 2 // the site has partial shade
}

/** 
 * Defines basic information about a reservable site.
 */
class SiteBasic {

    Int64 objectId; // Database identifier. Never displayed to user.
    Int64 locationObjectId; //The Database Identifier for the location which a site belongs

    SiteType type; // The type of site
    string siteIdentifier; // A short identifier, eg: "A001"
    MapCoordinates coords; // Defines where this site is located on the map

    //non queryable attributes 
     GalleryImage image; // The primary image to display for the site
}

/**
 * Extended details for a specific site
 */
class SiteDetail : SiteBasic {
     string description; // A verbose description of the site.
    int maxAccommodatingUnits; // Number tents/rvs/hourse/etc supported depending on site type.
    int minDuration; // the minimum number of days this site is reservable. Eg 1
    int maxDuration; // the maximum number of days this site is reservable. Eg 15
    int advancedReservationPeriod; // The number of days before the desired reservation startDate customers are allowed to make a reservation.
                                       //  Eg. If this value is 30, and I desired to make a reservation started on May 31th, I can make a reservation anytime 
                                       //    between May 1st and May 30th.

    FeatureAttribute<any>[] features; //a list of features associated with this site.

    //possible feature attributes which may be available in the collection above:
    //new FeatureAttribute<boolean>("handicapAccessible", false); // Is this site handdicap accessible 
    //new FeatureAttribute<boolean>("electricHookup", false);  // Does this site have electric hookup
    //new FeatureAttribute<boolean>("septicHookup", false); // Does this site have a sewage / septic hookup.
    //new FeatureAttribute<boolean>("generatorsAllowed", false); // does this site permit the use of generators.
    //new FeatureAttribute<string>("generatorRules", "Generators are permitted between 9am and sunset"); // general rules for the use of a generator. 
    //new FeatureAttribute<number>("maxOccupants", 5); // the maximum number of people who may stay at this site
    //new FeatureAttribute<number>("minOccupants", 1); // The mimimum number of people who may stay at this site.
    //new FeatureAttribute<SurfaceType>("parkingSurface", SurfaceType.gravel);  // The parking surface type
    //new FeatureAttribute<boolean>("parkingLevel", false); // Defines whether the parking area is level
    //new FeatureAttribute<number>("parkingLength", 25); // The length in feet of the parking area.
    //new FeatureAttribute<boolean>("boatAccessible", false); // Is this site adjacent to a boat slip
    //new FeatureAttribute<boolean>("horseAccomodation", false); // Site support the stay of horses
    //new FeatureAttribute<ShadeType>("shade", ShadeType.full); // The type of shade available at the site.
    //new FeatureAttribute<boolean>("petsAllowed", false); // Whether pets are allowed during the stay at the site.

    //non queryable attributes 
    CostStructure cost; // Defines the costs associated with the site.
}

/**
 * An Activity specifies something a customer can "do" while at a given location.
 */
class Activity {
    Int64 objectId; // Database identifier - never displayed to a user.
    Int64 locationObjectId; //Database identifier for the location where this activity is accessible.

    String title; // The name of an activity;
    String descriptionHtml; //A block of text with a detailed description of an activity
    GalleryImage image; //An image for the activity.

    //TODO: Costs?
    //TODO: Event Calendar?
}

/**
 * An event is much like an activity except it has a definitive start/end date.
 */
class EventDetail : Activity {
    DateTime start; // The start of an event
    DateTime end; // The end date of an event

    Boolean reservationRequired; // defines whether the event requires a registration or not.
}

/**
 * Specifies a leg on an itinerary, where a customer is staying, and for how long.
 *  also keeps track of selected activities.
 */
class ItineraryBasic {
    DateTime start; // Defines the beginning of an Itinerary item
    DateTime end; // Defines the end of an Itinerary item

    Int64 locationObjectId; //Specifies the location where a customer will be staying during the start/end dates
    Int64 siteObjectId; // Specifies the specific site within a location where a customer will be staying.
    Int64[] activityId; // A collection of activities the customer wishes to particpate with during their stay.
}

/**
 * Itinerary detail provides more information about an itinerary which would not be readily available.
 */
class ItineraryDetail : ItineraryBasic {
    LocationDetail location; // The complete information about the location of their stay.
    SiteDetail site; // The complete information about the site of their stay.
    Activity[] activity ; // a Collection of activities selected by the customer.
}

/**
 * Collection of ItineraryBasic objects.
 */
class ItineraryCart {
    ItineraryBasic[] legs;
}

/**
 * A user of the system
 */
class RecUser {

    Int64 objectId; // the database object id - never display to user

    string userName; //the username used to authenticate with.
    string firstName; // A user's first name
    string lastName; // a user's last name
    GalleryImage profilePicture ; // a user's profile picture.
}

/**
 * Represents a review of something, like a Location
 */
class Review {
    Int64 objectId; //A Database ObjectID, never display to user
    Int64 locationObjectId; //The Object ID for the location which this is a review of.
    String summary; // the short summary review
    int rating; // a value between 1 and 5 where 5 is the best rating.
    String description; //a verbose review write up
    RecUser reviewBy; // the user who submitted the review.
}

/**
 * Specifies which dates ARE not available.
 */
class SiteAvailability : SiteBasic {
    DateRange[] bookedRanges; // specifies the dates which are not available for booking.
}

/**
 * A Date Range, specifies a start and end date.
 * The precisions is to the day
 */
class DateRange {
    DateTime startDate;
    DateTime endDate;
}


class SiteAvailabilityCriteria : DateRange {
    Int64 siteObjectId; //The site ID to search for.
    Int64 locationObjectId; //The location to search for available sites.
    //super class specifies parameters for start/end date which specifiy the date range to search for availability.
    //Either a siteObjectId or locationObjectId are required. 
    //If not start/end date is specified, then the server will assume start is the current date, and end is +3 months.
}

/**
 * Defines a query for information from the server.
 */
class Query<T> {
    T criteria; //defines the criteria for a query
    int startRow = 0; //defines the record number to start returning results. Support for pagination.
    int rowCount = 25; //the number of rows to return for the query.
}

/**
 * Defines the results of a query where T is the type of records being returned.
 */
class QueryResults<T> {
    T[] results ;
    int startRow ; //defines the record number to start returning results. Support for pagination.
    int totalRecords; //the number of rows the query would have returned had there been no restriction on rowCount. Support for pagination.
}

/**
 * Used to return results from an async call to the server.
 */
class ASyncReply<T> {
    
    T success;
    ASyncFailureResult  failure;

    ASyncReply(T success, ASyncFailureResult failure) {
        this.success = success;
        this.failure = failure;
    }
}

/**
 * If an Async call fails, this object contains information as to why it failed.
 */
class ASyncFailureResult {
    int statusCode;
    String error;
}

/**
 * Defines the results of a reservation request
 */
class ReservationResults {
    Boolean success; 
    String failureReason; // if there is a failure completing the reservation, this text describes why.
    String paymentUrl; // The URL to direct the user's web browser to complete payments.
}

/**
 * primary interface for obtaining information from the server.
 */
interface RecreationServer {
    
    /**
     * Returns an array of GalleryImage objects for a given Location.
     * query.criteria - defines the objectId for a location for which to return a galary of images.
     */
    getLocationGallery(Query<int> query, ASyncReply<QueryResults<GalleryImage>> callback);

    /**
     * Returns an array of GalleryImage objects for a given Site.
     * query.criteria - defines the objectId for a site for which to return a galary of images.
     */
    getSiteGallary(query: Query<number>, callback: ASyncReply<QueryResults<GalleryImage>>): void;

    /**
     * Returns a collection of SiteBasic objects which match the given criteria
     *  passed in as siteExample.
     *
     * query.criteria -  is a partially populated SiteDetail object. Each value supplied
     *  in the criteria object specifies filter criteria to use to filter available sites.
     *
     * reservationStart & reservationEnd - specify the desired reservation start/end dates.
     *
     * Passing in null values for the siteExample, reservationStart, and reservationEnd parameters 
     *  will return a complete list of SiteBasic objects for the given location.
     */
    filterSitesByExample(query: Query<SiteDetail>, reservationStart: Date, reservationEnd: Date, callback: ASyncReply<QueryResults<SiteBasic>>): void;

    /**
     * Returns SiteDetail object which contains much more information about a given site
     */
    getSiteDetail(siteObjectId: number,  callback: ASyncReply<SiteDetail>): void;

    /**
     * Returns a list of available activites at a given location.
     * query.criteria - defines the objectId for a location for which to return activities. 
     */
    getActivities(query: Query<Activity>, callback: ASyncReply<QueryResults<Activity>>): void;

    /**
     * returns reviews for a given location
     * query.criteria - defines the objectId for a location for which to return reviews
     */
    getReviews(query: Query<Review>, callback: ASyncReply<QueryResults<Review>>): void;

    /**
     * returns a collection of upcoming events for a given location
     *
     * query.criteria - defines the objectId for a location for which to return events.
     */
    getEvents(query: Query<EventDetail>, callback: ASyncReply<QueryResults<EventDetail>>): void;

    /**
     * Completes a reservation for a given user and itinerary.
     */
    makeReservation(intinerary: ItineraryCart, callback: ASyncReply<ReservationResults>): void;

    /**
     * Returns a list of Sites and their unavailable date ranges.
     */ 
    getSiteAvailability(query: Query<SiteAvailabilityCriteria>, results: ASyncReply<QueryResults<SiteAvailability>>): void;
}




}


