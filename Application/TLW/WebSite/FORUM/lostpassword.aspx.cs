using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.Common;


	/// <summary>
	/// Summary description for lostpassword.
	/// </summary>
    public partial class lostpassword : aspnetforum.ForumPage
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

        //preventing the "HttpRequestValidationException A potentially dangerous Request.Form value was detected from the client"
        protected void Page_Error(object sender, System.EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex is HttpRequestValidationException)
            {
                Response.Write("no spam please");
                Response.End();
            }
        }

		protected void btnRequest_Click(object sender, System.EventArgs e)
		{
			if(txEmail.Text.Trim()!="")
			{
				this.cn.Open();
                this.cmd.Parameters.Clear();
                this.cmd.CommandText = "SELECT UserName FROM ForumUsers WHERE Email=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, txEmail.Text.Trim());
                object res = cmd.ExecuteScalar();
                if (res == null) return; //no user found

                string newPsw = aspnetforum.Password.CreateRandomPassword(7);
                string newPswHash = aspnetforum.Password.CalculateMD5Hash(newPsw);

                this.cmd.Parameters.Clear();
                this.cmd.CommandText = "UPDATE ForumUsers SET [Password]=? WHERE Email=?";
                aspnetforum.Utils.DB.PrepareCommandText(ref cmd);
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, newPswHash, txEmail.Text.Trim());
                cmd.ExecuteNonQuery();
                this.cn.Close();

                SendPsw(txEmail.Text.Trim(), res.ToString(), newPsw);

				Response.Redirect("default.aspx");
			}
		}

		private void SendPsw(string email, string username, string psw)
		{
			System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
			string forum = (string)configurationAppSettings.GetValue("ForumTitle", typeof(string));

			string[] recipients = new string[1];
			recipients[0] = email;

            string url = Request.Url.ToString().ToLower().Replace("lostpassword.aspx", "");
			string body = string.Format(
				"You or someone else asked for a {0} forum password recovery.\r\n\r\n" + 
				"Username: {1}\r\nYour NEW Password: {2}\r\n\r\n{3}",
				forum, username, psw, url);

            aspnetforum.AsyncSendMail mailer = new aspnetforum.AsyncSendMail(
                recipients,
				forum + " forum lost password recovery",
				body);
			mailer.AsyncSend();
		}
	}