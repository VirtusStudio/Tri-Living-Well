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
	/// Summary description for search.
	/// </summary>
    public partial class search : aspnetforum.ForumPage
	{
	
		protected void Page_Load(object sender, System.EventArgs e)
		{
            this.Title += " - " + ForumTitle;
		}

		protected void btnSearch_Click(object sender, System.EventArgs e)
        {
#if TRIAL
            lblNothingFound.Visible = true;
            lblNothingFound.Text = "Sorry, the search engine is not present in the free version.";
            lblNothingFound.ForeColor = Color.Red;
#else
            if (!Page.IsValid) return;

			cmd.Parameters.Clear();
            string searchStr = tbWords.Text.Trim().Replace("'", ""); //injection protection

			string delimStr = " ,";
			char[] delimiters = delimStr.ToCharArray();
            string[] words = searchStr.Split(delimiters);

            if (CurrentUserID == "") //guest user - search in public forums only
            {
                this.cmd.CommandText = "SELECT DISTINCT ForumTopics.TopicID, ForumTopics.Subject " +
                    "FROM ForumMessages INNER JOIN ForumTopics ON ForumMessages.TopicID = ForumTopics.TopicID " +
                    "WHERE ForumTopics.ForumID NOT IN (SELECT DISTINCT ForumID FROM ForumGroupPermissions) ";
            }
            else //search in allowed forums only
            {
                this.cmd.CommandText = "SELECT DISTINCT ForumTopics.TopicID, ForumTopics.Subject " +
                    "FROM ForumMessages INNER JOIN ForumTopics ON ForumMessages.TopicID = ForumTopics.TopicID " +
                    "WHERE (ForumTopics.ForumID NOT IN (SELECT DISTINCT ForumID FROM ForumGroupPermissions) "+
                    "OR ForumTopics.ForumID IN (SELECT DISTINCT ForumID FROM "+
                    "ForumGroupPermissions INNER JOIN ForumUsersInGroup ON ForumUsersInGroup.GroupID=ForumGroupPermissions.GroupID WHERE ForumUsersInGroup.UserID='" + CurrentUserID + "' and ForumGroupPermissions.AllowReading=?)) ";

                aspnetforum.Utils.DB.AddCommandParamaters(ref cmd, true);
            }


			if(rbAll.Checked)
			{
                string criteria = "";
				foreach(string word in words)
					criteria += "ForumMessages.Body LIKE '%" + word +"%' AND ";
				criteria = " AND (" + criteria.Substring(0, criteria.Length - 5) + ")";
                cmd.CommandText += criteria;
			}
			else if(rbExact.Checked)
			{
                cmd.CommandText += " AND (ForumMessages.Body LIKE '%" + searchStr + "%')";
			}
			else if(rbAny.Checked)
			{
                string criteria = "";
				foreach(string word in words)
					criteria += "ForumMessages.Body LIKE '%" + word +"%' OR ";
                criteria = " AND (" + criteria.Substring(0, criteria.Length - 4) + ")";
                cmd.CommandText += criteria;
			}

            if (tbDateFrom.Text != "" && tbDateTo.Text != "")
            {
                cmd.CommandText += " AND ForumMessages.CreationDate>? AND ForumMessages.CreationDate<?";
                aspnetforum.Utils.DB.AddCommandParamaters(ref cmd, DateTime.Parse(tbDateFrom.Text), DateTime.Parse(tbDateTo.Text));
            }
            else
            {
                if (tbDateTo.Text != "")
                {
                    cmd.CommandText += " AND ForumMessages.CreationDate<?";
                    aspnetforum.Utils.DB.AddCommandParamaters(ref cmd, DateTime.Parse(tbDateTo.Text));
                }
                else if (tbDateFrom.Text != "")
                {
                    cmd.CommandText += " AND ForumMessages.CreationDate>?";
                    aspnetforum.Utils.DB.AddCommandParamaters(ref cmd, DateTime.Parse(tbDateFrom.Text));
                }
            }

			//Response.Write(this.cmd.CommandText);
			this.cn.Open();
			DbDataReader dr = this.cmd.ExecuteReader();
			lblNothingFound.Visible = !dr.HasRows;
			this.gridResults.DataSource = dr;
			this.gridResults.DataBind();
			dr.Close();
			this.cn.Close();
			cmd.Parameters.Clear();
#endif
        }

        protected void CustomValidatorDateFrom_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime res;
            args.IsValid = DateTime.TryParse(tbDateFrom.Text, out res);
        }

        protected void CustomValidatorDateTo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime res;
            args.IsValid = DateTime.TryParse(tbDateTo.Text, out res);
        }
	}