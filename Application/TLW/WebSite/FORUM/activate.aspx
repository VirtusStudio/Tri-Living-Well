<%@ Page Language="C#" AutoEventWireup="true" CodeFile="activate.aspx.cs" Inherits="activate" MasterPageFile="AspNetForumMaster.Master" %>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">

	<div class="location">
		<b><a href="default.aspx">Home</a> » Activation </b>
	</div>
	<asp:Label ID="lblSuccess" runat="server" Visible="false">Activation successful. You are welcome to login</asp:Label>
	<asp:Label ID="lblError" runat="server" Visible="false">ERROR! Not activated - wrong code or username</asp:Label>
</asp:Content>