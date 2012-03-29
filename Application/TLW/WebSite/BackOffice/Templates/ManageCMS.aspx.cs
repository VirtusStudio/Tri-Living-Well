using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Templates_ManageCMS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage CMS");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;
        if (!IsPostBack)
        {

        }
    }
    protected void ddlTemplateName_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ddlTemplateName.SelectedValue) > 0)
        {
            BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
            ddlPage.DataSource = oTemplateLib.GetTemplateByTemplateType(Convert.ToInt32(ddlTemplateName.SelectedValue));
            ddlPage.DataTextField = "StrDefaultName";
            ddlPage.DataValueField = "StrPageName";
            ddlPage.DataBind();
            ddlPage.Items.Insert(0, new ListItem("Select", "0"));
            oTemplateLib = null;
            reContent.Content = string.Empty;
        }
        else
        {
            ddlPage.Items.Clear();
            lblMsg.Text = "Please Select Template";
            reContent.Content = string.Empty;
        }

    }
    protected void lnkBtnUpdate_Click(object sender, EventArgs e)
    {
        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
        oTemplateLib.UpdateTemplateDetails(ddlPage.SelectedValue, reContent.Content);
        lblMsg.Text = "Content has been updated successfully.";
        oTemplateLib = null;
    }
    protected void ddlSelectPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!ddlPage.SelectedValue.ToString().Equals("0"))
        {
            BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
            reContent.Content = oTemplateLib.GetTemplateDetailsByTemplateTemplateName(ddlPage.SelectedValue).TextAreaHTML;

            oTemplateLib = null;
        }
        else
        {
            lblMsg.Text = "Please Select Page";
            reContent.Content = string.Empty;
        }
    }

}