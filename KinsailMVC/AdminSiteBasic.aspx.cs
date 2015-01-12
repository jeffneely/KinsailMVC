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
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace KinsailMVC
{
    public partial class AdminSiteBasic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetRESTData();
                GetLocations();
                GetMaps();
                GetSites();
                GetImages();
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
                    
                    var arr = JsonConvert.DeserializeObject<QueryResults<SiteBasic>>(s);
                    
                    
                    dgSites.DataSource= arr.results;
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

        private void GetLocations()
        {
            try
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri + "/locationsBasicInfo";
                url = url.Replace(HttpContext.Current.Request.Url.AbsolutePath, "");

                var webRequest = (HttpWebRequest)WebRequest.Create(url);

                var webResponse = (HttpWebResponse)webRequest.GetResponse();
                if ((webResponse.StatusCode == HttpStatusCode.OK) && (webResponse.ContentLength > 0))
                {
                    var reader = new StreamReader(webResponse.GetResponseStream());
                    string s = reader.ReadToEnd();

                    var arr = JsonConvert.DeserializeObject<QueryResults<LocationBasicInfo>>(s);

                    foreach (LocationBasicInfo objLocation in arr.results)
                    {
                        ddlLocation.Items.Add(new ListItem(objLocation.Name, objLocation.ItemID.ToString()));
                    }

                   

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

        private void GetMaps()
        {
            try
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri + "/maps";
                url = url.Replace(HttpContext.Current.Request.Url.AbsolutePath, "");

                var webRequest = (HttpWebRequest)WebRequest.Create(url);

                var webResponse = (HttpWebResponse)webRequest.GetResponse();
                if ((webResponse.StatusCode == HttpStatusCode.OK) && (webResponse.ContentLength > 0))
                {
                    var reader = new StreamReader(webResponse.GetResponseStream());
                    string s = reader.ReadToEnd();

                    var arr = JsonConvert.DeserializeObject<QueryResults<Map>>(s);

                    foreach (Map objMap in arr.results)
                    {
                        ddlMap.Items.Add(new ListItem(objMap.Name.ToString(), objMap.MapId.ToString()));
                    }



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

        private void GetSites()
        {
            try
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri + "/SitesBasicInfo";
                url = url.Replace(HttpContext.Current.Request.Url.AbsolutePath, "");

                var webRequest = (HttpWebRequest)WebRequest.Create(url);

                var webResponse = (HttpWebResponse)webRequest.GetResponse();
                if ((webResponse.StatusCode == HttpStatusCode.OK) && (webResponse.ContentLength > 0))
                {
                    var reader = new StreamReader(webResponse.GetResponseStream());
                    string s = reader.ReadToEnd();

                    var arr = JsonConvert.DeserializeObject<QueryResults<SiteBasicInfo>>(s);

                    foreach (SiteBasicInfo objSite in arr.results)
                    {
                        ddlSite.Items.Add(new ListItem(objSite.Name.ToString(), objSite.ItemID.ToString()));
                    }



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

        private void GetImages()
        {
            try
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri + "/SiteImages";
                url = url.Replace(HttpContext.Current.Request.Url.AbsolutePath, "");

                var webRequest = (HttpWebRequest)WebRequest.Create(url);

                var webResponse = (HttpWebResponse)webRequest.GetResponse();
                if ((webResponse.StatusCode == HttpStatusCode.OK) && (webResponse.ContentLength > 0))
                {
                    var reader = new StreamReader(webResponse.GetResponseStream());
                    string s = reader.ReadToEnd();

                    var arr = JsonConvert.DeserializeObject<QueryResults<ImageBasic>>(s);

                    foreach (ImageBasic objImage in arr.results)
                    {
                        ddlImage.Items.Add(new ListItem(objImage.Caption, objImage.ImageID.ToString()));
                    }



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



        protected void dgSites_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow gvrow = dgSites.Rows[index];

            String idLocation = HttpUtility.HtmlDecode(gvrow.Cells[4].Text).ToString();
            String idItem = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString(); 

            if (e.CommandName.Equals("detail"))
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append(@"<script type='text/javascript'>");

                sb.Append("ShowModal();");

                sb.Append(@"</script>");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
            }


            if (e.CommandName.Equals("editRecord"))
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();

                sb.Append(@"<script type='text/javascript'>");

                sb.Append("$('#myModal').modal('show');");

                sb.Append(@"</script>");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false); 
            
            }

            if (e.CommandName.Equals("deleteRecord"))
                {
                
            
                }

                

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SiteBasic objSite = new SiteBasic();
            var client = new HttpClient();
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            url = url.Replace(HttpContext.Current.Request.Url.AbsolutePath, "");
            float objX, objY;
            objSite.coords = new MapCoordinates();

            // Validate Data
            if ((float.TryParse(txtCoordinateX.Text, out objX)))
            {
                objSite.coords.X = objX;
            }
            else
            {
                lblError.Text = "X coord must be a float value";
                txtCoordinateX.Focus();
            }


            if ((float.TryParse(txtCoordinateY.Text, out objY)))
            {
                objSite.coords.Y = objY;
            }
            else
            {
                lblError.Text = "Y coord must be a float value";
                txtCoordinateY.Focus();
            }

            objSite.image = new GalleryImage();
            objSite.image.imageId = long.Parse(ddlImage.SelectedValue);

            objSite.locationId = long.Parse(ddlLocation.SelectedValue);

            objSite.siteId = long.Parse(ddlSite.SelectedValue);

            objSite.siteIdentifier = txtDescription.Text;


            client.BaseAddress = new Uri(url);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));



            var result = client.PostAsJsonAsync("Addsites", objSite);
            if (result.Result.IsSuccessStatusCode)
            {
                lblError.Text = "Site Basic created with success";
                GetRESTData();
            }
            else
            {
                lblError.Text = "Error calling add sites method: " + result.Result.RequestMessage;
            }
        }

        

    }
}