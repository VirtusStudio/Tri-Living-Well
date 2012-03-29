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
using System.Data.Common;
using System.Text;

    public partial class recenttopics : aspnetforum.ForumPage
    {
        bool bRss;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title += " - " + ForumTitle;
            bRss = (Request.QueryString["rss"] == "1");

            this.cn.Open();
            if (!bRss)
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

        private string GetRssXML()
        {
            PrepareSqlCommandText();
            StringBuilder retval = new StringBuilder();
            string msgLink = Request.Url.ToString();
            msgLink = msgLink.Substring(0, msgLink.IndexOf("recenttopics.aspx"));
            msgLink += "messages.aspx?TopicID=";

            retval.Append("<?xml version=\"1.0\"?>\r\n");
            retval.Append("<rss version=\"2.0\">\r\n");
            retval.Append("<channel>\r\n");
            retval.Append("<title>" + ForumTitle + " - Recently updated topics</title>\r\n");
            retval.Append("<link>" + Request.Url.ToString().Replace("&rss=1", "").Replace("&", "&amp;") + "</link>\r\n");
            retval.Append("<description>" + ForumTitle + " - Recently updated topics</description>\r\n");
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

        private void PrepareSqlCommandText()
        {
            cmd.CommandText = "SELECT TOP 30 ForumTopics.TopicID, ForumTopics.Subject, ForumMessages.CreationDate, ForumMessages.UserID, ForumUsers.UserName " +
                "FROM ForumTopics INNER JOIN (ForumMessages INNER JOIN ForumUsers ON ForumUsers.UserID=ForumMessages.UserID) ON ForumMessages.MessageID = ForumTopics.LastMessageID " +
                "WHERE ForumTopics.Visible=? " +
                "AND ForumTopics.ForumID NOT IN (SELECT DISTINCT ForumID FROM ForumGroupPermissions) " +
                "ORDER BY ForumMessages.MessageID DESC";
            aspnetforum.Utils.DB.PrepareCommandText(ref cmd); //mysql workaround ("top X" -> "limit X")
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true);
        }

        private void BindRepeater()
        {
            PrepareSqlCommandText();

            DbDataReader dr = cmd.ExecuteReader();
            this.rptTopicsList.DataSource = dr;
            this.rptTopicsList.DataBind();
            dr.Close();
        }
    }