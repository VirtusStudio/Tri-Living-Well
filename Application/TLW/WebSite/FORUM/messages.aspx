<%@ Page language="c#" CodeFile="messages.aspx.cs" AutoEventWireup="True" Inherits="messages" MasterPageFile="AspNetForumMaster.Master" %>

<%--  Commented by Netsmartz for resolving compile time issues
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>--%>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderHEAD" ID="AspNetForumHead" runat="server">

<link rel="alternate" type="application/rss+xml" title="topics in this forum" id="rssDiscoverLink" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
<script type="text/javascript">


var	MessageID;
var	btnHelpful;
var	btnNotHelpful;
var	btnReportInappropriate;
var divInputArea;
var divThanks;
var lblMonster;

function saveReview(sMessageID, sMessageReview)
{
    MessageID.value = sMessageID;
    
    
    divInputArea = document.getElementById("divInputArea" + sMessageID);
    divThanks = document.getElementById("divThanks" + sMessageID);
    lblMonster = document.getElementById("lblMonster" + sMessageID);
    divInputArea.style.visibility="hidden";
    divThanks.style.visibility="visible";
    if(sMessageReview == "Yes")
    {
      btnHelpful.click();
    }

    if(sMessageReview == "No")
    {
      btnNotHelpful.click();
    }

    if(sMessageReview == "Inappropriate")
    {
      btnReportInappropriate.click();
    }

}


