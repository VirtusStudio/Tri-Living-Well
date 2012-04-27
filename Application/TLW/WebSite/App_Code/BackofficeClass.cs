using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class BackofficeClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    bool debug;

    public BackofficeClass()
    {
        try
        {
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlServer"].ToString();
            MyConnection = new SqlConnection(ConnectionString);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public BackofficeClass(SqlConnection objSqlConnection)
    {
        try
        {
            MyConnection = objSqlConnection;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public SqlConnection sqlconnection
    {
        get
        {
            return MyConnection;
        }
        set
        {

        }
    }

    public SqlConnection OpenConnection()
    {
        try
        {
            MyConnection.Open();
        }
        catch (Exception ex)
        {
            if (debug) HttpContext.Current.Response.Write(ex.Message);
        }
        return MyConnection;
    }

    public bool CloseConnection()
    {
        try
        {
            MyConnection.Close();
            return true;
        }
        catch (Exception ex)
        {
            if (debug) HttpContext.Current.Response.Write(ex.Message);
            return false;
        }
    }


    public DataSet GET_SignatureInfo()
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_SignatureInfo";

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("GET_SignatureInfo - " + ex.Message + "<br />");
        }
        return MyDataSet;
    }

    public DataSet GET_SignatureInfo_BY_SignatureId(string sSignatureID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_SignatureInfo_BY_SignatureId";
            MyCommand.Parameters.AddWithValue("@SIGNATURE_ID", sSignatureID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("GET_SignatureInfo_BY_SignatureId - " + ex.Message + "<br />");
        }
        return MyDataSet;
    }

    /******************************************************************************
    This is get List Item on the basis of Listname from the Database
    *******************************************************************************/

    public DataSet GET_Items_AnyItemTable(string ListName, string TableName)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_Items_AnyItemTable";
            MyCommand.Parameters.AddWithValue("@ListName", ListName);
            MyCommand.Parameters.AddWithValue("@TableName", TableName);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("GET_Items_AnyItemTable - " + ex.Message + "<br />");
        }
        return MyDataSet;
    }

    public DataSet GET_Items_LastNames()
    {
        DataSet MyDataSet = new DataSet();

        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_Items_LastNames";

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }

    public string GET_aspnet_Users(string username)
    {
        string userid = "";
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_aspnet_Users";
            MyCommand.Parameters.AddWithValue("@USERNAME", username);

            userid = MyCommand.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return userid;
    }

    /******************************************************************************
   This is to save the extra information of the user to the database
   *******************************************************************************/

    public void Mem_INSERT_UserInfo(string[] MyParameters)
    {
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            if (MyConnection.State == ConnectionState.Closed)
            {
                MyConnection.Open();
            }



            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_INSERT_UserInfo";

            MyCommand.Parameters.AddWithValue("@UserName", MyParameters[0]);
            MyCommand.Parameters.AddWithValue("@FName", MyParameters[1]);
            MyCommand.Parameters.AddWithValue("@MName", MyParameters[2]);
            MyCommand.Parameters.AddWithValue("@LName", MyParameters[3]);
            MyCommand.Parameters.AddWithValue("@DEGREE_ID", MyParameters[4]);
            MyCommand.Parameters.AddWithValue("@Specialty", MyParameters[6]);
            MyCommand.Parameters.AddWithValue("@Affiliation", MyParameters[7]);
            MyCommand.Parameters.AddWithValue("@Address1", MyParameters[9]);
            MyCommand.Parameters.AddWithValue("@Address2", MyParameters[10]);
            MyCommand.Parameters.AddWithValue("@City", MyParameters[11]);
            MyCommand.Parameters.AddWithValue("@State", MyParameters[12]);
            MyCommand.Parameters.AddWithValue("@Zip", MyParameters[13]);
            MyCommand.Parameters.AddWithValue("@Country", MyParameters[14]);
            MyCommand.Parameters.AddWithValue("@phone", MyParameters[15]);
            MyCommand.Parameters.AddWithValue("@Fax", MyParameters[16]);
            MyCommand.Parameters.AddWithValue("@EmailList", Convert.ToInt32(MyParameters[17]));
            MyCommand.Parameters.AddWithValue("@CreationDate", System.DateTime.Now);
            MyCommand.Parameters.AddWithValue("@RND_REG_CODE", MyParameters[19]);

            MyCommand.Parameters.AddWithValue("@ORGANIZATION", MyParameters[20]);
            MyCommand.Parameters.AddWithValue("@IS_ACCREDITED", MyParameters[21]);

            MyCommand.Parameters.AddWithValue("@YOUR_ROLE_ID", MyParameters[22]);

            MyCommand.Parameters.AddWithValue("@STATE_TEXT", MyParameters[23]);

            MyCommand.Parameters.AddWithValue("@REGISTRATION_FLG", MyParameters[24]);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_CREDITS", MyParameters[25]);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_FROM", MyParameters[26]);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_FROM_RELATIONSHIP_ID", MyParameters[27]);

            MyCommand.Parameters.AddWithValue("@GENDER_ID", MyParameters[28]);
            MyCommand.Parameters.AddWithValue("@FAMILY_STATUS_ID", MyParameters[29]);
            MyCommand.Parameters.AddWithValue("@DATE_BIRTH", MyParameters[30]);

            MyCommand.Parameters.AddWithValue("@HEIGHT", MyParameters[31]);

            MyCommand.ExecuteNonQuery();

            if (MyConnection.State == ConnectionState.Open)
                MyConnection.Close();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    /******************************************************************************
   This is to save the extra information of the user to the database
   *******************************************************************************/

    public void Mem_INSERT_AdminUserInfo(string[] MyParameters)
    {
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            if (MyConnection.State == ConnectionState.Closed)
            {
                MyConnection.Open();
            }



            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_INSERT_AdminUserInfo";

            MyCommand.Parameters.AddWithValue("@UserName", MyParameters[0]);
            MyCommand.Parameters.AddWithValue("@FName", MyParameters[1]);
            MyCommand.Parameters.AddWithValue("@MName", MyParameters[2]);
            MyCommand.Parameters.AddWithValue("@LName", MyParameters[3]);
            MyCommand.Parameters.AddWithValue("@DEGREE_ID", MyParameters[4]);
            MyCommand.Parameters.AddWithValue("@Specialty", MyParameters[6]);
            MyCommand.Parameters.AddWithValue("@Affiliation", MyParameters[7]);
            MyCommand.Parameters.AddWithValue("@Address1", MyParameters[9]);
            MyCommand.Parameters.AddWithValue("@Address2", MyParameters[10]);
            MyCommand.Parameters.AddWithValue("@City", MyParameters[11]);
            MyCommand.Parameters.AddWithValue("@State", MyParameters[12]);
            MyCommand.Parameters.AddWithValue("@Zip", MyParameters[13]);
            MyCommand.Parameters.AddWithValue("@Country", MyParameters[14]);
            MyCommand.Parameters.AddWithValue("@phone", MyParameters[15]);
            MyCommand.Parameters.AddWithValue("@Fax", MyParameters[16]);
            MyCommand.Parameters.AddWithValue("@EmailList", Convert.ToInt32(MyParameters[17]));
            MyCommand.Parameters.AddWithValue("@CreationDate", System.DateTime.Now);
            MyCommand.Parameters.AddWithValue("@RND_REG_CODE", MyParameters[19]);

            MyCommand.Parameters.AddWithValue("@ORGANIZATION", MyParameters[20]);
            MyCommand.Parameters.AddWithValue("@IS_ACCREDITED", MyParameters[21]);

            MyCommand.Parameters.AddWithValue("@YOUR_ROLE_ID", MyParameters[22]);

            MyCommand.Parameters.AddWithValue("@STATE_TEXT", MyParameters[23]);

            MyCommand.Parameters.AddWithValue("@REGISTRATION_FLG", MyParameters[24]);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_CREDITS", MyParameters[25]);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_FROM", MyParameters[26]);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_FROM_RELATIONSHIP_ID", MyParameters[27]);

            MyCommand.Parameters.AddWithValue("@GENDER_ID", MyParameters[28]);
            MyCommand.Parameters.AddWithValue("@FAMILY_STATUS_ID", MyParameters[29]);
            MyCommand.Parameters.AddWithValue("@DATE_BIRTH", MyParameters[30]);

            MyCommand.Parameters.AddWithValue("@HEIGHT", MyParameters[31]);
            MyCommand.Parameters.AddWithValue("@AdminUserTypeId", MyParameters[32]);

            MyCommand.ExecuteNonQuery();

            if (MyConnection.State == ConnectionState.Open)
                MyConnection.Close();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }


    
    public DataSet Mem_GET_UserAssessments_BY_UserId(string sUserId)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_GET_UserAssessments_BY_UserId";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserId);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    public DataSet Mem_INSERT_UserAssessments(string sUserID, string sLevelID, string sAssessmentScore)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_INSERT_UserAssessments";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@LEVEL_ID", sLevelID);
            MyCommand.Parameters.AddWithValue("@ASSESSMENT_SCORE", sAssessmentScore);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    

    /******************************************************************************   
 This is to retreive the extra information of the user to the database
 *******************************************************************************/

    public DataSet Mem_GET_UserInfo(string sUserEmail)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_GET_UserInfo";
            MyCommand.Parameters.AddWithValue("@UserEmail", sUserEmail);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    public DataSet Mem_GET_UserInfo_BY_UserId(string sUserID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_GET_UserInfo_BY_UserId";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    

    public DataSet Mem_GET_UserInfo_BY_AccountFrom(string sAccountFrom, string sRegistrationFlg)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_GET_UserInfo_BY_AccountFrom";
            MyCommand.Parameters.AddWithValue("@ACCOUNT_FROM", sAccountFrom);
            MyCommand.Parameters.AddWithValue("@REGISTRATION_FLG", sRegistrationFlg);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    

    /******************************************************************************   
    This is to Update the extra information of the user to the database
    *******************************************************************************/
    /// <summary>
    /// if password or locked out ='' they don't update themselves
    /// </summary>
    /// <param name="sUserID"></param>
    /// <param name="sPassword"></param>
    /// <param name="sIsLockedOut"></param>
    /// <param name="MyParameters"></param>
    public int Mem_UPDATE_UserInfo(string sUserID, string sPassword, string sIsLockedOut, string[] MyParameters)
    {
        int rcode = 0;
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_UPDATE_UserInfo";

            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@PASSWORD", sPassword);
            MyCommand.Parameters.AddWithValue("@ISLOCKEDOUT", sIsLockedOut);

            MyCommand.Parameters.AddWithValue("@USERNAME", MyParameters[0]);
            MyCommand.Parameters.AddWithValue("@FNAME", MyParameters[1]);
            MyCommand.Parameters.AddWithValue("@MNAME", MyParameters[2]);
            MyCommand.Parameters.AddWithValue("@LNAME", MyParameters[3]);
            
            MyCommand.Parameters.AddWithValue("@ADDRESS1", MyParameters[4]);
            MyCommand.Parameters.AddWithValue("@ADDRESS2", MyParameters[5]);
            MyCommand.Parameters.AddWithValue("@CITY", MyParameters[6]);
            MyCommand.Parameters.AddWithValue("@STATE_ID", MyParameters[7]);
            MyCommand.Parameters.AddWithValue("@ZIP", MyParameters[8]);
            MyCommand.Parameters.AddWithValue("@COUNTRY_ID", MyParameters[9]);
            MyCommand.Parameters.AddWithValue("@PHONE", MyParameters[10]);
            MyCommand.Parameters.AddWithValue("@FAX", MyParameters[11]);

            MyCommand.Parameters.AddWithValue("@DEGREE_ID", MyParameters[12]);
            MyCommand.Parameters.AddWithValue("@SPECIALTY", MyParameters[13]);
            MyCommand.Parameters.AddWithValue("@AFFILIATION", MyParameters[14]);
            //MyCommand.Parameters.AddWithValue("@Facility", MyParameters[8]);
            MyCommand.Parameters.AddWithValue("@EMAIL_LIST_FLG", Convert.ToInt32(MyParameters[15]));

            MyCommand.Parameters.AddWithValue("@YOUR_ROLE_ID", MyParameters[16]);
            MyCommand.Parameters.AddWithValue("@STATE_TEXT", MyParameters[17]);
            MyCommand.Parameters.AddWithValue("@HEIGHT", MyParameters[18]);
            MyCommand.Parameters.AddWithValue("@REGISTRATION_FLG", MyParameters[19]);

            MyCommand.Parameters.AddWithValue("@ACCOUNT_FROM_RELATIONSHIP_ID", MyParameters[20]);
            MyCommand.Parameters.AddWithValue("@GENDER_ID", MyParameters[21]);
            MyCommand.Parameters.AddWithValue("@FAMILY_STATUS_ID", MyParameters[22]);
            MyCommand.Parameters.AddWithValue("@DATE_BIRTH", MyParameters[23]);

            MyCommand.ExecuteNonQuery();
            rcode = 1;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return rcode;
    }

    public void Mem_UPDATE_UserInfo2(string userID, string[] MyParameters)
    {
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_UPDATE_UserInfo2";
            MyCommand.Parameters.AddWithValue("@USERID", userID);
            MyCommand.Parameters.AddWithValue("@UserName", MyParameters[0]);
            MyCommand.Parameters.AddWithValue("@FName", MyParameters[1]);
            MyCommand.Parameters.AddWithValue("@MName", MyParameters[2]);
            MyCommand.Parameters.AddWithValue("@LName", MyParameters[3]);
            MyCommand.Parameters.AddWithValue("@Degree", MyParameters[4]);
            MyCommand.Parameters.AddWithValue("@Specialty", MyParameters[6]);
            MyCommand.Parameters.AddWithValue("@Affiliation", MyParameters[7]);
            MyCommand.Parameters.AddWithValue("@Address1", MyParameters[9]);
            MyCommand.Parameters.AddWithValue("@Address2", MyParameters[10]);
            MyCommand.Parameters.AddWithValue("@City", MyParameters[11]);
            MyCommand.Parameters.AddWithValue("@State", MyParameters[12]);
            MyCommand.Parameters.AddWithValue("@Zip", MyParameters[13]);
            MyCommand.Parameters.AddWithValue("@Country", MyParameters[14]);
            MyCommand.Parameters.AddWithValue("@phone", MyParameters[15]);
            MyCommand.Parameters.AddWithValue("@Fax", MyParameters[16]);
            MyCommand.Parameters.AddWithValue("@EmailList", Convert.ToInt32(MyParameters[17]));
            MyCommand.Parameters.AddWithValue("@LastModified", System.DateTime.Now);

            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    /// Function Header*******************************************************
    /// Function Name: DeleteUserDetails
    /// Function Type: Function
    /// Functionality: used to insert the delete the user details
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    public DataSet DeleteUserDetails(string sUserName, string sRegistrationFlg, string sDeleteFlg)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "ms_DeleteUserDetails";
            MyCommand.Parameters.AddWithValue("@USERNAME", sUserName);
            MyCommand.Parameters.AddWithValue("@REGISTRATION_FLG", sRegistrationFlg);
            MyCommand.Parameters.AddWithValue("@DELETE_FLG", sDeleteFlg);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }


    public DataSet Mem_DELETE_UserInfo(string sUserName, string sRegistrationFlg, string sDeleteFlg)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_DELETE_UserInfo";
            MyCommand.Parameters.AddWithValue("@USERNAME", sUserName);
            MyCommand.Parameters.AddWithValue("@REGISTRATION_FLG", sRegistrationFlg);
            MyCommand.Parameters.AddWithValue("@DELETE_FLG", sDeleteFlg);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }





    /******************************************************************************   
      This is to retreive the password of the user from the database
    *******************************************************************************/

    public DataSet Mem_GET_PASSWORD(string UserEmail)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;



            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spMem_GET_PASSWORD";
            MyCommand.Parameters.AddWithValue("@UserEmail", UserEmail);


            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }


    // --------------------------------------------------------------------------------------------------

    public void CheckLoginStatus()
    {        
        // ----------------------------------------------------------
        // CHECK MEMBERSHIP OBJECT TO SEE IF USER IS LOGGED IN
        // ----------------------------------------------------------

        MembershipUser mu = Membership.GetUser();
        
        if (mu != null)
        {
            // CHECK IF USER IS IN ADMINISTRATOR ROLE
            if (!HttpContext.Current.User.IsInRole("Administrator"))
            {
                //HttpContext.Current.Response.Redirect("/default.aspx");/*Commented by Netsmartz*/
                HttpContext.Current.Response.Redirect(AppConfig.GetBaseSiteUrl() + "default.aspx");
                //HttpContext.Current.Response.Write("aa");
            }
        }
        else
        {
            //HttpContext.Current.Response.Redirect("/default.aspx");/*Commented by Netsmartz*/
            HttpContext.Current.Response.Redirect(AppConfig.GetBaseSiteUrl() + "default.aspx");
            //HttpContext.Current.Response.Write("bb");
        }
        
    }

    // --------------------------------------------------------------------------------------------------

}