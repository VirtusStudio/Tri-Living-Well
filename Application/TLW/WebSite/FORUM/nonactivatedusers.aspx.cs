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

    public partial class nonactivatedusers : aspnetforum.AdminForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindNewUsers();
        }

        private void BindNewUsers()
        {
            this.cn.Open();
            this.cmd.CommandText = "SELECT * FROM ForumUsers WHERE Disabled<>0";
            DbDataReader dr = this.cmd.ExecuteReader();
            this.rptNonActivatedUsers.DataSource = dr;
            this.rptNonActivatedUsers.DataBind();
            dr.Close();
            this.cn.Close();
            rptNonActivatedUsers.Visible = rptNonActivatedUsers.Items.Count > 0;
        }
    }
