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
using System.Text;
using System.IO;
using System.Configuration;

using System.Web.Security;


	/// <summary>
	/// Summary description for topics.
	/// </summary>
    public partial class topics : aspnetforum.ForumPage
	{
		protected int forumID;
        protected string pagerString = "";
		bool mailNotificationsEnabled;
        bool membersOnly = true;
		protected bool isModerator = false;
		private bool bRss;
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            try
            {
                forumID = int.Parse(Request.QueryString["ForumID"]);
            }
            catch
            {
                Response.Write("Wrong forum id");
                Response.End();
                return;
            }

			bRss = (Request.QueryString["rss"]=="1");
			mailNotificationsEnabled = (ConfigurationManager.AppSettings["MailNotificationsEnabled"].ToLower()=="true");
			isModerator = IsModerator(forumID);
			rssLink.HRef = "topics.aspx?ForumID=" + forumID + "&rss=1";
            rssDiscoverLink.Attributes["href"] = rssLink.HRef;

			//check permissions
            if (!CheckForumReadPermissions(forumID, CurrentUserID))
			{
				lblDenied.Visible=true;
				divMain.Visible=false;
				linkAddTopic.Visible=false;
                linkAddTopic2.Visible = false;
				return;
			}

            
			this.cn.Open();

			SubscribeButtonVisibility();

			//display the forum title and description, check if anonymous access allowed
			this.cmd.CommandText = "SELECT Title, Description, MembersOnly FROM Forums WHERE ForumID=" + forumID;
			DbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                this.Title = dr["Title"] + " - " + ForumTitle + " Forums";
                membersOnly = Convert.ToBoolean(dr["MembersOnly"]);
            }
			dr.Close();
            if (membersOnly && CurrentUserID == "")
            {
                cn.Close();
                Response.Write("The forum <b>\"" + lblCurForum.Text + "\"</b> is for authenticated users only. Please login or register.");
                Response.End();
                return;
            }

            //breadcrumbs
            lblCurForum.Text = aspnetforum.Utils.GetForumBreadCrumbs(forumID, cmd);

            //display subforums of the forum
            BindSubforums();
            
            //if not in RSS-mode
			if(!bRss)
			{
				BindMainRepeater();
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
			//hide "add post" link if user is a guest
            if (CurrentUserID != "")
            {
                lblRegister.Visible = false;
                linkAddTopic.Visible = true;
                linkAddTopic.HRef = "addpost.aspx?ForumID=" + forumID;
                lblRegister2.Visible = false;
                linkAddTopic2.Visible = true;
                linkAddTopic2.HRef = "addpost.aspx?ForumID=" + forumID;
            }
            else
            {
                linkAddTopic.Visible = false;
                lblRegister.Visible = true;
                linkAddTopic2.Visible = false;
                lblRegister2.Visible = true;
            }
		}

		private void PrepareSqlCommandText()
		{
			if(!isModerator) //only "visible" topics for non-moderators
			{
                this.cmd.CommandText = "SELECT ForumMessages.CreationDate, ForumTopics.TopicID, ForumTopics.Subject, ForumTopics.Visible, ForumTopics.LastMessageID, ForumTopics.RepliesCount AS Messages, ForumTopics.IsSticky, ForumTopics.IsClosed, ForumTopics.ViewsCount " +
                    "FROM ForumTopics " +
                    "INNER JOIN ForumMessages ON ForumMessages.MessageID = ForumTopics.LastMessageID " +
                    "WHERE ForumTopics.ForumID=" + forumID + " AND ForumTopics.Visible=? " +
                    "ORDER BY ForumTopics.IsSticky DESC, ForumTopics.LastMessageID DESC";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);

			}
			else //moderators: show also "invisible" topics (invisible = need to be approved first)
			{
                this.cmd.CommandText = "SELECT ForumMessages.CreationDate, ForumTopics.TopicID, ForumTopics.Subject, ForumTopics.Visible, ForumTopics.LastMessageID, ForumTopics.RepliesCount AS Messages, ForumTopics.IsSticky, ForumTopics.IsClosed, ForumTopics.ViewsCount " +
                    "FROM ForumTopics " +
                    "INNER JOIN ForumMessages ON ForumMessages.MessageID = ForumTopics.LastMessageID " +
                    "WHERE ForumTopics.ForumID=" + forumID + " " +
                    "ORDER BY ForumTopics.IsSticky DESC, ForumTopics.LastMessageID DESC";
				this.cmd.Parameters.Clear();
			}
		}

		private void SubscribeButtonVisibility()
		{ 
			if(!mailNotificationsEnabled)
			{
				btnSubscribe.Visible = false;
				btnUnsubscribe.Visible = false;
                btnSubscribe2.Visible = false;
                btnUnsubscribe2.Visible = false;
				return;
			}
            if (CurrentUserID == "") //if anonymous
			{
				btnSubscribe.Visible=false;
				btnUnsubscribe.Visible=false;
                btnSubscribe2.Visible = false;
                btnUnsubscribe2.Visible = false;
				return;
			}
            //Response.Write(CurrentUserID);
           
            this.cmd.CommandText = "SELECT ForumID FROM ForumNewTopicSubscriptions WHERE UserID='" + CurrentUserID + "' AND ForumID=" + forumID;
			object res = this.cmd.ExecuteScalar();
			btnSubscribe.Visible = (res==null);
			btnUnsubscribe.Visible = (res!=null);
            btnSubscribe2.Visible = (res == null);
            btnUnsubscribe2.Visible = (res != null);
              
		}

        private void BindSubforums()
        {
            this.cmd.CommandText = "SELECT SubForumID FROM ForumSubforums WHERE ParentForumID=" + forumID;
            object res = cmd.ExecuteScalar();
            if (res == null) return;

            this.cmd.CommandText =
                string.Format("SELECT Forums.ForumID, Forums.Title, Forums.Description, Count(ForumTopics.TopicID) AS Topics, Forums.GroupID, MAX(ForumTopics.LastMessageID) as LatestMessageID, Forums.OrderByNumber " +
                "FROM (Forums LEFT OUTER JOIN ForumTopics ON Forums.ForumID=ForumTopics.ForumID) " +
                "WHERE Forums.ForumID IN (SELECT SubForumID FROM ForumSubforums WHERE ParentForumID={0}) " + //subforums
                "GROUP BY Forums.ForumID, Forums.Title, Forums.Description, Forums.GroupID, Forums.OrderByNumber " +
                "ORDER BY Forums.OrderByNumber", forumID);
            DbDataAdapter da = providerFactory.CreateDataAdapter();
            da.SelectCommand = this.cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            rptSubForumsList.DataSource = dt;
            rptSubForumsList.DataBind();
        }

		private void BindMainRepeater()
		{
			PrepareSqlCommandText();

            DbDataAdapter da = providerFactory.CreateDataAdapter();
            da.SelectCommand = this.cmd;
			DataTable dt = new DataTable();
			da.Fill(dt);
			PagedDataSource pagedSrc = new PagedDataSource();
			pagedSrc.DataSource = dt.DefaultView;
			pagedSrc.AllowPaging = true;
			pagedSrc.PageSize = this.pageSize;
			int curPage = 0;
			if(Request.QueryString["page"]!=null)
				int.TryParse(Request.QueryString["page"], out curPage);
			pagedSrc.CurrentPageIndex = curPage;

            //prepare a string for the "pager" at the bottom
            pagerString = "";
            for (int i = 0; i < pagedSrc.PageCount; i++)
            {
                if (i == curPage)
                    pagerString += " " + (i + 1);
                else
                    pagerString += " <a href=\"topics.aspx?ForumID=" + forumID + "&Page=" + i + "\">" + (i + 1) + "</a>";
            }

            //clear the list
            rptTopicsList.DataSource = null;
            rptTopicsList.DataBind();

            if (pagedSrc.Count > 0) //bind only if not empty (to prevent header/footer from showing
            {
                this.rptTopicsList.DataSource = pagedSrc;
                this.rptTopicsList.DataBind();
            }
		}

        private string GetRssXML()
        {
            PrepareSqlCommandText();
            StringBuilder retval = new StringBuilder();
            string msgLink = Request.Url.ToString();
            msgLink = msgLink.Substring(0, msgLink.IndexOf("topics.aspx"));
            msgLink += "messages.aspx?TopicID=";

            retval.Append("<?xml version=\"1.0\"?>\r\n");
            retval.Append("<rss version=\"2.0\">\r\n");
            retval.Append("<channel>\r\n");
            retval.Append("<title>" + ForumTitle + " - " + lblCurForum.Text + " - Latest Topics</title>\r\n");
            retval.Append("<link>" + Request.Url.ToString().Replace("&rss=1", "").Replace("&", "&amp;") + "</link>\r\n");
            retval.Append("<description>" + ForumTitle + " - " + lblCurForum.Text + " - Latest Topics</description>\r\n");
            retval.Append("<language>en-us</language>\r\n");
            retval.Append("<docs>http://blogs.law.harvard.edu/tech/rss</docs>\r\n");
            retval.Append("<generator>Jitbit AspNetForum</generator>\r\n");

            DbDataReader dr = this.cmd.ExecuteReader();
            if (dr.HasRows)
            {
                int i = 0;
                while (dr.Read())
                {
                    if (i == 0) //first record
                    {
                        retval.Append(string.Format("<pubDate>{0}</pubDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r")));
                        retval.Append(string.Format("<lastBuildDate>{0}</lastBuildDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r")));
                    }
                    i++;

                    //items
                    retval.Append("<item>\r\n");
                    retval.Append(string.Format("<link>{0}</link>\r\n", msgLink + dr["TopicID"].ToString()));
                    retval.Append("<title>" + dr["Subject"].ToString().Replace("&", "&amp;") + "</title>\r\n");
                    retval.Append(string.Format("<description><![CDATA[{0}]]></description>\r\n", aspnetforum.Utils.Formatting.FormatMessageHTML(dr["Subject"].ToString())));
                    if (dr["CreationDate"] != DBNull.Value)
                        retval.Append(string.Format("<pubDate>{0}</pubDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r")));
                    retval.Append("</item>\r\n");
                }
            }
            dr.Close();

            retval.Append("</channel>\r\n");
            retval.Append("</rss>\r\n");

            return retval.ToString();
        }

		protected void rptTopicsList_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
		{
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView record = (DataRowView)e.Item.DataItem;

                bool isClosed = Convert.ToBoolean(record["IsClosed"]);

                //if it is a "sticky note" - display it
                bool isSticky = (Convert.ToInt32(record["IsSticky"]) == 1);
                if (isSticky)
                {
                    HtmlImage imgTopic = e.Item.FindControl("imgTopic") as HtmlImage;
                    imgTopic.Src = "images/topic_sticky.gif";
                }

                if (isModerator)
                {
                    //show "delete" button and other for moderators
                    e.Item.FindControl("btnModeratorDelete").Visible = true;
                    
                    if (!Convert.ToBoolean(record["Visible"]))
                    {
                        e.Item.FindControl("btnModeratorApprove").Visible = true;
                    }

                    //show stick/unstick
                    if (isSticky)
                    {
                        e.Item.FindControl("btnModeratorUnstick").Visible = true;
                    }
                    else
                    {
                        e.Item.FindControl("btnModeratorStick").Visible = true;
                    }

                    //show close
                    if (!isClosed)
                    {
                        e.Item.FindControl("btnModeratorClose").Visible = true;
                    }
                    else
                    {
                        e.Item.FindControl("btnModeratorReopen").Visible = true;
                    }
                }
			}
		}

		protected void rptTopicsList_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
		{
			//delete topic and all messages
            if (e.CommandName == "delete")
            {
                int deletedTopicID = int.Parse(e.CommandArgument.ToString());

                DeleteTopicAttachments(deletedTopicID);

                this.cn.Open();
                this.cmd.CommandText = "DELETE FROM ForumPollAnswers WHERE OptionID IN (SELECT OptionID FROM ForumPollOptions WHERE PollID IN (SELECT PollID FROM ForumPolls WHERE TopicID=" + deletedTopicID + "))";
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumPollOptions WHERE PollID IN (SELECT PollID FROM ForumPolls WHERE TopicID=" + deletedTopicID + ")";
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumPolls WHERE TopicID=" + deletedTopicID;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumUploadedFiles WHERE MessageID IN (SELECT MessageID FROM ForumMessages WHERE TopicID=" + deletedTopicID + ")";
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumMessages WHERE TopicID=" + deletedTopicID;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE TopicID=" + deletedTopicID;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumTopics WHERE TopicID=" + deletedTopicID;
                this.cmd.ExecuteNonQuery();
                BindMainRepeater();
                this.cn.Close();
                return;
            }
			//approved topic (when premoderated forum)
			if(e.CommandName=="approve")
			{
				int approvedTopicID = int.Parse(e.CommandArgument.ToString());

				this.cn.Open();
				this.cmd.CommandText = "UPDATE ForumTopics SET Visible=? WHERE TopicID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true, approvedTopicID);
				this.cmd.ExecuteNonQuery();
				BindMainRepeater();
				this.cn.Close();
                return;
			}
			//make "sticky"
            if (e.CommandName == "stick")
            {
                int stickyTopicID = int.Parse(e.CommandArgument.ToString());

                this.cn.Open();
                this.cmd.CommandText = "UPDATE ForumTopics SET IsSticky=? WHERE TopicID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, 1, stickyTopicID);
                this.cmd.ExecuteNonQuery();
                BindMainRepeater();
                this.cn.Close();
                return;
            }
            //make non-"sticky"
            if (e.CommandName == "unstick")
            {
                int stickyTopicID = int.Parse(e.CommandArgument.ToString());

                this.cn.Open();
                this.cmd.CommandText = "UPDATE ForumTopics SET IsSticky=? WHERE TopicID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, 0, stickyTopicID);
                this.cmd.ExecuteNonQuery();
                BindMainRepeater();
                this.cn.Close();
                return;
            }
            //close topic
            if (e.CommandName == "close")
            {
                int closeTopicID = int.Parse(e.CommandArgument.ToString());

                this.cn.Open();
                this.cmd.CommandText = "UPDATE ForumTopics SET IsClosed=? WHERE TopicID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true, closeTopicID);
                this.cmd.ExecuteNonQuery();
                BindMainRepeater();
                this.cn.Close();
                return;
            }
            //reopen topic
            if (e.CommandName == "reopen")
            {
                int closeTopicID = int.Parse(e.CommandArgument.ToString());

                this.cn.Open();
                this.cmd.CommandText = "UPDATE ForumTopics SET IsClosed=? WHERE TopicID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, false, closeTopicID);
                this.cmd.ExecuteNonQuery();
                BindMainRepeater();
                this.cn.Close();
                return;
            }
		}

		protected void btnSubscribe_Click(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "") return; //just in case
			this.cn.Open();
			//delete - just in case
            this.cmd.CommandText = "DELETE FROM ForumNewTopicSubscriptions WHERE UserID='" + CurrentUserID + "' AND ForumID=" + forumID;
			this.cmd.ExecuteNonQuery();
            this.cmd.CommandText = "INSERT INTO ForumNewTopicSubscriptions (UserID, ForumID) VALUES ('" + CurrentUserID + "', " + forumID + ")";
			this.cmd.ExecuteNonQuery();
			SubscribeButtonVisibility();
			this.cn.Close();
		}

		protected void btnUnsubscribe_Click(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "") return; //just in case
			this.cn.Open();
            this.cmd.CommandText = "DELETE FROM ForumNewTopicSubscriptions WHERE UserID='" + CurrentUserID + "' AND ForumID=" + forumID;
			this.cmd.ExecuteNonQuery();
			SubscribeButtonVisibility();
			this.cn.Close();
		}

        private void DeleteTopicAttachments(int tpcid)
        {
            cn.Open();
            cmd.CommandText = "SELECT FileName, UserID FROM ForumUploadedFiles WHERE MessageID IN (SELECT MessageID FROM ForumMessages WHERE TopicID=" + tpcid + ")";
            DbDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string filepath = Page.MapPath("upload") + "\\" + dr["UserID"].ToString() + "\\" + dr["FileName"].ToString();
                if (File.Exists(filepath)) File.Delete(filepath);
            }
            dr.Close();
            this.cmd.CommandText = "DELETE FROM ForumUploadedFiles WHERE MessageID IN (SELECT MessageID FROM ForumMessages WHERE TopicID=" + tpcid + ")";
            this.cmd.ExecuteNonQuery();
            cn.Close();
        }
	}