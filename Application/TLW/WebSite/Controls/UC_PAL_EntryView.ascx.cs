using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class UC_PAL_EntryView : System.Web.UI.UserControl
{
    int iMaxCommentLength = 22;
    string sLink = "<div onmouseover=\"document.getElementById('#DIV_COMMENT_CLIENTID#').style.display='';\">#TEXT#<br /></div>";

    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            objPALClass = new PALClass(objSqlConnClass.OpenConnection());

            if (Request.QueryString["iddel"] != null)
            {
                objPALClass.PAL_DELETE_PalEntries_BY_PAL_ENTRY_ID(Convert.ToInt32(Request.QueryString["iddel"]));
            }
        }
        catch { }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConnClass.CloseConnection();
    }

    public void populate(DataRow drPalEntry)
    {
        ancDelete.Attributes.Add("onclick", "DeletePAL(" + drPalEntry["PAL_ENTRY_Id"] + ")");
        lblPalEntryDate.Text = Convert.ToDateTime(drPalEntry["PAL_ENTRY_DATE"]).ToString("MM/dd/yyyy");
        lblPalEntryTypeText.Text = drPalEntry["PAL_ENTRY_TYPE_TEXT"].ToString();
        lblPalEntryTimeText.Text = drPalEntry["PAL_ENTRY_TIME_TEXT"].ToString();
        lblPalEntryDurationText.Text = drPalEntry["PAL_ENTRY_DURATION_TEXT"].ToString();
        lblPalEntryIntensityText.Text = drPalEntry["PAL_ENTRY_INTENSITY_TEXT"].ToString();
        lblMetEquivalent.Text = drPalEntry["MET_EQUIVALENT"].ToString();

        string sPalEntryComment = drPalEntry["PAL_ENTRY_COMMENT"].ToString();
        string sPalEntryCommentShort = sPalEntryComment;
        if (sPalEntryCommentShort.Length > iMaxCommentLength)
        {
            sPalEntryCommentShort = sPalEntryCommentShort.Substring(0, iMaxCommentLength) + "...";
        }
        lblPalEntryComment.Text = sPalEntryComment;
        lblPalEntryCommentShort.Text = sLink.Replace("#TEXT#", sPalEntryCommentShort).Replace("#DIV_COMMENT_CLIENTID#", divComment.ClientID);
    }

}
