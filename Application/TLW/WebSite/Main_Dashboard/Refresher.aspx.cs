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

public partial class Main_Refresher : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    ForumClass objForumClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objForumClass = new ForumClass(objSqlConnClass.OpenConnection());
    }
    
    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillPersonalMessages();

        objSqlConnClass.CloseConnection();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
    }


    private void fillPersonalMessages()
    {
        txtPrivateMessages.Text = "";

        int iMessageCount = 0;
        try
        {
            DataSet DS = objForumClass.Fum_GET_ForumPersonalMessages_BY_UserId(Membership.GetUser().ProviderUserKey.ToString(), "1");
            if (DS.Tables[0].Rows.Count > 0)
            {
                txtPrivateMessages.Text = "&nbsp;&nbsp;<a class='small' href=\"javascript:load('/FORUM/privateinbox.aspx');\">" + DS.Tables[0].Rows.Count.ToString() + " New Message(s)</a> <span style=font-weight:normal;>|</span> ";
            }
        }
        catch (Exception ex)
        {
        }
    }

}
