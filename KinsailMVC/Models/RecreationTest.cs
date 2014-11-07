using System;
using System.Collections.Generic;
using System.Linq;
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

    
    siteAttributes: FeatureAttribute<any>[] = [
        new FeatureAttribute<Boolean>("handicapAccessible", false), // Is this site handdicap accessible 
        new FeatureAttribute<Boolean>("electricHookup", false),  // Does this site have electric hookup
        new FeatureAttribute<Boolean>("septicHookup", false), // Does this site have a sewage / septic hookup.
        new FeatureAttribute<Boolean>("generatorsAllowed", false), // does this site permit the use of generators.
        new FeatureAttribute<string>("generatorRules", "Generators are permitted between 9am and sunset"), // general rules for the use of a generator. 
        new FeatureAttribute<number>("maxOccupants", 5), // the maximum number of people who may stay at this site
        new FeatureAttribute<number>("minOccupants", 1), // The mimimum number of people who may stay at this site.
        new FeatureAttribute<SurfaceType>("parkingSurface", SurfaceType.gravel),  // The parking surface type
        new FeatureAttribute<Boolean>("parkingLevel", false), // Defines whether the parking area is level
        new FeatureAttribute<number>("parkingLength", 25), // The length in feet of the parking area.
        new FeatureAttribute<Boolean>("boatAccessible", false), // Is this site adjacent to a boat slip
        new FeatureAttribute<Boolean>("horseAccomodation", false), // Site support the stay of horses
        new FeatureAttribute<ShadeType>("shade", ShadeType.full), // The type of shade available at the site.
        new FeatureAttribute<Boolean>("petsAllowed", false) // Whether pets are allowed during the stay at the site.
    ];

    locationImages: GalleryImage[] = [
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
    ]
   
    costPeriod1: CostPeriod[] = [new CostPeriod(1, 1, 3, 31, 1, 10, 15, false), new CostPeriod(4, 1, 6, 30, 3, 15, 25, false), new CostPeriod(7, 1, 10, 31, 2, 10, 15, false), new CostPeriod(11, 1, 12, 31, 1, 5, 5, false)];
    costPeriod2: CostPeriod[] = [new CostPeriod(1, 1, 2, 27, 1, 7, 14, false), new CostPeriod(3, 1, 5, 31, 2, 9, 18, false), new CostPeriod(6, 1, 9, 30, 3, 10, 15, false), new CostPeriod(10, 1, 12, 31, 0, 0, 0, true)];
    costPeriod3: CostPeriod[] = [new CostPeriod(1, 1, 3, 31, 1, 5, 5, false), new CostPeriod(4, 1, 9, 30, 3, 15, 25, false), new CostPeriod(10, 1, 12, 31, 1, 5, 5, false)];

    location: LocationDetail;
    mapXMax: number = 1000;
    mapYMax: number = 1000;
    activities: Activity[] = new Array();
    reviews: Review[] = new Array();
    events: EventDetail[] = new Array();

    sites: SiteDetail[] = new Array();

    constructor() {
        this.location = this.getRandomLocation();
        this.activities = this.getRandomActivities();
        this.reviews = this.getRandomReviews();
        this.events = this.getRandomEvents();
        for (var i: number = 0; i < this.location.totalReservableSites; i++) {
            this.sites[i] = this.getRandomSite();
        }
    }
    
    getSiteAvailability(query: Query<SiteAvailabilityCriteria>, results: ASyncReply<QueryResults<SiteAvailability>>): void {
        var sdate: Date = query.criteria.startDate;
        if (sdate == null) {
            sdate = new Date(Date.now());
        }
        var edate: Date = query.criteria.endDate;
        if (edate == null) {
            edate = new Date(sdate.getTime());
            edate.setMonth(edate.getMonth() + 3);  //add 3 months.
        }

        var res: QueryResults<SiteAvailability> = new QueryResults<SiteAvailability>();

        if (query.criteria.siteObjectId != null) {
            res.startRow = 0;
            res.totalRecords = 1;
            res.results = [this.genSiteAvailability(query.criteria.locationObjectId,query.criteria.siteObjectId, sdate, edate)];
        } else {
            res.startRow = query.startRow;
            res.results = new Array();
            for (var i: number = 0; i < query.rowCount; i++) {
                res.results[i] = this.genSiteAvailability(query.criteria.locationObjectId, getRandomArrayValue(this.sites).objectId, sdate, edate);
            }
            res.totalRecords = this.sites.length;
        }

        results.success(res);

    }

    /**
     * Searches the Sites collection for a matching SiteID and returns the corresponding SiteDetail record
     */
    private findSite(siteId: number): SiteDetail {

        for (var i: number = 0; i < this.sites.length; i++) {
            var s: SiteDetail = this.sites[i];
            if (s.objectId == siteId) {
                return s;
            }
        }

        return null;
    }

    /**
     * Generates a random SiteAvailabiltiy object
     */
    private genSiteAvailability(locationObjectId: number, siteObjectId: number, startDate: Date, endDate: Date): SiteAvailability {
        var sa: SiteAvailability = new SiteAvailability();
        var detail: SiteDetail = this.findSite(siteObjectId);
        sa.locationObjectId = locationObjectId;
        sa.objectId = siteObjectId;
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
    private genDateRanges(startDate: Date, endDate: Date): DateRange[] {
        var notAvail: DateRange[] = new Array();
        var astart: Date = new Date(startDate.getTime());
        var i: number = 0;
        while (astart.getTime() < endDate.getTime()) {
            var dr: DateRange = new DateRange();

            dr.startDate = genRandomDateInFutureFromStart(astart, 1, 5);
            dr.endDate = genRandomDateInFutureFromStart(dr.startDate, 1, 5);
            astart = dr.endDate;
            notAvail[i++] = dr;
        }
        return notAvail;
    }

    getLocationGallery(query: Query<number>, callback: ASyncReply<QueryResults<GalleryImage>>): void {
        var total: number = getRandom(0, this.locationImages.length);
        var imgs: GalleryImage[] = new Array();
        for (var i:number = 0; i < total; i++) {
            imgs[i] = getRandomArrayValue(this.locationImages);
        }
        var qr: QueryResults<GalleryImage> = new QueryResults<GalleryImage>();
        qr.startRow = query.startRow;
        qr.totalRecords = imgs.length;
        qr.results = imgs;

        callback.success(qr);
    }

    
    getSiteGallary(query: Query<number>, callback: ASyncReply<QueryResults<GalleryImage>>): void {
        this.getLocationGallery(query, callback);
    }

    filterSitesByExample(query: Query<SiteDetail>, reservationStart: Date, reservationEnd: Date, callback: ASyncReply<QueryResults<SiteBasic>>): void {
        var filtered: SiteDetail[] = new Array();
        var rnd: number = getRandom(0, this.sites.length);
        for(var i: number = 0; i < rnd; i++) {
            filtered[i] = getRandomArrayValue(this.sites);
        }

        var qr: QueryResults<SiteDetail> = new QueryResults<SiteDetail>();
        qr.results = filtered;
        qr.startRow = 0;
        qr.totalRecords = filtered.length;
        callback.success(qr);

    }

    /**
     * Returns SiteDetail object which contains much more information about a given site
    */
    getSiteDetail(siteObjectId: number, callback: ASyncReply<SiteDetail>): void {
        callback.success(getRandomArrayValue(this.sites));
    }


    getActivities(query: Query<Activity>, callback: ASyncReply<QueryResults<Activity>>): void {
        var page: Activity[] = new Array();
        var idx: number = 0;
        for (var i: number = query.startRow; i < (query.startRow + query.rowCount); i++) {
            page[idx++] = this.activities[i];
        }
        var qr: QueryResults<Activity> = new QueryResults<Activity>();
        qr.startRow = query.startRow;
        qr.totalRecords = this.activities.length;
        qr.results = page;
        callback.success(qr);
    }

    getReviews(query: Query<Review>, callback: ASyncReply<QueryResults<Review>>): void {
        var page: Review[] = new Array();
        var idx: number = 0;
        for (var i: number = query.startRow; i < (query.startRow + query.rowCount); i++) {
            page[idx++] = this.reviews[i];
        }
        var qr: QueryResults<Review> = new QueryResults<Review>();
        qr.startRow = query.startRow;
        qr.totalRecords = this.activities.length;
        qr.results = page;
        callback.success(qr);
    }

    getEvents(query: Query<EventDetail>, callback: ASyncReply<QueryResults<EventDetail>>): void {
        var page: EventDetail[] = new Array();
        var idx: number = 0;
        for (var i: number = query.startRow; i < (query.startRow + query.rowCount); i++) {
            page[idx++] = this.events[i];
        }
        var qr: QueryResults<EventDetail> = new QueryResults<EventDetail>();
        qr.startRow = query.startRow;
        qr.totalRecords = this.activities.length;
        qr.results = page;
        callback.success(qr);
    }

    makeReservation(intinerary: ItineraryCart, callback: ASyncReply<ReservationResults>): void {
        var rr: ReservationResults = new ReservationResults();
        rr.paymentUrl = "http://www.kinsail.com";
        rr.success = true;

        callback.success(rr);
    }

    private getRandomEvents(): EventDetail[] {
        var evts: EventDetail[] = new Array();
        for (var i: number = 0; i < 500; i++) {
            evts[i] = this.genEvent();
        }
        return evts;
    }

    private genEvent(): EventDetail {
        var ed: EventDetail = new EventDetail();
        ed.descriptionHtml = genString(555);
        ed.image = getRandomArrayValue(this.locationImages);
        ed.title = genString(100);
        ed.start = genRandomDateInFuture(10, 50);
        ed.end = genRandomDateInFutureFromStart(ed.start, 1, 5);
        ed.reservationRequired = genBool();

        return ed;
    }

    private getRandomReviews(): Review[] {
        var revs: Review[] = new Array();
        for (var i: number = 0; i < 500; i++) {
            revs[i] = this.genReview();
        }

        return revs;
    }

    private genReview(): Review {
        var r: Review = new Review();
        r.description = genString(555);
        r.rating = genNumber(1, 5);
        r.reviewBy = getRandomArrayValue(__names);
        r.summary = genString(100);

        return r;
    }

    private getRandomActivities() : Activity[] {

        var act: Activity[] = new Array();
        for (var i: number = 0; i < 500; i++) {
            act[i] = this.genActivity();
        }

        return act;
    }

    private genActivity(): Activity {
        var act: Activity = new Activity();
        act.descriptionHtml = genString(5000);
        act.image = getRandomArrayValue(this.locationImages);
        act.title = genString(100);

        return act;
    }

    private getRandomLocation(): LocationDetail {

        var loc: LocationDetail = new LocationDetail();
        var addr: Address = new Address();
        addr.city = genString(50);
        addr.latitude = parseFloat(genNumber(0, 99) + "." + genNumber(1000000, 9999999));
        addr.longitude = parseFloat(genNumber(0, 99) + "." + genNumber(1000000, 9999999));
        addr.state = genString(2);
        addr.street = genNumber(1000, 9999) + " " + genString(15) + " Street";
        var zip: string = ("0000" + genNumber(0, 99999));
        addr.zip = zip.substr(zip.length - 5);
        loc.address = addr;
        loc.availabilityEndDay = 31;
        loc.availabilityEndMonth = 12;
        loc.availabilityStartDay = 1;
        loc.availabilityStartMonth = 1;
        loc.banner = new GalleryImage("http://upload.wikimedia.org/wikipedia/commons/e/ed/1956_LK_Campsite_on_George_River_%28pano%29.jpg", "http://upload.wikimedia.org/wikipedia/commons/e/ed/1956_LK_Campsite_on_George_River_%28pano%29.jpg");
        loc.cancellationDaysBeforeReservation = 5;
        loc.features = this.getRandomLocationAttributes();
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

    private getRandomSite(): SiteDetail {
        var detail: SiteDetail = new SiteDetail();

        detail.objectId = this.sites.length;
        detail.advancedReservationPeriod = getRandom(2, 15);
        detail.coords = this.getRandomMapCoordinates();
        detail.cost = this.getRandomCostStructure();
        detail.description = genString(500);
        detail.image = getRandomArrayValue(this.locationImages);
        detail.maxAccommodatingUnits = getRandom(1, 3);
        detail.minDuration = getRandom(1, 3);
        detail.maxDuration = getRandom(detail.minDuration, detail.minDuration + 10);
        detail.siteIdentifier = genString(3) + getRandom(100, 999);
        detail.type = this.getRandomSiteType();
        detail.features = this.getRandomSiteAttributes();

        return detail;
    }

    private getRandomLocationAttributes(): FeatureAttribute<any>[] {

        var attrs: FeatureAttribute<any>[] = new Array();
        var rnd: number = getRandom(0, this.locationAttributes.length);

        for (var i: number = 0; i < rnd; i++) {
            attrs[i] = getRandomArrayValue(this.locationAttributes);

            if (attrs[i].value instanceof Boolean) {
                attrs[i].value = genBool();
            }

            if (attrs[i].value instanceof Number) {
                attrs[i].value = getRandom(0, attrs[i].value);
            }

            if (attrs[i].value instanceof String) {
                attrs[i].value = genString(attrs[i].value.length);
            }
        }

        return attrs;
    }

    private getRandomSiteAttributes(): FeatureAttribute<any>[] {

        var attrs: FeatureAttribute<any>[] = new Array();
        var rnd: number = getRandom(0, this.siteAttributes.length);

        for (var i: number = 0; i < rnd; i++) {
            attrs[i] = getRandomArrayValue(this.siteAttributes);

            if (attrs[i].value instanceof Boolean) {
                attrs[i].value = genBool();
            }

            if (attrs[i].value instanceof Number) {
                attrs[i].value = getRandom(0, attrs[i].value);
            }

            if (attrs[i].value instanceof String) {
                attrs[i].value = genString(attrs[i].value.length);
            }
        }

        return attrs;
    }

    private getRandomSiteType(): SiteType {
        var rnd: number = getRandom(0, 7);

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
            case 7:
                return SiteType.groupTentSite;
        }
    }

    private getRandomCostStructure(): CostStructure {
        var rnd: number = getRandom(0, 2);
        switch (rnd) {
            case 0:
                return new CostStructure(this.costPeriod1);
            case 1:
                return new CostStructure(this.costPeriod2);
            case 2:
                return new CostStructure(this.costPeriod3);
        }

    }

    private getRandomMapCoordinates(): MapCoordinates {
        var coords: MapCoordinates = new MapCoordinates();
        coords.X = getRandom(0, this.mapXMax);
        coords.Y = getRandom(0, this.mapYMax);
        return coords;
    }

}


