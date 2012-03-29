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
	/// Summary description for privatesent.
	/// </summary>
	public partial class privatesent : aspnetforum.ForumPage
	{
        protected string pagerString = "";

		protected void Page_Load(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "")
            {
                lblNotLoggedIn.Visible = true;
            }
            else
            {
                lblNotLoggedIn.Visible = false;
                cn.Open();
                BindRepeater();
                cn.Close();
            }
		}

		private void BindRepeater()
		{
            this.cmd.CommandText = "SELECT ForumPersonalMessages.MessageID, ForumUsers.UserName, ForumPersonalMessages.CreationDate, ForumPersonalMessages.Body, ForumUsers.UserID FROM ForumPersonalMessages INNER JOIN ForumUsers ON ForumPersonalMessages.ToUserID=ForumUsers.UserID WHERE ForumPersonalMessages.FromUserID='" + CurrentUserID + "' ORDER BY ForumPersonalMessages.CreationDate DESC";

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
                    pagerString += " <a href=\"privatemessages.aspx?Page=" + i + "\">" + (i + 1) + "</a>";
            }

			this.rptMessagesList.DataSource = pagedSrc;
			this.rptMessagesList.DataBind();
		}
	}