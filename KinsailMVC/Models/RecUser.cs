using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KinsailMVC.Models
{
    /**
     * A user of the recreation system
     */
    public class RecUser
    {
        public long userId { get; set; }                  // database identifier - never display to user

        public string userName { get; set; }              // username used to authenticate with
        public string firstName { get; set; }             // user's first name
        public string lastName { get; set; }              // user's last name
        public GalleryImage profilePicture { get; set; }  // user's profile picture
    }
}