<%@ Page language="c#" CodeFile="lostpassword.aspx.cs" AutoEventWireup="True" Inherits="lostpassword" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location"><b><a href="default.aspx">
	    <asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
	    »
	    <asp:Label ID="lblLostPsw" runat="server" EnableViewState="False" meta:resourcekey="lblLostPswResource1">Lost Password Recovery</asp:Label>
	    </b></div>
	<table width="100%" cellpadding="4">
		<tr>
			<th><asp:Label ID="lblLostPsw2" runat="server" EnableViewState="False" meta:resourcekey="lblLostPsw2Resource1">Lost Password Recovery Form</asp:Label></th></tr>
		<tr>
			<td><asp:Label ID="lblForgot" runat="server" EnableViewState="False" meta:resourcekey="lblForgotResource1">If you have forgotten your username or password, you can request to have your username and password emailed to you.</asp:Label></td>
		</tr>
		<tr>
			<td nowrap="nowrap">
			    <asp:Label ID="lblEmail" runat="server" EnableViewState="False" meta:resourcekey="lblEmailResource1">Enter your Email:</asp:Label>
				<asp:TextBox id="txEmail" runat="server" meta:resourcekey="txEmailResource1"></asp:TextBox>
			</td>
		</tr>
		<tr>
			<td><asp:Button id="btnRequest" runat="server" Text="Request Username / Password" onclick="btnRequest_Click" meta:resourcekey="btnRequestResource1"></asp:Button></td>
		</tr>
	</table>
</asp:Content>