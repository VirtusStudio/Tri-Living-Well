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
	/// Summary description for users.
	/// </summary>
	public partial class allusers : aspnetforum.ForumPage
	{
        protected string pagerString = "";
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            this.Title = "Users list - " + ForumTitle;

			this.cn.Open();
			BindRepeater();
			this.cn.Close();
		}

		private void BindRepeater()
		{
			this.cmd.CommandText = "SELECT * FROM ForumUsers";
            if (Request.QueryString["Admin"] != null)
            {
                this.cmd.CommandText += " WHERE UserID IN (SELECT UserID FROM ForumAdministrators)";
            }
            this.cmd.CommandText += " ORDER BY UserName";
            DbDataAdapter da = providerFactory.CreateDataAdapter();
            da.SelectCommand = this.cmd;
			DataTable dt = new DataTable();
			da.Fill(dt);
			PagedDataSource pagedSrc = new PagedDataSource();
			pagedSrc.DataSource = dt.DefaultView;
			pagedSrc.AllowPaging = true;
			pagedSrc.PageSize = this.pageSize * 3;
			int curPage = 0;
			if(Request.QueryString["page"]!=null)
                int.TryParse(Request.QueryString["page"], out curPage);
			pagedSrc.CurrentPageIndex = curPage;
            pagerString = "";
            for (int i = 0; i < pagedSrc.PageCount; i++)
            {
                if (i == curPage)
                    pagerString += " " + (i + 1);
                else
                    pagerString += " <a href=allusers.aspx?Page=" + i + ">" + (i + 1) + "</a>";
            }

			this.rptMessagesList.DataSource = pagedSrc;
			this.rptMessagesList.DataBind();
		}

        protected string ShowEmail(object email)
        {
            return IsAdministrator ? email.ToString() : "******"; 
        }
	}
