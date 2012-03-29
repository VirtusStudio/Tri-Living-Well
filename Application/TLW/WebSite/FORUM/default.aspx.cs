using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.Common;

/// <summary>
/// Summary description for forums.
/// </summary>
public partial class forums : aspnetforum.ForumPage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {

        if (Membership.GetUser() == null)
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        DataSet ds = new DataSet();
        ds.Tables.Add("ForumGroups");
        ds.Tables.Add("Forums");
        DbDataAdapter da = providerFactory.CreateDataAdapter();
        da.SelectCommand = this.cmd;

        this.cn.Open();
        this.cmd.CommandText = "SELECT DISTINCT ForumGroups.GroupID, ForumGroups.GroupName, ForumGroups.GroupSortOrder FROM ForumGroups INNER JOIN Forums ON ForumGroups.GroupID = Forums.GroupID ORDER BY ForumGroups.GroupSortOrder";
        da.Fill(ds.Tables[0]);

        string strSQLAllowedForums = "SELECT ForumGroupPermissions.ForumID FROM " +
            "ForumUsersInGroup INNER JOIN ForumGroupPermissions ON ForumUsersInGroup.GroupID = ForumGroupPermissions.GroupID " +
            "WHERE ForumUsersInGroup.UserID=convert(uniqueidentifier, ?) AND ForumGroupPermissions.AllowReading=?"; //query select allowed forums

        this.cmd.CommandText =
            "SELECT Forums.ForumID, Forums.Title, Forums.Description, Count(ForumTopics.TopicID) AS Topics, Forums.GroupID, MAX(ForumTopics.LastMessageID) as LatestMessageID " +
            "FROM (Forums LEFT OUTER JOIN ForumTopics ON Forums.ForumID=ForumTopics.ForumID) " +
            //"LEFT OUTER JOIN ForumMessages ON ForumTopics.LastMessageID = ForumMessages.MessageID " +
            "WHERE Forums.ForumID NOT IN (SELECT SubForumID FROM ForumSubforums)" + //not a subforum
            "AND (Forums.ForumID NOT IN (SELECT ForumID FROM ForumGroupPermissions WHERE AllowReading=?) OR Forums.ForumID IN (" + strSQLAllowedForums + ")) " + //not a private forum
            "GROUP BY Forums.ForumID, Forums.Title, Forums.Description, Forums.GroupID, Forums.OrderByNumber " +
            "ORDER BY Forums.OrderByNumber";

        aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, true, Membership.GetUser().ProviderUserKey.ToString(), true);
        da.Fill(ds.Tables[1]);
        ds.Relations.Add(new DataRelation("ForumGroupsForums", ds.Tables[0].Columns["GroupID"], ds.Tables[1].Columns["GroupID"]));

        this.rptGroupsList.DataSource = ds.Tables[0];
        this.rptGroupsList.DataBind();

        this.cn.Close();

        rptGroupsList.Visible = (rptGroupsList.Items.Count != 0);
        lblNoForums.Visible = (rptGroupsList.Items.Count == 0);

        this.Title = ForumTitle;

    }

    protected void rptGroupsList_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater nestedRepeater = e.Item.FindControl("rptForumsList") as Repeater;
            DataRowView dv = e.Item.DataItem as DataRowView;
            nestedRepeater.DataSource = dv.CreateChildView("ForumGroupsForums");
            nestedRepeater.DataBind();
        }
    }

}
