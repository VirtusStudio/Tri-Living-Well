<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCategoryGuideLines.aspx.cs"
    Inherits="Welcome_Content_ViewCategoryGuideLines" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   
    <div style="width: 100%;">
        <center class="Round5">
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <table class="Round5_tblHeader">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblHeading" Text="In Progress" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="text-align: right;">
                                                         
              
                                                        </td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                </center>
            </center>
        </center>
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table>
                <tr>
                    <td>
                        <asp:Literal ID="ltContent" runat="server"></asp:Literal>

                        Contents Waiting from Client
                    </td>
                    <td valign="top" align="right">  <input  style="height:30px;" type="button" class="aButtonSmall" value="Close" onclick="javascript:window.close();" />
          
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
