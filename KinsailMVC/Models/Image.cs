using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * An image has a URL and an identifier
     */
    [NPoco.PrimaryKey("ImageID")]
    public class Image
    {
        // identifiers
        public long? imageId { get; set; }       // database identifier, never displayed to the user

        // attributes
        [NPoco.Column("FullURL")]
        public string fullImageUrl { get; set; } // URL to full image

        // ctors
        public Image(string fullImageUrl)
        {
            this.imageId = null;
            this.fullImageUrl = fullImageUrl;
        }

        public Image()
        {
            this.imageId = null;
            this.fullImageUrl = string.Empty;
        }

    }
}