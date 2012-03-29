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

public partial class ActivateAccount : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string sAccountFrom = Membership.GetUser().ProviderUserKey.ToString();
            
            foreach (DataRow DR in objBackofficeClass.Mem_GET_UserInfo_BY_AccountFrom(sAccountFrom, "0").Tables[0].Rows)
            {
                ListItem LI = new ListItem();
                LI.Text = DR["FNAME"].ToString() + " " + DR["LNAME"].ToString();
                LI.Value = DR["USER_ID"].ToString();
                ddlUserID.Items.Add(LI);
            }
            UC_USER_EditAccount1.populate(ddlUserID.Items[0].Value);
        }

        objSqlConnClass.CloseConnection();
    }
    protected void ddlUserID_SelectedIndexChanged(object sender, EventArgs e)
    {
        UC_USER_EditAccount1.populate(ddlUserID.SelectedValue);
        //Response.Write(ddlUserID.SelectedValue);
    }

}
