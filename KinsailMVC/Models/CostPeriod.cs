using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Cost Period defines a period of time within a calendar year,
     * and the associated rates to reserve the site on a daily basis
     */
    public class CostPeriod
    {
        // ctors
        public CostPeriod()
        {
        }

        public CostPeriod(int startMonth, int startDay, int endMonth, int endDay, int minDur, float weekdayRate, float weekendRate, Boolean notAvailable)
        {
            this.startMonth = startMonth;
            this.startDay = startDay;
            this.endMonth = endMonth;
            this.endDay = endDay;
            this.minimumDuration = minDur;
            this.weekdayRate = weekdayRate;
            this.weekendRate = weekendRate;
            this.notAvailable = notAvailable;
        }

        public int startMonth { get; set; }        // calendar month which defines the beginning of this period
        public int startDay { get; set; }          // day of the startMonth which defines the beginning of this period
        public int endMonth { get; set; }          // calendar month which defines the end of this period
        public int endDay { get; set; }            // day of the calendar month which defines the end of this period
        public int minimumDuration { get; set; }   // miniumum duration stay which is applicable in this cost period
        public float weekdayRate { get; set; }     // price in USD for spending the night during a weeknight (Sunday - Thursday)
        public float weekendRate { get; set; }     // price in USD for spending the night during a weekend night (Friday and Saturday)
        public Boolean notAvailable { get; set; }  // indicates that the site is not available during this period
    }
}