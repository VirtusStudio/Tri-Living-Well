<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Anonymous_Registration_Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Password Reset:</title>

    <%--<link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
  Above lines are commented by Netsmartz  and following lines are added --%>
  <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
</head>
<body onload="top.setIframeHeight();" class="body2">
    <form id="form1" runat="server">     
        
            <div class="title">Update Password</div>
            <div class="description">

            <center class="Round3"><center><center><center><center><center><center><center><center><center>
                <table class="Round3_tblHeader"><tr><td>You must change you password before continuing</td><td style="text-align:right;"></td></tr></table>
                <table class="tblItems">
                    <tr>
                        <td>
                            New Password:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" CssClass="required" 
					        Display="Dynamic" ErrorMessage="*Required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Password (confirm):
                        </td>
                        <td>
                            <asp:TextBox ID="txtPasswordConfirm" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPasswordConfirm" runat="server" ControlToValidate="txtPasswordConfirm" SetFocusOnError="true"
					        CssClass="required" Display="Dynamic" ErrorMessage="*Required"></asp:RequiredFieldValidator>
					    <asp:CompareValidator ID="ComparcvPasswordConfirm" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirm" 
					         SetFocusOnError="true" CssClass="required" Display="Dynamic" ErrorMessage="Password & Confirm Password must match"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="lbSubmit" runat="server" class="aButton" OnClick="lbSubmit_Click">CHANGE PASSWORD</asp:LinkButton>
            </center></center></center></center></center></center></center></center></center></center>
            
            
            </div> 
    </form>
</body>
</html>
