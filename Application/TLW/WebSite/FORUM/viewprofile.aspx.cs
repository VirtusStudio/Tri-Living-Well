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
using System.IO;

	/// <summary>
	/// Summary description for viewprofile.
	/// </summary>
public partial class viewprofile : aspnetforum.ForumPage
	{
		protected string _userID;

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				_userID = Request.QueryString["UserID"].ToString();
			}
			catch
			{
				Response.Write("Invalid UserID passed");
				Response.End();
				return;
			}

			btnDelUser.Visible = IsAdministrator;
            btnActivateUser.Visible = IsAdministrator;
            btnDisableUser.Visible = IsAdministrator;
            lnkEdit.Visible = IsAdministrator;

			lnkPersonalMsg.HRef = "addprivatemsg.aspx?ToUserID=" + _userID;
            lnkEdit.HRef = "editprofile.aspx?userid=" + _userID;

            this.cmd.CommandText = "SELECT * FROM ForumUsers WHERE UserID='" + _userID + "'";
			this.cn.Open();
			DbDataReader dr = this.cmd.ExecuteReader();
			if(dr.Read())
			{
				lblUser.Text = dr["UserName"].ToString();
                this.Title = dr["UserName"].ToString() + " - " + ForumTitle;
				lblUserName.Text = dr["UserName"].ToString();
				lblInterests.Text = dr["Interests"].ToString();
				homepage.NavigateUrl = dr["Homepage"].ToString();
				homepage.Text = dr["Homepage"].ToString();
				lnkViewPosts.InnerText = dr["PostsCount"].ToString();
				lnkViewPosts.HRef = "viewpostsbyuser.aspx?UserID=" + _userID;
				lblRegistrationDate.Text = ((DateTime)dr["RegistrationDate"]).ToShortDateString();
                btnActivateUser.Visible = Convert.ToBoolean(dr["Disabled"]) && IsAdministrator;
                btnDisableUser.Visible = !Convert.ToBoolean(dr["Disabled"]) && IsAdministrator;
                if (dr["AvatarFileName"].ToString() == string.Empty)
                {
                    lblNoAvatar.Visible = true;
                    imgAvatar.Visible = false;
                }
                else
                {
                    lblNoAvatar.Visible = false;
                    imgAvatar.Visible = true;
                    imgAvatar.Src = "upload/" + dr["AvatarFileName"].ToString();
                }
			}
			dr.Close();

            this.cmd.CommandText = "SELECT * FROM ForumAdministrators WHERE UserID='" + _userID + "'";
            dr = cmd.ExecuteReader();
            bool isUserAdministrator = dr.Read();
            dr.Close();

            btnMakeAdmin.Visible = (!isUserAdministrator) && IsAdministrator;
            btnRevokeAdmin.Visible = isUserAdministrator && IsAdministrator;

			this.cn.Close();
		}

		protected void btnDelUser_Click(object sender, System.EventArgs e)
		{
			if(IsAdministrator)
			{
				cn.Open();
                cmd.CommandText = "DELETE FROM ForumAdministrators WHERE UserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM ForumModerators WHERE UserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
                cmd.CommandText = "UPDATE ForumMessages SET UserID=0 WHERE UserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
                cmd.CommandText = "UPDATE ForumTopics SET UserID=0 WHERE UserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
				cmd.CommandText = "DELETE FROM ForumPersonalMessages WHERE ToUserID='" + _userID + "' OR FromUserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM ForumSubscriptions WHERE UserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM ForumNewTopicSubscriptions WHERE UserID='" + _userID + "'";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM ForumUsersInGroup WHERE UserID='" + _userID + "'";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "DELETE FROM ForumUploadedFiles WHERE UserID='" + _userID + "'";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "SELECT AvatarFileName FROM ForumUsers WHERE UserID='" + _userID + "'";
                object resultAvatar = cmd.ExecuteScalar();
                cmd.CommandText = "DELETE FROM ForumUsers WHERE UserID='" + _userID + "'";
				cmd.ExecuteNonQuery();
				cn.Close();
                
                //delete user's upload folder & user's avatar
                string uploaddir = Page.MapPath("upload") + "\\" + _userID;
                if (Directory.Exists(uploaddir)) Directory.Delete(uploaddir);

                if (resultAvatar != null && resultAvatar.ToString() != "")
                {
                    string avatarFile = Page.MapPath("upload") + "\\" + resultAvatar.ToString();
                    if (File.Exists(avatarFile)) File.Delete(avatarFile);
                }

				Response.Redirect("users.aspx");
			}
		}

        protected void btnActivateUser_Click(object sender, EventArgs e)
        {
            if (IsAdministrator)
            {
                cn.Open();
                cmd.CommandText = string.Format("update ForumUsers set Disabled=0 where UserID='{0}'", _userID);
                cmd.ExecuteNonQuery();

                cmd.CommandText = string.Format("select Email from ForumUsers where UserID='{0}'", _userID);
                string email = cmd.ExecuteScalar().ToString();
                cn.Close();

                //send email
                string url = Request.Url.ToString().ToLower();
                url = url.Substring(0, url.IndexOf("viewprofile.aspx"));
                aspnetforum.SendNotifications.SendWelcomeEmail(email, url);

                btnActivateUser.Visible = false;
                btnDisableUser.Visible = true;
            }
        }

        protected void btnDisableUser_Click(object sender, EventArgs e)
        {
            if (IsAdministrator)
            {
                cn.Open();
                cmd.CommandText = string.Format("update ForumUsers set Disabled=1 where UserID='{0}'", _userID);
                cmd.ExecuteNonQuery();
                cn.Close();

                btnActivateUser.Visible = true;
                btnDisableUser.Visible = false;
            }
        }

        protected void btnMakeAdmin_Click(object sender, EventArgs e)
        {
            if (IsAdministrator)
            {
                cn.Open();
                cmd.CommandText = string.Format("INSERT INTO ForumAdministrators (UserID) VALUES ('{0}')", _userID);
                cmd.ExecuteNonQuery();
                cn.Close();
                btnMakeAdmin.Visible = false;
                btnRevokeAdmin.Visible = true;
            }
        }

        protected void btnRevokeAdmin_Click(object sender, EventArgs e)
        {
            if (IsAdministrator)
            {
                cn.Open();
                cmd.CommandText = string.Format("DELETE FROM ForumAdministrators WHERE UserID = '{0}'", _userID);
                cmd.ExecuteNonQuery();
                cn.Close();
                btnRevokeAdmin.Visible = false;
                btnMakeAdmin.Visible = true;
            }
        }
	}