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

	/// <summary>
	/// Summary description for recent.
	/// </summary>
	public partial class recent : aspnetforum.ForumPage
	{
		bool bRss;
        bool bAvatarsEnabled;
        protected string pagerString = "";
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
			this.Title += " - " + ForumTitle;
			bRss = (Request.QueryString["rss"]=="1");

            bAvatarsEnabled = (ConfigurationManager.AppSettings["EnableAvatars"].ToLower() == "true");

			this.cn.Open();
			if(!bRss)
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
		}

		private void BindRepeater()
		{
            this.cmd.CommandText = "SELECT TOP 30 ForumMessages.Body, ForumMessages.CreationDate, ForumTopics.TopicID, ForumTopics.Subject, ForumUsers.UserName, ForumMessages.UserID, ForumUsers.PostsCount, ForumUsers.AvatarFileName " +
                "FROM ForumUsers INNER JOIN (ForumMessages INNER JOIN ForumTopics ON ForumMessages.TopicID=ForumTopics.TopicID) ON ForumMessages.UserID=ForumUsers.UserID " +
                "WHERE ForumMessages.Visible=? " +
                "AND ForumTopics.ForumID NOT IN (SELECT DISTINCT ForumID FROM ForumGroupPermissions) " +
                //"AND ForumMessages.MessageID>" + maxid + " " +
                "ORDER BY ForumMessages.MessageID DESC";
            aspnetforum.Utils.DB.PrepareCommandText(ref cmd); //mysql workaround ("top X" -> "limit X")
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);

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
                    pagerString += " <a href=\"recent.aspx?Page=" + i + "\">" + (i + 1) + "</a>";
            }

			this.rptMessagesList.DataSource = pagedSrc;
			this.rptMessagesList.DataBind();
		}

		private string GetRssXML()
		{
            this.cmd.CommandText = "SELECT TOP 30 ForumMessages.Body, ForumMessages.CreationDate, ForumTopics.TopicID, ForumTopics.Subject, ForumUsers.UserName, ForumMessages.UserID, ForumUsers.PostsCount " +
				"FROM ForumUsers INNER JOIN (ForumMessages INNER JOIN ForumTopics ON ForumMessages.TopicID=ForumTopics.TopicID) ON ForumMessages.UserID=ForumUsers.UserID " +
				"WHERE ForumTopics.ForumID NOT IN (SELECT DISTINCT ForumID FROM ForumGroupPermissions) " +
				"ORDER BY ForumMessages.MessageID DESC";
            aspnetforum.Utils.DB.PrepareCommandText(ref cmd); //mysql workaround ("top X" -> "limit X")
			string retval = "";
			string msgLink = Request.Url.ToString();
			msgLink = msgLink.Substring(0, msgLink.IndexOf("recent.aspx"));
			msgLink += "messages.aspx?TopicID=";

			retval += "<?xml version=\"1.0\"?>\r\n";
			retval += "<rss version=\"2.0\">\r\n";
			retval += "<channel>\r\n";
			retval += "<title>" + ForumTitle + " - Recent Posts</title>\r\n";
			retval += "<link>" + Request.Url.ToString().Replace("?rss=1", "") + "</link>\r\n";
			retval += "<description>" + ForumTitle + " - Recent Posts</description>\r\n";
			retval += "<language>en-us</language>\r\n";
			retval += "<docs>http://blogs.law.harvard.edu/tech/rss</docs>\r\n";
			retval += "<generator>Jitbit AspNetForum</generator>\r\n";
			
			DbDataReader dr = this.cmd.ExecuteReader();
			if(dr.HasRows)
			{
				int i = 0;
				while(dr.Read())
				{
					if(i==0) //first record
					{
						retval += string.Format("<pubDate>{0}</pubDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r") );
						retval += string.Format("<lastBuildDate>{0}</lastBuildDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r") );
					}
					i++;

					//items
					retval += "<item>\r\n";
					retval += string.Format("<link>{0}</link>\r\n", msgLink + dr["TopicID"].ToString() );
                    retval += "<title>Message from " + dr["UserName"].ToString().Replace("&", "&amp;") + "</title>\r\n";
                    retval += string.Format("<description><![CDATA[{0}]]></description>\r\n", aspnetforum.Utils.Formatting.FormatMessageHTML(dr["Body"].ToString()));
					retval += string.Format("<pubDate>{0}</pubDate>\r\n", ((DateTime)dr["CreationDate"]).ToString("r") );
					retval += "</item>\r\n";
				}
			}
			dr.Close();

			retval += "</channel>\r\n";
			retval += "</rss>\r\n";

			return retval;
		}
	}
