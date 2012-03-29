<%--<%@ Page Language="c#" CodeFile="createLog.aspx.cs" AutoEventWireup="True" 
Inherits="aspnetforum.logs"
    ValidateRequest="false" %>
    Commented by Netsmartz for resolving compile time issues and following line is added
    --%>

    <%@ Page Language="c#" CodeFile="createLog.aspx.cs" AutoEventWireup="True" 
Inherits="createLog"
    ValidateRequest="false" %>
    
    
<%--
Commented by Netsmartz for resolving compile time issues
<%@ Register Src="~/Controls/UC_PAL_View.ascx" TagName="UC_PAL_View" TagPrefix="uc1" %>--%>

<%--
Commented by Netsmartz for resolving compile time issues
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>--%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblNotLoggedIn" runat="server" Visible="False" Font-Bold="True" ForeColor="Red"
        meta:resourcekey="lblNotLoggedInResource1">You are not signed in as a member. Please sign in to access your profile.</asp:Label>
    <div id="divMain" runat="server">
        <div>
            <asp:Label ID="lblResult" runat="server" Font-Bold="True" meta:resourcekey="lblResultResource1"></asp:Label></div>
        <table cellspacing="5" cellpadding="5">
            <tr>
                <th colspan="2">
                    <asp:Label ID="lblMyProfile" runat="server" EnableViewState="False" meta:resourcekey="lblPALResource1">New Personal Activity Log</asp:Label>
                </th>
            </tr>
            <tr>
                <td width="20%">
                    <asp:Label ID="lblUsername" runat="server" EnableViewState="False" meta:resourcekey="lblUsernameResource1">Date:</asp:Label>
                </td>
                <td>
                   <%--Commented by Netsmartz for resolving compile time issues
                    <radCln:raddatepicker id="rdpFrom" runat="server" Width="130">
                        <calendar enablerowselectors="False" skin="Custom"></calendar>
                    </radCln:raddatepicker>--%>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" EnableViewState="False">Time:</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlTime" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblHomepage" runat="server" EnableViewState="False">Duration:</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDuration" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLevel" runat="server" EnableViewState="False">Level:</asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlLevel" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblComment" runat="server" EnableViewState="False">Comment:</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbComment" runat="server" TextMode="MultiLine" Rows="3" Width="90%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <asp:Button CssClass="gradientbutton" ID="btnSave" runat="server" Text="Save Log"
                        OnClick="btnSave_Click" meta:resourcekey="btnSaveResource1"></asp:Button>
                </th>
            </tr>
        </table>
        <br />
    </div>
    </form>
</body>
</html>
