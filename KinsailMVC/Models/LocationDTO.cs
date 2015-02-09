using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /*
     * Helper object to temporaily contain location child data as it is queried from the database
     */
    public class LocationDTO
    {
        [NPoco.Column("ItemID")]
        public long locationId { get; set; }
        public MapDetail map { get; set; }
        public List<FeatureAttribute<object>> features { get; set; }
        public List<GalleryImage> photos { get; set; }
        public List<MapFeature> markers { get; set; }
    }
}