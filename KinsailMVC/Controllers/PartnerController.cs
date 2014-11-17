using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AttributeRouting.Web.Http;

namespace KinsailMVC.Controllers
{
    using KinsailMVC.Models;

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
                objSiteAvailability[i] = objRecreation.genSiteAvailability(objSite.locationObjectId, objSite.objectId, startDate, endDate);

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
                objSiteAvailability = objRecreation.genSiteAvailability(objSite.locationObjectId, objSite.objectId, startDate, endDate);

            

            return objSiteAvailability;

        }


    }
}
