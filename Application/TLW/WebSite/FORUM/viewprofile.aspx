<%@ Page language="c#" CodeFile="viewprofile.aspx.cs" AutoEventWireup="True" Inherits="viewprofile" MasterPageFile="aspnetforummaster.master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<br/>
	<br/>
	<table cellspacing="5">
		<tr>
			<th colspan="2">
				<asp:Label id="lblUser" runat="server" EnableViewState="False" meta:resourcekey="lblUserResource1"></asp:Label>
				-
				<asp:Label ID="lblProfile" runat="server" EnableViewState="False" meta:resourcekey="lblProfileResource1">profile</asp:Label>
				<a href="editprofile.aspx" id="lnkEdit" runat="server" visible="false" enableviewstate="false"><img src="images/edit.gif" alt="edit user" /></a>
			</th>
		</tr>
		<tr>
			<td><b><asp:Label ID="lblUsernameTitle" runat="server" EnableViewState="False" meta:resourcekey="lblUsernameTitleResource1">UserName:</asp:Label></b></td>
			<td><asp:Label id="lblUserName" runat="server" EnableViewState="False" meta:resourcekey="lblUserNameResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><b><asp:Label ID="lblAvatar" runat="server" EnableViewState="False" meta:resourcekey="lblAvatarResource1">Avatar:</asp:Label></b></td>
			<td>
				<img id="imgAvatar" runat="server" enableviewstate="false" src="" alt="User's avatar" />
				<asp:Label id="lblNoAvatar" runat="server" Visible="False" EnableViewState="False" Text="none" meta:resourcekey="lblNoAvatarResource1"></asp:Label>
		    </td>
		</tr>
		<tr>
			<td><b><asp:Label ID="lblInterestsTitle" runat="server" EnableViewState="False" meta:resourcekey="lblInterestsTitleResource1">Interests:</asp:Label></b></td>
			<td><asp:Label id="lblInterests" runat="server" EnableViewState="False" meta:resourcekey="lblInterestsResource1"></asp:Label></td>
		</tr>
		<tr>
			<td><b><asp:Label ID="lblHomepage" runat="server" EnableViewState="False" meta:resourcekey="lblHomepageResource1">Homepage:</asp:Label></b></td>
			<td><asp:HyperLink id="homepage" runat="server" EnableViewState="False" meta:resourcekey="homepageResource1" rel="nofollow"></asp:HyperLink></td>
		</tr>
		<tr>
			<td><b><asp:Label ID="lblTotalPosts" runat="server" EnableViewState="False" meta:resourcekey="lblTotalPostsResource1">Total posts:</asp:Label></b></td>
			<td><a id="lnkViewPosts" runat="server" enableviewstate="false"></a></td>
		</tr>
		<tr>
			<td><b><asp:Label ID="lblReggedSince" runat="server" EnableViewState="False" meta:resourcekey="lblReggedSinceResource1">Registered since:</asp:Label></b></td>
			<td><asp:Label id="lblRegistrationDate" runat="server" EnableViewState="False" meta:resourcekey="lblRegistrationDateResource1"></asp:Label></td>
		</tr>
	</table>
	<p><a id="lnkPersonalMsg" runat="server" enableviewstate="false"><asp:Label ID="Label5" runat="server" EnableViewState="False" meta:resourcekey="Label5Resource1">Send a private message</asp:Label></a></p>
	<p><asp:Button id="btnDelUser" runat="server" Text="delete this user (visible to administrators only)" onclick="btnDelUser_Click" EnableViewState="False" meta:resourcekey="btnDelUserResource1"></asp:Button></p>
	<p><asp:Button id="btnActivateUser" runat="server" Text="activate this user (visible to administrators only)" EnableViewState="False" meta:resourcekey="btnActivateUserResource1" OnClick="btnActivateUser_Click"></asp:Button></p>
	<p><asp:Button id="btnDisableUser" runat="server" Text="disable this user (visible to administrators only)" EnableViewState="False" meta:resourcekey="btnDisableUserResource1" OnClick="btnDisableUser_Click"></asp:Button></p>
	<p><asp:Button id="btnMakeAdmin" runat="server" Text="grant Administrator permissions (visible to administrators only)" EnableViewState="False" meta:resourcekey="btnMakeAdminResource1" OnClick="btnMakeAdmin_Click"></asp:Button></p>
	<p><asp:Button id="btnRevokeAdmin" runat="server" Text="revoke Administrator permissions (visible to administrators only)" EnableViewState="False" meta:resourcekey="btnRevokeAdminResource1" OnClick="btnRevokeAdmin_Click"></asp:Button></p>
</asp:Content>