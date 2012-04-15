/* ResendInvite.aspx.cs
 * David K. Bowers 04/10/2012
 * Displays form so that a user can request a resend of their company invite email that contains
 * the registration link.  If the user comes into the site and clicks the register button they
 * are taken to this page.
 */

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;

public partial class ResendInvite : System.Web.UI.Page
{
    protected System.Web.UI.WebControls.TextBox textEmailAddress;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void CheckEmail(object source, ServerValidateEventArgs arguments)
    {
        using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlServer"].ToString()))
        using (SqlCommand cmd = conn.CreateCommand())
        {
            string email = arguments.Value.ToString();
            cmd.CommandText = "spValidateInviteEmailAddress";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", email);
            var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.SmallInt);
            returnParameter.Direction = ParameterDirection.ReturnValue;
            conn.Open();
            cmd.ExecuteNonQuery();
            if(Convert.ToBoolean(returnParameter.Value) == false)
                arguments.IsValid = false;
            else
                arguments.IsValid = true;
        }
    }

    public void ResendEmailClick(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int inviteID = 0;


            DataSet MyDataSet = new DataSet();
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SqlServer"].ToString()); ;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spGetInvite";
            MyCommand.Parameters.AddWithValue("@email", this.EmailAddress.Text.Trim());

            SqlDataAdapter MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            inviteID = (int)MyDataSet.Tables[0].Rows[0]["intCompanyRequestedUsersListId"];

            string resendUrl = AppConfig.GetBaseSiteUrl() + "UserRegistration.aspx?iid=" + inviteID.ToString();
            string strContent = "Please click this link to register for Tri-Living-Well./r/n" + resendUrl;
            AppLib.SendMailToUser(EmailAddress.Text.Trim(), "Your Tri-Living-Well Invitation", strContent, AppConfig.GetAdminEmail());
        }
    }
}