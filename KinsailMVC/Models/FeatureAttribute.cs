using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Captures information about a feature or attribute of a site or location
     */
    public class FeatureAttribute<T>
    {
        // identifiers
        public long featureId { get; set; }     // database identifier, never displayed to the user

        // attributes
        public String name { get; set; }        // example: "Color"
        public String description { get; set; } // example: "Primary exterior color"
        public String value { get; set; }       // example: "Red"
        
        // ctors
        public FeatureAttribute()
        {
        }

        public FeatureAttribute(string name, Boolean value)
        { 
            this.name = name;
            this.value = value.ToString();
        }

        public FeatureAttribute(string name, string value)
        { 
            this.name = name;
            this.value = value;
        }

        public FeatureAttribute(string name, SurfaceType value)
        { 
            this.name = name;
            this.value = value.ToString();
        }

        public FeatureAttribute(string name, ShadeType value)
        { 
            this.name = name;
            this.value = value.ToString();
        }

        public FeatureAttribute(string name, int value)
        { 
            this.name = name;
            this.value = value.ToString();
        }

        public FeatureAttribute(string name, string value, string desc)
        { 
            this.name = name;
            this.value = value;
            this.description = desc;
        }


    }

    //Known features attributes with sample values that may appear
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

}