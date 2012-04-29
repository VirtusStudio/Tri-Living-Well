<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Login_Register.ascx.cs"
    Inherits="UC_Login_Register" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>
<div style="float:left; width:700px;">
 <div style="float:left; width:300px; padding-right:20px;">
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

                                           
                                            <asp:Login runat="server" ID="Login1"  OnLoggedIn="OnLoggedIn" OnLoginError="Login1_LoginError"
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
                                                                <a href="javascript:popUpWin('Login/ForgotPassword.aspx',510,350);">Forgot password</a>
                                                            </td>
                                                            <td style="padding-right: 14px;">
                                                                <asp:LinkButton CssClass="aButtonSmall" ID="LoginButton" runat="server"  CommandName="Login"
                                                                    ValidationGroup="ctl00$Login1" Text="Login"></asp:LinkButton>
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
     <div style="float:left; width:300px;">
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
                                                        New Account
                                                    </td>
                                                    <td style="text-align: right;">
                                                    </td>
                                                </tr>
                                            </table>
                                            <div>
                                                <span class="keyword">Click Below to Registration.</span>
                                            </div>
                                            <br />
                                            <table width="100%">
                                                <tr>
                                                    <td style="padding-right: 4px;">
                                                        <table width="90%" >
                                                            <tr>
                                                                <td align="center" >
                                                                    <a class="aButtonSmall" 
                                                                      href="<%=AppConfig.GetBaseSiteUrl() %>CompanyRegistration.aspx">Company Register</a>
                                                                </td>
                                                                 <td align="center" >
                                                                    <a class="aButtonSmall" href="<%=AppConfig.GetBaseSiteUrl() %>UserRegistration.aspx">User Register</a>
                                                                </td>
                                                            </tr>
                                                        </table>
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
    </div>
</div>
<uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
<%--<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">--%>
    <!--keypress event-->
    <script type="text/javascript">
        function keyPress(e) {
            var keycode;

            if (window.event)
                keycode = window.event.keyCode;
            else if (e)
                keycode = e.which;
            else
                return true;

            if (keycode == 13) {
                var clickbutt = document.getElementById('<%=Login1.FindControl("LoginButton").ClientID %>');
                if (clickbutt) {//because the login button is a link and not a button, just do it's js source code
                    //WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("LoginView1$UC_Login_Register1$Login1$LoginButton", "", true, "ctl00$Login1", "", false, true));
                    //  clickbutt.click();


                    WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("UC_Login_Register1$Login1$LoginButton", "", true, "ctl00$Login1", "", false, true))
                }
                return false;
            }
            else {
                return true;
            }
        }

        function popUpWin(path, x, y) {

            var sURL = '<%=AppConfig.GetBaseSiteUrl() %>' + path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
    </script>
<%--</telerik:RadScriptBlock>--%>
