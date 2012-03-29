using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_UserUtilities_CreateAdminUser : System.Web.UI.Page
{

    #region Events

    /// Event Header*******************************************************
    /// Function Name: Page_Load
    /// Function Type: Event
    /// Functionality: Event fired when the page gets loaded.
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// ********************************************************************
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Create Admin User");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);
    }
 
    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));


        base.OnInit(e);

    }
    #endregion

}