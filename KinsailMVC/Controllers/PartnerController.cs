using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AttributeRouting.Web.Http;
using KinsailMVC.Models;

namespace KinsailMVC.Controllers
{
    
    public class PartnerController : ApiController
    {

        static readonly PartnerRepository repository = new PartnerRepository();


        
        [GET("Partners")]
        public IEnumerable<DataAccess.Partner> GetPartners()
        {
            var objPartner = repository.GetAll();

            foreach (DataAccess.Partner objl in objPartner)
            {
                var name = objl.PartnerName;
            }

            return objPartner;
        }


        [POST("Partners")]
        public String PostPartners(IEnumerable<DataAccess.Partner> objPartner)
        {
            //TODO: Create insert method in partners
            return "Partner inserted with success";
        }


        [PUT("Partners")]
        public String PutPartners(IEnumerable<DataAccess.Partner> objPartner)
        {
            //TODO: Create update method in partners
            return "Partner updated with success";
        }

        [DELETE("Partners")]
        public String DeletePartners(IEnumerable<DataAccess.Partner> objPartner)
        {
            //TODO: Create delete method in partners
            return "Partner deleted with success";
        }


        [GET("Partners/{IdPartner}")]
        public IEnumerable<DataAccess.Partner> GetPartner(int IdPartner)
        {
            var objPartner = repository.GetbyId(IdPartner);

            foreach (DataAccess.Partner objl in objPartner)
            {
                var name = objl.PartnerName;
            }

            return objPartner;
        }

        [POST("Partners/{IdPartner}")]
        public String PostPartner(IEnumerable<DataAccess.Partner> objPartner)
        {
            //TODO: Create insert method in partner
            return "Partner inserted with success";
        }

        [PUT("Partners/{IdPartner}")]
        public String PutPartner(IEnumerable<DataAccess.Partner> objPartner)
        {
            //TODO: Create update method in partner
            return "Partner updated with success";
        }

        [DELETE("Partners/{IdPartner}")]
        public String DeletePartner(IEnumerable<DataAccess.Partner> objPartner)
        {
            //TODO: Create delete method in partner
            return "Partner deleted with success";
        }


        [GET("Partners/{IdPartner}/Locations")]
        public LocationDetail[] GetPartnerLocation(int IdPartner)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            LocationDetail[] objLocation = new LocationDetail[5];

            for (int i = 0; i < 5; i++) {
                objLocation[i] = objRecreation.getRandomLocation();
            }

            return objLocation;
            
        }

        

