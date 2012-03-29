using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
            if (AppLib.GetLoggedInUserType().Equals("U"))
                this.MasterPageFile = "~/MasterPages/User.master";
            else
                this.MasterPageFile = "~/MasterPages/BackOffice.master";
        }
    }
}