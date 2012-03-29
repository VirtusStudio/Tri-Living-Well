using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PopUp : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    TextAreaClass objTextAreaClass;
    string gsTextAreaId = "";
    string gsTextAreaName = "";
    

    bool gbPreviewMode = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());

        if (Request.QueryString["TextAreaName"] != null)
        {
            gsTextAreaName = Request.QueryString["TextAreaName"].ToString();
        }
        
        if (Request.QueryString["refreshButtonId"] != null)
        {
            txtBtnRefreshID.Text = Request.QueryString["refreshButtonId"].ToString();
        }

        if (ViewState["gsTextAreaId"] != null)
        {
            gsTextAreaId = ViewState["gsTextAreaId"].ToString();
        }

        if (ViewState["gbPreviewMode"] != null)
        {
            gbPreviewMode = Convert.ToBoolean(ViewState["gbPreviewMode"]);
        }
    }


    protected void Page_PreRender(object sender, EventArgs e)
    {
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas(gsTextAreaName, "1");

        if (DS.Tables[0].Rows.Count > 0)//There needs to be at least 1 row
        {
            RadEditor1.Content = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
            gsTextAreaId = DS.Tables[0].Rows[0]["TextAreaId"].ToString();
            gbPreviewMode = Convert.ToBoolean(DS.Tables[0].Rows[0]["isPreview"]);
            lblTextAreaName.Text = "Text Area: " + DS.Tables[0].Rows[0]["TextAreaName"].ToString();
        }

        string[] saImagePath = new string[1];
        saImagePath[0] = AppConfig.GetBaseSiteUrl()+ "Welcome/Uploads/Images";

        string[] saDocumantPath = new string[1];
        saDocumantPath[0] = AppConfig.GetBaseSiteUrl() + "Welcome/Uploads/Documents";

        string sServerPath = Server.MapPath("../Welcome/Uploads/Images/");
        Directory.CreateDirectory(sServerPath);

        sServerPath = Server.MapPath("../Welcome/Uploads/Documents/");
        Directory.CreateDirectory(sServerPath);

        RadEditor1.ImageManager.UploadPaths = saImagePath;
        RadEditor1.ImageManager.ViewPaths = saImagePath;

        RadEditor1.DocumentManager.UploadPaths = saDocumantPath;
        RadEditor1.DocumentManager.ViewPaths = saDocumantPath;

        ViewState["gsTextAreaId"] = gsTextAreaId;
        ViewState["gbPreviewMode"] = gbPreviewMode.ToString();
        objSqlConnClass.CloseConnection();
    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //insert/update DB
        if (gbPreviewMode)
        {
            objTextAreaClass.TxA_UPDATE_TextAreas(gsTextAreaId, RadEditor1.Content);
        }
        else
        {
            objTextAreaClass.TxA_INSERT_TextAreas(gsTextAreaName, RadEditor1.Content,"1");
        }
        //successful save
        txtSuccess.Text = "1";//triggers javascript events 
    }
}
