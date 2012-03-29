<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Login_ForgotPassword" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Forgot Password</title>
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function Init()
{
    window.focus();
}
</script>
</head>
<body onload="Init();" class="body2" style="background-color:#060f1e;"><!--#060f1e;-->
    <form id="form1" runat="server">
<div style="width:460px;">
     <div style="height:40px; margin:0 auto 0 auto;" align="right" >
        <input type="button" style="height:30px;" onclick="javascript:window.close();" class="aButtonSmall" value="Close" />
      </div>
  <div style="background-color:#ffffff;  margin:0 auto 0 auto; padding:7px 7px 7px 7px;">
        <div class="divBorder" >
            <div class="divHeader" style="padding-bottom:3px; border-bottom:solid 1px #b8bdc2; margin-bottom:2px;">Forgot Password</div>
            <table class="tblItems">
                <tr>
                    <td>
                        Enter your email address to receive your password via email.<br />
                        <br />
                        <br />
                        Email Address:<br />
                        <br />
                        <asp:TextBox ID="Email" runat="server" Width="98%"></asp:TextBox><br />
                        <br />
                        <asp:LinkButton class="aButton" ID="SubmitButton" runat="server" OnClick="SubmitButton_Click">Submit</asp:LinkButton><br />
                        <asp:Label ID="FailureText" runat="server" CssClass="required" EnableViewState="False"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                <td class="small">If you are unable to receive email please contact us at <%= System.Configuration.ConfigurationSettings.AppSettings["SITE_PHONE"]%>.</td></tr>
            </table>
        </div>
</div>
</div>
    
        <uc3:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </form>    
</body>
</html>
