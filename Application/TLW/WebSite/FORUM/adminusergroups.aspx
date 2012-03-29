<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminusergroups.aspx.cs" Inherits="adminusergroups" MasterPageFile="AspNetForumMaster.Master" %>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location"><img alt="" src="images/admin.gif" />&nbsp;.
	<b><a href="admin.aspx"><asp:Label ID="lblAdmin" runat="server" EnableViewState="False" meta:resourcekey="lblAdminResource1" Text="Administrator"></asp:Label></a>
	»
	<asp:Label ID="lblUserGroups" runat="server" EnableViewState="False" meta:resourcekey="lblUserGroupsResource1">User groups</asp:Label></b></div>
	<p><b><asp:Label ID="lblAvailableGroups" runat="server" EnableViewState="False" meta:resourcekey="lblAvailableGroupsResource1" Text="Available user groups:"></asp:Label></b>
		<br />
		<asp:DataGrid id="gridGroups" Runat="server" Width="100%" AutoGenerateColumns="False" EnableViewState="False"
			ShowHeader="False" OnItemCommand="gridGroups_ItemCommand" BorderColor="Silver" meta:resourcekey="gridGroupsResource1">
			<Columns>
				<asp:BoundColumn Visible="False" DataField="GroupID"></asp:BoundColumn>
				<asp:BoundColumn DataField="Title" HeaderText="Title"></asp:BoundColumn>
				<asp:HyperLinkColumn Text="edit" DataNavigateUrlField="GroupID" DataNavigateUrlFormatString="editusergroup.aspx?GroupID={0}" meta:resourcekey="HyperLinkColumnResource1"></asp:HyperLinkColumn>
				<asp:ButtonColumn Text="delete" CommandName="delete" meta:resourcekey="ButtonColumnResource1"></asp:ButtonColumn>
			</Columns>
            <AlternatingItemStyle BackColor="Lavender" />
		</asp:DataGrid>
		<asp:Label ID="lblNoGroups" Runat="server" Visible="False" meta:resourcekey="lblNoGroupsResource1" Text="No groups found."></asp:Label>
	</p>

	<b><asp:Label ID="lblAddNew" runat="server" EnableViewState="False" meta:resourcekey="lblAddNewResource1" Text="Add a new group:"></asp:Label></b>
	<table width="100%" border="1" style="border-color:Silver;">
		<tr>
			<td><asp:Label ID="lblTitle" runat="server" EnableViewState="False" meta:resourcekey="lblTitleResource1" Text="Title:"></asp:Label></td>
			<td style="width:100%"><asp:TextBox id="tbGroupTitle" runat="server" Width="100%" meta:resourcekey="tbGroupTitleResource1"></asp:TextBox></td>
		</tr>
	</table>
	<asp:Button id="btnAddGroup" runat="server" Text="add" onclick="btnAddGroup_Click" meta:resourcekey="btnAddGroupResource1"></asp:Button>
</asp:Content>