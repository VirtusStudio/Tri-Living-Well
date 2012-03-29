using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class HTML_Details : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPalClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        if (Request.QueryString["levelID"] != null)
        {
            string sSectionID = "1";

            if (Request.QueryString["sectionID"] != null)
            {
                sSectionID = Request.QueryString["sectionID"];
            }
            string slevelID = Request.QueryString["levelID"];
            string sUrl = "HTML/Details_Level" + slevelID + ".html#" + sSectionID;

            //Response.Write(sUrl);
            IFRAME1.Attributes.Add("src", sUrl);

            //Response.Write("</br></br>" + IFRAME1.Attributes["src"]);
            
            Session["levelID"] = Request.QueryString["levelID"];


            string sNavigation = "";
            sNavigation = "<a href='HTML_Details.aspx?levelID=" + slevelID + "&sectionID=1' ><img src='"+AppConfig.GetBaseSiteUrl()+"Images/buttons/button_milk.jpg' /></a><br />";
            sNavigation += "<a href='HTML_Details.aspx?levelID=" + slevelID + "&sectionID=2' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_fruit.jpg' /></a><br />";
            sNavigation += "<a href='HTML_Details.aspx?levelID=" + slevelID + "&sectionID=3' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_vegetables.jpg' /></a><br />";
            sNavigation += "<a href='HTML_Details.aspx?levelID=" + slevelID + "&sectionID=4' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_starch-list.jpg' /></a><br />";
            sNavigation += "<a href='HTML_Details.aspx?levelID=" + slevelID + "&sectionID=5' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_proteins.jpg' /></a><br />";
            sNavigation += "<a href='HTML_Details.aspx?levelID=" + slevelID + "&sectionID=6' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_fats.jpg' /></a>";
            lblNavigation.Text = sNavigation;

        }
    }

}
