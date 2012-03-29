<%@ Page Language="C#" AutoEventWireup="true" CodeFile="nonactivatedusers.aspx.cs" Inherits="nonactivatedusers" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
<p>
	<asp:Repeater id="rptNonActivatedUsers" runat="server" EnableViewState="false">
        <HeaderTemplate><table><tr><th>New (non-activated) users</th></tr></HeaderTemplate>
        <ItemTemplate>
            <tr><td><a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("Username") %></a></td></tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>
</p>
</asp:Content>