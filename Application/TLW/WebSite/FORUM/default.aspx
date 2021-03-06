<%@ Page Language="c#" CodeFile="default.aspx.cs" AutoEventWireup="True" Inherits="forums"
    MasterPageFile="AspNetForumMaster.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderHEAD" ID="AspNetForumHead" runat="server">
    <link rel="alternate" type="application/rss+xml" title="recent posts" href="recent.aspx?rss=1" />
    <style type="text/css">
        .header table
        {
            width: 868px;
        }
        .topheader table
        {
            width: 868px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto;
        padding: 10px; width: 886px; overflow: hidden;">
        <div class="location">
            <b>
                <asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></b>
            <a style="display: none;" href="../FORUM_ALT/default.aspx" style="float: right; border: none">
                New Forum</a>
            <br />
        </div>
        <asp:Repeater ID="rptGroupsList" runat="server" EnableViewState="False" OnItemDataBound="rptGroupsList_ItemDataBound">
            <HeaderTemplate>
                <table style="width: 100%;" cellspacing="0">
                    <tr>
                        <th>
                        </th>
                        <th style="width: 60%;">
                            <asp:Label ID="lblForums" runat="server" EnableViewState="False" meta:resourcekey="lblForumsResource1">Forums</asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="lblThreads" runat="server" EnableViewState="False" meta:resourcekey="lblThreadsResource1">Threads</asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="lblLatestPost" runat="server" EnableViewState="False" meta:resourcekey="lblLatestPostResource1">Latest post</asp:Label>
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td style="background-color: #ebebeb" colspan="4">
                        <h3>
                            <%# Eval("GroupName") %></h3>
                    </td>
                </tr>
                <asp:Repeater ID="rptForumsList" runat="server" EnableViewState="False">
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <img alt="" src="images/forum.gif">
                            </td>
                            <td>
                                <h2>
                                    <a href='<%# aspnetforum.Utils.GetForumURL(Eval("ForumID"), Eval("Title")) %>'>
                                        <%# Eval("Title") %></a>
                                </h2>
                                <%# Eval("Description") %>
                            </td>
                            <td>
                                <%# Eval("Topics") %>
                            </td>
                            <td>
                                <%# aspnetforum.Utils.GetMsgInfoByID(Eval("LatestMessageID"), this.cmd)%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Label ID="lblNoForums" runat="server" Visible="False" EnableViewState="False"
            meta:resourcekey="lblNoForumsResource1">No forums have been created yet. Contact the forum administrator.</asp:Label>
    </div>
</asp:Content>
