using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Defines the result of a reservation request
     */
    class ReservationResult
    {
        public Boolean success { get; set; }       // successful?
        public String failureReason { get; set; }  // if there is a failure completing the reservation, this text describes why
        public String paymentUrl { get; set; }     // URL to direct the user's web browser to complete payment
    }
}