var __names: string[] = ["Sean", "Tim", "Jacob", "Jon", "Pete", "Alex", "Bryan", "Tiffany", "Phil", "Dane", "Walter"];
var __places: string[] = ["Greenberry's", "Starbucks", "the well", "Jiffylube", "FedEx", "Kinsail", "Kazan", "The Thia place", "McDonalds", "Moby Dicks", "the mountain", "the trail", "the field"];
var __things: string[] = ["soap", "poison", "spoon", "vase", "pickle", "pail", "goose", "dress", "fruit", "bitcoin", "laptop", "furniture", "jellyfish", "ghost", "doll", "program"];
var __affects: string[] = ["stomach bloating", "bad gas", "high", "mental paralysis", "a limp"];
var __actions: string[] = ["hop on one foot", "dance", "sing", "climb"];
var __adjectives: string[] = ["big", "tiny", "small"];
var __adverbs: string[] = ["silicitiously", "acutely", "dimly", "evenly", "highly", "mockingly", "respectfully"]
var __verbs: string[] = ["answer", "arrest", "annoy", "bury", "coach", "disapprove", "dust", "enjoy", "fill", "grease", "hum", "influence", "jam", "license", "melt"];

var __intros: string[] = ["[__names] went to [__places] in order to [__actions].", "[__names] and [__names] always try to avoid [__places] as it tends to cause [__affects].", "When visiting [__places] it is always a problem for [__names] and [__names] because their [__things] [__verbs] all day long.", "it isn't [__adverbs] for [__names] to [__verbs] because of thier [____adjectives] [__things]!", "Once upon a time in a [__places] [__adverbs] away [__names], [__names], and [_names] [__adverbs] [__adverbs] each other."];
var __etcs: string[] = ["Its not easy being cheesy!", "The [__things] they were creating was not [__verbs]ed enough.", "Who knows how long it would have taken them if it wasn't for [__names] interrupting.", "If it wasn't for [__names] they would have never been searching for the [__things] for a [__adjectives] amount of time!", "Their hunt for the [__things] was never ending.", "They [__verbs] for the [__things], hoping that maybe one day their [__affects] would wear off before it was theirs!"];
var __summaries: string[] = ["Afterall, how could they have continued in light of their [__affects]?", "Thus avoid [__places] which cause [__affects]. You won't regret it!", "It is quite apparent that too much [__actions] is [__verbs] for you.", "In summary, never [__verbs] the [__things], it'll cause [__affects] of the [__things]!", "The End!"];

