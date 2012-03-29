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

public partial class HTML_Details : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPalClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
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
        if(Request.QueryString["levelID"] != null)
        {
            string slevelID = Request.QueryString["levelID"];
            string sUrl = "HTML/Details_Level" + slevelID + ".html";

            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objPalClass.PAL_GET_PalStarts(sUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
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

}
