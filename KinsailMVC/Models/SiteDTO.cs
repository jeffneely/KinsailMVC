using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /*
     * Helper object to temporaily contain site child data as it is queried from the database
     */
    public class SiteDTO
    {
        [NPoco.Column("ItemID")]
        public long siteId { get; set; }                        
        public List<FeatureAttribute<object>> features { get; set; }
        public List<CostPeriod> costs { get; set; }
        public List<GalleryImage> photos { get; set; }
    }
}