/**
 * Returns a random date in the future.
 */
function genRandomDateInFuture(min: number, max: number): Date {
    return genRandomDateInFutureFromStart(new Date(), min, max);
}

/**
 * Returns a random date in the future, after the supplied date
 */
function genRandomDateInFutureFromStart(start:Date, min: number, max: number) : Date {
    var dt: Date = new Date(start.getTime());

    var rnd = getRandom(min, max);

    return new Date(dt.getTime() + (rnd * (1000 * 60 * 60 * 24)));
}

/**
 * Generates a random integer between min and max. An overload for getRandom(min,max);
 */
function genNumber(min: number, max: number) {
    return getRandom(min, max);
}

/**
 * Generates a Random Boolean
 */
function genBool() {
    return (1 == getRandom(0, 1));
}

/**
 * Generates a random string of a given length;
 */
function genString(length: number): string {

    var str: string = getRandomString(__intros);
    var endStr: string = getRandomString(__summaries);

    while ((str.length + endStr.length) < length) {
        str += getRandomString(__etcs) + " ";
    }

    str += endStr;

    return str.substring(0, length);
}

/**
 * Returns a random value from the array of strings passed in.
 */
function getRandomString(possibleValues: string[]) {
    var rnd: number = getRandom(0, (possibleValues.length-1));

    return fillString(possibleValues[rnd]);
}

