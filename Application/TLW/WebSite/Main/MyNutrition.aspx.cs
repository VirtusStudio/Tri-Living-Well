using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Main_MyNutrition : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPersonalSummaryDetails();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("ins"))
                    lblMsg.Text = "Record has been inserted successfully.";
                else if (Request.QueryString["msg"].ToString().Equals("del"))
                    lblMsg.Text = "Record has been deleted successfully.";
                else if (Request.QueryString["msg"].ToString().Equals("up"))
                    lblMsg.Text = "Record has been updated successfully.";


            }

        }



        BindCMSDetails();
    }

    protected void lnkBtnUpdatePersonalSummary_Click(object sender, EventArgs e)
    {
        UpdatePersonalSummaryDetails();
    }

    protected void lnkBtnCalculate_Click(object sender, EventArgs e)
    {
        if (ViewState["isExists"] != null)
        {
            if (ViewState["isExists"].ToString().Equals("0"))
            {
                txtStartWaist.Text = txtWaist.Text;
                txtStartWeight.Text = txtWeight.Text;
                txtStartBMI.Text = AppLib.GetBMI(Convert.ToDecimal(txtWeight.Text), Convert.ToDecimal(txtHeight.Text)).ToString("00.00");
                txtStartBodyFAT.Text = AppLib.GetBodyFATPercentage(ddlGender.SelectedValue,
                                            Convert.ToDecimal(txtWaist.Text),
                                            Convert.ToDecimal(txtHips.Text),
                                            Convert.ToDecimal(txtNeck.Text), Convert.ToDecimal(txtHeight.Text)).ToString("00.00");

                txtStartWaistToHeight.Text = (Convert.ToDecimal(txtHeight.Text) / Convert.ToDecimal(txtWaist.Text)).ToString("00.00");
                txtStartWaistToHips.Text = (Convert.ToDecimal(txtHips.Text) / Convert.ToDecimal(txtWaist.Text)).ToString("00.00");
                txtCurrentWaist.Text = txtWaist.Text;
                txtCurrentWeight.Text = txtWeight.Text;
                txtCurrentBMI.Text = AppLib.GetBMI(Convert.ToDecimal(txtWeight.Text), Convert.ToDecimal(txtHeight.Text)).ToString("00.00");
                txtCurrentBodyFAT.Text = AppLib.GetBodyFATPercentage(ddlGender.SelectedValue,
                                            Convert.ToDecimal(txtWaist.Text),
                                            Convert.ToDecimal(txtHips.Text),
                                            Convert.ToDecimal(txtNeck.Text), Convert.ToDecimal(txtHeight.Text)).ToString("00.00");

                txtCurrentWaistToHeight.Text = (Convert.ToDecimal(txtWaist.Text) / Convert.ToDecimal(txtHeight.Text)).ToString("00.00");
                txtCurrentWaistToHips.Text = (Convert.ToDecimal(txtWaist.Text) / Convert.ToDecimal(txtHips.Text)).ToString("00.00");
            }
            else
            {
                txtCurrentWaist.Text = txtWaist.Text;
                txtCurrentWeightPersonalSummary.Text = txtWeight.Text;
                txtCurrentBMI.Text = AppLib.GetBMI(Convert.ToDecimal(txtWeight.Text), Convert.ToDecimal(txtHeight.Text)).ToString("00.00");
                txtCurrentBodyFAT.Text = AppLib.GetBodyFATPercentage(ddlGender.SelectedValue,
                                            Convert.ToDecimal(txtWaist.Text),
                                            Convert.ToDecimal(txtHips.Text),
                                            Convert.ToDecimal(txtNeck.Text), Convert.ToDecimal(txtHeight.Text)).ToString("00.00");

                txtCurrentWaistToHeight.Text = (Convert.ToDecimal(txtWaist.Text) / Convert.ToDecimal(txtHeight.Text)).ToString("00.00");
                txtCurrentWaistToHips.Text = (Convert.ToDecimal(txtWaist.Text) / Convert.ToDecimal(txtHips.Text)).ToString("00.00");
            }


            txtChangeWaist.Text = AppLib.GetPercentageIncreate(Convert.ToDecimal(txtStartWaist.Text), Convert.ToDecimal(txtCurrentWaist.Text)).ToString("00.00");
            txtChangeWeight.Text = AppLib.GetPercentageIncreate(Convert.ToDecimal(txtStartWeight.Text), Convert.ToDecimal(txtCurrentWeightPersonalSummary.Text)).ToString("00.00");
            txtChangeBMI.Text = AppLib.GetPercentageIncreate(Convert.ToDecimal(txtStartBMI.Text), Convert.ToDecimal(txtCurrentBMI.Text)).ToString("00.00");
            txtChangeBodyFAT.Text = AppLib.GetPercentageIncreate(Convert.ToDecimal(txtStartBodyFAT.Text), Convert.ToDecimal(txtCurrentBodyFAT.Text)).ToString("00.00");
            txtChangeWaistToHeight.Text = AppLib.GetPercentageIncreate(Convert.ToDecimal(txtStartWaistToHeight.Text), Convert.ToDecimal(txtCurrentWaistToHeight.Text)).ToString("00.00");
            txtChangeWaistToHips.Text = AppLib.GetPercentageIncreate(Convert.ToDecimal(txtStartWaistToHips.Text), Convert.ToDecimal(txtCurrentWaistToHips.Text)).ToString("00.00");
        }
    }


    private void UpdatePersonalSummaryDetails()
    {
        BackofficeClass objBackOfficeClass = new BackofficeClass();
        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());
        BLL.PersonalSummaryLib oPersonalSummaryLib = null;
        Entity.PersonalSummaryInfo oPersonalSummaryInfo = null;
        try
        {
            oPersonalSummaryLib = new BLL.PersonalSummaryLib();
            oPersonalSummaryInfo = new Entity.PersonalSummaryInfo();

            oPersonalSummaryInfo.DecBMI = Convert.ToDecimal(txtCurrentBMI.Text);
            oPersonalSummaryInfo.DecBodyFATPercentage = Convert.ToDecimal(txtCurrentBodyFAT.Text);
            oPersonalSummaryInfo.DecWaist = Convert.ToDecimal(txtCurrentWaist.Text);
            oPersonalSummaryInfo.DecWaistToHeight = Convert.ToDecimal(txtCurrentWaistToHeight.Text);
            oPersonalSummaryInfo.DecWaistToHip = Convert.ToDecimal(txtCurrentWaistToHips.Text);
            oPersonalSummaryInfo.DecWeight = Convert.ToDecimal(txtCurrentWeight.Text);
            oPersonalSummaryInfo.DtCreatedOn = DateTime.Now;
            oPersonalSummaryInfo.GuidUserId = new Guid(DS.Tables[0].Rows[0]["USER_ID"].ToString());
            oPersonalSummaryLib.SavePersonalSummaryDetails(oPersonalSummaryInfo);
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Main/MyNutrition.aspx?msg=up");


        }
        catch (Exception ex) { throw ex; }
        finally
        {
            oPersonalSummaryInfo = null;
            oPersonalSummaryLib = null;
            objBackOfficeClass = null;
            DS = null;

        }
    }
    #endregion

    #region User Defined Functions

    /// <summary>
    /// BindDetails() function used to bind all the details that need to be display on the page load.
    /// </summary>
    private void BindCMSDetails()
    {
        SqlConnClass objSqlConnClass = new SqlConnClass();
        TextAreaClass objTextAreaClass;
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DSCMS = objTextAreaClass.TxA_Get_TextAreas("MyNutritionOverview", "2");

        try
        {
            if (DSCMS.Tables[0].Rows.Count > 0)//There needs to be at least 1 row
            {
                if (DSCMS.Tables[0].Rows[0]["TextAreaHTML"].ToString().Length > 900)
                    lblNutritionOverview.Text = DSCMS.Tables[0].Rows[0]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblNutritionOverview.Text = DSCMS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
            }
        }
        catch { }
        finally
        {
            objSqlConnClass.CloseConnection();
            objSqlConnClass = null;
            objTextAreaClass = null;
            DSCMS = null;
        }
    }
    /// <summary>
    /// following function is used to bind the personal summary details.
    /// </summary>
    private void BindPersonalSummaryDetails()
    {
        lblCurrentPersonalSummary.Text = DateTime.Now.ToShortDateString();
        BLL.PersonalSummaryLib oPersonalSummaryLib = null;
        Entity.PersonalSummaryInfo oPersonalSummaryInfo = null;
        BackofficeClass objBackOfficeClass = new BackofficeClass();
        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());
        try
        {
            oPersonalSummaryLib = new BLL.PersonalSummaryLib();
            oPersonalSummaryInfo = new Entity.PersonalSummaryInfo();

            oPersonalSummaryInfo = oPersonalSummaryLib.GetPersonalSummaryDetailsByUserId(new Guid(DS.Tables[0].Rows[0]["USER_ID"].ToString()));
            if (oPersonalSummaryInfo != null)
            {
                ViewState["isExists"] = "1";

                lblStartDatePersonalSummary.Text = oPersonalSummaryInfo.DtModifiedOn.ToShortDateString();
                txtStartWeight.Text = oPersonalSummaryInfo.DecWeight.ToString("00.00");
                txtStartWaistToHips.Text = oPersonalSummaryInfo.DecWaistToHip.ToString("00.00");
                txtStartWaistToHeight.Text = oPersonalSummaryInfo.DecWaistToHeight.ToString("00.00");
                txtStartWaist.Text = oPersonalSummaryInfo.DecWaist.ToString("00.00");
                txtStartBodyFAT.Text = oPersonalSummaryInfo.DecBodyFATPercentage.ToString("00.00");
                txtStartBMI.Text = oPersonalSummaryInfo.DecBMI.ToString("00.00");
            }
            else
                ViewState["isExists"] = "0";
        }
        catch (Exception ex) { throw ex; }
        finally
        {
            oPersonalSummaryLib = null;
            oPersonalSummaryInfo = null;
            objBackOfficeClass = null;
            DS = null;
        }


    }

    #endregion


}