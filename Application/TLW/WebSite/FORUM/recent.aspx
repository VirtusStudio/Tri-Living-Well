<%@ Page language="c#" CodeFile="recent.aspx.cs" Title="Recent Messages" AutoEventWireup="True" Inherits="recent" MasterPageFile="AspNetForumMaster.Master" meta:resourcekey="PageResource1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHEAD" ID="AspNetForumHead" runat="server">
<link rel="alternate" type="application/rss+xml" title="recent posts" href="recent.aspx?rss=1" />
</asp:Content>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location">
		<b><a href="default.aspx">
			<asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblRecent" runat="server" EnableViewState="False" meta:resourcekey="lblRecentResource1">Recent messages</asp:Label></b>
		
		<a href="recent.aspx?rss=1"><img alt="recent posts - RSS" src="images/rss20.gif" style="float:right;border:none" /></a>
	</div>
	<asp:repeater id="rptMessagesList" runat="server" EnableViewState="False">
	    <HeaderTemplate>
	        <table width="100%">
	    </HeaderTemplate>
		<ItemTemplate>
			<tr>
			    <th style="width:120px"></th>
				<th>
					<%# Eval("CreationDate") %>
				</th>
			</tr>
			<tr valign="top">
				<td>
					topic: <a href='<%# aspnetforum.Utils.GetTopicURL(Eval("TopicID"), Eval("Subject")) %>'>
						<b>
							<%# Eval("Subject") %>
						</b></a>
					<br>
					<br>
					<%# aspnetforum.Utils.DisplayUserInfo(Eval("UserID"), Eval("UserName"), Eval("PostsCount"), Eval("AvatarFileName") ) %>
				</td>
				<td>
					<%# aspnetforum.Utils.Formatting.FormatMessageHTML(Eval("Body").ToString())%>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
		    <tr>
			<th colspan="2">
				<asp:Label ID="lblPages" runat="server" EnableViewState="False" meta:resourcekey="lblPagesResource1">pages:</asp:Label>
				<%# pagerString %>
			</th></tr>
		    </table>
		</FooterTemplate>
	</asp:repeater>
	<div class="location">
	    <hr />
		<b><a href="default.aspx">
			<asp:Label ID="lblHome2" runat="server" EnableViewState="False" meta:resourcekey="lblHome2Resource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblRecent2" runat="server" EnableViewState="False" meta:resourcekey="lblRecent2Resource1">Recent messages</asp:Label></b>
	</div>
</asp:Content>