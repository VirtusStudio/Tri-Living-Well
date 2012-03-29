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
	/// Summary description for viewpostsbyuser.
	/// </summary>
public partial class viewpostsbyuser : aspnetforum.ForumPage
	{
		protected string userID;
        protected string pagerString = "";

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				userID = Request.QueryString["UserID"].ToString();
			}
			catch
			{
				Response.Write("Invalid UserID passed");
				Response.End();
				return;
			}

			this.Title = "View User Profile - " + ForumTitle + " Forums";

			this.cn.Open();

			this.cmd.CommandText = "SELECT UserName FROM ForumUsers WHERE UserID='" + userID + "'";
			object res = this.cmd.ExecuteScalar();
			if(res!=null)
			{
				lblUser.Text = res.ToString();
			}
			BindRepeater();

			this.cn.Close();
		}

		private void BindRepeater()
		{
            this.cmd.CommandText = "SELECT ForumMessages.Body, ForumMessages.CreationDate, ForumTopics.TopicID, ForumTopics.Subject " +
                "FROM ForumMessages INNER JOIN ForumTopics ON ForumMessages.TopicID=ForumTopics.TopicID " +
                "WHERE ForumTopics.ForumID NOT IN (SELECT DISTINCT ForumID FROM ForumGroupPermissions) " +
                "AND ForumMessages.UserID='" + userID + "' ORDER BY ForumMessages.CreationDate";
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
                    pagerString += " <a href=viewpostsbyuser.aspx?UserID=" + userID + "&Page=" + i + ">" + (i + 1) + "</a>";
            }

			this.rptMessagesList.DataSource = pagedSrc;
			this.rptMessagesList.DataBind();
		}
	}