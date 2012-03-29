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

    public partial class admin : aspnetforum.AdminForumPage
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			BindForums();
			if(!IsPostBack)
			{
				BindForumGroups();
			}
		}

		private void BindForums()
		{
			this.cn.Open();
			this.cmd.CommandText = "SELECT * FROM Forums";
			DbDataReader dr =this.cmd.ExecuteReader();
			this.gridForums.DataSource = dr;
			this.gridForums.DataBind();
			dr.Close();
			this.cn.Close();
			lblNoForums.Visible = (gridForums.Items.Count==0);
		}

		private void BindForumGroups()
		{
			this.cn.Open();
			this.cmd.CommandText = "SELECT * FROM ForumGroups";
			DbDataReader dr = this.cmd.ExecuteReader();
			this.ddlForumGroup.DataSource = dr;
			this.ddlForumGroup.DataBind();
			dr.Close();
			this.cn.Close();
		}

		protected void gridForums_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if(e.CommandName == "delete")
			{
				string forumid = e.Item.Cells[0].Text;
				this.cn.Open();
				this.cmd.CommandText = "DELETE FROM ForumGroupPermissions WHERE ForumID=" + forumid;
				this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumMessages WHERE TopicID IN (SELECT TopicID FROM ForumTopics WHERE ForumID=" + forumid + ")";
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE TopicID IN (SELECT TopicID FROM ForumTopics WHERE ForumID=" + forumid + ")";
                this.cmd.ExecuteNonQuery();
				this.cmd.CommandText = "DELETE FROM ForumTopics WHERE ForumID=" + forumid;
				this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumSubforums WHERE ParentForumID=" + forumid + " OR SubForumID=" + forumid;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumModerators WHERE ForumID=" + forumid;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumNewTopicSubscriptions WHERE ForumID=" + forumid;
                this.cmd.ExecuteNonQuery();
				this.cmd.CommandText = "DELETE FROM Forums WHERE ForumID=" + forumid;
				this.cmd.ExecuteNonQuery();
				this.cn.Close();

				BindForums();
			}
		}

		protected void btnAdd_Click(object sender, System.EventArgs e)
		{
            lblError.Visible = false;

            if (tbForumGroup.Text == "" && ddlForumGroup.Items.Count == 0)
            {
                lblError.Visible = true;
                return;
            }

			this.cn.Open();

			int forumGroup = 0;

            if (this.tbForumGroup.Text.Trim() != "")
			{
				this.cmd.CommandText = "INSERT INTO ForumGroups (GroupName) VALUES (?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbForumGroup.Text);
				this.cmd.ExecuteNonQuery();

                this.cmd.CommandText = "SELECT GroupID FROM ForumGroups WHERE GroupName=?";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbForumGroup.Text);
				forumGroup = Convert.ToInt32(this.cmd.ExecuteScalar());
			}
			else
			{
				forumGroup = int.Parse( ddlForumGroup.SelectedValue );
			}

            if (tbTitle.Text.Trim() != "" && tbDescr.Text.Trim() != "")
            {
                this.cmd.CommandText = "INSERT INTO Forums (Title, Description, GroupID) " +
                    "VALUES (?, ?, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbTitle.Text, tbDescr.Text, forumGroup);
                this.cmd.ExecuteNonQuery();
            }
            else
            {
                lblError.Visible = true;
            }
            cn.Close();

			BindForums();
			BindForumGroups();

			this.tbDescr.Text = "";
			this.tbTitle.Text = "";
			this.tbForumGroup.Text = "";
		}

        protected void gridForums_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                WebControl btn = e.Item.Cells[2].Controls[0] as WebControl;
                if (btn != null)
                    btn.Attributes.Add("onclick", "return confirm('Delete?');");
            }
        }
	}
