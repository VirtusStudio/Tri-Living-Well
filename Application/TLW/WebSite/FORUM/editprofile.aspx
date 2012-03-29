<%@ Page language="c#" CodeFile="editprofile.aspx.cs" AutoEventWireup="True" Inherits="editprofile" MasterPageFile="aspNetForumMaster.Master" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
<div class="location">
    <b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
    »
    <asp:Label ID="lblProfile" runat="server" EnableViewState="False" meta:resourcekey="lblProfileResource1">Profile</asp:Label></b> : 
    <a href="mysubscriptions.aspx"><asp:Label ID="lblMySubs" runat="server" EnableViewState="False" meta:resourcekey="lblMySubsResource1">My subscriptions</asp:Label></a> |
    <a href="privateinbox.aspx"><asp:Label ID="lblInbox" runat="server" EnableViewState="False" meta:resourcekey="lblInboxResource1">Personal messages - Inbox</asp:Label></a> |
    <a href="privatesent.aspx"><asp:Label ID="lblSent" runat="server" EnableViewState="False" meta:resourcekey="lblSentResource1">Personal messages - Sent items</asp:Label></a>
</div>
<asp:Label ID="lblNotLoggedIn" runat="server" Visible="False" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblNotLoggedInResource1">You are not signed in as a member. Please sign in to access your profile.</asp:Label>
<div id="divMain" runat="server">
<div><asp:Label id="lblResult" runat="server" Font-Bold="True" meta:resourcekey="lblResultResource1"></asp:Label></div>

<table cellspacing="5" width="500px" id="tblChangePsw" runat="server" enableviewstate="false">
	<tr>
		<th colspan="2"><asp:Label ID="lblChangePsw" runat="server" EnableViewState="False" meta:resourcekey="lblChangePswResource1">Change Password</asp:Label></th></tr>
	<tr>
		<td width="50%"><asp:Label ID="lblOldPsw" runat="server" EnableViewState="False" meta:resourcekey="lblOldPswResource1">Old password:</asp:Label></td>
		<td><asp:TextBox id="tbOldPsw" runat="server" TextMode="Password" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label ID="lblNewPsw" runat="server" EnableViewState="False" meta:resourcekey="lblNewPswResource1">New password:</asp:Label></td>
		<td><asp:TextBox id="tbNewPsw1" runat="server" TextMode="Password" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label ID="lblConfPsw" runat="server" EnableViewState="False" meta:resourcekey="lblConfPswResource1">Confirm new password:</asp:Label></td>
		<td><asp:TextBox id="tbNewPsw2" runat="server" TextMode="Password" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<th colspan="2">
			<asp:Button CssClass="gradientbutton" id="btnChangePsw" runat="server" Text="change" onclick="btnChangePsw_Click" meta:resourcekey="btnChangePswResource1"></asp:Button></th></tr>
</table>
<br />
<table cellspacing="5" width="500px">
	<tr>
		<th colspan="2"><asp:Label ID="lblMyProfile" runat="server" EnableViewState="False" meta:resourcekey="lblMyProfileResource1">My Profile</asp:Label></th></tr>
	<tr>
		<td width="50%"><asp:Label ID="lblUsername" runat="server" EnableViewState="False" meta:resourcekey="lblUsernameResource1">UserName:</asp:Label></td>
		<td><asp:TextBox id="tbUsername" runat="server" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label ID="lblEmail" runat="server" EnableViewState="False" meta:resourcekey="lblEmailResource1">Email (NOT shared):</asp:Label></td>
		<td><asp:TextBox id="tbEmail" runat="server" meta:resourcekey="tbEmailResource1" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label ID="lblHomepage" runat="server" EnableViewState="False" meta:resourcekey="lblHomepageResource1">Homepage:</asp:Label></td>
		<td><asp:TextBox id="tbHomepage" runat="server" MaxLength="50" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<td><asp:Label ID="lblInterests" runat="server" EnableViewState="False" meta:resourcekey="lblInterestsResource1">Interests:</asp:Label></td>
		<td><asp:TextBox id="tbInterests" runat="server" MaxLength="255" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
	    <td>
	        <asp:Label ID="lblSignature" runat="server" EnableViewState="False" meta:resourcekey="lblSignatureResource1">Signature:</asp:Label>
	        <br />
	        (No tags. Only [url][/url], [b][/b], [i][/i])
	    </td>
		<td><asp:TextBox id="tbSignature" runat="server" TextMode="MultiLine" Rows="3" Width="100%"></asp:TextBox></td>
	</tr>
	<tr>
		<th colspan="2">
			<asp:Button CssClass="gradientbutton" id="btnSave" runat="server" Text="save" onclick="btnSave_Click" meta:resourcekey="btnSaveResource1"></asp:Button></th></tr>
</table>
<br />
<table cellspacing="5" id="tblAvatar" runat="server" width="500px">
    <tr><th colspan="2"><asp:Label ID="lblAvatar" runat="server" EnableViewState="False" meta:resourcekey="lblAvatarResource1">Avatar picture</asp:Label></th></tr>
    <tr><td colspan="2"><img id="imgAvatar" runat="server" visible="false" src="" alt="" /></td></tr>
    <tr valign="top">
	    <td>
	        <asp:Label ID="lblAvatar2" runat="server" EnableViewState="False" meta:resourcekey="lblAvatar2Resource1">Avatar picture</asp:Label>
	        <br />
	        (
	        max <asp:Label ID="lblMaxSize" runat="server" meta:resourcekey="lblMaxSizeResource1"></asp:Label> bytes,
	        max <asp:Label ID="lblMaxDimenstions" runat="server" meta:resourcekey="lblMaxDimenstionsResource1"></asp:Label> pixels)<br />
	        <asp:Label ID="lblLeaveBlank" runat="server" EnableViewState="False" meta:resourcekey="lblLeaveBlankResource1">leave blank to remove your current avatar</asp:Label>
	        ):</td>
		<td>
            <asp:FileUpload ID="avatarUpload" runat="server" meta:resourcekey="avatarUploadResource1" />
			</td>
	</tr>
	<tr>
	    <th colspan="2">
	        <asp:Button CssClass="gradientbutton" ID="btnUpload" runat="server" Text="upload" OnClick="btnUpload_Click" meta:resourcekey="btnUploadResource1" />
	    </th>
	</tr>
</table>
</div>
</asp:Content>