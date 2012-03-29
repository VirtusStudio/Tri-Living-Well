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

public partial class UC_BO_User_UserInfo: System.Web.UI.UserControl
{
    string gsUserId;
    string gDateCreated;
    string gsUsername;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string USER_ID
    {
        get { return gsUserId; }
        set { gsUserId = value; }
    }

    public string USER_NAME
    {
        get { return gsUsername; }
        set { gsUsername = value; }
    }

    public string DATE_CREATED
    {
        get { return gDateCreated; }
        set { gDateCreated = value; }
    }

    public void populate()
    {
        // USER NAME
        lblUsername.Text = gsUsername;

        // DATE CREATED
        lblDateCreated.Text = gDateCreated;
    }
}