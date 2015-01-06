using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Defines the type of shade available at a particular site.
     */
    public enum ShadeType : byte
    {
        none = 0,    // no shade is available
        full = 1,    // the site is completely covered in shade
        partial = 2  // the site has partial shade
    }
}