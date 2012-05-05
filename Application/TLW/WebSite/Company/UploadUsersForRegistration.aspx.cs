using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;
public partial class Company_UploadUsersForRegistration : System.Web.UI.Page
{
    string strpath = string.Empty;
    int intLoggedUserId = 0;
    BLL.CompanyManager oCompanyManager;
    protected void Page_Load(object sender, EventArgs e)
    {
        //HttpContext.Current.Session["intLoggedUserId"] = "1";

        /*  DateTime dtTodayDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"));
          DateTime dtBDate = Convert.ToDateTime("01/23/1983");
          TimeSpan ts = dtTodayDate - dtBDate;
          Response.Write(ts.Days.ToString());*/

        if (!AppLib.IsLoggedinSessionExists())
        {
            lblMsg.Text = "Your session has been expired. Please login again";
            return;
        }
            else
            lblMsg.Text = "";



        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Upload Users for Registration");

            #endregion
        }


        strpath = Request.PhysicalApplicationPath + AppConfig.GetCompanyRequestExcelUploadPath() + AppLib.GetLoggedInUserId().ToString();
        intLoggedUserId = AppLib.GetLoggedInUserId();

        trGVGridRecords.Visible = false;

    }

    protected void lntBtnDownload_Click(object sender, EventArgs e)
    {
        Response.ContentType = "application/ms-excel";
        Response.AddHeader("content-disposition", "inline; filename=UserRequestTemplate.xls");
        Response.TransmitFile(Server.MapPath(@"../Downloadable/UserRequestTemplate.xls"));
        Response.Flush();
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            if (fuUser.HasFile)
            {
                strpath = Request.PhysicalApplicationPath + AppConfig.GetCompanyRequestExcelUploadPath() + AppLib.GetLoggedInUserId().ToString();

                CreateCompanyDirectory();
                string strFileName = DateTime.Now.ToString("MMddyyyyHHmmss");

                strFileName = AppLib.UploadCompanyExcelForUserRegRequest(ref fuUser, strFileName, strpath + "\\");
                // Response.Write(strpath + "//" + strFileName + "<br />");
                ViewState["strFilePath"] = strpath + "/" + strFileName;
                ReadXML();
                // Bind the data to the GridView
            }
            else
            {
                lblMsg.Text = "<br /><br />Please select the file for upload.<br /><br /><br />";
            }
        }
        catch { lblMsg.Text = "<br /><br />Invalid file/Content. Please download the template and please fill the details very carefully.<br /><br />"; }
    }


    private void ReadXML()
    {
        if (ViewState["strFilePath"] != null)
        {
            string strFileName = ViewState["strFilePath"].ToString();
            strFileName = strFileName.Replace(@"/", @"\");
            DataSet ds = ReadXmlAndReturnDataset(strFileName, "Sheet1");
            gvRequestedUser.DataSource = ds.Tables[0].DefaultView;
            gvRequestedUser.DataBind();
            if (gvRequestedUser.Rows.Count > 0)
            {
                trGVGridRecords.Visible = true;
            }
            else
            {
                trGVGridRecords.Visible = false;
            }
        }
    }

    private DataSet ReadXmlAndReturnDataset(string strFilePath, string strSheetName)
    {
        string connString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strFilePath + ";Extended Properties=Excel 8.0";
        // Create the connection object
        OleDbConnection oledbConn = new OleDbConnection(connString);
        OleDbDataAdapter oleda = new OleDbDataAdapter();

        try
        {
            oledbConn.Open();


            // Create OleDbCommand object and select data from worksheet Sheet1
            OleDbCommand cmd = new OleDbCommand("SELECT * FROM [" + strSheetName + "$]", oledbConn);

            // Create new OleDbDataAdapter

            oleda.SelectCommand = cmd;

            // Create a DataSet which will hold the data extracted from the worksheet.
            DataSet ds = new DataSet();

            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(ds, "Employees");
            cmd.Dispose();

            return ds;
        }
        catch (Exception ex)
        {
            FileInfo fi = new FileInfo(strFilePath);
            if (fi.Exists)
            {
                fi.Delete();
            }


            throw ex;
        }
        finally
        {

            oledbConn.Close();
            oleda.Dispose();
            oledbConn.Dispose();
        }
    }

    private void CreateCompanyDirectory()
    {
        DirectoryInfo drInfo = new DirectoryInfo(strpath);
        if (!drInfo.Exists)
        {
            drInfo.Create();
        }
    }
    protected void gvRequestedUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string strTemp = DataBinder.Eval(e.Row.DataItem, "EmployeeFirstName").ToString();
            if (DataBinder.Eval(e.Row.DataItem, "EmployeeCode").ToString().Equals(string.Empty)
                || DataBinder.Eval(e.Row.DataItem, "EmployeeFirstName").ToString().Equals(string.Empty)
                || DataBinder.Eval(e.Row.DataItem, "EmployeeLastName").ToString().Equals(string.Empty)
                || DataBinder.Eval(e.Row.DataItem, "EmployeeEmail").ToString().Equals(string.Empty)
                )
            {
                e.Row.Style.Add("background-color:", "red");
            }
        }
    }

    protected void btnSaveRecord_Click(object sender, EventArgs e)
    {
        //date of birth should be mm/dd/yyyy
        
        List<Entity.CompanyInfo> oListCompanyInfo = new List<Entity.CompanyInfo>();
        Entity.CompanyInfo oCompanyInfo;
        /*
        foreach (GridViewRow gvr in gvRequestedUser.Rows)
        {
            Label lblEmpDateofBirth = (Label)gvr.FindControl("lblEmpDateofBirth");
            if (!lblEmpDateofBirth.Text.Equals(string.Empty))
            {
                if (!AppLib.isValidDate(lblEmpDateofBirth.Text))
                {
                    lblMsg.Text = lblMsg.Text + " Invalid Date->" + lblEmpDateofBirth.Text + ".<br /> Please upload the document again. <br />";
                    return;
                }
            }
        }*/

        string[] strEmailArray = new string[gvRequestedUser.Rows.Count];
        int i = 0;
        foreach (GridViewRow gvr in gvRequestedUser.Rows)
        {
            Label lblEmpEmail = (Label)gvr.FindControl("lblEmpEmail");
            if (lblEmpEmail != null && lblEmpEmail.Text != string.Empty)
            {
                strEmailArray[i] = lblEmpEmail.Text;
                i = i + 1;
            }
        }


        oCompanyManager = new BLL.CompanyManager();
        if (!oCompanyManager.IsEmailIdExists(strEmailArray))
        {
            oCompanyManager = null;
            lblMsg.Text = "<br /><br/>Please check the email addresses.  Multiple entries are not allowed.";
            ReadXML();
            return;
        }


        oCompanyManager = null;
        try
        {
            foreach (GridViewRow gvr in gvRequestedUser.Rows)
            {
                //Label lblEmpDateofBirth = (Label)gvr.FindControl("lblEmpDateofBirth");

                //if (lblEmpDateofBirth != null && lblEmpDateofBirth.Text != string.Empty)
                //{
                    Label lblEmpCode = (Label)gvr.FindControl("lblEmpCode");
                    Label lblEmpfName = (Label)gvr.FindControl("lblEmpfName");
                    Label lblEmpMName = (Label)gvr.FindControl("lblEmpMName");
                    Label lblEmpLName = (Label)gvr.FindControl("lblEmpLName");
                    Label lblEmpEmail = (Label)gvr.FindControl("lblEmpEmail");

                    //Label lblEmpRelationshipCode = (Label)gvr.FindControl("lblEmpRelationshipCode");
                    //Label lblEmpFamilyStatus = (Label)gvr.FindControl("lblEmpFamilyStatus");
                    //Label lblEmpGender = (Label)gvr.FindControl("lblEmpGender");
                    //Label lblEmpPhoneORCellNumber = (Label)gvr.FindControl("lblEmpPhoneORCellNumber");

                    oCompanyInfo = new Entity.CompanyInfo();
                    oCompanyInfo.IntCompanyId = AppLib.GetLoggedInUserId();
                    oCompanyInfo.StrEmployeeAddress = "";

                    oCompanyInfo.StrEmpCode = lblEmpCode.Text.Trim();
                    oCompanyInfo.StrEmpFirstName = lblEmpfName.Text.Trim();
                    oCompanyInfo.StrEmpLastName = lblEmpLName.Text.Trim();
                    oCompanyInfo.StrEmpMiddleName = lblEmpMName.Text.Trim();
                    oCompanyInfo.StrEmpEmail = lblEmpEmail.Text.Trim();
                    //oCompanyInfo.StrEmpRelationShipCode = lblEmpRelationshipCode.Text;
                    //oCompanyInfo.StrEmpFamilyStatus = lblEmpFamilyStatus.Text;
                    //oCompanyInfo.StrEmpGender = lblEmpGender.Text;
                    //oCompanyInfo.StrEmpPhoneORCell = lblEmpPhoneORCellNumber.Text;


                    //string strTemp = lblEmpDateofBirth.Text.Trim().Substring(0, 10);
                    //oCompanyInfo.DtEmpDateofBirth = Convert.ToDateTime(strTemp);
                    oCompanyInfo.ChrStatus = 'I';
                    oCompanyInfo.DtCreatedDate = DateTime.Now;

                    oListCompanyInfo.Add(oCompanyInfo);
                    oCompanyInfo = null;
                    //strTemp = null;
                //}
            }
        }
        catch { }

        try
        {
            if (oListCompanyInfo.Count > 0)
            {
                oCompanyManager = new BLL.CompanyManager();
                oCompanyManager.SaveRequestCompanyForUserRegistration(oListCompanyInfo);
                oCompanyManager = null;
                SendUserRegistrationEmailtoAdmin();
                lblMsg.Text = "<br /><br />Your request has been successfully sent to TLW.<br /><br /><br />";
            }
        }
        catch {

            lblMsg.Text = "<br /><br />There was an error with your request.  Please contact TLW directly.<br /><br /><br />";
        }
        oCompanyInfo = null;

        oListCompanyInfo = null;
    }

    protected string GetDateOfBirth(string strDOB)
    {
        try
        {
            if (String.IsNullOrEmpty(strDOB))
            {
                return string.Empty;
            }
            else
            {
                if (strDOB.Length > 11)
                    return strDOB.Substring(0, 10);
                else
                    return strDOB;
            }
        }
        catch { return ""; }
    }

    private void SendUserRegistrationEmailtoAdmin()
    {
        try
        {
            Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
            oCompanyManager = new BLL.CompanyManager();
            oCompanyInfo = oCompanyManager.GetCompanyDetailsById(intLoggedUserId);
            if (oCompanyInfo != null)
            {
                string strContent = string.Empty;
                BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
                strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("UserRegistrationRequestByCompany").TextAreaHTML;
                strContent = strContent.Replace("[CompanyName]", oCompanyInfo.StrCompanyName.Trim());
                strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
                strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());

                AppLib.SendMailToUser(AppConfig.GetAdminEmail(), "User Registration Request from Company", strContent, AppConfig.GetAdminEmail());
                oTemplateLib = null;
            }


            oCompanyInfo = null;

            oCompanyManager = null;
        }
        catch { }
    }
}