</script>
	<div class="location">
		<b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
			»
			<asp:label id="lblCurForum" runat="server" EnableViewState="False"></asp:label>
			»
			<asp:label id="lblCurTopic" runat="server" EnableViewState="False" meta:resourcekey="lblCurTopicResource1"></asp:label></b>
			
			<a runat="server" id="rssLink" enableviewstate="false"><img alt="Messages in this topic - RSS" src="images/rss20.gif" style="float:right;border:none" /></a>
	</div>
	<div id="divPoll" runat="server" visible="false" align="center" style="padding-bottom:7px">
	    <asp:Label ID="lblPollName" runat="server"></asp:Label>
	    <br />
	    <asp:RadioButtonList CssClass="radiolist" style="margin: 5px 5px 5px 5px;" ID="rblOptions" runat="server" DataTextField="OptionText" DataValueField="OptionID" Visible="false" BorderStyle="none" CellPadding="5"></asp:RadioButtonList>
	    <asp:Repeater id="rptVoteResults" runat="server">
	        <HeaderTemplate>
	            <table cellpadding="5" style="margin: 5px 5px 5px 5px">
	        </HeaderTemplate>
	        <ItemTemplate>
	            <tr><td><b><%# Eval("OptionText") %>:</b></td><td align="left"><%# Eval("VoteCount") %> <img src="images/darkgradient.gif" height="10" width='<%# GetVotingBarWidth(Eval("VoteCount")) %>' alt="" /></td></tr>
	        </ItemTemplate>
	        <FooterTemplate>
	            </table>
	        </FooterTemplate>
	    </asp:Repeater>
	    <asp:Button ID="btnVote" runat="server" Text="vote" CssClass="gradientbutton" OnClick="btnVote_Click" meta:resourcekey="btnVoteResource1" />
	</div>	
    <asp:repeater id="rptMessagesList" runat="server" EnableViewState="False" OnItemDataBound="rptMessagesList_ItemDataBound" OnItemCommand="rptMessagesList_ItemCommand">
        <HeaderTemplate>
            <table style="width:100%;" cellpadding="5">
        </HeaderTemplate>
	    <ItemTemplate>
		    <tr>
		        <th style="width:170px"></th>
			    <th>
				    <div style="float:left"><%# Eval("CreationDate") %></div>
				    <div style="float:right">
				        <a href='#post<%# Eval("MessageID") %>'><asp:Label ID="lblPermalink" runat="server" EnableViewState="False" meta:resourcekey="lblPermalinkResource1">permalink</asp:Label></a>
						<a runat="server" id="lnkQuote" visible="False"><asp:Label ID="lblQuote" runat="server" EnableViewState="False" meta:resourcekey="lblQuoteResource1">&bull; reply with quote</asp:Label></a>
					    <a runat="server" id="lnkEdit" visible="False"><asp:Label ID="lblEdit" runat="server" EnableViewState="False" meta:resourcekey="lblEditResource1">&bull; edit</asp:Label></a>
					    <asp:LinkButton id="btnModeratorApprove" Runat="server" Visible="False" CommandName="approve" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MessageID") %>' meta:resourcekey="btnModeratorApproveResource1">&bull; <b>approve</b></asp:LinkButton>
					    <asp:LinkButton id="btnModeratorDelete" Runat="server" Visible="False" CommandName="delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "MessageID") %>' meta:resourcekey="btnModeratorDeleteResource1">&bull; delete</asp:LinkButton>
				    </div>
				    </th>
		    </tr>
		    <tr valign="top">
			    <td>
	                    <a name='post<%# Eval("MessageID") %>'></a>
			            <%# aspnetforum.Utils.DisplayUserInfo(Eval("UserID"), Eval("UserName"), Eval("PostsCount"), Eval("AvatarFileName")) %>
	            </td>
			    <td colspan="2">
					<%# aspnetforum.Utils.Formatting.FormatMessageHTML(Eval("Body").ToString()) %>
					<%# aspnetforum.Utils.Formatting.FormatSignature(Eval("Signature").ToString())%>
				    <asp:Repeater ID="rptFiles" runat="server">
				    <HeaderTemplate>
						<br /><br />
						<asp:Label ID="lblAttachments" runat="server" EnableViewState="False" meta:resourcekey="lblAttachmentsResource1">Attachments:</asp:Label><br />
				    </HeaderTemplate>
				    <ItemTemplate><a href='upload/<%# Eval("UserID") %>/<%# Eval("FileName") %>'><%# Eval("FileName") %><%# GetThumbnail(Eval("FileName").ToString(), Eval("UserID").ToString()) %></a><br /></ItemTemplate>
				    </asp:Repeater>
				    
			                <br /><br /><br /><b>
			                <%# DataBinder.Eval(Container.DataItem, "HelpfulCount").ToString()%></b> out of <b><%# DataBinder.Eval(Container.DataItem, "TotalReviewsCount").ToString()%></b> people found this review helpful.
			                <br /><br />
			                <div id="divInputArea<%# DataBinder.Eval(Container.DataItem, "MessageID").ToString()%>">
			                Was this review helpful?
			                <a href='javascript:saveReview("<%# DataBinder.Eval(Container.DataItem, "MessageID").ToString()%>", "Yes");'>Yes</a> | <a href='javascript:saveReview("<%# DataBinder.Eval(Container.DataItem, "MessageID").ToString()%>", "No");'>No</a> | <a href='javascript:saveReview("<%# DataBinder.Eval(Container.DataItem, "MessageID").ToString()%>", "Inappropriate");'>Report Inappropriate Review</a>
                             </div>
			                <div visible="false" style="padding-top:0px;visibility:hidden;" id="divThanks<%# DataBinder.Eval(Container.DataItem, "MessageID").ToString()%>" >Thanks for your Input!</div>
                           
                </td>
		    </tr>
	    </ItemTemplate>
	    <FooterTemplate>
	        <tr><th colspan="2">
	        <asp:Label ID="lblPages" runat="server" EnableViewState="False" meta:resourcekey="lblPagesResource1">pages:</asp:Label>
	        <%# pagerString %></th></tr>
            </table>
	    </FooterTemplate>
    </asp:repeater>
	<b><a id="linkAddPost" href="addpost.aspx" runat="server" enableviewstate="false">
		<asp:Label ID="lblReply" runat="server" EnableViewState="False" meta:resourcekey="lblReplyResource1">add reply</asp:Label></a>
	
	<asp:Label runat="server" ID="lblClosed" Visible="False" EnableViewState="False" meta:resourcekey="lblClosedResource1">the topic is closed</asp:Label></b> |
	
	<asp:LinkButton id="btnSubscribe" Runat="server" Visible="False" onclick="btnSubscribe_Click" EnableViewState="False" meta:resourcekey="btnSubscribeResource1">watch this topic for replies</asp:LinkButton>
	
	<asp:LinkButton id="btnUnsubscribe" Runat="server" Visible="False" onclick="btnUnsubscribe_Click" EnableViewState="False" meta:resourcekey="btnUnsubscribeResource1">stop watching this topic</asp:LinkButton>
	
	<span id="spanMove" runat="server">
	    &nbsp;|&nbsp;
	    <asp:Label ID="lblMove" runat="server" EnableViewState="False" meta:resourcekey="lblMoveResource1">move thread to forum:</asp:Label>
	    <asp:DropDownList ID="ddlForums" Runat="server" DataTextField="Title" DataValueField="ForumID" meta:resourcekey="ddlForumsResource1"></asp:DropDownList><asp:Button ID="btnMove" Runat="server" Text="move" onclick="btnMove_Click" CssClass="gradientbutton" EnableViewState="False" meta:resourcekey="btnMoveResource1"></asp:Button>
	</span>
	
	<div class="location">
	    <hr />
		<b><a href="default.aspx"><asp:Label ID="lblHome2" runat="server" EnableViewState="False" meta:resourcekey="lblHome2Resource1">Home</asp:Label></a>
		»
		<asp:label id="lblCurForumBottom" runat="server" EnableViewState="False"></asp:label>
		»
		<asp:label id="lblCurTopicBottom" runat="server" EnableViewState="False" meta:resourcekey="lblCurTopicBottomResource1"></asp:label></b>
	</div>
	
	    <input id="MessageID" type="text" runat="server" value="1" />
        <asp:Button ID="btnHelpful" Text="Helpful" runat="server" OnClick="btnHelpful_Click"  />
        <asp:Button ID="btnNotHelpful" Text="NotHelpful" runat="server" OnClick="btnNotHelpful_Click" />
        <asp:Button ID="btnReportInappropriate"  Text="inApp" runat="server" OnClick="btnReportInappropriate_Click" />
	<%--
      Commented by Netsmartz for resolving compile time issues
        <rada:radajaxmanager id="RadAjaxManager1" runat="server" ><AjaxSettings>
                 <radA:AjaxSetting AjaxControlID="btnHelpful">
                     <UpdatedControls>
                         <radA:AjaxUpdatedControl ControlID="btnHelpful" />
                     </UpdatedControls>
                 </radA:AjaxSetting>
                 <radA:AjaxSetting AjaxControlID="btnNotHelpful">
                     <UpdatedControls>
                         <radA:AjaxUpdatedControl ControlID="btnNotHelpful" />
                     </UpdatedControls>
                 </radA:AjaxSetting>
                    <radA:AjaxSetting AjaxControlID="btnReportInappropriate">
                     <UpdatedControls>
                         <radA:AjaxUpdatedControl ControlID="btnReportInappropriate" />
                     </UpdatedControls>
                 </radA:AjaxSetting>
        </AjaxSettings>
	 </rada:radajaxmanager>--%>
	<script type="text/javascript">
	    MessageID = document.getElementById(<%= '"' + MessageID.ClientID + '"' %>);
	    btnHelpful = document.getElementById(<%= '"' + btnHelpful.ClientID + '"' %>);
	    btnNotHelpful = document.getElementById(<%= '"' + btnNotHelpful.ClientID + '"' %>);
	    btnReportInappropriate = document.getElementById(<%= '"' + btnReportInappropriate.ClientID + '"' %>);
	</script>
	
</asp:Content>