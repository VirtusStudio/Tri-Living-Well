using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome_Content_AboutUsForRegisteredUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("About Us");

        #endregion
    }
}