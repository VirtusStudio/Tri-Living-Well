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
using System.Text;
using System.IO;


	/// <summary>
	/// Summary description for messages.
	/// </summary>
	public partial class messages : aspnetforum.ForumPage
	{
		public int _topicID;
		int _forumID;
		bool _isModerator = false;
        protected string pagerString = "";
		bool _sortDesc;
		bool _bMailNotificationsEnabled;
		bool _allowGuestPosts;
		bool _bRss;
        bool _bAvatarsEnabled;
        bool _bFileUploadsEnabled;
        bool _bTopicClosed;
        int _pollID = 0;
        int _maxvotecount = 0;
        string _forumTitle = "";
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            int.TryParse(Request.QueryString["TopicID"], out _topicID);
            if (_topicID == 0)
            {
                Response.Write("topic not found");
                Response.End();
                return;
            }
            
            _bAvatarsEnabled = (ConfigurationManager.AppSettings["EnableAvatars"].ToLower() == "true");
            _bFileUploadsEnabled = (ConfigurationManager.AppSettings["EnableFileUploads"].ToLower() == "true");

			_bRss = (Request.QueryString["rss"]=="1");
            rssLink.HRef = "messages.aspx?TopicID=" + _topicID + "&rss=1";
            rssDiscoverLink.Attributes["href"] = rssLink.HRef;
			
            _bMailNotificationsEnabled = (System.Configuration.ConfigurationManager.AppSettings["MailNotificationsEnabled"].ToLower()=="true");
			
			GetGeneralTopicInfo();
			
            _isModerator = IsModerator(_forumID);

			this.cn.Open();

			//if moderator - fill the ddlForums dropdownlist (for moving topic to another forum)
			spanMove.Visible = _isModerator;
			if(_isModerator && !IsPostBack)
			{
				this.cmd.CommandText = "SELECT ForumID, Title FROM Forums";
				DbDataReader dr = this.cmd.ExecuteReader();
				ddlForums.DataSource = dr;
				ddlForums.DataBind();
				dr.Close();
			}

			//reading settings
			System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
			try
			{
				_allowGuestPosts = (bool)configurationAppSettings.GetValue("AllowGuestPosts", typeof(bool));
				_sortDesc = (bool)configurationAppSettings.GetValue("MsgSortDescending", typeof(bool));
			}
			catch
			{
				_allowGuestPosts = false;
				_sortDesc = false;
			}

            //is it a poll?
            this.cmd.CommandText = "SELECT PollID FROM ForumPolls WHERE TopicID=" + _topicID;
            object res = cmd.ExecuteScalar();
            if (res != null) //it is a poll
            {
                _pollID = Convert.ToInt32(res);
                ShowPoll();
            }

			//bind repeater
			if(!_bRss)
			{
				BindRepeater();			
				this.cn.Close();
			}
			else
			{
				Response.Clear();
				Response.ContentType = "text/xml";
				Response.Write(GetRssXML());
				this.cn.Close();
				Response.End();
			}

			//hide "add post" link if user is guest or topic readonly
            this.linkAddPost.Visible = (CurrentUserID != "" || _allowGuestPosts) && !_bTopicClosed;
			this.linkAddPost.HRef = "addpost.aspx?TopicID=" + _topicID;
		}

        private void ShowPoll()
        {
            divPoll.Visible = true;
            bool bShowResults;
            DbDataReader dr;

            //get poll name
            cmd.CommandText = "SELECT * FROM ForumPolls WHERE PollID=" + _pollID;
            dr = cmd.ExecuteReader();
            dr.Read();
            lblPollName.Text = dr["Question"].ToString();
            dr.Close();

            if (CurrentUserID != "") //check if current user already voted
            {
                cmd.CommandText = "SELECT UserID FROM ForumPollAnswers WHERE OptionID IN (SELECT OptionID FROM ForumPollOptions WHERE PollID=" + _pollID + ") AND UserID='" + CurrentUserID + "'";
                bShowResults = (cmd.ExecuteScalar() != null); //user has voted
            }
            else
                bShowResults = true;

            rblOptions.Visible = !bShowResults;
            rptVoteResults.Visible = bShowResults;
            btnVote.Visible = !bShowResults;

            if (bShowResults) //showing poll results
            {
                cmd.CommandText = "SELECT COUNT(ForumPollAnswers.UserID) as VoteCount, ForumPollOptions.OptionID, ForumPollOptions.OptionText FROM ForumPollAnswers" +
                    " RIGHT OUTER JOIN ForumPollOptions ON ForumPollOptions.OptionID = ForumPollAnswers.OptionID" +
                    " WHERE ForumPollOptions.PollID=" + _pollID +
                    " GROUP BY ForumPollOptions.OptionID, ForumPollOptions.OptionText";
                DbDataAdapter da = providerFactory.CreateDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);

                //now let's fin max vote count\
                _maxvotecount=0;
                foreach (DataRow row in dt.Rows)
                {
                    if (_maxvotecount <= Convert.ToInt32(row["VoteCount"]))
                        _maxvotecount =  Convert.ToInt32(row["VoteCount"]);
                }

                rptVoteResults.DataSource = dt;
                rptVoteResults.DataBind();
            }
            else if (!IsPostBack) //bind poll voting controls
            {
                cmd.CommandText = "SELECT OptionID, OptionText FROM ForumPollOptions WHERE PollID=" + _pollID;
                dr = cmd.ExecuteReader();
                rblOptions.DataSource = dr;
                rblOptions.DataBind();
                dr.Close();
            }
        }

		protected void rptMessagesList_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
		{
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView record = (DataRowView)e.Item.DataItem;

                //registered users are allowed to QUOTE msgs
                if (CurrentUserID != "")
                {
                    HtmlAnchor lnkQuote = (HtmlAnchor)e.Item.FindControl("lnkQuote");
                    lnkQuote.Visible = true;
                    lnkQuote.HRef = "addpost.aspx?TopicID=" + record["TopicID"] + "&Quote=" + record["MessageID"];
                }

                // Moderators and message owners can delete and edit messages.
                if (CurrentUserID != "" && (_isModerator || (record["UserID"].ToString()) == CurrentUserID))
                {
                    //show "delete" button for moderators
                    e.Item.FindControl("btnModeratorDelete").Visible = true;

                    // Show "edit" button for moderators.
                    HtmlAnchor lnkEdit = (HtmlAnchor)e.Item.FindControl("lnkEdit");
                    lnkEdit.Visible = true;
                    lnkEdit.HRef = "addpost.aspx?TopicID=" + record["TopicID"] + "&Edit=" + record["MessageID"];
                }
                else
                {
                    // Need to explicitly turn off this special case control.
                    e.Item.FindControl("lnkEdit").Visible = false;
                }

                if (_isModerator)
                {
                    if (!Convert.ToBoolean(record["Visible"]))
                    {
                        e.Item.FindControl("btnModeratorApprove").Visible = true;
                    }
                }

                //show attachments
                Repeater nestedRepeater = e.Item.FindControl("rptFiles") as Repeater;
                DataRowView dv = e.Item.DataItem as DataRowView;
                nestedRepeater.DataSource = dv.CreateChildView("MessagesFiles");
                nestedRepeater.DataBind();
                nestedRepeater.Visible = (nestedRepeater.Items.Count > 0);
            }
		}

		private void SubscribeButtonVisibility()
		{
			if(!_bMailNotificationsEnabled)
			{
				btnSubscribe.Visible = false;
				btnUnsubscribe.Visible = false;
				return;
			}
            if (CurrentUserID == "") //if anonymous
			{
				btnSubscribe.Visible=false;
				btnUnsubscribe.Visible=false;
				return;
			}
            this.cmd.CommandText = "SELECT TopicID FROM ForumSubscriptions WHERE UserID='" + CurrentUserID + "' AND TopicID=" + _topicID;
			object res = this.cmd.ExecuteScalar();
			btnSubscribe.Visible = (res==null);
			btnUnsubscribe.Visible = (res!=null);
		}

		private void BindRepeater()
		{
            DataSet ds = new DataSet();
            ds.Tables.Add("Messages");
            ds.Tables.Add("UploadedFiles");
            DbDataAdapter da = providerFactory.CreateDataAdapter();
            da.SelectCommand = this.cmd;

            //get messages
			if(!_isModerator) //only "visible" msgs for non-moderators
			{
                this.cmd.CommandText = "SELECT ForumMessages.*, ForumUsers.UserName, ForumUsers.AvatarFileName, ForumUsers.Signature, ForumUsers.PostsCount FROM ForumMessages LEFT JOIN ForumUsers ON ForumMessages.UserID = ForumUsers.UserID WHERE ForumMessages.Visible=? AND ForumMessages.TopicID=" + _topicID + " ORDER BY ForumMessages.CreationDate";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);
			}
			else //moderators: show also "invisible" msgs (invisible = need to be approved first)
			{
                this.cmd.CommandText = "SELECT ForumMessages.*, ForumUsers.UserName, ForumUsers.AvatarFileName, ForumUsers.Signature, ForumUsers.PostsCount FROM ForumMessages LEFT JOIN ForumUsers ON ForumMessages.UserID = ForumUsers.UserID WHERE ForumMessages.TopicID=" + _topicID + " ORDER BY ForumMessages.CreationDate";
				this.cmd.Parameters.Clear();
			}
			if(_sortDesc)
			{
				this.cmd.CommandText += " DESC";
			}
			da.Fill(ds.Tables[0]);

            //now get file uploaded in this topic
            cmd.CommandText = "SELECT FileName, MessageID, UserID FROM ForumUploadedFiles WHERE MessageID IN (SELECT MessageID FROM ForumTopics WHERE TopicID=" + _topicID + ")";
            da.Fill(ds.Tables[1]);

            ds.Relations.Add(new DataRelation("MessagesFiles", ds.Tables[0].Columns["MessageID"], ds.Tables[1].Columns["MessageID"], false));

			PagedDataSource pagedSrc = new PagedDataSource();
            pagedSrc.DataSource = ds.Tables[0].DefaultView;
			pagedSrc.AllowPaging = true;
			pagedSrc.PageSize = this.pageSize;
			int curPage = 0;
            if (Request.QueryString["page"] != null)
                int.TryParse(Request.QueryString["page"], out curPage);
            else if (Request.QueryString["lastpage"] != null)
                curPage = pagedSrc.PageCount - 1;
			pagedSrc.CurrentPageIndex = curPage;

            //prepare a string for the "pager" at the bottom
            pagerString = "";
            for (int i = 0; i < pagedSrc.PageCount; i++)
            {
                if (i == curPage)
                    pagerString += " " + (i + 1);
                else
                {
                    if (!aspnetforum.Utils.SEOUrlsEnabled)
                        pagerString += " <a href=\"?TopicID=" + _topicID + "&Page=" + i + "\">" + (i + 1) + "</a>";
                    else
                        pagerString += " <a href=\"?Page=" + i + "\">" + (i + 1) + "</a>";
                }
            }

			this.rptMessagesList.DataSource = pagedSrc;
			this.rptMessagesList.DataBind();
		}

		private void GetGeneralTopicInfo()
		{
			this.cn.Open();
            this.cmd.CommandText = "SELECT Forums.Title, Forums.ForumID, ForumTopics.Subject, ForumTopics.IsClosed FROM Forums INNER JOIN ForumTopics ON Forums.ForumID=ForumTopics.ForumID WHERE ForumTopics.TopicID=" + _topicID;
			DbDataReader dr = this.cmd.ExecuteReader();
			if(dr.Read())
			{
                _forumTitle = dr["Title"].ToString();
                lblCurTopic.Text = lblCurTopicBottom.Text = dr["Subject"].ToString();
                this.Title = dr["Subject"].ToString() + " - " + dr["Title"].ToString() + " - " + ForumTitle;
				_forumID = Convert.ToInt32(dr["ForumID"]);

                //is closed
                _bTopicClosed = Convert.ToBoolean(dr["IsClosed"]);
                lblClosed.Visible = _bTopicClosed;
			}
			dr.Close();

            lblCurForum.Text = lblCurForumBottom.Text = aspnetforum.Utils.GetForumBreadCrumbs(_forumID, cmd);

            if (!_bTopicClosed)
            {
                //subscribe/unsubscribe visibility
                SubscribeButtonVisibility();
            }
            else
            {
                btnSubscribe.Visible = false;
                btnUnsubscribe.Visible = false;
            }

            //is topic closed
            this.cmd.CommandText = "SELECT IsClosed FROM ForumTopics WHERE TopicID=" + _topicID;
            object res = cmd.ExecuteScalar();
            
            //increase views counter
            
            //ms access workaroud for upgrading customers - Access inserts NULL value to existing rows even if default value specified
            this.cmd.CommandText = "UPDATE ForumTopics SET ViewsCount=0 WHERE ViewsCount IS NULL AND TopicID=" + _topicID;
            this.cmd.ExecuteNonQuery();
            //now increase counter
            this.cmd.CommandText = "UPDATE ForumTopics SET ViewsCount=ViewsCount+1 WHERE TopicID=" + _topicID;
            this.cmd.ExecuteNonQuery();

			this.cn.Close();
		}

        protected void rptMessagesList_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
		{
			//delete message
			if( e.CommandName=="delete")
			{
				int deletedMessageID = int.Parse(e.CommandArgument.ToString());
                DeleteMessage(deletedMessageID);

				this.cn.Open();
				BindRepeater();
				this.cn.Close();
			}
			//approve message (for premoderated forum)
			if( e.CommandName=="approve")
			{
				int approvedMessageID = int.Parse(e.CommandArgument.ToString());

				this.cn.Open();
				this.cmd.CommandText = "UPDATE ForumMessages SET Visible=? WHERE MessageID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true, approvedMessageID);
				this.cmd.ExecuteNonQuery();

				//updating LastMessageID in Topics table
				this.cmd.CommandText = "SELECT MAX(MessageID) FROM ForumMessages WHERE Visible=? AND TopicID=" + _topicID;
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);
				object res = this.cmd.ExecuteScalar();
				int maxmsg = (res==null || res==DBNull.Value) ? 0 : (int)res;
				this.cmd.CommandText="UPDATE ForumTopics SET LastMessageID=" + maxmsg + " WHERE TopicID=" + _topicID;
				this.cmd.ExecuteNonQuery();

				BindRepeater();
				this.cn.Close();
			}
		}

		private string GetRssXML()
		{
			this.cmd.CommandText = "SELECT ForumMessages.*, ForumUsers.PostsCount FROM ForumMessages LEFT JOIN ForumUsers ON ForumMessages.UserID=ForumUsers.UserID WHERE ForumMessages.Visible=? AND ForumMessages.TopicID=" + _topicID + " ORDER BY ForumMessages.CreationDate DESC";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);

			StringBuilder retval = new StringBuilder();

            retval.Append("<?xml version=\"1.0\"?>\r\n");
			retval.Append("<rss version=\"2.0\">\r\n");
			retval.Append("<channel>\r\n");
            retval.Append("<title>" + ForumTitle + " - " + _forumTitle.Replace("&", "&amp;") + " - " + lblCurTopic.Text.Replace("&", "&amp;") + " - Messages</title>\r\n");
			retval.Append("<link>" + Request.Url.ToString().Replace("&rss=1", "") + "</link>\r\n");
            retval.Append("<description>" + ForumTitle + " - " + _forumTitle.Replace("&", "&amp;") + " - " + lblCurTopic.Text.Replace("&", "&amp;") + " - Messages</description>\r\n");
			retval.Append("<language>en-us</language>\r\n");
			retval.Append("<docs>http://blogs.law.harvard.edu/tech/rss</docs>\r\n");
			retval.Append("<generator>Jitbit AspNetForum</generator>\r\n");
			
			DbDataReader dr = this.cmd.ExecuteReader();
			if(dr.HasRows)
			{
				int i = 0;
				while(dr.Read())
				{
					if(i==0) //first record
					{
						retval.Append(string.Format("<pubDate>{0}</pubDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r") ));
						retval.Append(string.Format("<lastBuildDate>{0}</lastBuildDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r") ));
					}
					i++;

					//items
                    retval.Append("<item>\r\n");
                    retval.Append(string.Format("<link>{0}</link>\r\n", Request.Url.ToString().Replace("&rss=1", "")));
                    retval.Append("<title>Message from " + dr["UserName"].ToString().Replace("&", "&amp;") + "</title>\r\n");
                    retval.Append(string.Format("<description><![CDATA[{0}]]></description>\r\n", aspnetforum.Utils.Formatting.FormatMessageHTML(dr["Body"].ToString())));
                    retval.Append(string.Format("<pubDate>{0}</pubDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r")));
                    retval.Append("</item>\r\n");
				}
			}
			dr.Close();

            retval.Append("</channel>\r\n");
            retval.Append("</rss>\r\n");

			return retval.ToString();
		}

		protected void btnSubscribe_Click(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "") return; //just in case
			this.cn.Open();
			//delete - just in case
            this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE UserID='" + CurrentUserID + "' AND TopicID=" + _topicID;
			this.cmd.ExecuteNonQuery();
            this.cmd.CommandText = "INSERT INTO ForumSubscriptions (UserID, TopicID) VALUES ('" + CurrentUserID + "', " + _topicID + ")";
			this.cmd.ExecuteNonQuery();
			SubscribeButtonVisibility();
			this.cn.Close();
		}

		protected void btnUnsubscribe_Click(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "") return; //just in case
			this.cn.Open();
            this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE UserID='" + CurrentUserID + "' AND TopicID=" + _topicID;
			this.cmd.ExecuteNonQuery();
			SubscribeButtonVisibility();
			this.cn.Close();
		}

		protected void btnMove_Click(object sender, System.EventArgs e)
		{
			if(ddlForums.SelectedValue=="") return;
			
			this.cmd.CommandText = "UPDATE ForumTopics SET ForumID=? WHERE TopicID=?";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, ddlForums.SelectedValue, _topicID);
			this.cn.Open();
			this.cmd.ExecuteNonQuery();
			this.cmd.Parameters.Clear();
            this.cn.Close();
			GetGeneralTopicInfo();
		}

        private void DeleteMessageAttachments(int msgid)
        {
            cn.Open();
            cmd.CommandText = "SELECT FileName, UserID FROM ForumUploadedFiles WHERE MessageID=" + msgid;
            DbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string filepath = Page.MapPath("upload") + "\\" + dr["UserID"].ToString() + "\\" + dr["FileName"].ToString();
                if (File.Exists(filepath)) File.Delete(filepath);
            }
            dr.Close();
            this.cmd.CommandText = "DELETE FROM ForumUploadedFiles WHERE MessageID=" + msgid;
            this.cmd.ExecuteNonQuery();
            cn.Close();
        }

        private void DeleteMessage(int msgid)
        {
            DeleteMessageAttachments(msgid);

            this.cn.Open();

            //decreasing user posts count (-1)
            this.cmd.CommandText = "SELECT UserID FROM ForumMessages WHERE MessageID=" + msgid;
            object res = cmd.ExecuteScalar();
            if (res != null)
            {
                int userid = Convert.ToInt32(res);
                cmd.CommandText = "UPDATE ForumUsers SET PostsCount = PostsCount-1 WHERE UserID=" + userid;
                cmd.ExecuteNonQuery();
            }

            //deleting message
            this.cmd.CommandText = "DELETE FROM ForumUploadedFiles WHERE MessageID=" + msgid;
            this.cmd.ExecuteNonQuery();
            this.cmd.CommandText = "DELETE FROM ForumMessages WHERE MessageID=" + msgid;
            this.cmd.ExecuteNonQuery();

            //updating LastMessageID in Topics table
            this.cmd.CommandText = "SELECT MAX(MessageID) FROM ForumMessages WHERE Visible=1 AND TopicID=" + _topicID;
            res = this.cmd.ExecuteScalar();
            if (res != null && !(res is DBNull))
            {
                int maxmsg = Convert.ToInt32(res);
                this.cmd.CommandText = "UPDATE ForumTopics SET LastMessageID=" + maxmsg + " WHERE TopicID=" + _topicID;
                this.cmd.ExecuteNonQuery();
            }
            this.cn.Close();
        }


        private void UpdateReview(string sReviewResponse, string sMessageID)
        {

            this.cn.Open();
            if (sReviewResponse == "Helpful")
            {
                this.cmd.CommandText = "UPDATE ForumMessages SET HelpfulCount=(HelpfulCount + 1), TotalReviewsCount=(TotalReviewsCount+1) WHERE MessageID=" + sMessageID;
            }
            if (sReviewResponse == "NotHelpful")
            {
                this.cmd.CommandText = "UPDATE ForumMessages SET TotalReviewsCount=(TotalReviewsCount+1) WHERE MessageID=" + sMessageID;
            }
            if (sReviewResponse == "Inappropriate")
            {
                this.cmd.CommandText = "UPDATE ForumMessages SET ReportMessageFLG=1 WHERE MessageID=" + sMessageID;
            }
            this.cmd.ExecuteNonQuery();
            this.cn.Close();
        }

        //gets thewidth of the voting bar
        public int GetVotingBarWidth(object votecount)
        {
            if (_maxvotecount != 0)
                return 200 * Convert.ToInt32(votecount) / _maxvotecount;
            else
                return 0;
        }

        protected void btnVote_Click(object sender, EventArgs e)
        {
            if (rblOptions.SelectedValue == "") return;
            cn.Open();
            cmd.Parameters.Clear();
            cmd.CommandText = "INSERT INTO ForumPollAnswers (UserID, OptionID) VALUES (convert(uniqueidentifier, ?), ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, CurrentUserID, rblOptions.SelectedValue);
            cmd.ExecuteNonQuery();
            ShowPoll();
            cn.Close();
        }

        protected string GetThumbnail(string filename, string userID)
        {
            if (filename == null) return "";

            string lowFilename = filename.ToLower();

            if (lowFilename.EndsWith("gif") || lowFilename.EndsWith("jpg") || lowFilename.EndsWith("jpeg") || lowFilename.EndsWith("png"))
            {
                //it's an image
                string src = "imgthumbnail.aspx?Image=" + userID + "\\" + filename;
                return "<br/><img alt=\"\" src=\"" + src + "\" /><br/>";
            }
            else
                return "";
        }
        protected void btnHelpful_Click(object sender, EventArgs e)
        {
            //string sMessageID = e.CommandArgument.ToString();
            UpdateReview("Helpful", MessageID.Value.ToString());
        }
        protected void btnNotHelpful_Click(object sender, EventArgs e)
        {
            //string sMessageID = e.CommandArgument.ToString();
            UpdateReview("NotHelpful", MessageID.Value.ToString());
        }
        protected void btnReportInappropriate_Click(object sender, EventArgs e)
        {
            //string sMessageID = e.CommandArgument.ToString();
            UpdateReview("Inappropriate", MessageID.Value.ToString());
        }

}