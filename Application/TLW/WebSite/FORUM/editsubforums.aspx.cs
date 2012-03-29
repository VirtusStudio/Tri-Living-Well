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

public partial class editsubforums : aspnetforum.AdminForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cn.Open();
                cmd.CommandText = "SELECT ForumID FROM Forums";
                object res = cmd.ExecuteScalar();
                cn.Close();
                if (res == null)
                {
                    lblNoForumsFound.Visible = true;
                    divAddSubforum.Visible = false;
                    lblNoSubForums.Visible = true;
                    return;
                }

                BindSubForums();
                BindDropDownLists();
            }
        }

        private void BindSubForums()
		{
			this.cn.Open();
            cmd.CommandText = "SELECT Forums.Title AS ParentForumTitle, Forums_SubForums.Title AS SubForumTitle, Forums_SubForums.ForumID AS SubForumID, Forums.ForumID AS ParentForumID " +
                "FROM (Forums INNER JOIN ForumSubforums ON Forums.ForumID = ForumSubforums.ParentForumID) INNER JOIN Forums AS Forums_SubForums ON ForumSubforums.SubForumID = Forums_SubForums.ForumID";
			DbDataReader dr =this.cmd.ExecuteReader();
			this.gridSubForums.DataSource = dr;
            this.gridSubForums.DataBind();
			dr.Close();
			this.cn.Close();
            lblNoSubForums.Visible = (gridSubForums.Items.Count == 0);
            gridSubForums.Visible = (gridSubForums.Items.Count != 0);
		}

        private void BindDropDownLists()
        {
            cn.Open();
            cmd.CommandText = "SELECT ForumID, Title FROM Forums";
            DbDataReader dr = cmd.ExecuteReader();
            ddlParentForum.DataSource = dr;
            ddlParentForum.DataBind();
            dr.Close();

            cmd.CommandText = "SELECT ForumID, Title FROM Forums WHERE ForumID NOT IN (SELECT SubForumID FROM ForumSubforums)";
            dr = cmd.ExecuteReader();
            ddlSubForum.DataSource = dr;
            ddlSubForum.DataBind();
            dr.Close();
            cn.Close();

            divAddSubforum.Visible = (ddlParentForum.Items.Count != 0);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int parentid = 0, subforumid = 0;
            int.TryParse(ddlParentForum.SelectedValue, out parentid);
            int.TryParse(ddlSubForum.SelectedValue, out subforumid);

            cn.Open();

            //reverse subforum check
            cmd.CommandText = "SELECT ParentForumID FROM ForumSubforums WHERE ParentForumID=" + subforumid + " AND SubForumID=" + parentid;
            object res = cmd.ExecuteScalar();

            if (parentid != 0 && parentid != subforumid && res == null)
            {
                lblError.Visible = false;
                cmd.CommandText = "INSERT INTO ForumSubforums (ParentForumID, SubForumID) VALUES (?, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, parentid, subforumid);
                cmd.ExecuteNonQuery();
            }
            else
            {
                lblError.Visible = true;
            }

            cn.Close();

            BindDropDownLists();
            BindSubForums();
        }

        protected void gridSubForums_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string parentid = e.Item.Cells[0].Text;
                string subid = e.Item.Cells[1].Text;
                this.cn.Open();
                this.cmd.CommandText = "DELETE FROM ForumSubforums WHERE ParentForumID=" + parentid + " AND SubForumID=" + subid;
                this.cmd.ExecuteNonQuery();
                this.cn.Close();

                BindSubForums();
                BindDropDownLists();
            }
        }
    }