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
using aspNetEmail;

public partial class UC_USER_EditAccount : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;
    AccountClass objAccountClass;

    string gsUserID;
    bool gbUserMode = false;

    public bool USER_MODE
    {
        get { return gbUserMode; }
        set { gbUserMode = value; }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        objAccountClass = new AccountClass(objSqlConnClass.sqlConnection);

        if (!IsPostBack)
        {
            fillOutForm();

            {
                rbAccessFalse.Enabled = false;
                rbAccessTrue.Enabled = false;

                rbRoleAdministrator.Enabled = false;
                rbRoleUser.Enabled = false;

                rbRoleAdministrator.Checked = false;
                rbRoleUser.Checked = false;

                if (gbUserMode)     // no userName, get it now
                {
                    //hide things
                    spRole.Style.Add("display", "none");
                    spAccess.Style.Add("display", "none");
                }
                else
                {
                    spAccess.Style.Add("display", "none");
                }
            }
        }
        else
        {
            gsUserID = ViewState["gsUserID"].ToString();
        }
        if (!gbUserMode)
        {
            lblChangePassword.Text = "<a>Reset to a temp password</a>";//<a> is kept in for css reasons
        }
        lblError.Text = "";

    }

    public void populate(string sUserID)
    {
        gsUserID = sUserID;
        showOriginalProfile();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showOriginalProfile();
        }

        ViewState["gsUserID"] = gsUserID;

        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {        //////////////////////////////////////////////////////////
        //Taking the List of Items in DataSets from the Database
        //////////////////////////////////////////////////////////
        DataSet StateDS = objBackOfficeClass.GET_Items_AnyItemTable("State", "LIST_STATECOUNTRY");
        DataSet CountryDS = objBackOfficeClass.GET_Items_AnyItemTable("Country", "LIST_STATECOUNTRY");

        ///////////////////////////////////////////////////////////////////////////////////////
        //Assigning the DropDownList objects by finding the controls from the createuserwizard
        ////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////
        //Binding the DropDownLists
        ////////////////////////////
        BindDropDownList(ddlState, StateDS);
        BindDropDownList(ddlCountry, CountryDS);

        ddlDegree = objSqlConnClass.fillDropDown(ddlDegree, "Degree", "List_Items");
        ddlYourRole = objSqlConnClass.fillDropDown(ddlYourRole, "Your Role", "List_Items");
        ddlAccountFromRelationship = objSqlConnClass.fillDropDown(ddlAccountFromRelationship, "Account From Relationship", "List_Items");
        ddlGender = objSqlConnClass.fillDropDown(ddlGender, "Gender", "List_Items");
        ddlFamilyStatus = objSqlConnClass.fillDropDown(ddlFamilyStatus, "Family Status", "List_Items");
    }

    public void showOriginalProfile()
    {
        string sUsername = Membership.GetUser(new Guid(gsUserID)).UserName;
        lblPerson.Text = sUsername;
        // lblUserLabel.Visible = true;

        try
        {
            //lblAccountName.Text = objAccountClass.Act_GET_Accounts_BY_UserId(gsUserID).Tables[0].Rows[0]["ACCOUNT_NAME"].ToString();
            //above line is commented by Netsmartz

            DataSet ds = objAccountClass.Act_GET_Accounts_BY_UserId(gsUserID);
            if (ds.Tables.Count > 0 && ds != null && ds.Tables[0].Rows.Count > 0)
                lblAccountName.Text = ds.Tables[0].Rows[0]["ACCOUNT_NAME"].ToString();
        }
        catch (Exception ex)
        {//the user doesn't have an account associated
            //Response.Redirect("/login/logout.aspx");/*Commented by Netsmartz*/
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "login/logout.aspx");
        }

        try
        {
            if (Membership.GetUser() != null)
            {
                if (Roles.IsUserInRole("Administrator"))
                {
                    rbAccessFalse.Enabled = false;
                    rbAccessTrue.Enabled = false;

                    rbRoleAdministrator.Enabled = true;
                    rbRoleUser.Enabled = true;
                }
            }
        }
        catch (Exception ex)
        {
        }


        // Response.Write("   sUsername: " + sUsername);
        //DataSet DS = new DataSet();// = objBackOfficeClass.Mem_GET_UserInfo(sUsername);
        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(sUsername);
        if (DS != null)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {

                string sRoleName = DS.Tables[0].Rows[0]["ROLENAME"].ToString();
                rbRoleAdministrator.Checked = false;
                rbRoleUser.Checked = false;

               /* if (sRoleName == "Administrator")
                {
                    rbRoleAdministrator.Checked = true;
                }
                if (sRoleName == "User") rbRoleUser.Checked = true;*/

                lblUserRole.Text = sRoleName;

                UserName.Text = DS.Tables[0].Rows[0]["USERNAME"].ToString();
                //lblUserLabel.Text = DS.Tables[0].Rows[0]["USERNAME"].ToString();
                string sRegistrationFlg = DS.Tables[0].Rows[0]["REGISTRATION_FLG"].ToString();
                //hold on to if they are editing=1 or registering=0
                txtRegistrationFlg.Text = sRegistrationFlg;
                if (sRegistrationFlg == "0")//not fully registered
                {//force them to choose a password.
                    requiredPassword.Visible = true;
                    spanPassword.Style.Add("display", "none");
                    divPassword.Style.Remove("display");

                    if (DS.Tables[0].Rows[0]["ACCOUNT_FROM"].ToString() != gsUserID)//they are NOT main account holder
                    {
                        lblPerson.Visible = false;
                        //lblUserLabel.Visible = false;

                        UserName.Text = "";//we gave them a temp username they shouldn't see
                        trOriginalEmail.Visible = false;
                    }
                }
                else//they are registered
                {//password no longer required
                    requiredPassword.Visible = false;
                }




                //Don't set the password. (Won't accept because txtPassword is TextMode="Password")
                //Response.Write(DS.Tables[0].Rows[0]["PASSWORD"].ToString());
                //txtPassword.Text = DS.Tables[0].Rows[0]["PASSWORD"].ToString();
                if (DS.Tables[0].Rows[0]["IsLockedOut"].ToString() != "False")
                {
                    rbAccessTrue.Checked = false;
                    rbAccessFalse.Checked = true;
                }
                else
                {
                    rbAccessFalse.Checked = false;
                    rbAccessTrue.Checked = true;
                }



                txtFname.Text = DS.Tables[0].Rows[0]["FNAME"].ToString();
                txtMname.Text = DS.Tables[0].Rows[0]["MNAME"].ToString();
                txtLname.Text = DS.Tables[0].Rows[0]["LNAME"].ToString();
                txtHeight.Text = DS.Tables[0].Rows[0]["HEIGHT"].ToString();

                ddlCountry.SelectedValue = DS.Tables[0].Rows[0]["COUNTRY_ID"].ToString();
                fillState();//must be called after we fill country, but before state
                ddlState.SelectedValue = DS.Tables[0].Rows[0]["STATE_ID"].ToString();
                txtStateText.Text = DS.Tables[0].Rows[0]["STATE_TEXT"].ToString();


                txtAddress1.Text = DS.Tables[0].Rows[0]["ADDRESS1"].ToString();
                txtAddress2.Text = DS.Tables[0].Rows[0]["ADDRESS2"].ToString();
                txtCity.Text = DS.Tables[0].Rows[0]["CITY"].ToString();

                txtZip.Text = DS.Tables[0].Rows[0]["ZIP"].ToString();

                txtPhone.Text = DS.Tables[0].Rows[0]["PHONE"].ToString();
                //txtPhoneEves.Text = DS.Tables[0].Rows[0]["PHONE_EVENING"].ToString();
                //txtPhoneCell.Text = DS.Tables[0].Rows[0]["PHONE_CELL"].ToString();
                txtFax.Text = DS.Tables[0].Rows[0]["FAX"].ToString();
                //txtCompany.Text = DS.Tables[0].Rows[0]["COMPANY"].ToString();
                //txtDivision.Text = DS.Tables[0].Rows[0]["DIVISION"].ToString();
                txtAffiliation.Text = DS.Tables[0].Rows[0]["AFFILIATION"].ToString();
                txtSpecialty.Text = DS.Tables[0].Rows[0]["SPECIALTY"].ToString();
                ddlDegree.SelectedValue = DS.Tables[0].Rows[0]["DEGREE_ID"].ToString();
                ddlYourRole.SelectedValue = DS.Tables[0].Rows[0]["YOUR_ROLE_ID"].ToString();

                txtOrganization.Text = DS.Tables[0].Rows[0]["ORGANIZATION"].ToString();

                txtHeight.Text = DS.Tables[0].Rows[0]["HEIGHT"].ToString();
                ddlGender.SelectedValue = DS.Tables[0].Rows[0]["GENDER_ID"].ToString();
                ddlFamilyStatus.SelectedValue = DS.Tables[0].Rows[0]["FAMILY_STATUS_ID"].ToString();
                ddlAccountFromRelationship.SelectedValue = DS.Tables[0].Rows[0]["ACCOUNT_FROM_RELATIONSHIP_ID"].ToString();
                rdpDateBirth.SelectedDate = Convert.ToDateTime(DS.Tables[0].Rows[0]["DATE_BIRTH"]);


                if (DS.Tables[0].Rows[0]["EMAIL_LIST_FLG"].ToString() == "1")
                {
                    rbtnNEmail.Checked = false;
                    rbtnYEmail.Checked = true;
                }
                else
                {
                    rbtnYEmail.Checked = false;
                    rbtnNEmail.Checked = true;
                }
            }
        }
    }


    private void BindDropDownList(DropDownList DDL, DataSet DS)
    {
        try
        {
            DDL.DataSource = DS;
            DDL.DataValueField = "ITEM_ID";
            DDL.DataTextField = "ITEM_TEXT";
            DDL.DataBind();
        }
        catch (Exception ex)
        {
            //ErrorMessage.Text = ex.Message;
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        txtError.Text = "in btnSubmit_Click";
        try
        {
            string[] parameters = new string[35];
            parameters[0] = UserName.Text;
            parameters[1] = txtFname.Text;
            parameters[2] = txtMname.Text;
            parameters[3] = txtLname.Text;
            parameters[4] = txtAddress1.Text;
            parameters[5] = txtAddress2.Text;
            parameters[6] = txtCity.Text;
            parameters[7] = ddlState.SelectedValue;
            parameters[8] = txtZip.Text;
            parameters[9] = ddlCountry.SelectedValue;
            parameters[10] = txtPhone.Text;
            parameters[11] = txtFax.Text;

            //degreeid
            parameters[12] = ddlDegree.SelectedValue;
            parameters[13] = txtSpecialty.Text;
            parameters[14] = txtAffiliation.Text;

            if (rbtnYEmail.Checked == true)
            {
                parameters[15] = "1";
            }
            else
            {
                parameters[15] = "0";
            }

            parameters[16] = ddlYourRole.SelectedValue;

            string sAccess = "";
            if (!gbUserMode)
            {
                if (rbAccessTrue.Checked)
                {
                    sAccess = "0";
                }
                else
                {
                    sAccess = "1";
                }
            }
            parameters[17] = txtStateText.Text.Trim();

            parameters[18] = txtHeight.Text;//HEIGHT

            parameters[19] = "1";//REGISTRATION_FLG

            parameters[20] = ddlAccountFromRelationship.SelectedValue;//ACCOUNT_FROM_RELATIONSHIP_ID

            parameters[21] = ddlGender.SelectedValue;//GENDER_ID
            parameters[22] = ddlFamilyStatus.SelectedValue;//FAMILY_STAUS_ID
            parameters[23] = Convert.ToDateTime(rdpDateBirth.SelectedDate).ToString("MM/dd/yyyy");//DATE_BIRTH //need Convert.ToDateTime


            /*
            //This is used if you wanted a user with USER_INFO but no Membership
            if (Membership.GetUser(new Guid(gsUserID)) == null)//they aren't in the Memberhsip object
            {
                string sNewUsername = UserName.Text;
                if (Membership.GetUser(sNewUsername) == null)//no other user has the email
                {//Link their existing USER_INFO to a new Membership account
                    MembershipCreateStatus bNeededForOutput = new MembershipCreateStatus();
                    Membership.CreateUser(sNewUsername, "tempPassword", sNewUsername, null, null, true, new Guid(gsUserID), out bNeededForOutput);
                }
                else
                {
                    lblError.Text = "*This Username/Email Address Already Exists";
                    return;
                }
            }
             */

            ///////////////////////////////////////////////////////////////
            //Calling the function for saving the information for the user
            ////////////////////////////////////////////////////////////////
            int rcode = objBackOfficeClass.Mem_UPDATE_UserInfo(gsUserID, txtPassword.Text, sAccess, parameters);

            if (rcode > 0)//success
            {
                txtError.Text = "1";

                txtSuccess.Value = "1";
                string sUsername = Membership.GetUser(new Guid(gsUserID)).UserName;

                //---------------------VISITLOG---------------------
                //UC_Visitlog_Visitlog1.addEntry(6, 0, 0, 0, sUsername, "", "");

                if (!gbUserMode)
                { // don't do any of this if enter in user mode
                    //remove the user from ALL roles
                   // Roles.RemoveUserFromRoles(sUsername, Roles.GetRolesForUser(sUsername));

                    if (txtPassword.Text.Trim() != "")
                    {
                        //Roles.AddUserToRole(sUsername, "Password");
                    }
                    else
                    {
                        if (rbRoleAdministrator.Checked) Roles.AddUserToRole(sUsername, "Administrator");
                        else
                        {
                           // Roles.AddUserToRole(sUsername, "User");
                        }
                    }

                    //Response.Redirect("/BackOffice/UserUtilities/UserUtilities.aspx");
                }
                else//in user mode
                {
                    MembershipUser MU = Membership.GetUser(sUsername);
                    MU.IsApproved = true;
                    MU.UnlockUser();
                    Membership.UpdateUser(MU);

                    //log them in
                    if (Membership.GetUser() == null)
                    {
                        FormsAuthentication.RedirectFromLoginPage(parameters[0], false);
                        /*
                        if (Roles.IsUserInRole("Administrator"))
                        {
                            Response.Redirect("/BackOffice/UserUtilities/UserUtilities.aspx");

                        }
                        else*/
                        {
                            //Response.Redirect("/main/content/home.aspx");
                        }
                    }
                    else
                    {
                        if (txtRegistrationFlg.Text == "0")//originally not registered
                        {
                            //Response.Redirect("ActivateAccount_Receipt.aspx");
                        }
                        else//take them home
                        {
                            //Response.Redirect("/Main/Content/Home.aspx");
                        }
                    }
                }
            }
            else//the update failed
            {
                if (rcode == 2)//email already taken
                    lblError.Text = "*This Username/Email Address Already Exists";
                else if (rcode == -1)//all other problems updatin gthe DB
                    lblError.Text = "*There Was a Problem While Attempting to Update Your Information";
            }

            lblError.Text = "Record updated successfully.";

        }
        catch (Exception ex)
        {

            txtError.Text = "Catch";
            //Response.Write(ex.Message.ToString());
        }
    }

    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        fillState();
    }

    private void fillState()
    {
        if (ddlCountry.SelectedItem.Text == "USA" || ddlCountry.SelectedItem.Text == "Canada")
        {
            txtStateText.Style.Add("display", "none");
            ddlState.Style.Remove("display");
            ddlState.SelectedIndex = 0;
        }
        else
        {
            txtStateText.Style.Remove("display");
            ddlState.Style.Add("display", "none");
            ddlState.SelectedIndex = 1;
        }
    }



    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        base.OnInit(e);

    }
}
