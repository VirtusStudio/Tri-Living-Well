using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Temp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
 //       Temp2.Temp3 obj = new Temp2.Temp3();

        if (!IsPostBack)
            ViewState["i"] = "1";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //for (int i = 0; i < Convert.ToInt32(ViewState["i"]); i++)
        //{
        //    FileUpload dynamicLabel = new FileUpload();

        //    // Set some properties...
        //    dynamicLabel.ID = "Label_" + ViewState["i"].ToString();

        //    // If not the first control, add a line break...
        //    if (this.phFileUpload.Controls.Count > 0)
        //        this.phFileUpload.Controls.Add(new LiteralControl("<br>"));

        //    // Add the Control to a PlaceHolder...
        //    this.phFileUpload.Controls.Add(dynamicLabel);
        //    ViewState["i"] = Convert.ToString(Convert.ToInt32(ViewState["i"]) + 1);
        //}
    }



}

//public abstract class Temp2
//{
//    public void ACBTest2()
//    {

//    }
//    public sealed class Temp3
//    {
//        public void ACBTest()
//        {

//        }

//    }
//}

//public class ABCTest : Temp2
//{
  
//    ABCTest();
//}