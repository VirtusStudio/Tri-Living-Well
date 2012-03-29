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
using System.Collections.Generic;


public partial class HTML_MyNutrition : System.Web.UI.Page
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
        if(Request.QueryString["levelID"] != null && Request.QueryString["stepID"] != null)
        {
            string slevelID = Request.QueryString["levelID"];
            string sStepID = Request.QueryString["stepID"];
            string sUrl = "HTML/MyNutrition_Level" + slevelID + "_" + sStepID + ".html";

            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objPalClass.PAL_GET_PalStarts(sUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
                Dictionary<string, string> dictTokens = new Dictionary<string, string>();

                dictTokens.Add("<body", "<body onload=\"top.setIframeHeight();\"");
                try
                {
                    System.IO.StreamReader SR = new System.IO.StreamReader(Server.MapPath(sUrl), System.Text.Encoding.GetEncoding("Windows-1252"), true);
                    string sHTML = SR.ReadToEnd().ToString();
                    SR.Close();
                    foreach (KeyValuePair<string, string> dictToken in dictTokens)
                    {
                        sHTML = sHTML.Replace(dictToken.Key, dictToken.Value);
                    }

                    for (int i = sHTML.IndexOf("<body"); i < sHTML.Length; i++)
                    {
                        if (sHTML.Substring(i, 1) == ">")
                        {
                            string sPrint = "<div style='border-bottom:solid 1px navy;text-align:left;padding-right:100px;margin-bottom:5px;'><a style='text-decoration:none;' href='javascript:window.print();'><img src='"+AppConfig.GetBaseSiteUrl()+"images/icons/iconPrint.gif' style='border-width:0px;vertical-align:middle;' /> Print</a></div>";
                            sHTML = sHTML.Insert(i + 1, sPrint);
                            break;
                        }
                    }

                    Response.Write(sHTML);
                }
                catch (Exception ex)
                {
                }
            }
        }
    }

}
