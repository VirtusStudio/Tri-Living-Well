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


public partial class faq : aspnetforum.ForumPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = ForumTitle + " FAQ";
        BindFAQ();
    }
    protected void GVQuestionAnswer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView GVInnerAnswer = (GridView)e.Row.FindControl("GVInnerAnswer");
                if (GVInnerAnswer != null)
                {
                    GVInnerAnswer.DataSource = oUserLib.GetAllFAQsByTopic(DataBinder.Eval(e.Row.DataItem, "StrHeading").ToString());
                    GVInnerAnswer.DataBind();
                }
            }
        }
        catch { }
        finally { oUserLib = null; }


    }


    private void BindFAQ()
    {
        Entity.UserInfo oUserInfo = new Entity.UserInfo();

        BLL.UserLib oUserLib = new BLL.UserLib();
        GVTopics.DataSource = oUserLib.GetAllFAQsTopicsFromFAQ();

        GVTopics.DataBind();
        oUserLib = null;
        oUserInfo = null;
    }


}
