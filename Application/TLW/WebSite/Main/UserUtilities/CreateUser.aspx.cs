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

public partial class Main_UserUtilities_CreateUser : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Membership.GetUser() != null)
            {
                string sAccountFrom = Membership.GetUser().ProviderUserKey.ToString();
                UC_USER_CreateAccount1.populate(sAccountFrom);
            }
        }

        if (UC_USER_CreateAccount1.SUCCESS)
        {
            btnSubmit.Visible = false;
        }
    }

}