        [GET("Partners/{IdPartner}/Locations/{IdLocation}")]
        public LocationDetail GetPartnerLocation(int IdPartner, int IdLocation)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            LocationDetail objLocation = new LocationDetail();
            objLocation = objRecreation.getRandomLocation();
            return objLocation;
        }

        [POST("Partners/{IdPartner}/Locations/{IdLocation}")]
        public String  PostPartnerLocation(LocationDetail objLocationDetail)
        {
            //TODO: Create insert method in partner
            return "Location was inserted with success";
        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}")]
        public String PutPartnerLocation(LocationDetail objLocationDetail)
        {
            //TODO: Create update method in partner
            return "Location was updated with success";
        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}")]
        public String DeletePartnerLocation(LocationDetail objLocationDetail)
        {
            //TODO: Create delete method in partner
            return "Location was deleted with success";
        }

        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Images")]
        public GalleryImage[] GetPartnerLocationImages(int IdPartner, int IdLocation)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            GalleryImage[] objImages = new GalleryImage[5];

            for (int i = 0; i < 5; i++)
            {
                LocationDetail objLocation = new LocationDetail();
                objLocation = objRecreation.getRandomLocation();
                objImages[i] = objLocation.image;
            }

            return objImages;


        }

        
        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Images/{IdImage}")]
        public GalleryImage GetPartnerLocationImage(int IdPartner, int IdLocation, int IdImage)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            GalleryImage objImage = new GalleryImage();

                objImage = objRecreation.getRandomLocation().image;

                return objImage;
        }

        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Images/{IdImage}")]
        public  String PostPartnerLocationImage(GalleryImage objImage)
        {
            //TODO: Create insert method in partner
            return "Image was inserted with success";

        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Images/{IdImage}")]
        public String PutPartnerLocationImage(GalleryImage objImage)
        {
            //TODO: Create update method in partner
            return "Image was updated with success";

        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Images/{IdImage}")]
        public String DeletePartnerLocationImage(GalleryImage objImage)
        {
            //TODO: Create delete method in partner
            return "Image was deleted with success";

        }

        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Activities")]
        public Activity[] GetPartnerLocationActivities(int IdPartner, int IdLocation)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            Activity[] objActivity = new Activity[5];


            for (int i = 0; i < 5; i++)
            {
                objActivity[i] = objRecreation.genActivity();
            }

            return objActivity;

        }


        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Activities/{IdActivity}")]
        public Activity GetPartnerLocationActivity(int IdPartner, int IdLocation, int IdActivity)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            Activity objActivity = new Activity();


                objActivity = objRecreation.genActivity();
            
            return objActivity;

        }


        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Activities/{IdActivity}")]
        public String PostPartnerLocationActivity(Activity objActivity)
        {
            //TODO: Create insert method for Activities
            return "Actvity was inserted with success";

        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Activities/{IdActivity}")]
        public String PutPartnerLocationActivity(Activity objActivity)
        {
            //TODO: Create update method for Activities
            return "Actvity was updated with success";

        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Activities/{IdActivity}")]
        public String DeletePartnerLocationActivity(Activity objActivity)
        {
            //TODO: Create delete method for Activities
            return "Actvity was deleted with success";
        }


        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Reviews")]
        public Review[] GetPartnerLocationReviews(int IdPartner, int IdLocation)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            Review[] objReview = new Review[5];


            for (int i = 0; i < 5; i++)
            {

                objReview[i] = objRecreation.genReview();
            }

            return objReview;

        }

        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Reviews/{IdReview}")]
        public Review GetPartnerLocationReview(int IdPartner, int IdLocation, int IdReview)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            Review objReview = new Review();


                objReview = objRecreation.genReview();
            
            return objReview;

        }


        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Reviews/{IdReview}")]
        public String PostPartnerLocationReview(Review objReview)
        {
            //TODO: Create insert method for Reviews
            return "Review was inserted with success";
            

        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Reviews/{IdReview}")]
        public String PutPartnerLocationReview(Review objReview)
        {
            //TODO: Create update method for Reviews
            return "Review was updated with success";


        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Reviews/{IdReview}")]
        public String DeletePartnerLocationReview(Review objReview)
        {
            //TODO: Create delete method for Reviews
            return "Review was deleted with success";

        }


        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Events")]
        public EventDetail[] GetPartnerLocationEvents(int IdPartner, int IdLocation)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            EventDetail[] objEvent = new EventDetail[5];


            for (int i = 0; i < 5; i++)
            {

                objEvent[i] = objRecreation.genEvent();
            }

            return objEvent;

        }

        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Events{IdEvent}")]
        public EventDetail GetPartnerLocationEvent(int IdPartner, int IdLocation, int IdEvent)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            EventDetail objEvent = new EventDetail();



                objEvent = objRecreation.genEvent();
            
            return objEvent;

        }

        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Events{IdEvent}")]
        public String PostPartnerLocationEvent(EventDetail objEvent)
        {

            //TODO: Create INSERT method for Events
            return "Event was inserted with success";

        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Events{IdEvent}")]
        public String PutPartnerLocationEvent(EventDetail objEvent)
        {

            //TODO: Create update method for Events
            return "Event was updated with success";

        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Events{IdEvent}")]
        public String DeletePartnerLocationEvent(EventDetail objEvent)
        {

            //TODO: Create delete method for Events
            return "Event was deleted with success";

        }



        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Sites")]
        public SiteDetail[] GetPartnerLocationSites(int IdPartner, int IdLocation)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            SiteDetail[] objSite = new SiteDetail[5];


            for (int i = 0; i < 5; i++)
           
            
            {

                objSite[i] = objRecreation.getRandomSite();
            }

            return objSite;


        }


        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}")]
        public SiteDetail GetPartnerLocationSite(int IdPartner, int IdLocation, int IdSite)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            SiteDetail objSite = new SiteDetail();



                objSite = objRecreation.getRandomSite();
        
            return objSite;


        }

        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}")]
        public String PostPartnerLocationSite(SiteDetail objSiteDetail)
        {
            //TODO: Create insert method for Events
            return "Site was inserted with success";
        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}")]
        public String PutPartnerLocationSite(SiteDetail objSiteDetail)
        {
            //TODO: Create update method for Events
            return "Site was updated with success";
        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}")]
        public String DeletePartnerLocationSite(SiteDetail objSiteDetail)
        {
            //TODO: Create delete method for Events
            return "Site was deleted with success";
        }



        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/Images")]
        public GalleryImage[] GetPartnerLocationSitesImages(int IdPartner, int IdLocation, int IdSite)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            GalleryImage[] objImage = new GalleryImage[5];

            for (int i = 0; i < 5; i++)
            {
                objImage[i] = objRecreation.getRandomLocation().image;
            }

            return objImage;

        }

        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/Images/{IdImage}")]
        public GalleryImage GetPartnerLocationSitesImage(int IdPartner, int IdLocation, int IdSite, int IdImage)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            GalleryImage objImage = new GalleryImage();

            
                objImage = objRecreation.getRandomLocation().image;
            

            return objImage;

        }



        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/Images/{IdImage}")]
        public  String PostPartnerLocationSitesImage(GalleryImage objImage)
        {
           //TODO: Create insert method for Site Images
            return "Site Image was inserted with success";
            
        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/Images/{IdImage}")]
        public String PutPartnerLocationSitesImage(GalleryImage objImage)
        {
            //TODO: Create update method for Site Images
            return "Site Image was updated with success";

        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/Images/{IdImage}")]
        public String DeletePartnerLocationSitesImage(GalleryImage objImage)
        {
            //TODO: Create delete method for Site Images
            return "Site Image was deleted with success";

        }



        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/availabilityranges")]
        public SiteAvailability[] GetPartnerLocationSitesAvailabilityRanges(int IdPartner, int IdLocation, int IdSite)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            SiteAvailability[] objSiteAvailability = new SiteAvailability[5];
            DateTime startDate = DateTime.Now;
            DateTime endDate = startDate.AddMonths(3);
            for (int i = 0; i < 5; i++)
            {
                SiteDetail objSite = objRecreation.getRandomSite();
                objSiteAvailability[i] = objRecreation.genSiteAvailability(objSite.locationId, objSite.siteId, startDate, endDate);

            }


            return objSiteAvailability;
            
        }


        [GET("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/availabilityranges/{IdAvailibility}")]
        public SiteAvailability GetPartnerLocationSitesAvailabilityRange(int IdPartner, int IdLocation, int IDAvailibility)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            SiteAvailability objSiteAvailability = new SiteAvailability();
            DateTime startDate = DateTime.Now;
            DateTime endDate = startDate.AddMonths(3);
                SiteDetail objSite = objRecreation.getRandomSite();
                objSiteAvailability = objRecreation.genSiteAvailability(objSite.locationId, objSite.siteId, startDate, endDate);

            

            return objSiteAvailability;

        }



        [POST("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/availabilityranges/{IdAvailibility}")]
        public String PostPartnerLocationSitesAvailabilityRange(SiteAvailability objSiteAvailability)
        {
            //TODO: Create insert method for Site Images
            return "Dates for availability was inserted with success";

        }

        [PUT("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/availabilityranges/{IdAvailibility}")]
        public String PutPartnerLocationSitesAvailabilityRange(SiteAvailability objSiteAvailability)
        {
            //TODO: Create UPDATE method for Site Images
            return "Dates for availability was updated with success";

        }

        [DELETE("Partners/{IdPartner}/Locations/{IdLocation}/Sites/{IdSite}/availabilityranges/{IdAvailibility}")]
        public String DeletePartnerLocationSitesAvailabilityRange(SiteAvailability objSiteAvailability)
        {
            //TODO: Create delete method for Site Images
            return "Dates for availability was deleted with success";

        }


        [GET("RecUsers")]
        public RecUser[] GetRecUsers()
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            RecUser[] objRecUsers = new RecUser[5];
            
            for (int i = 0; i < 5; i++)
            {
                RecUser objRecUser = objRecreation.genRecUser();
                objRecUsers[i] = objRecUser;

            }


            return objRecUsers;
  
        }

        [GET("RecUsers/{IdRecUser}")]
        public RecUser GetRecUsers(int IdRecUser)
        {
            RecreationServerTestHarness objRecreation = new RecreationServerTestHarness();
            
                RecUser objRecUser = objRecreation.genRecUser();
            

            return objRecUser;

        }

        [POST("RecUsers/{IdRecUser}")]
        public String PostRecUsers(RecUser objRecUser)
        {
            //TODO: Create insert method for RecUser
            return "Rec User was inserted with success";
 
        }

        [PUT("RecUsers/{IdRecUser}")]
        public String PutRecUsers(RecUser objRecUser)
        {
            //TODO: Create update method for Site Images
            return "Rec User was updated with success";

        }


        [DELETE("RecUsers/{IdRecUser}")]
        public String DeleteRecUsers(RecUser objRecUser)
        {
            //TODO: Create delete method for Site Images
            return "Rec User was deleted with success";
           
        }



    }
}
