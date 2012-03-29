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


    public partial class forumgroups : aspnetforum.AdminForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                BindGroups();
        }

        private void BindGroups()
        {
            this.cn.Open();
            this.cmd.CommandText = "SELECT * FROM ForumGroups";
            DbDataReader dr = this.cmd.ExecuteReader();
            this.gridForumGroups.DataSource = dr;
            this.gridForumGroups.DataBind();
            dr.Close();
            this.cn.Close();
        }

        protected void gridForumGroups_EditCommand(object source, DataGridCommandEventArgs e)
        {
            gridForumGroups.EditItemIndex = e.Item.ItemIndex;
            BindGroups();
        }

        protected void gridForumGroups_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            gridForumGroups.EditItemIndex = -1;
            BindGroups();
        }

        protected void gridForumGroups_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            TextBox tbName = e.Item.Cells[1].Controls[0] as TextBox;
            string groupid = e.Item.Cells[0].Text;
            this.cn.Open();
            this.cmd.CommandText = "UPDATE ForumGroups SET GroupName=? WHERE GroupID=?";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbName.Text, groupid);
            cmd.ExecuteNonQuery();
            this.cn.Close();
            gridForumGroups.EditItemIndex = -1;
            BindGroups();
        }

        protected void gridForumGroups_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                string groupid = e.Item.Cells[0].Text;
                this.cn.Open();
                this.cmd.CommandText = "DELETE FROM ForumGroups WHERE GroupID=? and GroupID NOT IN (SELECT GroupID FROM Forums)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, groupid);
                cmd.ExecuteNonQuery();
                this.cn.Close();
                BindGroups();
            }
        }
    }
