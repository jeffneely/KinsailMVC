using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Banner Image is very similar to a Gallery Image, but is used in branding
     */
    public class BannerImage : GalleryImage
    {
        // ctors
        public BannerImage(string iconUrl, string fullImageUrl)
            : base(iconUrl, fullImageUrl)
        {
        }

        public BannerImage()
            : base()
        {
        }

    }
}