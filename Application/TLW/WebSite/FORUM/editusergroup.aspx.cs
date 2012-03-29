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

	/// <summary>
	/// Summary description for editusergroup.
	/// </summary>
    public partial class editusergroup : aspnetforum.AdminForumPage
	{
		private int groupID;

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try { groupID = int.Parse(Request.QueryString["GroupID"]); }
			catch 
			{
				Response.End();
				return;
			}

			BindAllowedUsers();
			BindDeniedUsers();
		}

		private void BindAllowedUsers()
		{
			cmd.Parameters.Clear();
			cmd.CommandText = "SELECT ForumUsers.UserID, ForumUsers.UserName FROM ForumUsersInGroup INNER JOIN ForumUsers ON ForumUsersInGroup.UserID = ForumUsers.UserID WHERE ForumUsersInGroup.GroupID=" + groupID;
			cn.Open();
			rptAllowed.DataSource = cmd.ExecuteReader();
			rptAllowed.DataBind();
			cn.Close();
			lblNoUsersInGroup.Visible = (rptAllowed.Items.Count==0);
		}

		private void BindDeniedUsers()
		{
			cmd.Parameters.Clear();
			cmd.CommandText = "SELECT ForumUsers.UserID, ForumUsers.UserName FROM ForumUsers "+
				"WHERE UserID NOT IN " +
				"(SELECT UserID FROM ForumUsersInGroup "+
				"WHERE GroupID = " + groupID + ")";
			cn.Open();
			rptDenied.DataSource = cmd.ExecuteReader();
			rptDenied.DataBind();
			cn.Close();
		}

		protected void rptAllowed_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
		{
			if(e.CommandName=="remove")
			{
                //deny access
                cmd.CommandText = string.Format("DELETE FROM ForumUsersInGroup WHERE GroupID={0} AND UserID='{1}'", groupID, e.CommandArgument);
				cn.Open();
				cmd.ExecuteNonQuery();
				cn.Close();
			}
			BindAllowedUsers();
			BindDeniedUsers();
		}

        protected void rptDenied_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
		{
			if(e.CommandName=="add")
			{
				//grant access
				cmd.CommandText = string.Format("INSERT INTO ForumUsersInGroup (UserID, GroupID) VALUES('{0}', {1})", e.CommandArgument, groupID);
				cn.Open();
				cmd.ExecuteNonQuery();
				cn.Close();
			}
			BindAllowedUsers();
			BindDeniedUsers();
		}
	}