using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    public class Location
    {
        public Int64 LocationID;
        public String LocationName;
        public String StreetAddress;
        public String StreetAddress2;
        public String City;
        public String State;
        public String ZipCode;
        public String Country;
        public String Directions;
        public String Parking;
        public int Active;
        public float Latitude;
        public float Longitude;
        public Int64 Audit_ContactID;

    }
}