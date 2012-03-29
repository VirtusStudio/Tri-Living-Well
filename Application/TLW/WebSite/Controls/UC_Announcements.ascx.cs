using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_UC_Announcements : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindNewsAnnouncements();
    }

    #region User Defined Functions

    /// Function Header*******************************************************
    /// Function Name: BindNewsAnnouncements
    /// Function Type: Function
    /// Functionality: used to bind the news and annoucements
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindNewsAnnouncements()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        dlNewsAnnouncments.DataSource = oNewsLib.GetAllNewsAnnouncementsForHomePage();
        dlNewsAnnouncments.DataBind();
        oNewsLib = null;
    }

    /// Function Header*******************************************************
    /// Function Name: GetPDFLink
    /// Function Type: Function
    /// Functionality: used to return the link of pdf or direct link
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
   
    protected string GetPDFLink(string strPDFFileName, string strDirectLink)
    {
        if (strDirectLink.Equals(string.Empty))
            return AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsAnnouncementsPDFPath() + strPDFFileName;
        else
            return strDirectLink;
    }
    #endregion
}
