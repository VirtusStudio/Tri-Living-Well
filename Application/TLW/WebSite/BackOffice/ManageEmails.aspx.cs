using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageEmails : System.Web.UI.Page
{
  
    #region Events
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage Emails");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        trCompany.Visible = false;
        trUsers.Visible = false;
        txtFromEmail.Text = AppConfig.GetAdminEmail();

        if (!IsPostBack)
        {
            BindControls();
        }
    }
    
    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        trCompany.Visible = true;
        if (!ddlCompany.SelectedValue.Equals("0"))
        {
            if (Convert.ToInt32(ddlToEmails.SelectedValue).Equals(4))
            {
                trUsers.Visible = true;
                BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
                ddlUsers.DataSource = oCompanyManager.GetUsersByCompanyId(Convert.ToInt32(ddlCompany.SelectedValue));
                ddlUsers.DataTextField = "StrEmpEmail";
                ddlUsers.DataValueField = "StrEmpEmail";
                ddlUsers.DataBind();
                if (ddlUsers.Items.Count.Equals(0))
                    ddlUsers.Items.Add(new ListItem("No User Exist", "0"));
            }
            else
                trUsers.Visible = false;
        }
        else
            trUsers.Visible = false;
    }
   
    protected void ddlToEmails_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ddlToEmails.SelectedValue) > 1)
        {
            BindControls();
            trCompany.Visible = true;
        }
        else
            trCompany.Visible = false;
    }
  
    protected void lnkBtnUpdate_Click(object sender, EventArgs e)
    {
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        List<Entity.CompanyInfo> oListCompanyInfo = new List<Entity.CompanyInfo>();
        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        switch (ddlToEmails.SelectedValue)
        {
            case "0":/*send email to all the users*/
                {
                    oListCompanyInfo = oCompanyManager.GetAllUsers();
                    if (oListCompanyInfo.Count > 0)
                    {
                        foreach (var item in oListCompanyInfo)
                        {
                            AppLib.SendMailToUser(item.StrEmpEmail, txtSubject.Text, reContent.Content, txtFromEmail.Text);
                        }
                    }
                    oCompanyManager = null;
                    oListCompanyInfo = null;
                    break;
                }
            case "1":/*send email to all companies*/
                {
                    oListCompanyInfo = oCompanyManager.GetCompanyAllCompanies();
                    if (oListCompanyInfo.Count > 0)
                    {
                        foreach (var item in oListCompanyInfo)
                        {
                            AppLib.SendMailToUser(item.StrEmpEmail, txtSubject.Text, reContent.Content, txtFromEmail.Text);
                        }
                    }
                    break;
                }
            case "2":/* send email to single companies*/
                {
                    oCompanyInfo = oCompanyManager.GetCompanyDetailsById(Convert.ToInt32(ddlCompany.SelectedValue));
                    if (oCompanyInfo != null)
                    {
                        AppLib.SendMailToUser(oCompanyInfo.StrCompanyEmail, txtSubject.Text, reContent.Content,txtFromEmail.Text);
                    }
                    break;
                }
            case "3":/*send email to all the users of the company*/
                {
                    oListCompanyInfo = oCompanyManager.GetUsersByCompanyId(Convert.ToInt32(ddlCompany.SelectedValue));
                    foreach (var item in oListCompanyInfo)
                    {
                        AppLib.SendMailToUser(item.StrEmpEmail, txtSubject.Text, reContent.Content, txtFromEmail.Text);
                    }

                    break;
                }
            case "4":/*send email to single user of the compan*/
                {
                    AppLib.SendMailToUser(ddlUsers.SelectedItem.Text, txtSubject.Text, reContent.Content, txtFromEmail.Text);
                    break;
                }
            default:
                {
                    break;
                }
        }

        lblMsg.Text = "Email(s) has been successfully sent. ";
        txtSubject.Text = string.Empty;
        reContent.Content = string.Empty;
        oCompanyManager = null;
        oCompanyInfo = null;
        oListCompanyInfo = null;

    }

    #endregion

    #region User Defined Functions

    private void BindControls()
    {
        AppLib.BindCompanyDropdown(ddlCompany, "All");
    }

    #endregion

}