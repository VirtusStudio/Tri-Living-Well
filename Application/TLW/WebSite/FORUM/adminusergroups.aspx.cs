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


    public partial class adminusergroups : aspnetforum.AdminForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGroups();
        }

        private void BindGroups()
        {
            this.cn.Open();
            this.cmd.CommandText = "SELECT * FROM ForumUserGroups";
            DbDataReader dr = this.cmd.ExecuteReader();
            this.gridGroups.DataSource = dr;
            this.gridGroups.DataBind();
            dr.Close();
            this.cn.Close();
            lblNoGroups.Visible = (gridGroups.Items.Count == 0);
        }

        protected void btnAddGroup_Click(object sender, System.EventArgs e)
        {
            if (tbGroupTitle.Text == "") return;

            this.cn.Open();

            this.cmd.CommandText = "INSERT INTO ForumUserGroups (Title) VALUES (?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbGroupTitle.Text);
            this.cmd.ExecuteNonQuery();
            this.cn.Close();

            BindGroups();

            tbGroupTitle.Text = "";
        }

        protected void gridGroups_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string groupid = e.Item.Cells[0].Text;
                this.cn.Open();
                this.cmd.CommandText = "DELETE FROM ForumGroupPermissions WHERE GroupID=" + groupid;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumUsersInGroup WHERE GroupID=" + groupid;
                this.cmd.ExecuteNonQuery();
                this.cmd.CommandText = "DELETE FROM ForumUserGroups WHERE GroupID=" + groupid;
                this.cmd.ExecuteNonQuery();
                this.cn.Close();

                BindGroups();
            }
        }
    }