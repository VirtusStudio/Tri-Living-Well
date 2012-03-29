<%@ Page language="c#" CodeFile="topics.aspx.cs" AutoEventWireup="True" Inherits="topics" MasterPageFile="AspNetForumMaster.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHEAD" ID="AspNetForumHead" runat="server">
<link rel="alternate" type="application/rss+xml" title="topics in this forum" id="rssDiscoverLink" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<div class="location">
		<b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<asp:Label id="lblCurForum" runat="server" EnableViewState="False" meta:resourcekey="lblCurForumResource1"></asp:Label>
		</b><a runat="server" id="rssLink" enableviewstate="false"><img alt="topics in this forum - RSS" src="images/rss20.gif" style="float:right;border:none" /></a>
	</div>
	<asp:Label ID="lblDenied" Runat="server" ForeColor="Red" Font-Bold="True" Visible="False" EnableViewState="False" meta:resourcekey="lblDeniedResource1">Access to this forum is restricted</asp:Label>
	<div id="divMain" runat="server" enableviewstate="false">
	    <div style="margin-bottom:3px">
	    <b><a id="linkAddTopic2" runat="server" enableviewstate="false">
			<asp:Label ID="lblNewTopic2" runat="server" EnableViewState="False" meta:resourcekey="lblNewTopic2Resource1">new topic</asp:Label>
			</a></b>
		<asp:Label ID="lblRegister2" runat="server" EnableViewState="False" meta:resourcekey="lblRegister2Resource1">please login or <a href="register.aspx">register</a> to create a topic</asp:Label>
		|
		<asp:LinkButton id="btnSubscribe2" Runat="server" Visible="False" onclick="btnSubscribe_Click" EnableViewState="False" meta:resourcekey="btnSubscribe2Resource1">watch this forum for new topics</asp:LinkButton>
		<asp:LinkButton id="btnUnsubscribe2" Runat="server" Visible="False" onclick="btnUnsubscribe_Click" EnableViewState="False" meta:resourcekey="btnUnsubscribe2Resource1">stop watching this forum</asp:LinkButton>
		</div>
		<asp:repeater id="rptSubForumsList" runat="server" EnableViewState="False">
			<HeaderTemplate>
				<table width="100%">
				<tr>
					<th></th>
					<th width="80%"><asp:Label ID="lblSubForums" runat="server" EnableViewState="False" meta:resourcekey="lblSubForumsResource1">Sub-Forumsaaaa</asp:Label></th>
					<th><asp:Label ID="lblThreads" runat="server" EnableViewState="False" meta:resourcekey="lblThreadsResource1">Threads</asp:Label></th>
					<th><asp:Label ID="lblLatestPost" runat="server" EnableViewState="False" meta:resourcekey="lblLatestPostResource1">Latest post</asp:Label></th>
				</tr>
			</HeaderTemplate>
			<ItemTemplate>
				<tr>
					<td align="center"><img alt="" src="images/forum.gif"></td>
					<td><h2><a href='<%# aspnetforum.Utils.GetForumURL(Eval("ForumID"), Eval("Title")) %>'><%# Eval("Title") %>
							</a>
						</h2>
						<%# Eval("Description") %>
					</td>
					<td><%# Eval("Topics") %></td>
					<td><%# aspnetforum.Utils.GetMsgInfoByID(Eval("LatestMessageID"), this.cmd) %></td>
				</tr>
			</ItemTemplate>
			<FooterTemplate>
				</table>
				<br /><br />
			</FooterTemplate>
		</asp:repeater>
		
		<asp:repeater id="rptTopicsList" Visible="true" runat="server" EnableViewState="False" OnItemDataBound="rptTopicsList_ItemDataBound" OnItemCommand="rptTopicsList_ItemCommand">
			<HeaderTemplate>
				<table width="100%">
				<tr>
					<th></th>
					<th width="70%"><asp:Label ID="lblThread" runat="server" EnableViewState="False" meta:resourcekey="lblThreadResource1">Thread</asp:Label></th>
					<th nowrap="nowrap"><asp:Label ID="lblLatestPost" runat="server" EnableViewState="False" meta:resourcekey="lblLatestPostResource1">Latest Post</asp:Label></th>
					<th><asp:Label ID="lblViews" runat="server" EnableViewState="False" meta:resourcekey="lblViewsResource1">Views</asp:Label></th>
					<th><asp:Label ID="lblReplies" runat="server" EnableViewState="False" meta:resourcekey="lblRepliesResource1">Replies</asp:Label></th>
				</tr>
			</HeaderTemplate>
			<ItemTemplate>
				<tr>
					<td align="center"><img src="images/topic.gif" alt="topic" id="imgTopic" runat="server" /></td>
					<td><h2>
					        <a href='<%# aspnetforum.Utils.GetTopicURL(Eval("TopicID"), Eval("Subject")) %>'>
								<%# Eval("Subject") %>
							</a>
						</h2>
						<div align="right">
							<asp:LinkButton id="btnModeratorApprove" Runat="server" Visible="False" CommandName="approve" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorApproveResource1"><b>approve</b></asp:LinkButton>
							<asp:LinkButton id="btnModeratorDelete" Runat="server" Visible="False" CommandName="delete" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorDeleteResource1">delete</asp:LinkButton>
							<asp:LinkButton id="btnModeratorMove" Runat="server" Visible="False" CommandName="move" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorMoveResource1">move</asp:LinkButton>
							<asp:LinkButton ID="btnModeratorStick" runat="server" Visible="False" CommandName="stick" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorStickResource1">make sticky</asp:LinkButton>
							<asp:LinkButton ID="btnModeratorUnStick" runat="server" Visible="False" CommandName="unstick" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorUnStickResource1">unstick</asp:LinkButton>
							<asp:LinkButton ID="btnModeratorClose" runat="server" Visible="False" CommandName="close" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorCloseResource1">close</asp:LinkButton>
							<asp:LinkButton ID="btnModeratorReopen" runat="server" Visible="False" CommandName="reopen" CommandArgument='<%# Eval("TopicID") %>' meta:resourcekey="btnModeratorReopenResource1">reopen</asp:LinkButton>
						</div>
					</td>
					<td><%# aspnetforum.Utils.GetMsgInfoByID(Eval("LastMessageID"), this.cmd) %></td>
					<td><%# Eval("ViewsCount") %></td>
					<td><%# Eval("Messages") %></td>
				</tr>
			</ItemTemplate>
			<FooterTemplate>
				<tr>
					<th colspan="5">
						<%# pagerString %>
					</th>
				</tr>
				</table>
			</FooterTemplate>
		</asp:repeater>
		<b><a id="linkAddTopic" runat="server" enableviewstate="false"><asp:Label ID="lblNewTopic" runat="server" EnableViewState="False" meta:resourcekey="lblNewTopicResource1">new topic</asp:Label></a></b>
		<asp:Label ID="lblRegister" runat="server" EnableViewState="False" meta:resourcekey="lblRegisterResource1">please login or <a href="register.aspx">register</a> to create a topic</asp:Label>
		|
		<asp:LinkButton id="btnSubscribe" Runat="server" Visible="False" onclick="btnSubscribe_Click" EnableViewState="False" meta:resourcekey="btnSubscribeResource1">watch this forum for new topics</asp:LinkButton>
		<asp:LinkButton id="btnUnsubscribe" Runat="server" Visible="False" onclick="btnUnsubscribe_Click" EnableViewState="False" meta:resourcekey="btnUnsubscribeResource1">stop watching this forum</asp:LinkButton>
	</div>
	<div class="location">
	    <hr />
	    <b><a href="default.aspx"><asp:Label ID="lblHome2" runat="server" EnableViewState="False" meta:resourcekey="lblHome2Resource1">Home</asp:Label></a> »
	    <asp:Label id="lblCurForumBottom" runat="server" EnableViewState="False" meta:resourcekey="lblCurForumBottomResource1"></asp:Label></b>
    </div>
</asp:Content>