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
	/// Summary description for mysubscriptions.
	/// </summary>
    public partial class mysubscriptions : aspnetforum.ForumPage
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
            if (CurrentUserID == "")
            {
                lblNotLoggedIn.Visible = true;
                divMain.Visible = false;
            }
            else
            {
                lblNotLoggedIn.Visible = false;
                divMain.Visible = true;
                BindGrid();
            }
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.grid.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.grid_ItemCommand);
			this.gridForums.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.gridForums_ItemCommand);

		}
		#endregion

		private void BindGrid()
		{
			this.cn.Open();

			//topics
			this.cmd.CommandText = "SELECT ForumTopics.TopicID, ForumTopics.Subject " +
				"FROM ForumSubscriptions INNER JOIN ForumTopics ON ForumSubscriptions.TopicID = ForumTopics.TopicID " +
                "WHERE ForumSubscriptions.UserID = '" + CurrentUserID + "'";
			this.cmd.Parameters.Clear();
			DbDataReader dr = this.cmd.ExecuteReader();
			this.grid.DataSource = dr;
			this.grid.DataBind();
			dr.Close();

			//forums
			this.cmd.CommandText = "SELECT Forums.ForumID, Forums.Title " +
				"FROM ForumNewTopicSubscriptions INNER JOIN Forums ON ForumNewTopicSubscriptions.ForumID = Forums.ForumID " +
                "WHERE ForumNewTopicSubscriptions.UserID = '" + CurrentUserID + "'";
			this.cmd.Parameters.Clear();
			dr = this.cmd.ExecuteReader();
			this.gridForums.DataSource = dr;
			this.gridForums.DataBind();
			dr.Close();

			this.cn.Close();
		}

		private void grid_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if(e.CommandName == "delete")
			{
				string topicid = e.Item.Cells[0].Text;
                this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE TopicID=" + topicid + " AND UserID = '" + CurrentUserID + "'";
				this.cmd.Parameters.Clear();
				this.cn.Open();
				this.cmd.ExecuteNonQuery();
				this.cn.Close();
				BindGrid();
			}
		}

		private void gridForums_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if(e.CommandName == "delete")
			{
				string forumid = e.Item.Cells[0].Text;
                this.cmd.CommandText = "DELETE FROM ForumNewTopicSubscriptions WHERE ForumID=" + forumid + " AND UserID = '" + CurrentUserID + "'";
				this.cmd.Parameters.Clear();
				this.cn.Open();
				this.cmd.ExecuteNonQuery();
				this.cn.Close();
				BindGrid();
			}
		}
	}