using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    //Recreation Server API


    // needed on server?? 
    public static class Utils
    {

        static public Int64 GetTime(DateTime exDate)
        {
            Int64 retval = 0;
            var st = new DateTime(1970, 1, 1);
            TimeSpan t = (exDate.ToUniversalTime() - st);
            retval = (Int64)(t.TotalMilliseconds + 0.5);
            return retval;
        }
    }


    class SiteAvailabilityCriteria : DateRange
    {
        public long siteId; //The site ID to search for.
        public long locationId; //The location to search for available sites.
        //super class specifies parameters for start/end date which specifiy the date range to search for availability.
        //Either a siteObjectId or locationObjectId are required. 
        //If not start/end date is specified, then the server will assume start is the current date, and end is +3 months.
    }


    /**
     * TODO: All of these replaced by REST GET/POST calls
     */

    /**
     * primary interface for obtaining information from the server.
     */
    interface RecreationServer
    {
        /**
         * Returns an array of GalleryImage objects for a given Location.
         * query.criteria - defines the objectId for a location for which to return a galary of images.
         */
        void getLocationGallery(Query<long> query, QueryResults<GalleryImage> callback);

        /**
         * Returns an array of GalleryImage objects for a given Site.
         * query.criteria - defines the objectId for a site for which to return a galary of images.
         */
        void getSiteGallery(Query<long> query, QueryResults<GalleryImage> callback);

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
        void filterSitesByExample(Query<SiteDetail> query, DateTime reservationStart, DateTime reservationEnd, QueryResults<SiteDetail> callback);

        /**
         * Returns SiteDetail object which contains much more information about a given site
         */
        void getSiteDetail(long siteObjectId, SiteDetail callback);

        /**
         * Returns a list of available activites at a given location.
         * query.criteria - defines the objectId for a location for which to return activities. 
         */
        void getActivities(Query<Activity> query, QueryResults<Activity> callback);

        /**
         * returns reviews for a given location
         * query.criteria - defines the objectId for a location for which to return reviews
         */
        void getReviews(Query<Review> query, QueryResults<Review> callback);

        /**
         * returns a collection of upcoming events for a given location
         *
         * query.criteria - defines the objectId for a location for which to return events.
         */
        void getEvents(Query<EventDetail> query, QueryResults<EventDetail> callback);

        /**
         * Completes a reservation for a given user and itinerary.
         */
        void makeReservation(ItineraryCart intinerary, ReservationResult callback);

        /**
         * Returns a list of Sites and their unavailable date ranges.
         */
        void getSiteAvailability(Query<SiteAvailabilityCriteria> query, QueryResults<SiteAvailability> results);
    }
}

