using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * DateRange specifies a start and end date
     * precision is to the day (not hour/minute)
     */
    public class DateRange
    {
        public DateTime startDate { get; set; }  // start date of the range
        public DateTime endDate { get; set; }    // end date of the range
    }
}