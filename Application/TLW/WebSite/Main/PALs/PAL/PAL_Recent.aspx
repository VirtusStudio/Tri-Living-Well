<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PAL_Recent.aspx.cs" Inherits="PAL_Recent" %>

<%@ Register Src="~/Controls/UC_PAL_PalEntries_PopUp.ascx" TagName="UC_PAL_PalEntries_PopUp" TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_PAL_EntryView.ascx" TagName="UC_PAL_EntryView" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
    
    <br />
    
    <table>
    <tr>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView1" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView2" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView3" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView4" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView5" runat="server"></uc1:UC_PAL_EntryView></td>
    </tr>
    <tr>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView6" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView7" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView8" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView9" runat="server"></uc1:UC_PAL_EntryView></td>
        <td style="width:20%;"><uc1:UC_PAL_EntryView id="UC_PAL_EntryView10" runat="server"></uc1:UC_PAL_EntryView></td>
    </tr>
    </table>
    
    <br />
      
        <uc2:UC_PAL_PalEntries_PopUp id="UC_PAL_PalEntries_PopUp1" runat="server"></uc2:UC_PAL_PalEntries_PopUp>
    

        
    </form>
</body>
</html>
