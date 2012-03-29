<%@ Page Language="C#" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
    <div class="location">
		<b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblUsers" runat="server" EnableViewState="False" meta:resourcekey="lblUsersResource1">Users</asp:Label></b></div>

    <asp:Repeater id="rptRecent" runat="server" EnableViewState="false">
        <HeaderTemplate><table style="float:left;margin-right:20px;"><tr><th><asp:Label ID="lblRecet" runat="server" EnableViewState="False" meta:resourcekey="lblRecetResource1">Newly registered users</asp:Label></th></tr></HeaderTemplate>
        <ItemTemplate>
            <tr><td><a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("Username") %></a></td></tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
    
    
    <asp:Repeater id="rptRecentlyActive" runat="server" EnableViewState="false">
        <HeaderTemplate><table style="float:left;margin-right:20px;"><tr><th colspan="2"><asp:Label ID="lblRecet" runat="server" EnableViewState="False" meta:resourcekey="lblRecentlyActiveResource1">Last two weeks active users</asp:Label></th></tr></HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("Username") %></a></td>
                <td>posts: <%# Eval("MsgCount") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>


    <asp:Repeater id="rptMostActive" runat="server" EnableViewState="false">
        <HeaderTemplate><table><tr><th colspan="2"><asp:Label ID="lblActive" runat="server" EnableViewState="False" meta:resourcekey="lblActiveResource1">Most active users</asp:Label></th></tr></HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("Username") %></a></td>
                <td>posts: <%# Eval("MsgCount") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
    
    <p style="clear:both"></p>
    
    <p><a href="allusers.aspx"><asp:Label ID="lblAll" runat="server" EnableViewState="False" meta:resourcekey="lblAllResource1">List of all users</asp:Label></a>
    |
    <a href="allusers.aspx?Admin=1">Administrators</a>
    </p>
</asp:Content>
