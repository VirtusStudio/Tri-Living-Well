using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class PopUps_CMSPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnClass objSqlConnClass = new SqlConnClass();
        TextAreaClass objTextAreaClass;
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DSCMS = objTextAreaClass.TxA_Get_TextAreas(Request.QueryString["cmstype"].ToString(), "2");

        try
        {

            if (DSCMS.Tables[0].Rows.Count > 0)//There needs to be at least 1 row
            {
                lblTextAreaHtml.Text = DSCMS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
                lblHeading.Text = DSCMS.Tables[0].Rows[0]["strDefaultName"].ToString();
                #region Insert visited log details

                AppLib.InsertVisitedSectionDetails(lblHeading.Text);

                #endregion
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
}