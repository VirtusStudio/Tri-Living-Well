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

public partial class Login_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //---------------------VISITLOG---------------------
        //UC_Visitlog_Visitlog1.addEntry(1, 3, 0, 0, "", "", "");

        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Log out");

            #endregion
        }


        try
        {
            // LOG USER OUT PROGRAMMATICALLY
            FormsAuthentication.SignOut();
        }
        catch (Exception ex)
        {
            Response.Write("<br />FormsAuthentication.SignOut(); " + ex.Message);
        }

        try
        {
            // CLEAR SESSION
            Session.Abandon();
        }
        catch (Exception ex)
        {
            Response.Write("<br />Session.Abandon(); " + ex.Message);
        }

    }
}
