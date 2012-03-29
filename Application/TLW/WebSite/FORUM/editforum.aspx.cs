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
	/// Summary description for editaspnetforum.
	/// </summary>
    public partial class editforum : aspnetforum.AdminForumPage
	{
		int forumID;

		protected void Page_Load(object sender, System.EventArgs e)
		{
			forumID = int.Parse( Request.QueryString["ForumID"] );

			if(!IsPostBack)
			{
				BindForumProperties();
				BindGroupsList();
			}
			BindModeratorsGrid();
			BindPermissionsGrid();
		}

		private void BindForumProperties()
		{
			this.cn.Open();

			this.cmd.CommandText = "SELECT * FROM ForumGroups";
			DbDataReader dr = this.cmd.ExecuteReader();
			this.ddlForumGroup.DataSource = dr;
			this.ddlForumGroup.DataBind();
			dr.Close();

			this.cmd.CommandText = "SELECT * FROM Forums WHERE ForumID=" + forumID;
			dr = this.cmd.ExecuteReader();
			if(dr.Read())
			{
				tbTitle.Text = dr["Title"].ToString();
				tbDescr.Text = dr["Description"].ToString();
                cbPremoderated.Checked = Convert.ToBoolean(dr["Premoderated"]);
                cbMembersOnly.Checked = Convert.ToBoolean(dr["MembersOnly"]);
				ddlForumGroup.SelectedValue = dr["GroupID"].ToString();
                tbOrderByNumber.Text = dr["OrderByNumber"].ToString() == "" ? "0" : dr["OrderByNumber"].ToString();
			}
			dr.Close();

			this.cn.Close();
		}

		private void BindModeratorsGrid()
		{
			this.cn.Open();
			this.cmd.CommandText = "SELECT ForumModerators.UserID, ForumUsers.UserName "+
				"FROM ForumModerators INNER JOIN ForumUsers ON ForumModerators.UserID = ForumUsers.UserID "+
				"WHERE ForumModerators.ForumID=" + forumID;
			this.gridModerators.DataSource = this.cmd.ExecuteReader();
			this.gridModerators.DataBind();
			this.cn.Close();
			lblNoModerators.Visible = (gridModerators.Items.Count==0);
		}

		private void BindPermissionsGrid()
		{
			this.cn.Open();
			this.cmd.CommandText = "SELECT ForumUserGroups.GroupID, ForumUserGroups.Title, ForumGroupPermissions.AllowReading, ForumGroupPermissions.AllowPosting "+
				"FROM ForumUserGroups INNER JOIN ForumGroupPermissions ON ForumGroupPermissions.GroupID = ForumUserGroups.GroupID "+
				"WHERE ForumGroupPermissions.ForumID=" + forumID;
			this.gridGroups.DataSource = this.cmd.ExecuteReader();
			this.gridGroups.DataBind();
			this.cn.Close();
			lblFFA.Visible = (gridGroups.Items.Count==0);
			gridGroups.Visible = (gridGroups.Items.Count!=0);
		}

		private void BindGroupsList()
		{
			this.cn.Open();
			this.cmd.CommandText = "SELECT * FROM ForumUserGroups";
			this.ddlGroups.DataSource = this.cmd.ExecuteReader();
			this.ddlGroups.DataBind();
			this.cn.Close();
		}

		protected void gridModerators_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if(e.CommandName == "delete")
			{
				this.cmd.CommandText = "DELETE FROM ForumModerators WHERE UserID=? AND ForumID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, int.Parse(e.Item.Cells[0].Text), forumID);
				this.cn.Open();
				this.cmd.ExecuteNonQuery();
				this.cn.Close();

				BindModeratorsGrid();
			}
		}

		protected void btnSave_Click(object sender, System.EventArgs e)
		{
            if (tbForumGroup.Text.Trim() == "" && ddlForumGroup.Items.Count == 0)
            {
                Response.Write("error");
                return;
            }

			this.cn.Open();

			int forumGroup = 0;

            if (this.tbForumGroup.Text.Trim() != "")
            {
                this.cmd.CommandText = "INSERT INTO ForumGroups (GroupName) VALUES (?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbForumGroup.Text);
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "SELECT GroupID FROM ForumGroups WHERE GroupName='" + tbForumGroup.Text + "'";
                forumGroup = Convert.ToInt32(this.cmd.ExecuteScalar());
            }
            else
            {
                forumGroup = int.Parse(ddlForumGroup.SelectedValue);
            }

            this.cmd.CommandText = "UPDATE Forums SET Title=?, Description=?, Premoderated=?, GroupID=?, MembersOnly=?, OrderByNumber=? WHERE ForumID=?";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbTitle.Text, tbDescr.Text, cbPremoderated.Checked, forumGroup, cbMembersOnly.Checked, int.Parse(tbOrderByNumber.Text), forumID);
			this.cmd.ExecuteNonQuery();
			this.cn.Close();

			this.tbForumGroup.Text = "";

			BindForumProperties();
		}

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
            this.cn.Open();

            this.cmd.CommandText = "SELECT UserID FROM ForumUsers WHERE UserName=?";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbModerator.Text);
            object res = cmd.ExecuteScalar();
            if (res != null)
            {
                int userID = Convert.ToInt32(res);
                this.cmd.Parameters.Clear();
                this.cmd.CommandText = "DELETE FROM ForumModerators WHERE UserID=? and ForumID=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, userID, forumID);
                this.cmd.ExecuteNonQuery();

                this.cmd.CommandText = "INSERT INTO ForumModerators (UserID, ForumID) VALUES (?, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, userID, forumID);
                this.cmd.ExecuteNonQuery();
            }
			this.cn.Close();

			BindModeratorsGrid();
		}

		protected void btnAddPermission_Click(object sender, System.EventArgs e)
		{
            if(ddlGroups.SelectedValue=="") return;
			this.cn.Open();

			//delete just in case
			this.cmd.CommandText = "DELETE FROM ForumGroupPermissions WHERE GroupID="+ddlGroups.SelectedValue+" AND ForumID="+forumID;
			this.cmd.ExecuteNonQuery();

			this.cmd.CommandText = "INSERT INTO ForumGroupPermissions (GroupID, ForumID, AllowReading, AllowPosting) "+
				"VALUES(?, ?, ?, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, ddlGroups.SelectedValue, forumID, chkAllowReadingNew.Checked, chkAllowPostingNew.Checked);
			this.cmd.ExecuteNonQuery();
			this.cn.Close();

			this.cmd.Parameters.Clear();

			BindPermissionsGrid();
		}

		protected void gridGroups_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if(e.CommandName=="delete")
			{
				string groupid = e.Item.Cells[0].Text;
				this.cn.Open();
				this.cmd.CommandText = "DELETE FROM ForumGroupPermissions WHERE GroupID="+groupid+" AND ForumID="+forumID;
				this.cmd.ExecuteNonQuery();
				this.cn.Close();
				BindPermissionsGrid();
				return;
			}
			if(e.CommandName=="save")
			{
				string groupid = e.Item.Cells[0].Text;
				CheckBox chkAllowReading = (CheckBox)e.Item.Cells[2].FindControl("chkAllowReading");
				CheckBox chkAllowPosting = (CheckBox)e.Item.Cells[2].FindControl("chkAllowPosting");
				this.cn.Open();
				this.cmd.CommandText = "UPDATE ForumGroupPermissions SET AllowReading=?, AllowPosting=? WHERE GroupID="+groupid+" AND ForumID="+forumID;
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, chkAllowReading.Checked, chkAllowPosting.Checked);
				this.cmd.ExecuteNonQuery();
				this.cn.Close();
				BindPermissionsGrid();
				return;
			}
		}
	}