<%@ Page language="c#" CodeFile="register.aspx.cs" Title="Register a new user" AutoEventWireup="True" Inherits="register" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<p>
		<b><a href="default.aspx"><asp:Label ID="lbl" runat="server" EnableViewState="False" meta:resourcekey="lblResource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblRegister" runat="server" EnableViewState="False" meta:resourcekey="lblRegisterResource1">Register</asp:Label></b>
	</p>
	
	<div id="divTOS" runat="server" enableviewstate="false" visible="false">
	<p>By accessing this forum, you agree to be legally bound by the following terms.
	If you do not agree to be legally bound by all of the following terms then please do not access and/or use this forum.</p>

    <p>This forum is powered by <a href="http://www.jitbit.com/asp-net-forum.aspx">Jitbit AspNetForum Forum Software</a>
    which is a bulletin board solution for ASP.NET.</p>

    <p>You agree not to post any abusive, obscene, vulgar, slanderous, hateful, threatening, sexually-orientated or any other material that may violate any laws be it of your country or International Law.
    Doing so may lead to you being immediately and permanently banned, with notification of your Internet Service Provider if deemed required by us.
    The IP address of all posts are recorded to aid in enforcing these conditions.
    You agree that we have the right to remove, edit, move or close any topic at any time should we see fit.
    As a user you agree to any information you have entered to being stored in a database.</p>
    
    <p align="center">
        <asp:Button ID="btnAgree" CssClass="gradientbutton" Text="I agree to these terms" runat="server" Font-Bold="true" OnClick="btnAgree_Click" />
        <asp:Button ID="btnDisagree" CssClass="gradientbutton" Text="I do not agree to these terms" runat="server" OnClick="btnDisagree_Click" />
    </p>
    
	</div>
	
	<table id="registerTable" cellspacing="5" runat="server">
		<tr>
			<th colspan="2">
				<asp:Label ID="lbRegNew" runat="server" EnableViewState="False" meta:resourcekey="lbRegNewResource1">Register a new user</asp:Label></th></tr>
		<tr>
			<td>* <asp:Label ID="lblUsername" runat="server" EnableViewState="False" meta:resourcekey="lblUsernameResource1">Username:</asp:Label></td>
			<td><asp:textbox id="tbUserName" runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<td>* <asp:Label ID="lblEmail" runat="server" EnableViewState="False" meta:resourcekey="lblEmailResource1">Email (NOT shared):</asp:Label>
			</td>
			<td><asp:textbox id="tbEmail" runat="server"></asp:textbox></td>
		</tr>
		<tr>
			<td>* <asp:Label ID="lblPsw" runat="server" EnableViewState="False" meta:resourcekey="lblPswResource1">Password:</asp:Label></td>
			<td><asp:textbox id="tbPsw1" runat="server" TextMode="Password"></asp:textbox></td>
		</tr>
		<tr>
			<td>* <asp:Label ID="lblPswConf" runat="server" EnableViewState="False" meta:resourcekey="lblPswConfResource1">Confirm password:</asp:Label></td>
			<td><asp:textbox id="tbPsw2" runat="server" TextMode="Password"></asp:textbox></td>
		</tr>
		<tr>
			<td><img alt="" src="captchajpgimg.aspx" /></td>
			<td><asp:Label ID="lblCaptcha" runat="server" EnableViewState="False" meta:resourcekey="lblCaptchaResource1">Enter the code shown:</asp:Label><br/>
				<asp:TextBox id="tbImgCode" runat="server" autocomplete="off"></asp:TextBox></td>
		</tr>
		<tr>
			<td><asp:Label ID="lblHomepage" runat="server" EnableViewState="False" meta:resourcekey="lblHomepageResource1">Homepage:</asp:Label></td>
			<td><asp:textbox id="tbHomepage" runat="server" MaxLength="50">http://</asp:textbox></td>
		</tr>
		<tr>
			<td><asp:Label ID="lblInterests" runat="server" EnableViewState="False" meta:resourcekey="lblInterestsResource1">Interests:</asp:Label></td>
			<td><asp:textbox id="tbInterests" runat="server" MaxLength="255"></asp:textbox></td>
		</tr>
		<tr>
			<th colspan="2">
				<asp:button id="btnOK" runat="server" Text="register" CssClass="gradientbutton" meta:resourcekey="btnOKResource1"></asp:button></th></tr>
	</table>
	<asp:label id="lblError" runat="server" Visible="False" ForeColor="Red" meta:resourcekey="lblErrorResource1"></asp:label>
	<asp:label id="lblSuccess" runat="server" Visible="False" meta:resourcekey="lblSuccessResource1">User successfully created!</asp:label>
</asp:Content>