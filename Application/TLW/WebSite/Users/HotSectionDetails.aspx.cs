using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_HotSectionDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindHotSection();
    }
    private void BindHotSection()
    {
        BLL.HotSectionDetailsLib oHotSectionDetailsLib = null;

        try
        {
            oHotSectionDetailsLib = new BLL.HotSectionDetailsLib();

            dlHotLinks.DataSource = oHotSectionDetailsLib.GetAllHotSections();
            dlHotLinks.DataBind();

        }
        catch (Exception ex) { throw ex; }
        finally
        {
            oHotSectionDetailsLib = null;
        }
    }
}