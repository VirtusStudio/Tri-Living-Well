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


public partial class activate : aspnetforum.ForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["user"];
            string code = Request.QueryString["code"];
            if (username == null || code == null)
            {
                Response.End();
                return;
            }

            this.cmd.CommandText = string.Format("select UserID from ForumUsers WHERE UserName='{0}' AND ActivationCode='{1}'",
                username.Replace("'", "''"),
                code.Replace("'", "''"));
            this.cn.Open();
            object res = this.cmd.ExecuteScalar();

            if (res != null)
            {
                this.cmd.CommandText = string.Format("update ForumUsers set Disabled=0 where UserID={0}",
                Convert.ToInt32(res));
                this.cmd.ExecuteNonQuery();
                this.cn.Close();
                lblSuccess.Visible = true;
            }
            else
            {
                this.cn.Close();
                lblError.Visible = true;
            }
        }
    }