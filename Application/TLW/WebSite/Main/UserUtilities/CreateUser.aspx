<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Main_UserUtilities_CreateUser" %>

<%@ Register Src="~/Controls/UC_USER_CreateAccount.ascx" TagName="UC_USER_CreateAccount"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <%--<link rel="stylesheet" type="text/css" href="../../Styles/BGT_Text_Arial.css" /> commented by Netsmartz as this file does not exists in the application but is reference 
        by the Control/US_USER_CreateAccount.ascx
    --%>
    <link href="../../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Grid.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var btnSubmit;
        function init() {
            btnSubmit = document.getElementById('UC_USER_CreateAccount1_CreateUserWizard1___CustomNav0_StepNextButtonButton');
            if (btnSubmit != null) {
                btnSubmit.style.visibility = "hidden";
            }
        }
    </script>
</head>
<body onload="init();" class="body2">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="title">
        Create Account</div>
    <div class="description">
        <uc1:UC_USER_CreateAccount ID="UC_USER_CreateAccount1" USERMODE="true" runat="server" />
        <a class="aButton" id="btnSubmit" runat="server" href="javascript:btnSubmit.click();">
            USE ACCOUNT CREDIT</a>
    </div>
    </form>
</body>
</html>
