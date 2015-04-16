using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A ReservationCost defines a number of values related to the cost of reserving a site, including 
     * a total cost in USD, a corresponding deposit amount that must be paid in advance, and a the fee 
     * charged by the processor or booking agent (us)
     */
    public class ReservationCost
    {
        public float total { get; set; }         // total price in USD
        public float deposit { get; set; }       // amount in USD that must be paid in advance
        public float processorFee { get; set; }  // amount in USD that is paid to the reservation processor

        public int nights { get; set; }          // total number of nights included in the stay
        public int weekendNights { get; set; }   // number of nights in the stay that are weekend nights

        // ctors
        public ReservationCost()
        {
            this.total = 0.0F;
            this.deposit = 0.0F;
            this.processorFee = 0.0F;
            this.nights = 0;
            this.weekendNights = 0;
        }

        public ReservationCost(float total, float deposit)
        {
            this.total = total;
            this.deposit = deposit;
            this.processorFee = 0.0F;
            this.nights = 0;
            this.weekendNights = 0;
        }

    }
}