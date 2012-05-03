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

public class UsersClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    // ---------------------------------------------------------------------------------------------

    public UsersClass(SqlConnection objSQLConnection)
    {
        try
        {
            MyConnection = objSQLConnection;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    // ---------------------------------------------------------------------------------------------

    public DataSet USR_Get_GetAllUsers()
    {
        DataSet MyDataSet = new DataSet();

        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_Get_GetAllUsers";
            //MyCommand.Parameters.AddWithValue("@UserEmail", UserEmail);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }

    // ______________________________________________________________________________

    public DataSet USR_GET_GetAllUsers_BackOffice(string sFilterType, string sFilterValue)
    {
        DataSet MyDataSet = new DataSet();

        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_GET_GetAllUsers_BackOffice";

            MyCommand.Parameters.AddWithValue("@FILTER_TYPE", sFilterType);
            MyCommand.Parameters.AddWithValue("@FILTER_VALUE", sFilterValue);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }

    // ______________________________________________________________________________

    public DataSet USR_UPDATE_DeleteUser(string sUserID)
    {
        DataSet MyDataSet = new DataSet();

        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_UPDATE_DeleteUser";

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

    // ______________________________________________________________________________

    public int USR_INSERT_CreateUser(string sProviderKey, string sEmail, string sPassword,
        string sFName, string sMName, string sLName,
        string sDegree, string sSpec, string sAffiliation, int iIsPhysician,
        string sAddr1, string sAddr2, string sCity, string sState, string sZip,
        string sCountry, string sBPhone, string sFax,
        int iEmailList, string sRndRegCode)
    {
        int rcode = 0;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spUSR_INSERT_CreateUser";

            MyCommand.Parameters.AddWithValue("@PROVIDER_KEY", sProviderKey);

            MyCommand.Parameters.AddWithValue("@EMAIL", sEmail);
            MyCommand.Parameters.AddWithValue("@PASSWORD", sPassword);

            MyCommand.Parameters.AddWithValue("@FNAME", sFName);
            MyCommand.Parameters.AddWithValue("@MNAME", sMName);
            MyCommand.Parameters.AddWithValue("@LNAME", sLName);

            MyCommand.Parameters.AddWithValue("@DEGREE", sDegree);
            MyCommand.Parameters.AddWithValue("@SPECIALTY", sSpec);
            MyCommand.Parameters.AddWithValue("@AFFILIATION", sAffiliation);
            MyCommand.Parameters.AddWithValue("@IS_PHYSICIAN", iIsPhysician);

            MyCommand.Parameters.AddWithValue("@ADDR1", sAddr1);
            MyCommand.Parameters.AddWithValue("@ADDR2", sAddr2);
            MyCommand.Parameters.AddWithValue("@CITY", sCity);
            MyCommand.Parameters.AddWithValue("@STATE", sState);
            MyCommand.Parameters.AddWithValue("@ZIP", sZip);
            MyCommand.Parameters.AddWithValue("@COUNTRY", sCountry);
            MyCommand.Parameters.AddWithValue("@BUSINESS_PHONE", sBPhone);
            MyCommand.Parameters.AddWithValue("@FAX", sFax);
            MyCommand.Parameters.AddWithValue("@EMAIL_LIST", iEmailList);

            MyCommand.Parameters.AddWithValue("@RND_REG_CODE", sRndRegCode);

            MyCommand.Parameters.AddWithValue("@DATE_CREATED", DateTime.Now.ToShortDateString());
            MyCommand.Parameters.AddWithValue("@DATE_LASTMODIFIED", DateTime.Now.ToShortDateString());



            MyCommand.Parameters.Add("@retVal", SqlDbType.Int);
            MyCommand.Parameters["@retVal"].Direction = ParameterDirection.Output;

            MyCommand.ExecuteNonQuery();

            rcode = Convert.ToInt32(MyCommand.Parameters["@retVal"].Value);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
            rcode = -1;
        }

        return rcode;
    }

    // ______________________________________________________________________________

    public DataSet USR_GET_GetUserInfo(string sUserId)
    {
        DataSet MyDataSet = new DataSet();

        try
        {
            SqlCommand MyCommand = new SqlCommand();

            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_GET_GetUserInfo";
            MyCommand.Parameters.AddWithValue("@UserId", sUserId);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }                                                                                                                                                           
        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }

    // ______________________________________________________________________________

    public string USR_GET_UserPasswordFromEmail(string sUserEmail)
    {
        string sPassword = "";

        try
        {
            SqlCommand MyCommand = new SqlCommand();

            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_GET_UserPasswordFromEmail";

            MyCommand.Parameters.AddWithValue("@UserEmail", sUserEmail);

            sPassword = MyCommand.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write("USR_GET_UserPasswordFromEmail - " + ex.Message);
        }

        return sPassword;
    }

    // ______________________________________________________________________________

    public int USR_UPDATE_EditUser(string sUserId, string sFname, string sMname, string sLname)
    {
        int rcode = 0;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spUSR_UPDATE_EditUser";

            MyCommand.Parameters.AddWithValue("@USER_ID", sUserId);
            MyCommand.Parameters.AddWithValue("@FNAME", sFname);
            MyCommand.Parameters.AddWithValue("@MNAME", sMname);
            MyCommand.Parameters.AddWithValue("@LNAME", sLname);

            MyCommand.Parameters.Add("@retVal", SqlDbType.Int);
            MyCommand.Parameters["@retVal"].Direction = ParameterDirection.Output;

            MyCommand.ExecuteNonQuery();

            rcode = Convert.ToInt32(MyCommand.Parameters["@retVal"].Value);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
            rcode = -1;
        }

        return rcode;
    }

    // ______________________________________________________________________________

    public int USR_GET_CheckIfUserExistsByEmail(string sEmail)
    {
        int rcode = 0;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spUSR_GET_CheckIfUserExistsByEmail";

            MyCommand.Parameters.AddWithValue("@EMAIL", sEmail);

            MyCommand.Parameters.Add("@retVal", SqlDbType.Int);
            MyCommand.Parameters["@retVal"].Direction = ParameterDirection.Output;

            MyCommand.ExecuteNonQuery();

            rcode = Convert.ToInt32(MyCommand.Parameters["@retVal"].Value);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
            rcode = -1;
        }

        return rcode;
    }

    // ______________________________________________________________________________

    public string USR_GET_GetUserNameFromProviderKey(string sProviderKey)
    {
        string sUsername = "";

        try
        {
            SqlCommand MyCommand = new SqlCommand();

            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_GET_GetUserNameFromProviderKey";

            MyCommand.Parameters.AddWithValue("@PROVIDER_KEY", sProviderKey);

            sUsername = MyCommand.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write("USR_GET_UserPasswordFromEmail - " + ex.Message);
        }

        return sUsername;
    }

    // ______________________________________________________________________________

    public string USR_GET_GetFirstNameLastNameFromProviderKey(string sProviderKey)
    {
        DataSet MyDataSet = new DataSet();
        string sFullname = "";

        try
        {
            SqlCommand MyCommand = new SqlCommand();

            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_GET_GetFirstNameLastNameFromProviderKey";

            MyCommand.Parameters.AddWithValue("@PROVIDER_KEY", sProviderKey);


            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

            string sTmpFNAME = MyDataSet.Tables[0].Rows[0]["FNAME"].ToString();
            string sTmpLNAME = MyDataSet.Tables[0].Rows[0]["LNAME"].ToString();

            sFullname = sTmpFNAME + " " + sTmpLNAME;
        }
        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write("USR_GET_UserPasswordFromEmail - " + ex.Message);
        }

        return sFullname;
    }

    // ______________________________________________________________________________

    public int USR_GET_GetUserGroupIDFromProviderKey(string sProviderKey)
    {
        int iUserGroupID = 0;

        try
        {
            SqlCommand MyCommand = new SqlCommand();

            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spUSR_GET_GetUserGroupIDFromProviderKey";

            MyCommand.Parameters.AddWithValue("@PROVIDER_KEY", sProviderKey);

            iUserGroupID = Convert.ToInt16(MyCommand.ExecuteScalar().ToString());
        }
        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write("USR_GET_UserPasswordFromEmail - " + ex.Message);
        }

        return iUserGroupID;
    }

    // ______________________________________________________________________________

    public bool USR_ValidateInvite(int inviteID)
    {

        try
        {
            SqlCommand MyCommand = new SqlCommand(); 
            MyCommand.Connection = MyConnection;
            MyCommand.CommandText = "spValidateInviteId";
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.Parameters.AddWithValue("@iid", inviteID);
            var returnParameter = MyCommand.Parameters.Add("@ReturnVal", SqlDbType.SmallInt);
            returnParameter.Direction = ParameterDirection.ReturnValue;
            MyCommand.ExecuteNonQuery();
            if (Convert.ToBoolean(returnParameter.Value) == false)
                return false;
            else
                return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public DataSet USR_GetInviteCompany(int inviteID)
    {
        DataSet MyDataSet = new DataSet();

        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spGetCompanyFromInviteId";

            MyCommand.Parameters.AddWithValue("@inviteid", inviteID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
            return null;
        }

        return MyDataSet;
    }

    // ______________________________________________________________________________
}