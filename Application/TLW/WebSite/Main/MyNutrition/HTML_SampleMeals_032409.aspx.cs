using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class HTML_SampleMeals : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    DDClass objDDClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objDDClass = new DDClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        string sUrl = "";

        string sUserID = Membership.GetUser().ProviderUserKey.ToString();
        DataSet DS = objDDClass.DD_GET_DdUsers_BY_UserId(sUserID);
        if (DS.Tables[0].Rows.Count > 0)
        {
            sUrl = "HTML/SampleMeals.html";//#" + DS.Tables[0].Rows[0]["CALORIE_NUMBER"].ToString();

            try
            {
                System.IO.StreamReader SR = new System.IO.StreamReader(Server.MapPath(sUrl));
                Response.Write(SR.ReadToEnd());
                SR.Close();
                //Response.Redirect(sUrl);
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            Response.Write("111");

            sUrl = "SampleMeals.html";
            try
            {
                System.IO.StreamReader SR = new System.IO.StreamReader(Server.MapPath(sUrl));
                Response.Write(SR.ReadToEnd());
                SR.Close();
                //Response.Redirect(sUrl);
            }
            catch (Exception ex)
            {
            }
        }

    }

}
