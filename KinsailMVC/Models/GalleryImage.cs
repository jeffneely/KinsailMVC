using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Gallery Image has a smaller thumnail image representation, along with the full-sized image
     */
    public class GalleryImage : Image
    {
        // attributes
        public string thumbUrl { get; set; }     // URL to thumbnail image
        public string caption { get; set; }      // Textual description for display near the photo
        public string source { get; set; }       // Source of the image

        // ctors
        public GalleryImage(string thumbUrl, string fullImageUrl)
        {
            this.imageId = null;
            this.thumbUrl = thumbUrl;
            this.fullImageUrl = fullImageUrl;
        }

        public GalleryImage()
        {
            this.imageId = null;
            this.thumbUrl = string.Empty;
            this.fullImageUrl = string.Empty;
            this.caption = string.Empty;
            this.source = string.Empty;
        }

    }
}