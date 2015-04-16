using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Tuple that helps associate a count to a value
     */
    public class ValueCount<T>
    {
        // attributes
        public T value { get; set; }      // example: "Red" or 3
        public int count { get; set; }    // example: 2
        
        // ctors
        public ValueCount()
        {
            this.value = default(T);
            this.count = 0;
        }

    }

}