using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    public class LocationDTO
    {
        [NPoco.Column("ItemID")]
        public long locationId { get; set; }                        
        public List<FeatureAttribute<object>> features { get; set; }
        public List<GalleryImage> photos { get; set; }              
    }
}