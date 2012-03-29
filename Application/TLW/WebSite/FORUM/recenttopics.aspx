<%@ Page Language="C#" AutoEventWireup="true" Title="Recently updated topics" CodeFile="recenttopics.aspx.cs" Inherits="recenttopics" MasterPageFile="AspNetForumMaster.Master" meta:resourcekey="PageResource1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHEAD" ID="AspNetForumHead" runat="server">
<link rel="alternate" type="application/rss+xml" title="recent posts" href="recenttopics.aspx?rss=1" />
</asp:Content>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location">
		<b><a href="default.aspx">
			<asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblRecent" runat="server" EnableViewState="False" meta:resourcekey="lblRecentResource1">Recently updated topics</asp:Label></b>
			
		<a href="recenttopics.aspx?rss=1"><img alt="Recently updated topics - RSS" src="images/rss20.gif" style="float:right;border:none" /></a>
	</div>
	
	<asp:repeater id="rptTopicsList" runat="server" EnableViewState="False">
		<HeaderTemplate>
			<table width="100%">
			<tr>
				<th> </th>
				<th width="70%"><asp:Label ID="lblThread" runat="server" EnableViewState="False" meta:resourcekey="lblThreadResource1">Thread</asp:Label></th>
				<th><asp:Label ID="lblLatestPost" runat="server" EnableViewState="False" meta:resourcekey="lblLatestPostResource1">Latest Post</asp:Label></th>
			</tr>
		</HeaderTemplate>
		<ItemTemplate>
			<tr>
				<td align="center"><img src="images/topic.gif" alt="topic" id="imgTopic" runat="server" /></td>
				<td><h2><a href='<%# aspnetforum.Utils.GetTopicURL(Eval("TopicID"), Eval("Subject")) %>'>
							<%# Eval("Subject") %>
						</a>
					</h2>
				</td>
				<td><a href='viewprofile.aspx?UserID=<%# Eval("UserID") %>'><%# Eval("UserName") %></a>
					-
					<%# Eval("CreationDate") %>
				</td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</table>
		</FooterTemplate>
	</asp:repeater>
	
	<div class="location">
	    <hr />
		<b><a href="default.aspx">
			<asp:Label ID="lblHome2" runat="server" EnableViewState="False" meta:resourcekey="lblHome2Resource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblRecent2" runat="server" EnableViewState="False" meta:resourcekey="lblRecent2Resource1">Recently updated topics</asp:Label></b>
	</div>
</asp:Content>