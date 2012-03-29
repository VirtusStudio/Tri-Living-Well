<%@ Page Language="C#" MasterPageFile="AspNetForumMaster.Master" AutoEventWireup="true" CodeFile="editsubforums.aspx.cs" Inherits="editsubforums" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location"><img src="images/admin.gif" alt="" />&nbsp;
	<b><a href="admin.aspx"><asp:Label ID="lblAdmin" runat="server" EnableViewState="False" meta:resourcekey="lblAdminResource1">Administrator</asp:Label></a>
	»
	<asp:Label ID="lblTitle" runat="server" EnableViewState="False" meta:resourcekey="lblTitleResource1">Editing subforums</asp:Label></b></div>
	<p><asp:Label ID="lblHelp" runat="server" EnableViewState="False" meta:resourcekey="lblHelpResource1">A Subforum is a "parent-child" relation between two existing forums, when one forum is a subforum to another forum. For example, a "Feedback" forum can have two subforums: "General Feedback" and "Site suggestions". To make one forum a subforum of another forum, you have to create both forums and then add a "parent-child" relation using this page.</asp:Label></p>
	<p><b><asp:Label ID="lblExisting" runat="server" EnableViewState="False" meta:resourcekey="lblExistingResource1">Existing "forum-subforum" relations:</asp:Label></b>
		<br />
		<asp:DataGrid id="gridSubForums" runat="server" AutoGenerateColumns="False" Width="100%"
			BorderColor="Silver" OnItemCommand="gridSubForums_ItemCommand" meta:resourcekey="gridSubForumsResource1">
			<HeaderStyle Font-Bold="True" BackColor="#DDDDDD" />
			<AlternatingItemStyle BackColor="Lavender" />
			<Columns>
				<asp:BoundColumn Visible="False" DataField="ParentForumID"></asp:BoundColumn>
				<asp:BoundColumn Visible="False" DataField="SubForumID"></asp:BoundColumn>
				<asp:BoundColumn DataField="ParentForumTitle" HeaderText="Parent Forum"></asp:BoundColumn>
				<asp:BoundColumn DataField="SubForumTitle" HeaderText="Sub-Forum"></asp:BoundColumn>
				<asp:ButtonColumn Text="delete this relation" CommandName="delete" meta:resourcekey="ButtonColumnResource1"></asp:ButtonColumn>
			</Columns>
		</asp:DataGrid>
		<asp:Label ID="lblNoSubForums" Runat="server" Visible="False" meta:resourcekey="lblNoSubForumsResource1">No subforums defined yet.</asp:Label>
	</p>
	<asp:Label ID="lblNoForumsFound" runat="server" ForeColor="Red" Visible="False" meta:resourcekey="lblNoForumsFoundResource1">No forums found. Go back and create some forums before adding subforums.</asp:Label>
	<div id="divAddSubforum" runat="server">
		<b><asp:Label ID="lblDefine" runat="server" EnableViewState="False" meta:resourcekey="lblDefineResource1">Define a subforum:</asp:Label></b>
		<asp:Label ID="lblNote" runat="server" EnableViewState="False" meta:resourcekey="lblNoteResource1">to make one forum a subforum of another forum, select a parent forum, then select a sub-forum, and click "add".</asp:Label>
		<table width="100%">
			<tr>
				<td><asp:Label ID="lblParent" runat="server" EnableViewState="False" meta:resourcekey="lblParentResource1">Parent forum:</asp:Label></td>
				<td style="width:100%;"><asp:DropDownList ID="ddlParentForum" runat="server" DataValueField="ForumID" DataTextField="Title" meta:resourcekey="ddlParentForumResource1"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><asp:Label ID="lblSubForums" runat="server" EnableViewState="False" meta:resourcekey="lblSubForumsResource1">Sub forum:</asp:Label></td>
				<td style="width:100%;"><asp:DropDownList ID="ddlSubForum" runat="server" DataValueField="ForumID" DataTextField="Title" meta:resourcekey="ddlSubForumResource1"></asp:DropDownList></td>
			</tr>
		</table>
		<asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" meta:resourcekey="btnAddResource1" />
		<asp:Label ID="lblError" runat="server" Visible="False" ForeColor="Red" meta:resourcekey="lblErrorResource1">ERROR: You either trying to make a forum a subforum of itself OR relation already exists.</asp:Label>
	</div>
</asp:Content>
