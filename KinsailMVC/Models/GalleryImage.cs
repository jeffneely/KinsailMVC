using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A Gallery Image has an icon representation and a full-sized image
     */
    [NPoco.PrimaryKey("ImageID")]
    public class GalleryImage
    {
        // identifiers
        public long? imageId { get; set; }       // database identifier, never displayed to the user

        // attributes
        public string iconUrl { get; set; }      // URL to icon image
        [NPoco.Column("FullURL")]
        public string fullImageUrl { get; set; } // URL to full image

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