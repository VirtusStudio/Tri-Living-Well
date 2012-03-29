using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

/// <summary>
/// Summary description for register.
/// </summary>
public partial class register : aspnetforum.ForumPage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!IsPostBack)
        {
            registerTable.Visible = false;
            divTOS.Visible = true;
        }
        else
        {
            divTOS.Visible = false;
        }

        //this is for correct processing the "enter" keypress onthe form
        if (IsPostBack && registerTable.Visible)
        {
            RegisterUser();
        }
    }

    protected void Page_PreRender(object sender, System.EventArgs e)
    {
        this.Title += " - " + ForumTitle;

        // Create a random code and store it in the Session object.
        this.Session["CaptchaImageText"] = aspnetforum.Utils.GenerateRandomCode();
        tbImgCode.Text = "";
    }

    //preventing the "HttpRequestValidationException A potentially dangerous Request.Form value was detected from the client"
    protected void Page_Error(object sender, System.EventArgs e)
    {
        Exception ex = Server.GetLastError();
        if (ex is HttpRequestValidationException
            || ex is ViewStateException
            || ex.InnerException is ViewStateException)
        {
            //it's a m..f..ing BOT!!! damn spammers!!
            //let's just suppress the error msg so they don't know what's wrong

            //Response.Write("die spammer, die!!!");
            Response.End();
        }
    }

    protected void RegisterUser()
    {
        if (tbUserName.Text.Trim().Length > 0 &&
            tbPsw1.Text.Trim().Length > 0 &&
            tbPsw2.Text.Trim().Length > 0 &&
            tbEmail.Text.Trim().Length > 0 &&
            tbEmail.Text.IndexOf("@") > -1 &&
            tbEmail.Text.IndexOf(".") > -1)
        {
            if (tbPsw1.Text == tbPsw2.Text)
            {
                if (tbImgCode.Text == (string)Session["CaptchaImageText"])
                {
                    string username = tbUserName.Text.Trim();
                    this.cmd.CommandText = "select UserID from ForumUsers WHERE UserName=?";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, username);
                    this.cn.Open();
                    object res = this.cmd.ExecuteScalar();
                    if (res == null)
                    {
                        this.cmd.CommandText = "select UserID from ForumUsers WHERE Email=?";
                        aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbEmail.Text);
                        res = this.cmd.ExecuteScalar();
                        if (res == null)
                        {

                            //is email confirmation enabled?
                            bool bEmailConfirmation = (ConfigurationManager.AppSettings["EnableEmailActivation"] == "true");

                            //should we notify admins?
                            bool bNewUsersNotifyAdmin = (ConfigurationManager.AppSettings["NewUsersNotifyAdmin"] == "true");

                            //shoud user be disabled by default?
                            bool bUserDisabled = (ConfigurationManager.AppSettings["NewUsersDisabledByDefault"] == "true");

                            //generate activation code
                            string randomCode = aspnetforum.Password.CreateRandomPassword(9);
                            string strTemp = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();

                            this.cmd.Parameters.Clear();
                            this.cmd.CommandText = "INSERT INTO ForumUsers (UserID,UserName, Email, [Password], Homepage, Interests, RegistrationDate, Disabled, ActivationCode) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                            aspnetforum.Utils.DB.PrepareCommandText(ref cmd);
                            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, strTemp, username, tbEmail.Text, aspnetforum.Password.CalculateMD5Hash(tbPsw1.Text), tbHomepage.Text, tbInterests.Text, aspnetforum.Utils.GetCurrTime(), false, randomCode);
                            this.cmd.ExecuteNonQuery();
                            this.cn.Close();
                            lblError.Visible = false;
                            lblSuccess.Visible = true;
                            registerTable.Visible = false;

                            //send activation email
                            if (bEmailConfirmation)
                            {
                                string url = Request.Url.ToString().ToLower().Replace("register.aspx", "activate.aspx") + "?user=" + Server.UrlEncode(username) + "&code=" + randomCode;
                                aspnetforum.SendNotifications.SendActivationEmail(tbEmail.Text, url);
                            }

                            //send notification to admins
                            if (bNewUsersNotifyAdmin)
                            {
                                //get the new user's ID
                                cmd.Parameters.Clear();
                                cmd.CommandText = "SELECT UserID FROM ForumUsers WHERE UserName=?";
                                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, username);
                                cn.Open();
                                object uid = cmd.ExecuteScalar();
                                if (uid != null)
                                {
                                    string url = Request.Url.ToString().ToLower().Replace("register.aspx", "viewprofile.aspx") + "?UserID=" + uid.ToString();
                                    aspnetforum.SendNotifications.SendNewUserRegAdminNotification(url);
                                }
                                cn.Close();
                            }

                            return;
                        }
                        else
                        {
                            this.cn.Close();
                            lblError.Visible = true;
                            lblError.Text = string.Format("Email {0} allready exists, please select another one or use the password recovery form.", tbEmail.Text);
                        }
                    }
                    else
                    {
                        this.cn.Close();
                        lblError.Visible = true;
                        lblError.Text = string.Format("Username {0} allready exists, please select another one.", username);
                    }
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Wrong code entered";
                }
            }
            else
            {
                lblError.Visible = true;
                lblError.Text = "Passwords do not match";
            }
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = "Please, fill all the fields correctly";
        }
    }

    protected void btnAgree_Click(object sender, EventArgs e)
    {
        registerTable.Visible = true;
    }

    protected void btnDisagree_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }
}