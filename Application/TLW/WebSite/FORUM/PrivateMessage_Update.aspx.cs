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

//namespace aspnetforum Commented by Netsmartz for resolving compile time issues
//Commented by Netsmartz for resolving compile time issues{
/// <summary>
/// Summary description for addprivatemsg.
/// </summary>
// public partial class addprivatemsg : ForumPage Commented by Netsmartz for resolving compile time issues
public partial class addprivatemsg : aspnetforum.ForumPage
{
    protected int toUserID;
    protected bool mailNotificationsEnabled;
    protected int iMessageGroupID;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        try
        {
            toUserID = int.Parse(Request.QueryString["ToUserID"]);
            iMessageGroupID = int.Parse(Request.QueryString["Quote"]);
            //if (CurrentUserID == 0) throw new Exception("not logged in");Commented by Netsmartz for resolving compile time issues
            if (CurrentUserID == "0") throw new Exception("not logged in");
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

        if (Request.QueryString["Quote"] != null && !IsPostBack)
        {
            this.cmd.CommandText = "SELECT ForumPersonalMessages.Body, ForumUsers.UserName, MessageGroupID FROM ForumUsers INNER JOIN ForumPersonalMessages ON ForumUsers.UserID=ForumPersonalMessages.FromUserID WHERE ForumPersonalMessages.MessageID=" + iMessageGroupID.ToString();
            this.cn.Open();
            DbDataReader dr = this.cmd.ExecuteReader();
            if (dr.Read())
            {
                string body = dr["Body"].ToString().Replace("<br>", "\r\n");
                try
                {
                    iMessageGroupID = Convert.ToInt32(dr["MessageGroupID"].ToString());
                }
                catch (Exception ex)
                {
                    iMessageGroupID = Convert.ToInt32(Request.QueryString["Quote"]);
                }
                // Response.Write(dr["MessageGroupID"].ToString());
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
        else
        {
            this.cmd.CommandText = "SELECT ForumPersonalMessages.Body, ForumUsers.UserName, MessageGroupID FROM ForumUsers INNER JOIN ForumPersonalMessages ON ForumUsers.UserID=ForumPersonalMessages.FromUserID WHERE ForumPersonalMessages.MessageID=" + iMessageGroupID.ToString();
            this.cn.Open();
            DbDataReader dr = this.cmd.ExecuteReader();
            if (dr.Read())
            {
                try
                {
                    iMessageGroupID = Convert.ToInt32(dr["MessageGroupID"].ToString());
                }
                catch (Exception ex)
                {
                    iMessageGroupID = Convert.ToInt32(Request.QueryString["Quote"]);
                }
                dr.Close();
                this.cn.Close();
            }
        }
    }

    protected void btnSave_Click(object sender, System.EventArgs e)
    {
        this.cn.Open();

        string msg = lblBody.Text + tbMsg.Text + "<br /><br />";
        msg = msg.Trim().Replace("\r\n", "<br>");
        if (msg == "") return;

        this.cmd.CommandText = "INSERT INTO ForumPersonalMessages (MessageGroupID, FromUserID, ToUserID, Body, CreationDate) " +
            "VALUES (?, ?, ?, ?, ?)";
        //Utils.DB.FillCommandParamaters(ref cmd, iMessageGroupID, CurrentUserID, toUserID, msg, Utils.GetCurrTime());Commented by Netsmartz for resolving compile time issues
        aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, iMessageGroupID, CurrentUserID, toUserID, msg, aspnetforum.Utils.GetCurrTime());/* line is added by Netsmartz */
        this.cmd.ExecuteNonQuery();
        this.cmd.Parameters.Clear();

        //sending notifications
        if (mailNotificationsEnabled)
        {
            string url = Request.Url.ToString().ToLower().Replace("addprivatemsg.aspx", "privateinbox.aspx");
            // SendNotifications.SendPersonalNotificationEmails(toUserID, url);//if (CurrentUserID == 0) throw new Exception("not logged in");
            //Above line Commented by Netsmartz for resolving compile time issues 

            aspnetforum.SendNotifications.SendPersonalNotificationEmails(toUserID.ToString(), url);/*line is added by Netsmartz*/
            if (CurrentUserID == "0") throw new Exception("not logged in");/*line is added by Netsmartz*/

        }

        this.cn.Close();

        Response.Redirect("default.aspx");
    }
}
//}Commented by Netsmartz for resolving compile time issues

