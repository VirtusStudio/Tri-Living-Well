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


public class RegistrationClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public RegistrationClass(SqlConnection objSQLConnection)
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

    public int SaveUserToProgram(string[] MyParameters)
    {
        int rcode = 0;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spReg_PrgRegistration";
            MyCommand.Parameters.AddWithValue("@UserName", MyParameters[0]);
            MyCommand.Parameters.AddWithValue("@FName", MyParameters[1]);
            MyCommand.Parameters.AddWithValue("@MName", MyParameters[2]);
            MyCommand.Parameters.AddWithValue("@LName", MyParameters[3]);
            MyCommand.Parameters.AddWithValue("@Degree", MyParameters[4]);
            MyCommand.Parameters.AddWithValue("@Specialty", MyParameters[6]);
            MyCommand.Parameters.AddWithValue("@Affiliation", MyParameters[7]);
            MyCommand.Parameters.AddWithValue("@Facility", MyParameters[8]);
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
            MyCommand.Parameters.AddWithValue("@PROGRAM_ID", Convert.ToInt32(MyParameters[18]));
            MyCommand.Parameters.AddWithValue("@VENUE_ID", Convert.ToInt32(MyParameters[19]));
            MyCommand.Parameters.AddWithValue("@ISUSER", 0);
            SqlParameter objoutput = new SqlParameter();
            objoutput.ParameterName = "@RCODE";
            objoutput.Direction = ParameterDirection.Output;
            objoutput.DbType = DbType.Int32;
            MyCommand.Parameters.Add(objoutput);

            MyCommand.ExecuteNonQuery();
            rcode = Convert.ToInt32(objoutput.Value);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return rcode;
    }

    public string GET_aspnet_Users(string username)
    {
        string userid="";
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
    
    public DataSet GET_ActivateUserRegistration(string sUserRandomRegCode)
    {
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spReg_GET_ActivateUserRegistration";
            MyCommand.Parameters.AddWithValue("@RANDOM_REG_CODE", sUserRandomRegCode);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }
    
    public DataSet UPDATE_ActivateUserRegistration(string sRndRegCode)
    {
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spReg_UPDATE_ActivateUserRegistration";
            MyCommand.Parameters.AddWithValue("@RND_REG_CODE", sRndRegCode);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }

    public DataSet Get_GetUserMembershipInfo(string sUserId)
    {
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spReg_GET_GetUserMembershipInfo";
            MyCommand.Parameters.AddWithValue("@UserId", sUserId);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }
}