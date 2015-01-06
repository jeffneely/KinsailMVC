using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KinsailMVC.Models;

namespace KinsailMVC
{
    public partial class AdminSiteBasic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetRESTData( );
            }
        }

        private void GetRESTData()
        {
            try
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri + "/sites";
                url = url.Replace(HttpContext.Current.Request.Url.AbsolutePath, "");

                var webRequest = (HttpWebRequest)WebRequest.Create(url);
                var webResponse = (HttpWebResponse)webRequest.GetResponse();
                if ((webResponse.StatusCode == HttpStatusCode.OK) && (webResponse.ContentLength > 0))
                {
                    var reader = new StreamReader(webResponse.GetResponseStream());
                    string s = reader.ReadToEnd();
                    var arr = JsonConvert.DeserializeObject<SiteBasic[]>(s);
                    
                    
                    dgSites.DataSource= arr;
                    dgSites.DataBind();

                }
                else
                {
                    lblError.Text = string.Format("Status code == {0}", webResponse.StatusCode);
                }
            }
            catch (Exception ex)
            {

                lblError.Text = ex.Message;
            }
        }

        protected void dgSites_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            dgSites.PageIndex = e.NewPageIndex;
            dgSites.DataBind();
        }

        protected void dgSites_PageIndexChanged(object sender, EventArgs e)
        {
            GetRESTData();
        }

        

    }
}