function getRandomArrayValue(possibleValues: any[]) {
    var rnd: number = getRandom(0, (possibleValues.length -1));
    return possibleValues[rnd];
}

/**
 * Examines the input string for special input tokes [__ and ] which designate placeholder for additional text. 
 */
function fillString(input: string): string {

    var openToken: string = "[__";
    var closeToken: string = "]";

    var sidx: number = input.indexOf(openToken);
    while (sidx >= 0) {
        var eidx: number = input.indexOf(closeToken, sidx);
        var varName = input.substring(sidx+1, eidx);
        
        var beginStr: string = input.substring(0, sidx);
        var endStr: string = input.substr(eidx+1);
        try {
            var possibleValues: string[] = eval(varName);
            var rndResult = getRandom(0, possibleValues.length-1);
            var placeHolderValue: string = possibleValues[rndResult];
            if (placeHolderValue.indexOf(openToken) >= 0) {
                placeHolderValue = fillString(placeHolderValue);
            }
            input = beginStr + placeHolderValue + endStr;
        }
        catch (e) {
            input = beginStr + "ERR(" + varName + " - " + e + ")" + endStr;
        }

        sidx = input.indexOf(openToken);
    }

    return input;

}

/**
 * Returns a random integer between the min & max values
 */
function getRandom(min: number, max: number): number {
    
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

}