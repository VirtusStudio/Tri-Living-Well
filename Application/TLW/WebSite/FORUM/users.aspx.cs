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


    public partial class users : aspnetforum.ForumPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Users list - " + ForumTitle;
            this.cn.Open();
            BindRecentUsers();
            BindActiveUsers();
            BindRecentlyActiveUsers();
            this.cn.Close();
        }

        private void BindRecentUsers()
        {
            this.cmd.CommandText = "SELECT top 10 UserID, UserName FROM ForumUsers ORDER BY UserID DESC";
            aspnetforum.Utils.DB.PrepareCommandText(ref cmd); //mysql workaround ("top X" -> "limit X")
            DbDataReader dr = this.cmd.ExecuteReader();
            rptRecent.DataSource = dr;
            rptRecent.DataBind();
            dr.Close();
        }

        private void BindActiveUsers()
        {
            this.cmd.CommandText = "SELECT TOP 10 ForumUsers.UserID, ForumUsers.UserName, COUNT(ForumMessages.MessageID) AS MsgCount " +
                "FROM ForumUsers INNER JOIN ForumMessages ON ForumUsers.UserID=ForumMessages.UserID " +
                "GROUP BY ForumUsers.UserID, ForumUsers.UserName " +
                "ORDER BY COUNT(ForumMessages.MessageID) DESC";
            aspnetforum.Utils.DB.PrepareCommandText(ref cmd); //mysql workaround ("top X" -> "limit X")
            DbDataReader dr = this.cmd.ExecuteReader();
            rptMostActive.DataSource = dr;
            rptMostActive.DataBind();
            dr.Close();
        }

        private void BindRecentlyActiveUsers()
        {
            this.cmd.CommandText = "SELECT TOP 10 ForumUsers.UserID, ForumUsers.UserName, COUNT(ForumMessages.MessageID) AS MsgCount " +
                "FROM ForumUsers INNER JOIN ForumMessages ON ForumUsers.UserID=ForumMessages.UserID " +
                "WHERE ForumMessages.CreationDate>? " +
                "GROUP BY ForumUsers.UserID, ForumUsers.UserName " +
                "ORDER BY COUNT(ForumMessages.MessageID) DESC";
            aspnetforum.Utils.DB.PrepareCommandText(ref cmd); //mysql workaround ("top X" -> "limit X")
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, aspnetforum.Utils.GetCurrTime().AddDays(-14));
            DbDataReader dr = this.cmd.ExecuteReader();
            rptRecentlyActive.DataSource = dr;
            rptRecentlyActive.DataBind();
            dr.Close();
        }
    }