using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * An event is much like an activity except it has a definitive start/end date
     */
    public class EventDetail : Activity
    {
        public DateTime start { get; set; }               // start of an event
        public DateTime end { get; set; }                 // end date of an event
        public Boolean reservationRequired { get; set; }  // defines whether the event requires a registration or not
    }
}