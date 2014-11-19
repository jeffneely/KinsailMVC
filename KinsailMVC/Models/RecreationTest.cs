using ExpressionEvaluator;
using Microsoft.CSharp;
using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace KinsailMVC.Models
{
/// <reference path="RecreationCore.ts"/>

class RecreationServerTestHarness :  RecreationServer {
    
     FeatureAttribute<Boolean>[] locationAttributes  = new FeatureAttribute<Boolean>[] {
        new FeatureAttribute<Boolean> ("Equestrian", false),
        new FeatureAttribute<Boolean>("equestrianRental", false),
        new FeatureAttribute<Boolean>("golfCourse",false), //Has a golf course
        new FeatureAttribute<Boolean>("discCourse",false), //Has a disc golf course
        new FeatureAttribute<Boolean>("fishing",false), //Has opportunities to fish
        new FeatureAttribute<Boolean>("miniGolf",false), //Has a minigolf course
        new FeatureAttribute<Boolean>("boatLaunch",false), //Has a boat launch
        new FeatureAttribute<Boolean>("boatRentals",false), //Has boat rentals
        new FeatureAttribute<Boolean>("motorBoatsPermitted",false), //Boats with gasoline engines are permitted
        new FeatureAttribute<Boolean>("waterSkiing",false), //Water feature supports water skiing.
        new FeatureAttribute<Boolean>("skiing",false), //Has skiing slope. 
        new FeatureAttribute<Boolean>("snowboarding",false), //Has snowboarding slope
        new FeatureAttribute<Boolean>("marina",false),  //Has a Marina
        new FeatureAttribute<Boolean>("kayakOrCanoeRentals",false), //Rents Kayaks or Canoes
        new FeatureAttribute<Boolean>("swimmingPool",false), //Has a swimming pool
        new FeatureAttribute<Boolean>("swimmingBeach",false), //Has a beach and swimming in a natural water feature
        new FeatureAttribute<Boolean>("picnicShelters",false), //Has picnic shelters
        new FeatureAttribute<Boolean>("playground",false), //Has a playgound
        new FeatureAttribute<Boolean>("meetingRoom",false), //Has a common/shared meeting room
        new FeatureAttribute<Boolean>("campStore",false), //Has a camp store
        new FeatureAttribute<Boolean>("playingFields",false), //has large fields for baseball/football/soccer
        new FeatureAttribute<Boolean>("tennis",false), //Has tennis courts
        new FeatureAttribute<Boolean>("hikingTrails",false), //Has hiking trails
        new FeatureAttribute<Boolean>("mountainBikeTrails",false), //Has mountain biking trails
        new FeatureAttribute<Boolean>("atvTrail",false), //Has ATV Trail riding
        new FeatureAttribute<Boolean>("restrooms",false), //Location supports enclosed restrooms
        new FeatureAttribute<Boolean>("showers",false), //Location has showers
        new FeatureAttribute<Boolean>("hotwater",false), //Location supports hot water of some sort
        new FeatureAttribute<Boolean>("guidedPrograms",false), //location has programs guided by someone. Eg guided hikes, wildlife programs, etc
        new FeatureAttribute<Boolean>("resturant",false), //The location has a resturant/cafe with prepared foods
        new FeatureAttribute<Boolean>("ampitheatre",false), //The location has a ampitheatre
        new FeatureAttribute<Boolean>("groupTenting",false), //Has group camping sites
        new FeatureAttribute<Boolean>("tentSites",false), //Has sites for tents
        new FeatureAttribute<Boolean>("cabinLodging",false), //Has cabins for rent
        new FeatureAttribute<Boolean>("hotelLodging",false), //Has lodging in a hotel type of facility
        new FeatureAttribute<Boolean>("picnicShelterRentals",false), // can rent picnic shelters
        new FeatureAttribute<Boolean>("recreationalVehicleSites",false) //location has sites for RVs
     };

    
    FeatureAttribute<object>[] siteAttributes = new FeatureAttribute<object>[] {
        new FeatureAttribute<object>("handicapAccessible", false), // Is this site handdicap accessible 
        new FeatureAttribute<object>("electricHookup", false),  // Does this site have electric hookup
        new FeatureAttribute<object>("septicHookup", false), // Does this site have a sewage / septic hookup.
        new FeatureAttribute<object>("generatorsAllowed", false), // does this site permit the use of generators.
        new FeatureAttribute<object>("generatorRules", "Generators are permitted between 9am and sunset"), // general rules for the use of a generator. 
        new FeatureAttribute<object>("maxOccupants", 5), // the maximum number of people who may stay at this site
        new FeatureAttribute<object>("minOccupants", 1), // The mimimum number of people who may stay at this site.
        new FeatureAttribute<object>("parkingSurface", SurfaceType.gravel),  // The parking surface type
        new FeatureAttribute<object>("parkingLevel", false), // Defines whether the parking area is level
        new FeatureAttribute<object>("parkingLength", 25), // The length in feet of the parking area.
        new FeatureAttribute<object>("boatAccessible", false), // Is this site adjacent to a boat slip
        new FeatureAttribute<object>("horseAccomodation", false), // Site support the stay of horses
        new FeatureAttribute<object>("shade", ShadeType.full), // The type of shade available at the site.
        new FeatureAttribute<object>("petsAllowed", false) // Whether pets are allowed during the stay at the site.
    };

    GalleryImage[]  locationImages = new GalleryImage[]{
        new GalleryImage("/Images/camp_site_icon_1.jpg","/Images/camp_site_1.jpg"),
        new GalleryImage("/Images/camp_site_icon_2.jpg", "/Images/camp_site_2.jpg"),
        new GalleryImage("/Images/camp_site_icon_3.jpg", "/Images/camp_site_3.jpg"),
        new GalleryImage("/Images/camp_site_icon_4.jpg", "/Images/camp_site_4.jpg"),
        new GalleryImage("/Images/camp_site_icon_5.jpg", "/Images/camp_site_5.jpg"),
        new GalleryImage("/Images/camp_site_icon_6.jpg", "/Images/camp_site_6.jpg"),
        new GalleryImage("/Images/camp_site_icon_7.jpg", "/Images/camp_site_7.jpg"),
        new GalleryImage("/Images/camp_site_icon_8.jpg", "/Images/camp_site_8.jpg"),
        new GalleryImage("/Images/camp_site_icon_9.jpg", "/Images/camp_site_9.jpg"),
        new GalleryImage("/Images/camp_site_icon_10.jpg", "/Images/camp_site_10.jpg"),
        new GalleryImage("/Images/camp_site_icon_11.jpg", "/Images/camp_site_11.jpg"),
        new GalleryImage("/Images/camp_site_icon_12.jpg", "/Images/camp_site_12.jpg")
    };
   
    CostPeriod[] costPeriod1 =  new CostPeriod[] {new CostPeriod(1, 1, 3, 31, 1, 10, 15, false), new CostPeriod(4, 1, 6, 30, 3, 15, 25, false), new CostPeriod(7, 1, 10, 31, 2, 10, 15, false), new CostPeriod(11, 1, 12, 31, 1, 5, 5, false)};
    CostPeriod[] costPeriod2 = new CostPeriod[] {new CostPeriod(1, 1, 2, 27, 1, 7, 14, false), new CostPeriod(3, 1, 5, 31, 2, 9, 18, false), new CostPeriod(6, 1, 9, 30, 3, 10, 15, false), new CostPeriod(10, 1, 12, 31, 0, 0, 0, true)};
    CostPeriod[] costPeriod3 = new CostPeriod[] {new CostPeriod(1, 1, 3, 31, 1, 5, 5, false), new CostPeriod(4, 1, 9, 30, 3, 15, 25, false), new CostPeriod(10, 1, 12, 31, 1, 5, 5, false)};

    LocationDetail location;
    int mapXMax = 1000;
    int mapYMax= 1000;
    Activity[] activities ;
    Review[] reviews ;
    EventDetail[] events;

    SiteDetail[] sites;

    Random random = new Random();
    
    public RecreationServerTestHarness()
    {
        this.location = this.getRandomLocation();
        this.activities = this.getRandomActivities();
        this.reviews = this.getRandomReviews();
        this.events = this.getRandomEvents();
        this.sites = new SiteDetail[location.totalReservableSites];
        for (int i = 0; i < this.location.totalReservableSites; i++) {
            this.sites[i] = this.getRandomSite();
        }
    }
    
    public void getSiteAvailability(Query<SiteAvailabilityCriteria> query, ASyncReply<QueryResults<SiteAvailability>> results) {
        DateTime  sdate = query.criteria.startDate;
        if (sdate == null) {
            sdate = DateTime.Now;
        }
        DateTime  edate = query.criteria.endDate;
        if (edate == null) {
            edate = new DateTime( Utils.GetTime(sdate));
            edate = edate.AddMonths(3); //.setMonth(edate.getMonth() + 3);  //add 3 months.
        }

        QueryResults<SiteAvailability> res = new QueryResults<SiteAvailability>();

        if (query.criteria.siteId != null) {
            res.startRow = 0;
            res.totalRecords = 1;
            res.results[0] = this.genSiteAvailability(query.criteria.locationId,query.criteria.siteId, sdate, edate);
        } else {
            res.startRow = query.startRow;
            res.results = new SiteAvailability[query.rowCount + 1];
            for (int i = 0; i < query.rowCount; i++) {
                SiteDetail objSite = (SiteDetail)getRandomArrayValue(this.sites);
                res.results[i] = this.genSiteAvailability(query.criteria.locationId, objSite.siteId, sdate, edate) ;
            }
            res.totalRecords = this.sites.Length;
        }

        results.success = res;

    }

    /**
     * Searches the Sites collection for a matching SiteID and returns the corresponding SiteDetail record
     */
    private SiteDetail findSite(long siteId){

        for (int i= 0; i < this.sites.Length; i++) {
            SiteDetail s = this.sites[i];
            if (s.siteId == siteId) {
                return s;
            }
        }

        return null;
    }

    /**
     * Generates a random SiteAvailabiltiy object
     */
    public SiteAvailability genSiteAvailability(long locationId, long siteId, DateTime startDate, DateTime endDate) {
         SiteAvailability sa = new SiteAvailability();
        SiteDetail detail = this.findSite(siteId);
        sa.locationId = locationId;
        sa.siteId = siteId;
        sa.coords = detail.coords;
        sa.siteIdentifier = detail.siteIdentifier;
        sa.type = detail.type;
        sa.image = detail.image;
        sa.bookedRanges = this.genDateRanges(startDate, endDate);

        return sa;
    }

    /**
     * Generates a random collection of date ranges between two given dates
     */
    private DateRange[] genDateRanges(DateTime startDate, DateTime endDate) {
         DateRange[] notAvail = new DateRange[100];
        DateTime astart = new DateTime(Utils.GetTime(startDate));

        int i= 0;
        while ( Utils.GetTime(astart) < Utils.GetTime(endDate) ) {
            DateRange dr = new DateRange();

            dr.startDate = genRandomDateInFutureFromStart(astart, 1, 5);
            dr.endDate = genRandomDateInFutureFromStart(dr.startDate, 1, 5);
            astart = dr.endDate;
            notAvail[i++] = dr;
        }
        return notAvail;
    }

    public void getLocationGallery( Query<Int64> query, ASyncReply<QueryResults<GalleryImage>> callback) {
        int total= getRandom(0, this.locationImages.Length);
        GalleryImage[] imgs  = new GalleryImage[total + 1];
        for (int  i= 0; i < total; i++) {
            imgs[i] = (GalleryImage) getRandomArrayValue(this.locationImages);
        }
        QueryResults<GalleryImage> qr = new QueryResults<GalleryImage>();
        qr.startRow = query.startRow;
        qr.totalRecords = imgs.Length;
        qr.results = imgs;

        callback.success = qr;
    }

    
    public void getSiteGallary(Query<Int64> query, ASyncReply<QueryResults<GalleryImage>> callback) {
        this.getLocationGallery(query, callback);
    }

    public void filterSitesByExample(Query<SiteDetail> query, DateTime reservationStart, DateTime reservationEnd,  ASyncReply<QueryResults<SiteDetail>> callback){
        
        int rnd = getRandom(0, this.sites.Length);
        SiteDetail[]  filtered = new SiteDetail[rnd + 1];
        
        for(int i = 0; i < rnd; i++) {
            filtered[i] = (SiteDetail)getRandomArrayValue(this.sites);
        }

         QueryResults<SiteDetail> qr = new QueryResults<SiteDetail>();
        qr.results = filtered;
        qr.startRow = 0;
        qr.totalRecords = filtered.Length;
        callback.success = qr;

    }

    /**
     * Returns SiteDetail object which contains much more information about a given site
    */
    public void getSiteDetail(Int64 siteObjectId, ASyncReply<SiteDetail> callback)
    {
        callback.success = (SiteDetail)getRandomArrayValue(this.sites);
    }


    public void getActivities(Query<Activity> query,  ASyncReply<QueryResults<Activity>> callback) {
        Activity[] page = new Activity[query.startRow + query.rowCount + 1];
        int idx = 0;
        for (int i = query.startRow; i < (query.startRow + query.rowCount); i++) {
            page[idx++] = this.activities[i];
        }
        QueryResults<Activity> qr = new QueryResults<Activity>();
        qr.startRow = query.startRow;
        qr.totalRecords = this.activities.Length;
        qr.results = page;
        callback.success = qr;
    }

    public void getReviews(Query<Review> query, ASyncReply<QueryResults<Review>> callback) {
        Review[] page = new Review[query.startRow + query.rowCount + 1];
        int idx = 0;
        for (int i = query.startRow; i < (query.startRow + query.rowCount); i++) {
            page[idx++] = this.reviews[i];
        }
        QueryResults<Review> qr = new QueryResults<Review>();
        qr.startRow = query.startRow;
        qr.totalRecords = this.activities.Length;
        qr.results = page;
        callback.success = qr;
    }

    public void getEvents(Query<EventDetail> query, ASyncReply<QueryResults<EventDetail>> callback) {
        EventDetail[] page = new EventDetail[query.startRow + query.rowCount];
        int idx = 0;
        for (int i = query.startRow; i < (query.startRow + query.rowCount); i++) {
            page[idx++] = this.events[i];
        }
        QueryResults<EventDetail> qr = new QueryResults<EventDetail>();
        qr.startRow = query.startRow;
        qr.totalRecords = this.activities.Length;
        qr.results = page;
        callback.success = qr;
    }

    public void makeReservation(ItineraryCart intinerary, ASyncReply<ReservationResults> callback) {
        ReservationResults rr = new ReservationResults();
        rr.paymentUrl = "http://www.kinsail.com";
        rr.success = true;

        callback.success = rr;
    }

    private  EventDetail[] getRandomEvents() {
        EventDetail[] evts   = new EventDetail[500];
        for (int i = 0; i < 500; i++) {
            evts[i] = this.genEvent();
        }
        return evts;
    }

    public EventDetail genEvent() {
        EventDetail ed = new EventDetail();
        ed.descriptionHtml = genString(555);
        ed.image = (GalleryImage)getRandomArrayValue(this.locationImages);
        ed.title = genString(100);
        ed.start = genRandomDateInFuture(10, 50);
        ed.end = genRandomDateInFutureFromStart(ed.start, 1, 5);
        ed.reservationRequired = genBool();

        return ed;
    }

    private Review[] getRandomReviews()  {
        Review[] revs  = new Review[500];
        for (int i = 0; i < 500; i++) {
            revs[i] = this.genReview();
        }

        return revs;
    }

    public Review  genReview() {
        Review  r = new Review();
        r.description = genString(555);
        r.rating = genNumber(1, 5);
        r.reviewBy = new RecUser();
        r.reviewBy.firstName = getRandomArrayValue(names).ToString();
        r.summary = genString(100);

        return r;
    }

    public RecUser genRecUser() {
        RecUser r = new RecUser();
        r.firstName = getRandomArrayValue(names).ToString();
        r.lastName = getRandomArrayValue(names).ToString();
        r.objectId = genNumber(1, 1000);
        r.profilePicture = new GalleryImage();
        r.profilePicture = (GalleryImage)getRandomArrayValue(this.locationImages);
        r.userName = getRandomArrayValue(names).ToString();

        return r;
    }

    public Activity[] getRandomActivities() {

        Activity[] act = new Activity[500];
        for (int i = 0; i < 500; i++) {
            act[i] = this.genActivity();
        }

        return act;
    }

    public Activity genActivity()  {
        Activity act = new Activity();
        act.descriptionHtml = genString(5000);
        act.image = (GalleryImage)getRandomArrayValue(this.locationImages);
        act.title = genString(100);

        return act;
    }

    public LocationDetail getRandomLocation()  {

        LocationDetail  loc = new LocationDetail();

        Address addr  = new Address();
        addr.city = genString(50);
        addr.latitude = float.Parse(genNumber(0, 99) + "." + genNumber(1000000, 9999999));
        addr.longitude = float.Parse(genNumber(0, 99) + "." + genNumber(1000000, 9999999));
        addr.state = genString(2);
        addr.street = genNumber(1000, 9999) + " " + genString(15) + " Street";
        String zip = ("0000" + genNumber(0, 99999));
        addr.zip = zip.Substring(zip.Length - 5);
        loc.address = addr;

        loc.availabilityEndDay = 31;
        loc.availabilityEndMonth = 12;
        loc.availabilityStartDay = 1;
        loc.availabilityStartMonth = 1;
        loc.cancellationDaysBeforeReservation = 5;

        loc.features = this.getRandomLocationAttributes();

        loc.banner = new GalleryImage("http://upload.wikimedia.org/wikipedia/commons/e/ed/1956_LK_Campsite_on_George_River_%28pano%29.jpg", "http://upload.wikimedia.org/wikipedia/commons/e/ed/1956_LK_Campsite_on_George_River_%28pano%29.jpg");
        loc.image = new GalleryImage("http://1.bp.blogspot.com/-xBnfvrtsZLE/TcANtMhh-sI/AAAAAAAAC2Y/VHuBcpZcN90/s640/P1100300+sign.jpg", "http://1.bp.blogspot.com/-xBnfvrtsZLE/TcANtMhh-sI/AAAAAAAAC2Y/VHuBcpZcN90/s640/P1100300+sign.jpg");

        loc.mapTilesBaseURL = "";//TODO:

        loc.operatingOrganization = genString(35);
        loc.operatingOrganizationPhone = genNumber(100, 999) + "-" + genNumber(100, 999) + "-" + genNumber(1000, 9999);

        loc.priceMin = genNumber(5, 10);
        loc.priceMax = genNumber(loc.priceMin, 35);

        loc.reservationPhone = genNumber(100, 999) + "-" + genNumber(100, 999) + "-" + genNumber(1000, 9999);
        loc.reservationPolicies = genString(1000);
        loc.title = genString(35);
        loc.totalReservableSites = genNumber(5, 50);

        return loc;
    }

    public SiteDetail getRandomSite()  {
         SiteDetail detail = new SiteDetail();
        

        detail.siteId = this.sites.Length;

        //detail.objectId = getRandom(1, 100);
        detail.advancedReservationPeriod = getRandom(2, 15);
        detail.coords = this.getRandomMapCoordinates();
        detail.cost = this.getRandomCostStructure();
        detail.description = genString(500);
        detail.image = (GalleryImage) getRandomArrayValue(this.locationImages);
        detail.maxAccommodatingUnits = getRandom(1, 3);
        detail.minDuration = getRandom(1, 3);
        detail.maxDuration = getRandom(detail.minDuration, detail.minDuration + 10);
        detail.siteIdentifier = genString(3) + getRandom(100, 999);
        detail.type = this.getRandomSiteType();
        detail.features = this.getRandomSiteAttributes();

        return detail;
    }

    private FeatureAttribute<Boolean>[] getRandomLocationAttributes() {

        int rnd = getRandom(0, this.locationAttributes.Length);
        FeatureAttribute<Boolean>[] attrs = new FeatureAttribute<Boolean>[rnd];
      
        for (int  i= 0; i < rnd; i++) {
            attrs[i] = (FeatureAttribute<Boolean>)getRandomArrayValue(this.locationAttributes);

            //if (attrs[i].value.GetType() ==  typeof( Boolean)) {
                attrs[i].value = genBool().ToString();
            //}

            /*
            if (attrs[i].value.GetType() == typeof(int)) {
                attrs[i].value = getRandom(0, int.Parse(attrs[i].value)).ToString();
            }

            if (attrs[i].value.GetType() == typeof(String)) {
                attrs[i].value = genString(attrs[i].value.Length);
            }
             * */
        }

        return attrs;
    }

    private FeatureAttribute<object>[] getRandomSiteAttributes() {

        int rnd = getRandom(0, this.siteAttributes.Length);

        FeatureAttribute<object>[] attrs = new FeatureAttribute<object>[rnd];
        
        for (int i= 0; i < rnd; i++) {
            attrs[i] = (FeatureAttribute<object>)getRandomArrayValue(this.siteAttributes);

            if (attrs[i].value == null)
            {
                attrs[i].value = String.Empty;
            }

            if (attrs[i].value.GetType() == typeof(Boolean)) {
                attrs[i].value = genBool().ToString();
            }

            if (attrs[i].value.GetType() ==  typeof(int)) {
                attrs[i].value = getRandom(0, int.Parse(attrs[i].value)).ToString();
            }

            if (attrs[i].value.GetType() == typeof( String)) {
                attrs[i].value = genString(attrs[i].value.Length);
            }
        }

        return attrs;
    }

    private SiteType getRandomSiteType() {
        int rnd = getRandom(0, 7);

        switch (rnd) {
            case 0:
                return SiteType.picnicShelter;
            case 1:
                return SiteType.rvSite;
            case 2:
                return SiteType.tentSite;
            case 3:
                return SiteType.trailerSite;
            case 4:
                return SiteType.yurt;
            case 5:
                return SiteType.cabin;
            case 6:
                return SiteType.boat;
            default :
                return SiteType.groupTentSite;
        }
    }

    private CostStructure  getRandomCostStructure(){
        int rnd= getRandom(0, 2);
        switch (rnd) {
            case 0:
                return new CostStructure(this.costPeriod1);
            case 1:
                return new CostStructure(this.costPeriod2);
            default:
                return new CostStructure(this.costPeriod3);
        }

    }

    private MapCoordinates getRandomMapCoordinates(){
        MapCoordinates coords = new MapCoordinates();
        coords.X = getRandom(0, this.mapXMax);
        coords.Y = getRandom(0, this.mapYMax);
        return coords;
    }



public string[] names  = new string[] {"Sean", "Tim", "Jacob", "Jon", "Pete", "Alex", "Bryan", "Tiffany", "Phil", "Dane", "Walter"};
public string[] places = new string[] {"Greenberry's", "Starbucks", "the well", "Jiffylube", "FedEx", "Kinsail", "Kazan", "The Thia place", "McDonalds", "Moby Dicks", "the mountain", "the trail", "the field"};
public string[] things = new string[] {"soap", "poison", "spoon", "vase", "pickle", "pail", "goose", "dress", "fruit", "bitcoin", "laptop", "furniture", "jellyfish", "ghost", "doll", "program"};
public string[] affects = new string[] {"stomach bloating", "bad gas", "high", "mental paralysis", "a limp"};
public string[] actions = new string[] {"hop on one foot", "dance", "sing", "climb"};
public string[] adjectives = new string[] {"big", "tiny", "small"};
public string[] adverbs = new string[] {"silicitiously", "acutely", "dimly", "evenly", "highly", "mockingly", "respectfully"};
public string[] verbs = new string[] {"answer", "arrest", "annoy", "bury", "coach", "disapprove", "dust", "enjoy", "fill", "grease", "hum", "influence", "jam", "license", "melt"};

public string[] intros = new string[] {"[names] went to [places] in order to [actions].", "[names] and [names] always try to avoid [places] as it tends to cause [affects].", "When visiting [places] it is always a problem for [names] and [names] because their [things] [verbs] all day long.", "it isn't [adverbs] for [names] to [verbs] because of thier [adjectives] [things]!", "Once upon a time in a [places] [adverbs] away [names], [names], and [_names] [adverbs] [adverbs] each other."};
public string[] etcs = new string[] {"Its not easy being cheesy!", "The [things] they were creating was not [verbs]ed enough.", "Who knows how long it would have taken them if it wasn't for [names] interrupting.", "If it wasn't for [names] they would have never been searching for the [things] for a [adjectives] amount of time!", "Their hunt for the [things] was never ending.", "They [verbs] for the [things], hoping that maybe one day their [affects] would wear off before it was theirs!"};
public string[] summaries = new string[] {"Afterall, how could they have continued in light of their [affects]?", "Thus avoid [places] which cause [affects]. You won't regret it!", "It is quite apparent that too much [actions] is [verbs] for you.", "In summary, never [verbs] the [things], it'll cause [affects] of the [things]!", "The End!"};

/**
 * Returns a random date in the future.
 */
DateTime genRandomDateInFuture(int min, int max){
    return genRandomDateInFutureFromStart(DateTime.Now, min, max);
}

/**
 * Returns a random date in the future, after the supplied date
 */
DateTime genRandomDateInFutureFromStart(DateTime start, int min, int max) {
   // DateTime dt= new DateTime(Utils.GetTime(start));

    int rnd = getRandom(min, max);
    DateTime newDate = start.AddDays(rnd);

    //return new DateTime(Utils.GetTime(dt) + (rnd * (1000 * 60 * 60 * 24)));
    return newDate;
}

/**
 * Generates a random integer between min and max. An overload for getRandom(min,max);
 */
int  genNumber(int min, int max) {
    return getRandom(min, max);
}

/**
 * Generates a Random Boolean
 */
Boolean genBool() {
    return (1 == getRandom(0, 1));
}

/**
 * Generates a random string of a given length;
 */
String genString(int length){

    string str= getRandomString(intros);
    string  endStr= getRandomString(summaries);

    while ((str.Length + endStr.Length) < length) {
        str += getRandomString(etcs) + " ";
    }

    str += endStr;

    return str.Substring(0, length);
}

/**
 * Returns a random value from the array of strings passed in.
 */
String getRandomString(String [] possibleValues) {
    int rnd= getRandom(0, (possibleValues.Length-1));

    return fillString(possibleValues[rnd]);
}

object getRandomArrayValue(object[] possibleValues) {
    int rnd= getRandom(0, (possibleValues.Length -1));
    return possibleValues[rnd];
}

/**
 * Examines the input string for special input tokes [ and ] which designate placeholder for additional text. 
 */
String fillString(string input){

    string openToken  = "[";
    string closeToken  = "]";

    int sidx = input.IndexOf(openToken);
    while (sidx >= 0) {
        int eidx = input.IndexOf(closeToken, sidx);
        var varName = input.Substring(sidx, eidx - sidx + 1);
        
        string beginStr = input.Substring(0, sidx);
        string endStr = input.Substring(eidx+1);
        try {

            String strExpression = varName;
            strExpression = strExpression.Replace("[", "");
            strExpression = strExpression.Replace("]", "");

            //var Expression = new CompiledExpression(strExpression);

            
            //string[] possibleValues = (string[])Expression.Eval();

            string[] possibleValues = new string[1];
            switch(strExpression)
            {
                case "names":
                    possibleValues = names;
                    break;
                case "places":
                    possibleValues = places;
                    break;
                case "things":
                    possibleValues = things;
                    break;
                case "affects":
                    possibleValues = affects;
                    break;
                case "actions":
                    possibleValues = actions;
                    break;
                case "adjectives":
                    possibleValues = adjectives;
                    break;
                case "adverbs":
                    possibleValues = adverbs;
                    break;
                case "verbs":
                    possibleValues = verbs;
                    break;
                case "intros":
                    possibleValues = intros;
                    break;
                case "etcs":
                    possibleValues = etcs;
                    break;
                case "summaries":
                    possibleValues = summaries;
                    break;
            
            }
            
            var rndResult = getRandom(0, possibleValues.Length-1);
            string placeHolderValue  = possibleValues[rndResult];
            if (placeHolderValue.IndexOf(openToken) >= 0) {
                placeHolderValue = fillString(placeHolderValue);
            }
            input = beginStr + placeHolderValue + endStr;
        }
        catch (Exception e) {
            input = beginStr + "ERR(" + varName + " - " + e.Message + ")" + endStr;
        }

        sidx = input.IndexOf(openToken);
    }

    return input;

}

/**
 * Returns a random integer between the min & max values
 */
public int getRandom(int min, int max){

    return random.Next(min, max);
    //return Math.Floor(Math.random() * (max - min + 1)) + min;
}



}



}