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
using System.Configuration;
using System.IO;


	/// <summary>
	/// Summary description for addpost.
	/// </summary>
	public partial class addpost : aspnetforum.ForumPage
	{
		//private delegate void SendMailDelegate(int topicID, int userID, string url);

		int _topicID = 0;
		int _forumID = 0;
		bool _addTopic;
        bool _changeTopic;
		bool _isEditing;
		int _messageId;
        string _messageAuthorID;
		bool _premoderated;
		bool _mailNotificationsEnabled;
		bool _allowGuestPosts;
        bool _allowFileUploads;
        int maxFileSize = int.Parse(ConfigurationManager.AppSettings["MaxUploadFileSizeInBytes"]);

        protected void Page_PreRender(object sender, System.EventArgs e)
        {
            if (CurrentUserID == "" && _allowGuestPosts)
            {
                // Create a random code and store it in the Session object.
                this.Session["CaptchaImageText"] = aspnetforum.Utils.GenerateRandomCode();
                tbImgCode.Text = "";
                divCaptcha.Visible = true;
            }
            else
                divCaptcha.Visible = false;
        }

		protected void Page_Load(object sender, System.EventArgs e)
		{
			//firefox html3.2 rendering fix
			tbSubj.Style.Add("width", "100%");
			tbMsg.Style.Add("width", "100%");

            _allowFileUploads = (ConfigurationManager.AppSettings["EnableFileUploads"].ToLower() == "true");
            divFiles.Visible = _allowFileUploads && (CurrentUserID!="");

            //add JS const
            string script = "<script type=\"text/javascript\">\n" +
                "var textboxid = \"" + tbMsg.ClientID + "\";" +
                "var textboxelement = document.getElementById(textboxid);" +
                "\n</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "mykey", script);

            _allowGuestPosts = (ConfigurationManager.AppSettings["AllowGuestPosts"].ToLower() == "true");

            if (Request.QueryString["TopicID"] != null)
                _topicID = int.Parse(Request.QueryString["TopicID"]);

            if (Request.QueryString["ForumID"] != null)
                _forumID = int.Parse(Request.QueryString["ForumID"]);

            if (_forumID == 0 && _topicID == 0)
                throw new Exception("Either Topic or Forum must be specified");

            //if we have an unauthorized user
            if (CurrentUserID == "" && !_allowGuestPosts)
            {
                Response.Write("Sorry, posting and editing is allowed only for authenticated users");
                Response.End();
            }

            _mailNotificationsEnabled = (ConfigurationManager.AppSettings["MailNotificationsEnabled"].ToLower() == "true");
            this.cbSubscribe.Visible = _mailNotificationsEnabled && (CurrentUserID != "");

			// Figure out if we're editing or quoting a message, and extract the ID.
			_messageId = 0;
			if (Request.QueryString["Edit"]!=null)
			{
				_messageId = int.Parse(Request.QueryString["Edit"]);
				_isEditing = true;
				btnSave.Text = "update message";

                //check if it's the first msg in a topic - to see if we should allow changing the topic text
                this.cmd.CommandText = "SELECT MIN(MessageID) FROM ForumMessages WHERE TopicID=" + _topicID;
                this.cn.Open();
                object res = this.cmd.ExecuteScalar();
                this.cn.Close();
                _changeTopic = (Convert.ToInt32(res) == _messageId);
			}

			if (Request.QueryString["Quote"]!=null)
			{
				_messageId = int.Parse(Request.QueryString["Quote"]);
				_isEditing = false;
			}

            if (_forumID == 0) //we're NOT adding a new topic to a forum, we're adding msg to an existing
            {
                _addTopic = false;
                bool isTopicClosed = false;
                this.cmd.CommandText = "SELECT Forums.ForumID, Forums.Title, Forums.Premoderated, ForumTopics.IsClosed, ForumTopics.Subject FROM Forums INNER JOIN ForumTopics ON Forums.ForumID=ForumTopics.ForumID WHERE ForumTopics.TopicID=" + _topicID;
                this.cn.Open();
                DbDataReader dr = this.cmd.ExecuteReader();
                if (dr.Read())
                {
                    _forumID = Convert.ToInt32(dr["ForumID"]);
                    _premoderated = Convert.ToBoolean(dr["Premoderated"]);
                    isTopicClosed = Convert.ToBoolean(dr["IsClosed"]);
                    if (_changeTopic && !IsPostBack)
                        tbSubj.Text = dr["Subject"].ToString();
                }
                dr.Close();
                this.cn.Close();

                if (isTopicClosed)
                {
                    Response.End();
                    return;
                }
            }
            else //we're adding a NEW TOPIC to a forum
            {
                _addTopic = true;
                this.cmd.CommandText = "SELECT Forums.ForumID, Forums.Title, Forums.Premoderated FROM Forums WHERE Forums.ForumID=" + _forumID;
                this.cn.Open();
                DbDataReader dr = this.cmd.ExecuteReader();
                if (dr.Read())
                {
                    _premoderated = Convert.ToBoolean(dr["Premoderated"]);
                }
                dr.Close();
                this.cn.Close();
            }
            divPolls.Visible = _addTopic;

            if (!CheckForumPostPermissions(_forumID, CurrentUserID))
			{
				lblDenied.Visible=true;
				divMain.Visible=false;
			}

            if (_addTopic || _changeTopic)
            {
                lblSubject.Visible = true;
                tbSubj.Visible = true;
            }

			if(!_addTopic)
			{
				if(!IsPostBack)
				{
                    this.cn.Open();

                    //set the "subscribe me" checkbox
                    if (_mailNotificationsEnabled)
                    {
                        this.cmd.CommandText = "SELECT UserID FROM ForumSubscriptions WHERE UserID='" + CurrentUserID + "' AND TopicID=" + _topicID;
                        this.cbSubscribe.Checked = (this.cmd.ExecuteScalar() != null);
                    }

                    //display previous messages in a topic
                    this.cmd.CommandText = "SELECT ForumMessages.Body FROM ForumMessages WHERE ForumMessages.TopicID=" + _topicID + " and ForumMessages.Visible=? ORDER BY ForumMessages.CreationDate DESC";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);
                    DbDataReader dr = cmd.ExecuteReader();
                    rptMessages.DataSource = dr;
                    rptMessages.DataBind();
                    dr.Close();
					this.cn.Close();
				}
			}

			//if we-re quoting or editing
            if (_messageId != 0)
            {
                this.cn.Open();
                
                //get the author of the edited message
                this.cmd.CommandText = "SELECT UserID FROM ForumMessages WHERE MessageID=" + _messageId;
                object res = this.cmd.ExecuteScalar();
                _messageAuthorID = ((res).ToString());

                //IF not PostBack - lets pre-fill the body field with the message text
                if (!IsPostBack)
                {
                    this.cmd.CommandText = "SELECT ForumMessages.Body, ForumUsers.UserName, ForumMessages.UserID FROM ForumUsers LEFT OUTER JOIN ForumMessages ON ForumUsers.UserID=ForumMessages.UserID WHERE ForumMessages.MessageID=" + _messageId;
                    DbDataReader dr = this.cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        string body = dr["Body"].ToString().Replace("<br>", "\r\n");
                        body = System.Text.RegularExpressions.Regex.Replace(body, @"<\S[^>]*>", "");
                        if (!_isEditing) //quoting
                        {
                            //remove domain from username (in case its windows auth)
                            string unameNoDomain = dr["UserName"].ToString();
                            unameNoDomain = unameNoDomain.Substring(unameNoDomain.IndexOf("\\") + 1);
                            
                            tbMsg.Text = "[quote=" + unameNoDomain + "]" + body + "[/quote]\r\n\r\n";
                        }
                        else //editing
                        {
                            tbMsg.Text = body;
                        }
                    }
                    dr.Close();
                }
                this.cn.Close();
            }
		}

		protected void btnSave_Click(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "" && _allowGuestPosts)
                if (tbImgCode.Text != (string)Session["CaptchaImageText"])
                    return;

            string msg = tbMsg.Text;
            msg = msg.Trim();
            msg = msg.Replace("<", "&lt;").Replace(">", "&gt;");

            //bad words filter
            msg = aspnetforum.Utils.Formatting.FilterBadWords(msg);

            bool isModer = IsModerator(_forumID);

            if (msg == "") return;

            if (!CheckAttachmentsSize())
            {
                lblMaxSize.Text = maxFileSize/1000 + " Kb";
                lblMaxSize.Visible = true;
                lblFileSizeError.Visible = true;
                return;
            }
            else
            {
                lblMaxSize.Visible = false;
                lblFileSizeError.Visible = false;
            }

            bool bmoderator = IsModerator(_forumID);

            this.cn.Open();

			if(_addTopic || _changeTopic) //creating a new topic or editing topic title
			{
				string subj = tbSubj.Text;
				subj = subj.Trim();
				if(subj=="") return;
                subj = aspnetforum.Utils.Formatting.FilterBadWords(subj);

                if (_addTopic)
                {
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
                    string pollQuestion = tbPollQuestion.Text.Trim();
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
                if (bmoderator || _messageAuthorID == CurrentUserID)
                {
                    // Record last editor and date at the end of the message.
                    msg += "\r\n<em>edited by " + Session["aspnetforumUserName"] +
                            " on " + aspnetforum.Utils.GetCurrTime().ToShortDateString() + "</em>";

                    this.cmd.CommandText = "UPDATE ForumMessages SET Body=?, Visible=? " +
                        "WHERE MessageID=" + _messageId;
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, msg, !_premoderated);
                    this.cmd.ExecuteNonQuery();
                    this.cmd.Parameters.Clear();

                    SaveAttachments(_messageId);
                }
			}
			else //inserting
			{
				this.cmd.CommandText = "INSERT INTO ForumMessages (TopicID, UserID, Body, CreationDate, Visible) "+
                    "VALUES (?, convert(uniqueidentifier, ?), ?, ?, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _topicID, CurrentUserID, msg, aspnetforum.Utils.GetCurrTime(), (!_premoderated) || isModer);
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
			if(_mailNotificationsEnabled)
			{
                this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE UserID='" + CurrentUserID + "' AND TopicID=" + _topicID;
				this.cmd.ExecuteNonQuery();
				if(this.cbSubscribe.Checked)
				{
                    this.cmd.CommandText = "INSERT INTO ForumSubscriptions (UserID, TopicID) VALUES ('" + CurrentUserID + "', " + _topicID + ")";
					this.cmd.ExecuteNonQuery();
				}
			}

			//sending notifications
			if(_mailNotificationsEnabled)
			{
                string url = Request.Url.ToString().ToLower();
                url = url.Substring(0, url.IndexOf("addpost.aspx"));

                if (_addTopic)
                {
                    aspnetforum.SendNotifications.SendNewTopicNotificationEmails(_forumID, CurrentUserID, url);
                }
                else
                {
                    aspnetforum.SendNotifications.SendNewMsgNotificationEmails(_topicID, CurrentUserID, url);
                }
			}

            if (_premoderated && !isModer)
            {
                this.cn.Close();
                Response.Redirect("premoderatedmessage.aspx");
            }
            else
            {
                //count messages to compute the number of pages
                //(needed to get the user redirected to the last page)
                this.cmd.CommandText = "SELECT COUNT(MessageID) FROM ForumMessages WHERE Visible=? AND TopicID=" + _topicID;
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);
                int numMessages = Convert.ToInt32(cmd.ExecuteScalar());
                int numPages = (numMessages - 1) / this.pageSize;
                this.cn.Close();
                string url = (numPages > 0)
                    ? "messages.aspx?TopicID=" + _topicID +"&Page=" + numPages.ToString()
                    : "messages.aspx?TopicID=" + _topicID;
                Response.Redirect(url);
            }
		}

		protected void btnPreview_Click(object sender, System.EventArgs e)
		{
			string msg = tbMsg.Text;
			msg = msg.Trim();
			msg = msg.Replace("<", "&lt;").Replace(">", "&gt;");
            divPreview.InnerHtml = aspnetforum.Utils.Formatting.FormatMessageHTML(msg);
		}

        private bool CheckAttachmentsSize()
        {
            //loop through the posted files
            for (int i = 0; i < Request.Files.Count; i++)
            {
                //max size check
                if (Request.Files[i].ContentLength > maxFileSize)
                {
                    return false;
                }
            }
            return true;
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
                if (Request.Files[i].ContentLength > maxFileSize) continue;

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