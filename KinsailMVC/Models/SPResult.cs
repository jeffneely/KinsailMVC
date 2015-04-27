using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Stored procedure result code and message
     */
    public class SPResult
    {
        // attributes
        public int result { get; set; }        // example: 0
        public string message { get; set; }    // example: 'Site reserved successfully'
        
        // ctors
        public SPResult()
        {
            this.result = 0;
            this.message = "";
        }

    }

}