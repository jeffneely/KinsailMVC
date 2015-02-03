using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Logo Image is a special type of Image used in branding
     */
    public class LogoImage : Image
    {
        // ctors
        public LogoImage(string fullImageUrl)
            : base(fullImageUrl)
        {
        }

        public LogoImage()
            : base()
        {
        }

    }
}