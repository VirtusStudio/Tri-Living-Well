<%@ Page language="c#" CodeFile="privatesent.aspx.cs" AutoEventWireup="True" Inherits="privatesent" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location">
		<b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<a href="editprofile.aspx"><asp:Label ID="lblProfile" runat="server" EnableViewState="False" meta:resourcekey="lblProfileResource1">Profile</asp:Label></a>
		»
		<asp:Label ID="lblSent" runat="server" EnableViewState="False" meta:resourcekey="lblSentResource1">Personal messages - Sent Items</asp:Label></b></div>
	<asp:Label ID="lblNotLoggedIn" runat="server" Visible="False" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblNotLoggedInResource1">You are not signed in as a member. Please sign in to access your private messages.</asp:Label>
		<asp:repeater id="rptMessagesList" runat="server" EnableViewState="False">
		    <HeaderTemplate><table width="100%"></HeaderTemplate>
			<ItemTemplate>
				<tr>
					<th colspan="2">
						<%# DataBinder.Eval(Container.DataItem, "CreationDate") %>
					</th>
				</tr>
				<tr valign="top">
					<td style="width:120px;">
						<b>To <a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'>
								<%# Eval("UserName") %>
							</a></b>
					</td>
					<td>
						<%# aspnetforum.Utils.Formatting.FormatMessageHTML(Eval("Body").ToString())%>
						</div>
					</td>
				</tr>
			</ItemTemplate>
			<FooterTemplate>
			    <tr><th colspan="2">
			    <asp:Label ID="lblPager" runat="server" EnableViewState="False" meta:resourcekey="lblPagerResource1">pages:</asp:Label>
			    <%# pagerString %></th></tr>
		</table>
			</FooterTemplate>
		</asp:repeater>
</asp:Content>