using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Represents the X and Y cordinate values on a map where 0, 0 is the top, left-most coordinate
     */
    public class MapCoordinates
    {
        public float X { get; set; }
        public float Y { get; set; }
    }
}