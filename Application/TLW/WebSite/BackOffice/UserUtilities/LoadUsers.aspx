<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoadUsers.aspx.cs" Inherits="Administrator_UserUtilities_LoadUsers" %>

<%--
Commented by Netsmartz for resolving compile time issues
<%@ Register Src="../../Controls/UC_Navigation_SiteMap.ascx" TagName="UC_Navigation_SiteMap" TagPrefix="uc3" %>--%>
<%@ Register Src="../../Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog"
    TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <%--<link href="../../Styles/Main.css" rel="stylesheet" type="text/css" />
    Above linve line is commented by Netsmartz--%>
</head>
<body>
    <form id="form1" runat="server">
    <%--Commented by Netsmartz for resolving compile time issues
<uc3:UC_Navigation_SiteMap ID="UC_Navigation_SiteMap1" runat="server" />--%>
    <table class="tblBoHeader">
        <tr>
            <td>
                <img src="../../images/icons/iconCreateUser.gif" />Load Users
            </td>
            <td style="text-align: right;">
            </td>
        </tr>
    </table>
    <asp:Label ID="lbl_Error" runat="server" CssClass="txt_A_14-Red-B" Visible="true"
        Width="100px"></asp:Label>
    <br />
    <br />
    <div style="text-align: left;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Users" OnClick="btnSubmit_Click" />
    </div>
    <br />
    <br />
    <asp:Label ID="lblResult" runat="server" CssClass="txt_A_14-Red-B" Visible="true"
        Width="100px"></asp:Label>
    <br />
    <div class="divBoSubtitle" style="visibility: hidden">
        Accounts Created!</div>
    <uc2:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </form>
</body>
</html>
