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

public partial class ActivateAccount_Receipt : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        //objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //objSqlConnClass.CloseConnection();
    }

}
