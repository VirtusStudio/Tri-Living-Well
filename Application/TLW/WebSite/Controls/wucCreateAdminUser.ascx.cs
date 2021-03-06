﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using aspNetEmail;
/*using Telerik.WebControls;*/
/*Commented by Netsmartz for resolving compile time issues*/
using Telerik.Web.UI;
public partial class Controls_wucCreateAdminUser : System.Web.UI.UserControl
{

    string gsAccountFrom;

    int giSendEmail, giShowReceipt;

    bool gbSuccess = false;
    bool gbUsermode = true;

    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;
    UsersClass objUsersClass;

    public bool USERMODE
    {
        get { return gbUsermode; }
        set { gbUsermode = value; }
    }
    public bool SUCCESS
    {
        get { return gbSuccess; }
        set { gbSuccess = value; }
    }

    public int SENDEMAIL
    {
        get { return giSendEmail; }
        set { giSendEmail = value; }
    }

    public int SHOWRECEIPT
    {
        get { return giShowReceipt; }
        set { giShowReceipt = value; }
    }

    public string RETURNURL
    {
        get { return CreateUserWizard1.FinishDestinationPageUrl; }
        set { CreateUserWizard1.FinishDestinationPageUrl = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        try
        {
            objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
            objUsersClass = new UsersClass(objSqlConnClass.sqlConnection);

            if (ViewState["gsAccountFrom"] != null)
            {
                gsAccountFrom = ViewState["gsAccountFrom"].ToString();
            }


            if (!IsPostBack)
            {

                giShowReceipt = 1;
                giSendEmail = 1;
                CreateUserWizard1.FinishDestinationPageUrl = "/";
                CreateUserWizard1.LoginCreatedUser = false;

                //////////////////////////////////////////////////////////
                //Taking the List of Items in DataSets from the Database
                //////////////////////////////////////////////////////////

                // DataSet DegreeDS = 

                DataSet StateDS = objBackofficeClass.GET_Items_AnyItemTable("State", "List_StateCountry");
                DataSet CountryDS = objBackofficeClass.GET_Items_AnyItemTable("Country", "List_StateCountry");

                ///////////////////////////////////////////////////////////////////////////////////////
                //Assigning the DropDownList objects by finding the controls from the createuserwizard
                ////////////////////////////////////////////////////////////////////////////////////////

                DropDownList ddlDegree = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlDegree");
                DropDownList ddlState = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlState");
                DropDownList ddlCountry = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCountry");
                DropDownList ddlAccountFromRelationship = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlAccountFromRelationship");
                DropDownList ddlGender = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlGender");
                DropDownList ddlFamilyStatus = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlFamilyStatus");

                /////////////////////////////
                //Binding the DropDownLists
                ////////////////////////////

                ddlDegree = objSqlConnClass.fillDropDown(ddlDegree, "Degree", "List_Items");
                //ddlYourRole = objSqlConnClass.fillDropDown(ddlYourRole, "Your Role", "List_Items");
                ddlAccountFromRelationship = objSqlConnClass.fillDropDown(ddlAccountFromRelationship, "Account From Relationship", "List_Items");
                ddlGender = objSqlConnClass.fillDropDown(ddlGender, "Gender", "List_Items");
                ddlFamilyStatus = objSqlConnClass.fillDropDown(ddlFamilyStatus, "Family Status", "List_Items");

                BindDropDownList(ddlState, StateDS);
                BindDropDownList(ddlCountry, CountryDS);
            }
        }
        catch (Exception ex) { }
        finally
        {
            objSqlConnClass.CloseConnection();
        }
    }

    public void populate(string sAccountFrom)
    {
        gsAccountFrom = sAccountFrom;

        string sUsername = Membership.GetUser(new Guid(sAccountFrom)).UserName;
        DataSet DS = objBackofficeClass.Mem_GET_UserInfo(sUsername);

        if (DS.Tables[0].Rows[0]["ACCOUNT_CREDITS_REMAINING"].ToString() != "0")
        {//called txt because of standard to use txt on create and lbl on receipt
            Label txtOrganization = (Label)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtOrganization");
            txtOrganization.Text = DS.Tables[0].Rows[0]["ORGANIZATION"].ToString();
        }
        else
        {
            CreateUserWizard1.Visible = false;
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        ViewState["gsAccountFrom"] = gsAccountFrom;

        if (!IsPostBack)
        {
            /*---------------------VISITLOG---------------------*/
            //UC_Visitlog_Visitlog1.addEntry(3, 0, 0, 0, "", "", "");
        }

        try
        {
            objSqlConnClass.CloseConnection();//this line is added by Netsmartz (line is used to close the sql server connection)
        }
        catch { }
    }

    private void BindDropDownList(DropDownList DDL, DataSet DS)
    {
        try
        {
            DDL.DataSource = DS;
            DDL.DataValueField = "Item_ID";
            DDL.DataTextField = "Item_Text";
            DDL.DataBind();
        }
        catch (Exception ex)
        {
            //Response.Write("err: " + ex.Message.ToString());
        }
    }

    protected void CreateUserWizard1_CreatedUserError(object sender, System.Web.UI.WebControls.CreateUserErrorEventArgs e)
    {
        string sErrorMessage = "";

        switch (e.CreateUserError)
        {
            case MembershipCreateStatus.DuplicateUserName:
                sErrorMessage = "Emailid already exists. Please enter a different emailid.";
                break;

            case MembershipCreateStatus.DuplicateEmail:
                sErrorMessage = "A emailid already exists. Please enter a different e-mail address.";
                break;

            case MembershipCreateStatus.InvalidPassword:
                sErrorMessage = "The password provided is invalid. Please enter a valid password value.";
                break;

            case MembershipCreateStatus.InvalidEmail:
                sErrorMessage = "The e-mail address provided is invalid. Please check the value and try again.";
                break;

            case MembershipCreateStatus.InvalidAnswer:
                sErrorMessage = "The password retrieval answer provided is invalid. Please check the value and try again.";
                break;

            case MembershipCreateStatus.InvalidQuestion:
                sErrorMessage = "The password retrieval question provided is invalid. Please check the value and try again.";
                break;

            case MembershipCreateStatus.InvalidUserName:
                sErrorMessage = "The user name provided is invalid. Please check the value and try again.";
                break;

            case MembershipCreateStatus.ProviderError:
                sErrorMessage = "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
                break;

            case MembershipCreateStatus.UserRejected:
                sErrorMessage = "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
                break;

            default:
                sErrorMessage = "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
                break;
        }
        /*---------------------VISITLOG---------------------*/
        /*   UC_Visitlog_Visitlog1.addEntry(3, 2, 0, 0, sErrorMessage, "", "");*/

        lblError.Text = "<span class='txt_A_14-Red-B'>ERROR - " + sErrorMessage + "</span>";
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        try
        {

            //Defining and assigning the userNameTextBox object
            TextBox userNameTextBox = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("UserName");
            MembershipUser user = Membership.GetUser(userNameTextBox.Text);
            //////////////////////////////////////////////////////////////////////
            //Defining and Assigning the objects for all Extra Information 
            //////////////////////////////////////////////////////////////////////

            TextBox txtFname = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtFname");
            TextBox txtMname = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtMname");
            TextBox txtLname = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtLname");
            DropDownList ddlDegree = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlDegree");
            DropDownList ddlYourRole = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlYourRole");
            TextBox txtSpecialty = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtSpecialty");
            TextBox txtAffiliation = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtAffiliation");
            TextBox txtAddress1 = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtAddress1");
            TextBox txtAddress2 = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtAddress2");
            TextBox txtCity = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtCity");
            DropDownList ddlState = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlState");
            TextBox txtStateText = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtStateText");
            TextBox txtZip = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtZip");
            TextBox txtPassword = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Password");
            DropDownList ddlCountry = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlCountry");
            TextBox txtBphone = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtBphone");
            TextBox txtFax = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtFax");
            RadioButton rbtnYEmail = (RadioButton)CreateUserWizardStep1.ContentTemplateContainer.FindControl("rbtnYEmail");
            RadioButton rbtnNEmail = (RadioButton)CreateUserWizardStep1.ContentTemplateContainer.FindControl("rbtnNEmail");

            Label txtOrganization = (Label)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtOrganization");
            TextBox txtHeight = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtHeight");
            //RadioButtonList rdbtnlst_IsAccredited = (RadioButtonList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("rbtnlistIsAccredited");
            DropDownList ddlAccountFromRelationship = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlAccountFromRelationship");
            DropDownList ddlGender = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlGender");
            DropDownList ddlFamilyStatus = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlFamilyStatus");
            //  Telerik.Web.UI.RadDatePicker rdpDateBirth = (Telerik.Web.UI.RadDatePicker)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("rdpDateBirth");
            TextBox rdpDateBirth = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("rdpDateBirth");


            //Assiging the parameters array
            string[] parameters = new string[35];

            parameters[0] = userNameTextBox.Text;
            parameters[1] = txtFname.Text;
            parameters[2] = txtMname.Text;
            parameters[3] = txtLname.Text;
            parameters[4] = ddlDegree.SelectedValue;
            //  parameters[6] = txtSpecialty.Text;
            parameters[6] = "";
            //parameters[7] = txtAffiliation.Text;
            parameters[7] = "";
            parameters[9] = txtAddress1.Text;
            parameters[10] = txtAddress2.Text;
            parameters[11] = txtCity.Text;
            parameters[12] = ddlState.SelectedValue;
            parameters[13] = txtZip.Text;
            parameters[14] = ddlCountry.SelectedValue;
            parameters[15] = txtBphone.Text;
            parameters[16] = txtFax.Text;

            if (rbtnYEmail.Checked == true)
            {
                parameters[17] = "1";
            }
            else
            {
                parameters[17] = "0";
            }

            parameters[18] = txtPassword.Text;
            parameters[19] = RandomCode();
            parameters[20] = txtOrganization.Text;
            //parameters[21] = rdbtnlst_IsAccredited.SelectedValue; //is accredited
            parameters[21] = "1"; //is accredited
            //parameters[22] = ddlYourRole.SelectedValue; //is accredited
            parameters[22] = "0"; //is accredited

            parameters[23] = txtStateText.Text.Trim(); //is accredited
            if (ddlCountry.SelectedValue == "1" || ddlCountry.SelectedValue == "2")//USA || Canada
            {
                parameters[23] = ddlState.SelectedItem.Text;
            }

            parameters[24] = "1";//REGISTRATION_FLG
            parameters[25] = "0";//ACCOUNT_CREDITS
            parameters[26] = "858B5769-15F9-462C-BF46-39031A46EF15";//ACCOUNT_FROM /*Temp storing the values*/
            parameters[27] = ddlAccountFromRelationship.SelectedValue;//ACCOUNT_FROM_RELATIONSHIP_ID

            parameters[28] = ddlGender.SelectedValue;//GENDER_ID
            parameters[29] = ddlFamilyStatus.SelectedValue;//FAMILY_STAUS_ID
            parameters[30] = Convert.ToDateTime(rdpDateBirth.Text).ToString("MM/dd/yyyy");//DATE_BIRTH //need Convert.ToDateTime
            parameters[31] = txtHeight.Text;
            parameters[32] = ddlYourRole.SelectedValue; //is accredited
            ///////////////////////////////////////////////////////////////
            //Calling the function for saving the information for the user
            ////////////////////////////////////////////////////////////////
            objBackofficeClass.Mem_INSERT_AdminUserInfo(parameters);
            string sUsername = userNameTextBox.Text.Trim();
            sendOutConfirmationEmail(sUsername);
            lblError.Text = "User added successfully.";
        }
        catch (Exception ex)
        {
            lblError.Text = ">> " + ex.Message.ToString();
        }

        gbSuccess = true;

        if (Request.QueryString["userName"] == null)
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/Userutilities/UserUtilities.aspx?msg=adins", true);
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/Userutilities/UserUtilities.aspx?msg=up", true);

        //if (!gbUsermode)
        //{

        //    Response.Redirect(AppConfig.GetBaseSiteUrl() + "backoffice/manageusers/manageUsers.aspx");
        //}
    }

    private void sendOutConfirmationEmail(string sUsername)
    {
        string strContent = string.Empty;
        strContent = AppLib.GetEmailContent("Email_Account_Create.htm");
        strContent = strContent.Replace("#HOSTURL#", AppConfig.GetBaseSiteUrl());
        strContent = strContent.Replace("#WC_SITE_NAME#", AppConfig.GetSiteName());
        strContent = strContent.Replace("#WC_SITE_PHONE#", AppConfig.GetSITEPHONE());

        AppLib.SendMailToUser(sUsername, ConfigurationSettings.AppSettings["EMAIL_SUBJECT_ACCOUNT_CREATE"], strContent, AppConfig.GetAdminEmail());


        /*EmailClass objEmail = new EmailClass(objBackofficeClass.sqlconnection);
       // objEmail.BodyTemplate = "Email_Account_Create.htm";*/
        /*    objEmail.Subject = ConfigurationSettings.AppSettings["EMAIL_SUBJECT_ACCOUNT_CREATE"];
            objEmail.FillUserInfo(new Guid(Membership.GetUser(sUsername).ProviderUserKey.ToString()));
            objEmail.Send();*/
    }

    protected string RandomCode()
    {
        Random rnd = new Random();

        int iRandomCode_PartA = rnd.Next(1000, 9999);
        int iRandomCode_PartB = rnd.Next(1000, 9999);
        int iRandomCode_PartC = rnd.Next(1000, 9999);
        int iRandomCode_PartD = rnd.Next(1000, 9999);

        return (iRandomCode_PartA.ToString() + "-" + iRandomCode_PartB.ToString() + "-" + iRandomCode_PartC.ToString() + "-" + iRandomCode_PartD.ToString());
    }

    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlCountry = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlCountry");
        TextBox txtStateText = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtStateText");
        DropDownList ddlState = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlState");
        RequiredFieldValidator ddlStateRequired1 = (RequiredFieldValidator)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlStateRequired1");
        CompareValidator ddlStateRequired2 = (CompareValidator)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ddlStateRequired2");

        if (ddlCountry.SelectedItem.Text == "USA" || ddlCountry.SelectedItem.Text == "Canada")
        {
            txtStateText.Style.Add("display", "none");
            ddlState.Style.Remove("display");
            //ddlStateRequired1.ValidationGroup = "CreateUserWizard1";
            // ddlStateRequired2.ValidationGroup = "CreateUserWizard1";
        }
        else
        {
            txtStateText.Style.Remove("display");
            ddlState.Style.Add("display", "none");
            //ddlStateRequired1.ValidationGroup = "na";
            //ddlStateRequired2.ValidationGroup = "na";
        }

    }

}