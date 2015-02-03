using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Gallery Image has an icon representation, along with the full-sized image
     */
    public class GalleryImage : Image
    {
        // attributes
        public string iconUrl { get; set; }      // URL to icon image

        // ctors
        public GalleryImage(string iconUrl, string fullImageUrl)
        {
            this.imageId = null;
            this.iconUrl = iconUrl;
            this.fullImageUrl = fullImageUrl;
        }

        public GalleryImage()
        {
            this.imageId = null;
            this.iconUrl = string.Empty;
            this.fullImageUrl = string.Empty;
        }

    }
}