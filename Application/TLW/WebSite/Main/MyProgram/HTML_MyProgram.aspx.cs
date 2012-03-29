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
using System.IO;

public partial class HTML_MyProgram : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPalClass;
    ProgramClass objProgramClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
        objProgramClass = new ProgramClass(objSqlConnClass.OpenConnection());
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
        if(Request.QueryString["programID"] != null && Request.QueryString["stepID"] != null)
        {
            string sProgramID = Request.QueryString["programID"];
            string sStepID = Request.QueryString["stepID"];
            string sUrl = "HTML/MyProgram_" + sProgramID + "_" + sStepID + ".html";

            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objPalClass.PAL_GET_PalStarts(sUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
                //if (DS.Tables[0].Rows[0]["PROGRAM_ID"].ToString() == sProgramID)
                {
                    //if (Convert.ToInt32(sStepID) <= Convert.ToInt32(DS.Tables[0].Rows[0]["PROGRAM_CURRENT_STEP"]) + 1)
                    {
                        WritePage(sUrl);
                    }
                }
            }
            else//they are looking at sample program data
            {
                if (Convert.ToInt32(sStepID) <= 3)
                {
                    WritePage(sUrl);
                }
            }
        }
    }

    private void WritePage(string sUrl)
    {
        Dictionary<string, string> dictTokens = new Dictionary<string, string>();

        //StreamReader SR2 = new StreamReader(Server.MapPath("/HTML_Templates/MyProgram_MyProgram.html"));/*Commented by Netsmartz*/
        StreamReader SR2 = new StreamReader(Server.MapPath("../../HTML_Templates/MyProgram_MyProgram.html"));
        string sLayout = SR2.ReadToEnd();
        SR2.Close();

        //getting these from SQL
        DataSet DS = objProgramClass.Prg_GET_ProgramsExercises_BY_ProgramSeries("800");
        foreach (DataRow DR in DS.Tables[0].Rows)
        {
            dictTokens.Add("#" + DR["NAME"].ToString() + "#", sLayout.Replace("#EXERCISE_ID#", DR["EXERCISE_ID"].ToString()).Replace("#PROGRAM_SERIES#", DR["PROGRAM_SERIES"].ToString()).Replace("#IMAGE1#", DR["IMAGE1"].ToString()).Replace("#IMAGE2#", DR["IMAGE2"].ToString()).Replace("#NAME#", DR["NAME"].ToString()));
              
        }

        dictTokens.Add("<body", "<body>");
        try
        {
            System.IO.StreamReader SR = new System.IO.StreamReader(Server.MapPath(sUrl), System.Text.Encoding.GetEncoding("Windows-1252"), true);
            string sHTML = SR.ReadToEnd().ToString().Replace("\r\n", " ");
            SR.Close();
            while(sHTML.Contains("  "))
            {
                sHTML = sHTML.Replace("  ", " ");
            }

            foreach (KeyValuePair<string, string> dictToken in dictTokens)
            {
                sHTML = sHTML.Replace(dictToken.Key, dictToken.Value);
            }
            
            for (int i = sHTML.IndexOf("<body"); i < sHTML.Length; i++)
            {
                if (sHTML.Substring(i, 1) == ">")
                {
                    string sPrint = "<div style='border-bottom:solid 1px navy;text-align:left;padding-right:100px;margin-bottom:5px;'><a style='text-decoration:none;' href='javascript:window.print();'><img src='" + AppConfig.GetBaseSiteUrl() + "images/icons/iconPrint.gif' style='border-width:0px;vertical-align:middle;' /> Print</a></div>";
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
