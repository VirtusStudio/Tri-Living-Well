<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMSPopup.aspx.cs" Inherits="PopUps_CMSPopup" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CMS Popup</title>
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound5.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
     <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>

        <tr><td>
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
                                                           <asp:Label ID="lblHeading" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="text-align: right;">
                                                        <a href='#' onclick="javascript:window.close();"  style="color:Blue;" >Close</a>
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
        </td></tr>


            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTextAreaHtml" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
