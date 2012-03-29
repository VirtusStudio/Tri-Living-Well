<%@ Page Language="C#" MasterPageFile="AspNetForumMaster.Master" AutoEventWireup="true"
    CodeFile="faq.aspx.cs" Inherits="faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHEAD" runat="server">
    <style type="text/css">
     .forumcontent td {border:0px solid silver;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AspNetForumContentPlaceHolder" runat="server">
    <h1>
        Forum Frequently Asked Questions</h1>
    <br />
    <br />
    <div >
        <asp:GridView ID="GVTopics" AutoGenerateColumns="False" runat="server" Width="100%"
            AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="0" CellPadding="0"
            BorderColor="White" GridLines="None" BorderWidth="0" OnRowDataBound="GVQuestionAnswer_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="" ItemStyle-BorderWidth="0" ItemStyle-HorizontalAlign="Left"
                    HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="height:40px;vertical-align:middle;">
                                    <span class="forumtopicHeading"><%#Eval("StrHeading").ToString()%></span> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GVInnerAnswer" AutoGenerateColumns="False" runat="server" Width="100%"
                                        AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="0" CellPadding="0"
                                        BorderColor="White" GridLines="None" BorderWidth="0">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-Font-Names="Vardana" ItemStyle-Font-Size="10" ItemStyle-BorderWidth="0"
                                                HeaderText="" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <table style="font-family:Verdana;">
                                                        <tr style="height:30px;vertical-align:bottom;">
                                                            <td>
                                                                <strong>
                                                                    <%#Eval("StrQuestion").ToString()%>
                                                                </strong>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height:40px;vertical-align:middle;">
                                                                <%#Eval("StrAnswer").ToString()%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                         
                        <hr />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
