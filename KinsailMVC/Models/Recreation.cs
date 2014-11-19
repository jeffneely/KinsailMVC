using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    //Recreation Server API


public static class Utils {
    static public Int64 GetTime(DateTime exDate)
    {
        Int64 retval = 0;
        var st = new DateTime(1970, 1, 1);
        TimeSpan t = (exDate.ToUniversalTime() - st);
        retval = (Int64)(t.TotalMilliseconds + 0.5);
        return retval;
    }
}

/**
 * Represents the X and Y cordinate values on a map where 0,0 is the top,left most coordinate.
 */
public class MapCoordinates {
    public float X;
    public float Y;
}

/**
 * Defines a type of surface, for drive ways, tent pads, etc.
 */
public enum SurfaceType {
    gravel = 0,
    pavement = 1,
    dirt = 2
}

/**
 * Defines the type of shade available at a particular site.
 */
public enum ShadeType {
    none = 0, // no share is available
    full = 1, // the site is completely covered in shade
    partial = 2 // the site has partial shade
}


/**
 * An Activity specifies something a customer can "do" while at a given location.
 */
public class Activity {
    public Int64 objectId; // Database identifier - never displayed to a user.
    public Int64 locationObjectId; //Database identifier for the location where this activity is accessible.

    public String title; // The name of an activity;
    public String descriptionHtml; //A block of text with a detailed description of an activity
    public GalleryImage image; //An image for the activity.

    //TODO: Costs?
    //TODO: Event Calendar?
}

/**
 * An event is much like an activity except it has a definitive start/end date.
 */
public class EventDetail : Activity {
    public DateTime start; // The start of an event
    public DateTime end; // The end date of an event

    public Boolean reservationRequired; // defines whether the event requires a registration or not.
}

/**
 * Specifies a leg on an itinerary, where a customer is staying, and for how long.
 *  also keeps track of selected activities.
 */
public class ItineraryBasic {
    public DateTime start; // Defines the beginning of an Itinerary item
    public DateTime end; // Defines the end of an Itinerary item

    public Int64 locationObjectId; //Specifies the location where a customer will be staying during the start/end dates
    public Int64 siteObjectId; // Specifies the specific site within a location where a customer will be staying.
    public Int64[] activityId; // A collection of activities the customer wishes to particpate with during their stay.
}

/**
 * Itinerary detail provides more information about an itinerary which would not be readily available.
 */
class ItineraryDetail : ItineraryBasic {
    public LocationDetail location; // The complete information about the location of their stay.
    public SiteDetail site; // The complete information about the site of their stay.
    public Activity[] activity ; // a Collection of activities selected by the customer.
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
public class RecUser {

    public Int64 objectId; // the database object id - never display to user

    public string userName; //the username used to authenticate with.
    public string firstName; // A user's first name
    public string lastName; // a user's last name
    public GalleryImage profilePicture; // a user's profile picture.
}

/**
 * Represents a review of something, like a Location
 */
public class Review {
    public Int64 objectId; //A Database ObjectID, never display to user
    public Int64 locationObjectId; //The Object ID for the location which this is a review of.
    public String summary; // the short summary review
    public int rating; // a value between 1 and 5 where 5 is the best rating.
    public String description; //a verbose review write up
    public RecUser reviewBy; // the user who submitted the review.
}

/**
 * Specifies which dates ARE not available.
 */
public class SiteAvailability : SiteBasic {
    public DateRange[] bookedRanges; // specifies the dates which are not available for booking.
}

/**
 * A Date Range, specifies a start and end date.
 * The precisions is to the day
 */
public class DateRange {
    public DateTime startDate;
    public DateTime endDate;
}


class SiteAvailabilityCriteria : DateRange {
    public Int64 siteObjectId; //The site ID to search for.
    public Int64 locationObjectId; //The location to search for available sites.
    //super class specifies parameters for start/end date which specifiy the date range to search for availability.
    //Either a siteObjectId or locationObjectId are required. 
    //If not start/end date is specified, then the server will assume start is the current date, and end is +3 months.
}

/**
 * Defines a query for information from the server.
 */
class Query<T> {
    public T criteria; //defines the criteria for a query
    public int startRow = 0; //defines the record number to start returning results. Support for pagination.
    public int rowCount = 25; //the number of rows to return for the query.
}

/**
 * Defines the results of a query where T is the type of records being returned.
 */
class QueryResults<T> {
    public T[] results ;
    public int startRow; //defines the record number to start returning results. Support for pagination.
    public int totalRecords; //the number of rows the query would have returned had there been no restriction on rowCount. Support for pagination.
}

/**
 * Used to return results from an async call to the server.
 */
class ASyncReply<T> {
    
    public T success;
    public ASyncFailureResult  failure;

    public ASyncReply(T success, ASyncFailureResult failure) {
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
    public Boolean success;
    public String failureReason; // if there is a failure completing the reservation, this text describes why.
    public String paymentUrl; // The URL to direct the user's web browser to complete payments.
}

/**
 * primary interface for obtaining information from the server.
 */
interface RecreationServer {
    
    /**
     * Returns an array of GalleryImage objects for a given Location.
     * query.criteria - defines the objectId for a location for which to return a galary of images.
     */
    void getLocationGallery(Query<Int64> query, ASyncReply<QueryResults<GalleryImage>> callback);

    /**
     * Returns an array of GalleryImage objects for a given Site.
     * query.criteria - defines the objectId for a site for which to return a galary of images.
     */
     void getSiteGallary(Query<Int64> query, ASyncReply<QueryResults<GalleryImage>> callback);

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
     void filterSitesByExample(Query<SiteDetail> query, DateTime reservationStart, DateTime reservationEnd, ASyncReply<QueryResults<SiteDetail>> callback);

    /**
     * Returns SiteDetail object which contains much more information about a given site
     */
     void getSiteDetail(Int64 siteObjectId, ASyncReply<SiteDetail> callback);

    /**
     * Returns a list of available activites at a given location.
     * query.criteria - defines the objectId for a location for which to return activities. 
     */
     void getActivities(Query<Activity> query, ASyncReply<QueryResults<Activity>> callback);

    /**
     * returns reviews for a given location
     * query.criteria - defines the objectId for a location for which to return reviews
     */
     void getReviews(Query<Review> query, ASyncReply<QueryResults<Review>> callback);

    /**
     * returns a collection of upcoming events for a given location
     *
     * query.criteria - defines the objectId for a location for which to return events.
     */
     void getEvents(Query<EventDetail> query, ASyncReply<QueryResults<EventDetail>> callback);

    /**
     * Completes a reservation for a given user and itinerary.
     */
     void makeReservation(ItineraryCart intinerary, ASyncReply<ReservationResults> callback);

    /**
     * Returns a list of Sites and their unavailable date ranges.
     */ 
     void getSiteAvailability(Query<SiteAvailabilityCriteria> query, ASyncReply<QueryResults<SiteAvailability>> results);
}




}


