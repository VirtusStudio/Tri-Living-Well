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

public partial class UC_TextArea : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    TextAreaClass objTextAreaClass;

    public enum Mode
    {
        Normal = 0,
        Edit = 1
    }

    private Mode gMode;

    string gsTextAreaName = "";
    string gsTextAreaId = "";

    public void SetMode(Mode mdMode)
    {
         gMode = mdMode;
    }

    public Mode getMode()
    {
        return gMode;
    }

    public string TEXTAREA_NAME
    {
        get { return gsTextAreaName; }
        set { gsTextAreaName = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        if (Session["MODE_CURRENT"] == null)
        {
            Session["MODE_CURRENT"] = "NORMAL";
        }

        if (ViewState["gsTextAreaId"] != null)
        {
            gsTextAreaId = ViewState["gsTextAreaId"].ToString();
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {

        if (Session["MODE_CURRENT"] == "EDIT")//Is the user is in edit mode
        {
            SetMode(UC_TextArea.Mode.Edit);
        }
        else
        {
            SetMode(UC_TextArea.Mode.Normal);
        }

       /* txtTextAreaName.Text = gsTextAreaName;
        txtIsPreview.Text = gMode.ToString();*/

        DataSet DS = objTextAreaClass.TxA_Get_TextAreas(gsTextAreaName, "2");

        if (DS.Tables[0].Rows.Count > 0)//There needs to be at least 1 row
        {
            if (gMode == Mode.Edit) //The user is in Edit Mode
            {
               /* divModeEdit.Visible = true;
                divEditBtn.Visible = true;
                divCancelBtn.Visible = false;
                divSaveBtn.Visible = false;
                if (Convert.ToBoolean(DS.Tables[0].Rows[0]["isPreview"]))// There is a Row with isPreview set to true
                {
                    divCancelBtn.Visible = true;
                    divSaveBtn.Visible = true;
                }*/
                lblTextAreaHtml.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
                gsTextAreaId = DS.Tables[0].Rows[0]["TextAreaId"].ToString();
            }

            if (gMode == Mode.Normal)//The user is in Normal Mode
            {
                divModeEdit.Visible = false;
                if (Convert.ToBoolean(DS.Tables[0].Rows[0]["isPreview"]))//if the current row is a preview row
                {
                    if (DS.Tables[0].Rows.Count > 1)
                    {
                        lblTextAreaHtml.Text = DS.Tables[0].Rows[1]["TextAreaHTML"].ToString();
                        gsTextAreaId = DS.Tables[0].Rows[1]["TextAreaId"].ToString();
                    }
                    else 
                    {
                        lblTextAreaHtml.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
                        gsTextAreaId = DS.Tables[0].Rows[0]["TextAreaId"].ToString();
                    }
                }
                else
                {
                    lblTextAreaHtml.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
                    gsTextAreaId = DS.Tables[0].Rows[0]["TextAreaId"].ToString();
                }
            }
        }

       /* txtTextAreaId.Text = gsTextAreaId;*/
        ViewState["gsTextAreaId"] = gsTextAreaId;
        objSqlConnClass.CloseConnection();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
       /* objTextAreaClass.TxA_UPDATE_TextAreas_IsPreview(txtTextAreaId.Text, "0");*/
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
       /* objTextAreaClass.TxA_DELETE_TextAreas_BT_TextAreaId(txtTextAreaId.Text);*/
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {

    }
    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "welcome/Styles/Corporate_text.css\" />"));
        base.OnInit(e);
} 
    
}
