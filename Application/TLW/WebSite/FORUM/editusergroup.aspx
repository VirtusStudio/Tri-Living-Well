<%@ Page language="c#" CodeFile="editusergroup.aspx.cs" AutoEventWireup="True" Inherits="editusergroup" MasterPageFile="aspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<p><img alt="" src="images/admin.gif" />&nbsp;
	<b><a href="admin.aspx"><asp:Label ID="lblAdmin" runat="server" EnableViewState="False" meta:resourcekey="lblAdminResource1">Administrator</asp:Label></a>
	»
	<a href="adminusergroups.aspx"><asp:Label ID="Label1" runat="server" EnableViewState="False" meta:resourcekey="Label1Resource1">User groups</asp:Label></a>
	»
	<asp:Label ID="lblEditing" runat="server" EnableViewState="False" meta:resourcekey="lblEditingResource1">Editing group of users</asp:Label></b></p>
	<p><asp:Label ID="lblClick" runat="server" EnableViewState="False" meta:resourcekey="lblClickResource1">Click on a username to add/remove a user to/from the group:</asp:Label></p>
	<table width="100%" style="height:200px" cellpadding="3">
		<tr class="gradientbg">
			<th align="center" style="width:50%">
				<asp:Label ID="lblUsersIn" runat="server" EnableViewState="False" meta:resourcekey="lblUsersInResource1">Users in this group</asp:Label></th>
			<th align="center">
			    <asp:Label ID="lblUsersNotIn" runat="server" EnableViewState="False" meta:resourcekey="lblUsersNotInResource1">Users not in this group</asp:Label></th>
		</tr>
		<tr valign="top">
			<td height="100%">
				<div style="overflow:auto;height:100%">
					<asp:Label ID="lblNoUsersInGroup" Runat="server" Visible="False" meta:resourcekey="lblNoUsersInGroupResource1" Text="No users found"></asp:Label>
					<asp:Repeater id="rptAllowed" runat="server" EnableViewState="False" OnItemCommand="rptAllowed_ItemCommand">
						<ItemTemplate>
							<asp:linkbutton runat="server" id="btnRemoveUser" CommandName="remove" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "UserID") %>' meta:resourcekey="btnRemoveUserResource1"><%# DataBinder.Eval(Container.DataItem, "Username") %></asp:linkbutton>
							<b>;</b>
						</ItemTemplate>
					</asp:Repeater>
				</div>
			</td>
			<td><div style="overflow:auto;height:100%">
					<asp:Repeater id="rptDenied" runat="server" EnableViewState="False" OnItemCommand="rptDenied_ItemCommand">
						<ItemTemplate>
							<asp:linkbutton runat="server" id="btnAddUser" CommandName="add" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "UserID") %>' meta:resourcekey="btnAddUserResource1"><%# DataBinder.Eval(Container.DataItem, "Username") %></asp:linkbutton>
							<b>;</b>
						</ItemTemplate>
					</asp:Repeater>
				</div>
			</td>
		</tr>
	</table>
</asp:Content>