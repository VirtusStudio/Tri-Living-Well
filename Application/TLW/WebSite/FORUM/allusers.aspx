<%@ Page language="c#" CodeFile="allusers.aspx.cs" AutoEventWireup="True" Inherits="allusers" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
    <div class="location">
		<b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblListUsers" runat="server" EnableViewState="False" meta:resourcekey="lblListUsersResource1">List of all users</asp:Label></b></div>
    <table width="100%">
	    <tr>
		    <th><asp:Label ID="lblUser" runat="server" EnableViewState="False" meta:resourcekey="lblUserResource1">Username</asp:Label></th>
		    <th>Email</th>
		    <th><asp:Label ID="lblRegSince" runat="server" EnableViewState="False" meta:resourcekey="lblRegSinceResource1">Registered since</asp:Label></th>
		    <th><asp:Label ID="lblPosts" runat="server" EnableViewState="False" meta:resourcekey="lblPostsResource1">Posts</asp:Label></th></tr>
		    <asp:repeater id="rptMessagesList" runat="server" EnableViewState="False">
			    <ItemTemplate>
				    <tr>
					    <td><a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("Username") %></a></td>
					    <td><%# ShowEmail(Eval("Email")) %></td>
					    <td><%# Eval("RegistrationDate") %></td>
					    <td><a href='viewpostsbyuser.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("PostsCount") %></a></td>
				    </tr>
			    </ItemTemplate>
		    </asp:repeater>
	    <tr>
		    <th colspan="3">
			    <asp:Label ID="lblPager" runat="server" EnableViewState="False" meta:resourcekey="lblPagerResource1">pages:</asp:Label>
			    <%= pagerString %></th></tr>
    </table>
</asp:Content>