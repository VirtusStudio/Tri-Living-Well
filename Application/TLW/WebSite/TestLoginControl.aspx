<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestLoginControl.aspx.cs"
    Inherits="TestLoginControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
</head>
<body>
    <form id="form1" runat="server">
    <div style="display:none;">
        <div>
            <center class="Round4">
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <table class="Round4_tblHeader">
                                                        <tr>
                                                            <td>
                                                                Login
                                                            </td>
                                                            <td style="text-align: right;">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:Login runat="server" ID="Login1" OnLoggedIn="OnLoggedIn" OnLoginError="Login1_LoginError"
                                                        DestinationPageUrl="login/login_success.aspx">
                                                        <LayoutTemplate>
                                                            <span class="required">
                                                                <asp:Literal runat="server" ID="FailureText" EnableViewState="False">
                                                                </asp:Literal>
                                                            </span>
                                                            <table class="tblItems">
                                                                <tr>
                                                                    <td>
                                                                        <span class="keyword">Username:</span>&nbsp;
                                                                    </td>
                                                                    <td style="white-space: nowrap;">
                                                                        <asp:TextBox runat="server" ID="UserName" onkeypress="return keyPress(event);" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" Display="Static"
                                                                            ValidationGroup="ctl00$Login1" ID="UserNameRequired" ErrorMessage="*" CssClass="required"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <span class="keyword">Password:</span>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox runat="server" Enabled="true" ID="Password" onkeypress="return keyPress(event);"
                                                                            TextMode="Password" Width="150px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="Password"
                                                                            Display="Static" ValidationGroup="ctl00$Login1" ID="PasswordRequired" CssClass="required">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td colspan="3">
                                                                        <asp:CheckBox ID="cbRememberMe" runat="server" CssClass="small" Text="&nbsp;Remember Me" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table class="tblItems" style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 100%;">
                                                                        <a href="javascript:top.popUpWin('../../Login/ForgotPassword.aspx',510,350);">Forgot
                                                                            password</a>
                                                                    </td>
                                                                    <td style="padding-right: 14px;">
                                                                        <asp:LinkButton CssClass="aButton" ID="LoginButton" runat="server" Width="60" CommandName="Login"
                                                                            ValidationGroup="ctl00$Login1">Login</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </LayoutTemplate>
                                                    </asp:Login>
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
        </div>
    </div>
    </form>
</body>
</html>
  <script language="javascript" type="text/javascript">
      document.getElementById('Login1_LoginButton').click();
    </script>