using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A CostStructure defines several CostPeriods and the accompanying rates
     * A CostStructure may have one or more overlapping CostPeriods if the CostPeriods
     *   distinguish themselves with different minimumDuration values
     * When calculating a total cost, it is necessary to select the appropriate cost period
     *   based on the duration of the reservation
     */
    public class CostStructure
    {
        public CostPeriod[] periods { get; set; }

        // ctors
        public CostStructure()
        {
        }

        public CostStructure(CostPeriod[] periods)
        {
            this.periods = periods;
        }

    }
}