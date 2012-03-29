<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adduser.aspx.cs" Inherits="adduser"
	MasterPageFile="AspNetForumMaster.Master" %>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location"><img src="images/admin.gif" alt="" />&nbsp;
	<b><a href="admin.aspx"><asp:Label ID="lblAdmin" runat="server" EnableViewState="False" meta:resourcekey="lblAdminResource1">Administrator</asp:Label></a>
	»
	<asp:Label ID="lblTitle" runat="server" EnableViewState="False" meta:resourcekey="lblTitleResource1">Manually adding a user</asp:Label></b></div>
	<p>
	<asp:Label ID="lblDescription" runat="server" EnableViewState="False" meta:resourcekey="lblDescriptionResource1">Use this page to add a new user manually, without requiring a user to go through the registraion process</asp:Label></p>
	<table>
		<tr><th colspan="2">
		    <asp:Label ID="lblNewUser" runat="server" EnableViewState="False" meta:resourcekey="lblNewUserResource1">New user</asp:Label></th></tr>
		<tr>
			<td>
				<asp:Label ID="lblUsername" runat="server" EnableViewState="False" meta:resourcekey="lblUsernameResource1">Username:</asp:Label> *
			</td>
			<td>
				<asp:TextBox ID="txUserName" runat="server" meta:resourcekey="txUserNameResource1"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txUserName"
					Display="Dynamic" ErrorMessage="Required" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr>
			<td>
				<asp:Label ID="lblPassword" runat="server" EnableViewState="False" meta:resourcekey="lblPasswordResource1">Password:</asp:Label> *
			</td>
			<td>
				<asp:TextBox ID="txPsw" runat="server" meta:resourcekey="txPswResource1"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txPsw"
					Display="Dynamic" ErrorMessage="Required" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td>
				<asp:Label ID="lblEmail" runat="server" EnableViewState="False" meta:resourcekey="lblEmailResource1">Email:</asp:Label> *
			</td>
			<td>
				<asp:TextBox ID="txEmail" runat="server" meta:resourcekey="txEmailResource1"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txEmail"
					Display="Dynamic" ErrorMessage="Required" meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator></td>
		</tr>
		<tr>
			<td>
				<asp:Label ID="lblHomepage" runat="server" EnableViewState="False" meta:resourcekey="lblHomepageResource1">Homepage:</asp:Label>
			</td>
			<td>
				<asp:TextBox ID="txHomepage" runat="server" meta:resourcekey="txHomepageResource1"></asp:TextBox>
			</td>
		</tr>
		<tr><th colspan="2"><asp:Button CssClass="gradientbutton" ID="btnAdd" runat="server" Text="add" OnClick="btnAdd_Click" meta:resourcekey="btnAddResource1" /></th></tr>
	</table>
	<asp:label id="lblError" runat="server" Visible="False" ForeColor="Red" meta:resourcekey="lblErrorResource1">User already exists!</asp:label>
	<asp:label id="lblSuccess" runat="server" Visible="False" meta:resourcekey="lblSuccessResource1">User successfully created!</asp:label>
</asp:Content>
