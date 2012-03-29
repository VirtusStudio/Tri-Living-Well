//###########################################################//
//    Copyright 2007 Blue Grotto Technologies, Inc.          //
//    This code is owned by Blue Grotto Technologies, Inc    //
//    It may not be copied, shared or modified.              //
//###########################################################//
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Annoucements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Announcements");

            #endregion
        }



        BindNewsAnnouncements();
    }

    #region User Defined Functions

    private void BindNewsAnnouncements()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        dlNewsAnnouncments.DataSource = oNewsLib.GetAllNewsAnnouncements();
        dlNewsAnnouncments.DataBind();
        oNewsLib = null;
    }
    #endregion
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
            this.MasterPageFile = "~/MasterPages/User.master";
        }
    }

    protected string GetPDFLink(string strPDFFileName, string strDirectLink)
    {
        if (strDirectLink.Equals(string.Empty))
            return AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsAnnouncementsPDFPath() + strPDFFileName;
        else
            return strDirectLink;
    }
}
