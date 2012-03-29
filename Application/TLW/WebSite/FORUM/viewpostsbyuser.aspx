<%@ Page language="c#" CodeFile="viewpostsbyuser.aspx.cs" AutoEventWireup="True" Inherits="viewpostsbyuser" MasterPageFile="aspnetforummaster.master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
    <p>
    <asp:Label id="lblUser" runat="server" Font-Bold="True" meta:resourcekey="lblUserResource1"></asp:Label>
    -
    <asp:Label ID="lblAllMsgs" runat="server" EnableViewState="False" meta:resourcekey="lblAllMsgsResource1">all messages by user</asp:Label>
    </p>
	    <asp:repeater id="rptMessagesList" runat="server" EnableViewState="False">
	        <HeaderTemplate>
	            <table width="100%">
	        </HeaderTemplate>
		    <ItemTemplate>
			    <tr>
				    <th colspan="2">
					    <%# Eval("CreationDate") %>
				    </th>
			    </tr>
			    <tr valign="top">
				    <td style="width:120px;">
					    <a href='<%# aspnetforum.Utils.GetTopicURL(Eval("TopicID"), Eval("Subject")) %>'>
						    <b><%# Eval("Subject") %></b></a>
				    </td>
				    <td><%# aspnetforum.Utils.Formatting.FormatMessageHTML(Eval("Body").ToString())%>
				    </td>
			    </tr>
		    </ItemTemplate>
		    <FooterTemplate>
		        <tr>
		        <th colspan="2">
				    <asp:Label ID="lblPager" runat="server" EnableViewState="False" meta:resourcekey="lblPagerResource1">pages:</asp:Label>
				    <%#pagerString %>
			    </th></tr>
                </table>
		    </FooterTemplate>
	    </asp:repeater>
</asp:Content>