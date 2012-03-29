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
	/// Summary description for addprivatemsg.
	/// </summary>
public partial class addprivatemsg : aspnetforum.ForumPage
	{
		protected string toUserID;
		protected bool mailNotificationsEnabled;

		protected void Page_Load(object sender, System.EventArgs e)
        {
			try
			{
				toUserID = Request.QueryString["ToUserID"].ToString();
                if (CurrentUserID == "") throw new Exception("not logged in");
			}
			catch
			{
                divMain.Visible = false;
                lblError.Visible = true;
				return;
			}

            //add JS const
            string script = "<script language=\"javascript\" type=\"text/javascript\">\n" +
                "var textboxid = \"" + tbMsg.ClientID + "\";" +
                "var textboxelement = document.getElementById(textboxid);" +
                "\n</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "mykey", script);


			System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
			mailNotificationsEnabled = (bool)configurationAppSettings.GetValue("MailNotificationsEnabled", typeof(bool));
			
			//if quoting
           
			if(Request.QueryString["Quote"]!=null && !IsPostBack)
			{
				this.cmd.CommandText = "SELECT ForumPersonalMessages.Body, ForumUsers.UserName FROM ForumUsers INNER JOIN ForumPersonalMessages ON ForumUsers.UserID=ForumPersonalMessages.FromUserID WHERE ForumPersonalMessages.MessageID=" + Request.QueryString["Quote"];
				this.cn.Open();
				DbDataReader dr = this.cmd.ExecuteReader();
				if(dr.Read())
				{
					string body = dr["Body"].ToString().Replace("<br>", "\r\n");
					body = System.Text.RegularExpressions.Regex.Replace(body, @"<\S[^>]*>", "");
                    lblBody.Text = body + "[/quote]" + "[quote=" + dr["UserName"].ToString() + "]";
                    string strViewBody = body.Replace("[/quote]", "<br /><br />");
                    strViewBody = strViewBody.Replace("[quote=", "");
                    lblMessageHistory.Text = strViewBody;// + "[/quote]";
                    tbMsg.Text = "";
                }
				dr.Close();
				this.cn.Close();
            }
		}

		protected void btnSave_Click(object sender, System.EventArgs e)
		{
            string strNextMessageID = "";
            string sSubject = txtSubject.Text;

            string msg = lblBody.Text + tbMsg.Text + "<br /><br />";
			msg = msg.Trim().Replace("\r\n", "<br>");
			if(msg=="") return;

            this.cmd.CommandText = "Select (MAX(MessageID)+1)as MessageID from ForumPersonalMessages";
            this.cn.Open();
            DbDataReader dr = this.cmd.ExecuteReader();
            if (dr.Read())
            {
                strNextMessageID = dr["MessageID"].ToString();
            }

            this.cn.Close();
            this.cn.Open();
            this.cmd.CommandText = "INSERT INTO ForumPersonalMessages (FromUserID, ToUserID, Subject, Body, CreationDate, MessageGroupID) " +
                "VALUES (convert(uniqueidentifier, ?), convert(uniqueidentifier, ?), ?, ?, ?, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, CurrentUserID, toUserID, sSubject, msg, aspnetforum.Utils.GetCurrTime(), strNextMessageID);
			this.cmd.ExecuteNonQuery();
			this.cmd.Parameters.Clear();

			//sending notifications
			if(mailNotificationsEnabled)
			{
                string url = Request.Url.ToString().ToLower().Replace("addprivatemsg.aspx", "privateinbox.aspx");
                aspnetforum.SendNotifications.SendPersonalNotificationEmails(toUserID, url);
			}

            this.cn.Close();

            Response.Redirect("privateinbox.aspx");
		}
	}
