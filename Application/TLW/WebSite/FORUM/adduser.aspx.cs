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


    public partial class adduser : aspnetforum.AdminForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            string username = Membership.GetUser().ProviderUserKey.ToString();   //txUserName.Text.Trim();
            this.cmd.CommandText = "select * from ForumUsers WHERE UserName=?";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, username);
            this.cn.Open();
            object res = this.cmd.ExecuteScalar();
            if (res == null)
            {
                this.cmd.Parameters.Clear();
                this.cmd.CommandText = "INSERT INTO ForumUsers (UserName, Email, [Password], Homepage, Interests, RegistrationDate, Disabled, ActivationCode) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                aspnetforum.Utils.DB.PrepareCommandText(ref cmd);
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, username, txEmail.Text, txPsw.Text, txHomepage.Text, "", aspnetforum.Utils.GetCurrTime(), false, "");
                this.cmd.ExecuteNonQuery();
                this.cn.Close();
                lblError.Visible = false;
                lblSuccess.Visible = true;

                return;
            }
            else
            {
                this.cn.Close();
                lblError.Visible = true;
            }
        }
    }
