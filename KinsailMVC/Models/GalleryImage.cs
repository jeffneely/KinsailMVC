using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Gallery Image has an icon representation and a full-sized image
     */
    public class GalleryImage
    {
        // ctors
        public GalleryImage(string iconUrl, string fullImageUrl)
        {
            this.iconUrl = iconUrl;
            this.fullImageUrl = fullImageUrl;
        }

        public GalleryImage()
        {
            this.iconUrl = string.Empty;
            this.fullImageUrl = string.Empty;
        }

        // identifiers
        public long imageId { get; set; }        // database identifier, never displayed to the user

        // attributes
        public string iconUrl { get; set; }      // URL to icon image
        public string fullImageUrl { get; set; } // URL to full image
    }
}