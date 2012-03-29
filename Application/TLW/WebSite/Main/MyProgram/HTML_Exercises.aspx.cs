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

public partial class HTML_Exercises : System.Web.UI.Page
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
        if(Request.QueryString["programID"] != null)
        {
            string sProgramID = Request.QueryString["programID"];
            string sUrl = "HTML/Exercises_" + sProgramID + ".html";
            //Response.Write(sProgramID);

            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objPalClass.PAL_GET_PalStarts(sUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
               // if (DS.Tables[0].Rows[0]["PROGRAM_ID"].ToString() == sProgramID)
                {
                    WritePage(sUrl);
                }
            }
            else//show them a sample... which i guess is everything from the querystring
            {
                WritePage(sUrl);
            }
        }
    }

    private void WritePage(string sUrl)
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
