using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * Defines a type of surface, for drive ways, tent pads, etc.
     */
    public enum SurfaceType : byte
    {
        gravel = 0,
        pavement = 1,
        dirt = 2
    }
}