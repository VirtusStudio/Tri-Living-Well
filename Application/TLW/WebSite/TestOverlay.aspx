<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestOverlay.aspx.cs" Inherits="PAL_Recent" %>

<%@ Register Src="~/Controls/UC_EnterActivity_PopUp.ascx" TagName="UC_EnterActivity_PopUp" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>

<%--
    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Grid.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound2.css" rel="stylesheet" type="text/css" />
    Above lines are commented by Netsmartz
--%>
</head>
<body class="body2">

<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table>
        <tr><td colspan="2" align="center" ><asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label> </td></tr>
        <tr>
        <td><span class="subTitle">Recent Activity</span></td>
        <td style="text-align:right;"><a href="javascript:addEntry('');"><img src="<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconPalEntryCreate.gif" /> Add a new Personal Activity Log Entry</a></td>
        </tr>
    </table>
    <br /><br />
    <uc2:UC_EnterActivity_PopUp id="UC_EnterActivity_PopUp1" runat="server"></uc2:UC_EnterActivity_PopUp>
</form>

</body>
</html>
