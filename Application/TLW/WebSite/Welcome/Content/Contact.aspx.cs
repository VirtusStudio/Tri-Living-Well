//###########################################################//
//    Copyright 2007 Blue Grotto Technologies, Inc.          //
//    This code is owned by Blue Grotto Technologies, Inc    //
//    It may not be copied, shared or modified.              //
//###########################################################//
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

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Contact Us");

            #endregion
        }

        lblMsg.Text = string.Empty;
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        SendContactUsEmail();
    }
    private void SendContactUsEmail()
    {
        string strContent = string.Empty;
        
        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();

        strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("ContactUsEmail").TextAreaHTML;
        strContent = strContent.Replace("[Name]", txtName.Text);
        strContent = strContent.Replace("[Email]", txtEmail.Text);
        strContent = strContent.Replace("[Phone]", txtBphone.Text);
        strContent = strContent.Replace("[Subject]", txtsubject.Text);
        strContent = strContent.Replace("[Comments]", txtComments.Text);
        strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
        strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
        strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());

        AppLib.SendMailToUser(txtEmail.Text, txtsubject.Text, strContent, AppConfig.GetAdminEmail());

        AppLib.SendMailToUser(AppConfig.GetAdminEmail(), txtsubject.Text, "Dear Admin, Following are the contents that were sent to the user. <br />" + strContent, txtEmail.Text);


        lblMsg.Text = "Thanks for contact us. Your details has been successfully sent to TLW.";
        txtName.Text = string.Empty;
        txtBphone.Text = string.Empty;
        txtComments.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtsubject.Text = string.Empty;
    }
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
            this.MasterPageFile = "~/MasterPages/User.master";
        }
    }

    
    
}
