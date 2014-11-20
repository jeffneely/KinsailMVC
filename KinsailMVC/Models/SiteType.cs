using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Defines the type of a reservable site
     */
    public enum SiteType : byte
    {
        tentSite = 1,      // Tent Site
        rvSite = 2,        // Recreational Vehicle (RV) Site
        picnicShelter = 4, // Picnic Shelter
        groupTentSite = 8, // Group Tent Site
        trailerSite = 16,  // Trailer site
        cabin = 32,        // Cabin Site
        boat = 64,         // Boat Site --?
        yurt = 128         // Yurt Site
    }
}