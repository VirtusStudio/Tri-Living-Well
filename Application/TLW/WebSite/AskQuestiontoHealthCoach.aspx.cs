using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using System.Web.Security;
using System.Data;
using System.IO;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class AskQuestiontoHealthCoach : System.Web.UI.Page
{
    aspnetforum forum = new aspnetforum();
    bool _addTopic = true;
    //int _forumID = 0;
    bool _premoderated = false;
    int _topicID = 0;
    protected DbCommand cmd;
    protected DbConnection cn;
    protected DbProviderFactory providerFactory;
    private bool? _isAdministrator = null;
    bool _changeTopic;
    bool _isEditing;
    int _messageId;
    string _messageAuthorID;

    bool _mailNotificationsEnabled;
    bool _allowGuestPosts;
    bool _allowFileUploads;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            if (Request.QueryString["cid"] != null)
            {
                ddlCategory.SelectedValue = Request.QueryString["cid"].ToString();
            }

        }

    }
    protected void lnkBtnSumit_Click(object sender, EventArgs e)
    {
        SendContactUsEmail();
    }
    private void SendContactUsEmail()
    {
        string strContent = string.Empty;

        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();

        strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("HealthCoachSubmitQuestionEmail").TextAreaHTML;

        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.StrCategoryLevel = ddlLevel.SelectedItem.Text;
        oCompanyInfo.StrUserName = AppLib.GetLoggedInUserName();
        oCompanyInfo.StrCategoryName = ddlCategory.SelectedItem.Text;
        oCompanyInfo.StrQuestion = txtQuestion.Text.Trim();
        oCompanyInfo.StrSubject = txtsubject.Text.Trim();
        oCompanyInfo.StrComments = txtComments.Text.Trim();
        oCompanyInfo.StrQuestionType = rdoQuestionType.SelectedItem.Text;
        oCompanyInfo.StrAnswer = string.Empty;
        oCompanyInfo.DtCreatedOn = DateTime.Now;
        oCompanyInfo.ChrIsAnsweredGiven = 'N';
        oCompanyInfo.ChrIsDeleted = 'N';

        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        oCompanyManager.SaveQuestionToHealthCoachFromUser(oCompanyInfo);



        lblMsg.Text = "Your question has been successfully sent to health coach. Health Coach will approach you soon";
        // strContent = strContent.Replace("[Name]", oCompanyManager.GetUserDetailsByUsername(AppLib.GetLoggedInUserName()).StrUserFullName);
        strContent = strContent.Replace("[Email]", AppLib.GetLoggedInUserName());
        strContent = strContent.Replace("[Category]", ddlCategory.SelectedItem.Text + " - " + ddlLevel.SelectedItem.Text);
        strContent = strContent.Replace("[Question]", txtQuestion.Text.Trim());

        strContent = strContent.Replace("[Subject]", txtsubject.Text);
        strContent = strContent.Replace("[Comments]", txtComments.Text);
        strContent = strContent.Replace("[QuestionType]", rdoQuestionType.SelectedItem.Text);

        strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
        strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
        strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());

        ///Code added for Forum parts
        ///
        if (rdoQuestionType.SelectedValue == "Public")
        {

            string msg = txtQuestion.Text;
            msg = msg.Trim();
            msg = msg.Replace("<", "&lt;").Replace(">", "&gt;");
            msg = aspnetforum.Utils.Formatting.FilterBadWords(msg);

            bool isModer = false;

            if (msg == "") return;

            string catgory = ddlCategory.SelectedItem.Text;
            string lvl = ddlLevel.SelectedValue;
            string totalvalue = catgory + " - " + lvl;
            providerFactory = aspnetforum.Utils.DB.CreateDBProviderFactory();
            cn = aspnetforum.Utils.DB.CreateConnection();
            cmd = providerFactory.CreateCommand();
            cmd.Connection = cn;
            this.cn.Open();
            this.cmd.CommandText = "SELECT ForumID FROM Forums WHERE Title='" + totalvalue + "'";

            object _forumID = this.cmd.ExecuteScalar();

            if (_addTopic || _changeTopic) //creating a new topic or editing topic title
            {
                string subj = txtsubject.Text;
                subj = subj.Trim();
                if (subj == "") return;
                subj = aspnetforum.Utils.Formatting.FilterBadWords(subj);

                if (_addTopic)
                {
                    string CurrentUserID = Membership.GetUser().ProviderUserKey.ToString();
                    this.cmd.Parameters.Clear();
                    this.cmd.CommandText = "INSERT INTO ForumTopics (ForumID, UserID, Subject, Visible) " +
                        "VALUES (?, convert(uniqueidentifier, ?), ?, ?)";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _forumID, CurrentUserID, subj, !_premoderated);
                    this.cmd.ExecuteNonQuery();
                    this.cmd.Parameters.Clear();

                    this.cmd.CommandText = "SELECT MAX(TopicID) FROM ForumTopics WHERE Subject=?";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, subj);
                    _topicID = Convert.ToInt32(this.cmd.ExecuteScalar());
                    this.cmd.Parameters.Clear();

                    //CREATE A POLL (if specified)
                    string pollQuestion = "";//tbPollQuestion.Text.Trim();
                    if (pollQuestion.Length > 0)
                    {
                        //add a poll
                        this.cmd.Parameters.Clear();
                        this.cmd.CommandText = "INSERT INTO ForumPolls (TopicID, Question) " +
                            "VALUES (?, ?)";
                        aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _topicID, pollQuestion);
                        this.cmd.ExecuteNonQuery();
                        this.cmd.Parameters.Clear();

                        //now get the ID of the poll we just created
                        this.cmd.CommandText = "SELECT MAX(PollID) FROM ForumPolls WHERE TopicID=?";
                        aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _topicID);
                        int pollID = Convert.ToInt32(this.cmd.ExecuteScalar());
                        this.cmd.Parameters.Clear();

                        int i = 0;
                        while (Request.Form["PollOption" + i] != null && Request.Form["PollOption" + i].Trim().Length > 0)
                        {
                            //add option
                            this.cmd.CommandText = "INSERT INTO ForumPollOptions (PollID, OptionText) " +
                            "VALUES (?, ?)";
                            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, pollID, Request.Form["PollOption" + i]);
                            this.cmd.ExecuteNonQuery();
                            this.cmd.Parameters.Clear();
                            i++;
                        }
                    }
                }
                else if (_changeTopic) //edit topic subj
                {
                    this.cmd.Parameters.Clear();
                    this.cmd.CommandText = "UPDATE ForumTopics SET Subject = ? WHERE TopicID = ?";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, subj, _topicID);
                    this.cmd.ExecuteNonQuery();
                    this.cmd.Parameters.Clear();
                }
            }

            // Inserting or updating?
            if (_isEditing)
            {
                //if moderatro, admin or message author
                //if (bmoderator || _messageAuthorID == CurrentUserID)
                //{
                //    // Record last editor and date at the end of the message.
                //    msg += "\r\n<em>edited by " + Session["aspnetforumUserName"] +
                //            " on " + aspnetforum.Utils.GetCurrTime().ToShortDateString() + "</em>";

                //    this.cmd.CommandText = "UPDATE ForumMessages SET Body=?, Visible=? " +
                //        "WHERE MessageID=" + _messageId;
                //    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, msg, !_premoderated);
                //    this.cmd.ExecuteNonQuery();
                //    this.cmd.Parameters.Clear();

                //    SaveAttachments(_messageId);
                //}
            }
            else //inserting
            {
                this.cmd.CommandText = "INSERT INTO ForumMessages (TopicID, UserID, Body, CreationDate, Visible) " +
                    "VALUES (?, convert(uniqueidentifier, ?), ?, ?, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _topicID, CurrentUserID, msg, aspnetforum.Utils.GetCurrTime(), !_premoderated);
                this.cmd.ExecuteNonQuery();
                this.cmd.Parameters.Clear();

                //incrementing repliescount (well... actually - re-calculating it)
                this.cmd.CommandText = "SELECT Count(MessageID) FROM ForumMessages WHERE TopicID=" + _topicID;
                object res = this.cmd.ExecuteScalar();
                this.cmd.CommandText = "UPDATE ForumTopics SET RepliesCount=" + res.ToString() + " WHERE TopicID=" + _topicID;
                this.cmd.ExecuteNonQuery();

                //incrementing PostsCount in Users table only for new messages, not edits.
                //only for registered users (if guestmode is on)
                if (CurrentUserID != "")
                {
                    this.cmd.CommandText = "UPDATE ForumUsers SET PostsCount=PostsCount+1 WHERE UserID='" + CurrentUserID + "'";
                    this.cmd.ExecuteNonQuery();
                }

                //get last message's ID
                this.cmd.CommandText = "SELECT MAX(MessageID) FROM ForumMessages WHERE TopicID=" + _topicID + " AND UserID='" + CurrentUserID + "'";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);
                res = this.cmd.ExecuteScalar();
                int lastmsgid = (res == null || res == DBNull.Value) ? 0 : Convert.ToInt32(res);

                //updating LastMessageID in Topics table
                this.cmd.CommandText = "UPDATE ForumTopics SET LastMessageID=" + lastmsgid + " WHERE TopicID=" + _topicID;
                this.cmd.ExecuteNonQuery();

                SaveAttachments(lastmsgid);
            }

            //saving notifications settings
            if (_mailNotificationsEnabled)
            {
                this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE UserID='" + CurrentUserID + "' AND TopicID=" + _topicID;
                this.cmd.ExecuteNonQuery();
                //if(this.cbSubscribe.Checked)
                //{
                this.cmd.CommandText = "INSERT INTO ForumSubscriptions (UserID, TopicID) VALUES ('" + CurrentUserID + "', " + _topicID + ")";
                this.cmd.ExecuteNonQuery();
                //}
            }

            //sending notifications
            if (_mailNotificationsEnabled)
            {
                string url = Request.Url.ToString().ToLower();
                url = url.Substring(0, url.IndexOf("addpost.aspx"));

                if (_addTopic)
                {
                    if (_forumID != null)
                    {
                        aspnetforum.SendNotifications.SendNewTopicNotificationEmails(Convert.ToInt32(_forumID), CurrentUserID, url);
                    }

                }
                else
                {
                    aspnetforum.SendNotifications.SendNewMsgNotificationEmails(_topicID, CurrentUserID, url);
                }
            }
        }
        try
        {
            AppLib.SendMailToUser(AppLib.GetLoggedInUserName(), txtsubject.Text, strContent, AppConfig.GetAdminEmail());

            AppLib.SendMailToUser(AppConfig.GetAdminEmail(), txtsubject.Text, "Dear Admin, Following are the contents that were sent to the user. <br />" + strContent, AppLib.GetLoggedInUserName());
        }
        catch { }

        oTemplateLib = null;
        oCompanyManager = null;
        oCompanyInfo = null;

        txtQuestion.Text = string.Empty;
        txtsubject.Text = string.Empty;
        txtComments.Text = string.Empty; ;
        rdoQuestionType.SelectedIndex = 0;

        //lblMsg.Text = "Thanks for contact us. Your details has been successfully sent to TLW.";
        //txtName.Text = string.Empty;
        //txtBphone.Text = string.Empty;
        //txtComments.Text = string.Empty;
        //txtEmail.Text = string.Empty;
        //txtsubject.Text = string.Empty;
    }
    /*Following functions is added by Netsmartz*/
    protected override void OnInit(EventArgs e)
    {
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }
    protected string CurrentUserID
    {
        //get
        //{ 
        // return Session["aspnetforumUserID"] == null ? "" : (Session["aspnetforumUserID"]).ToString();
        //}
        //

        get
        {
            return Membership.GetUser().ProviderUserKey.ToString();
        }
    }
    public bool IsAdministrator
    {
        get
        {
            if (!_isAdministrator.HasValue)
            {
                if (CurrentUserID == "") _isAdministrator = false;
                else
                {
                    bool openConn = (this.cn.State == ConnectionState.Open);
                    if (!openConn) this.cn.Open();
                    this.cmd.CommandText = "SELECT UserID FROM ForumAdministrators WHERE UserID='" + CurrentUserID + "'";
                    _isAdministrator = (this.cmd.ExecuteScalar() != null);
                    if (!openConn) this.cn.Close();
                }
            }
            return _isAdministrator.Value;
        }
    }
    private void SaveAttachments(int msgid)
    {
        //this.cn.Open(); - NO! connection should be opened already!!!

        if (Request.Files.Count < 1)
            return;

        //create a folder, named "1234" where "1234" is the user's id
        string uploadDir = Page.MapPath("upload") + "\\" + CurrentUserID.ToString();

        //loop through the posted files
        for (int i = 0; i < Request.Files.Count; i++)
        {
            //empty filename check
            if (Request.Files[i].FileName.Trim() == "") continue;

            //max size check
            //if (Request.Files[i].ContentLength > maxFileSize) continue;

            string shortname = Path.GetFileName(Request.Files[i].FileName);
            if (!Directory.Exists(uploadDir)) Directory.CreateDirectory(uploadDir);

            //rename if file already exists
            int j = 0;
            while (File.Exists(uploadDir + "\\" + shortname))
            {
                j = j + 1;
                int dotPos = shortname.LastIndexOf(".");
                string namewithoutext = shortname.Substring(0, dotPos);
                string ext = shortname.Substring(dotPos + 1);
                shortname = namewithoutext + "[" + j + "]." + ext;
            }

            //save file to disk
            Request.Files[i].SaveAs(uploadDir + "\\" + shortname);

            //write to db
            cmd.CommandText = "INSERT INTO ForumUploadedFiles (FileName, MessageID, UserID) VALUES (?, ?, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, shortname, msgid, CurrentUserID);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
        }
    }
}