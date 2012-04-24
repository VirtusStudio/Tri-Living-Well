<%@ Page Title="View Libraries" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="ViewLibraries.aspx.cs" Inherits="Users_ViewLibraries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div style="width: 100%;">
        <center class="Round5">
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <table class="Round5_tblHeader">
                                                    <tr>
                                                        <td>
                                                          Libraries
                                                        </td>
                                                        <td style="text-align: right;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                </center>
            </center>
        </center>

        <br />
          <div>
                <asp:Label ID="lbltextcontent" runat="server"></asp:Label>
            </div>
            <br />

        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table>  <tr><td align="right">
            <a href='<%=AppConfig.GetBaseSiteUrl() %>Main/Main_Frame.aspx' >Back</a>
        </td></tr>
                <tr>
                    <td>
                                <asp:GridView ID="GVLibrary" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                    Width="100%" AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="1"
                                                                    CellPadding="0" BorderWidth="1" GridLines="None" OnRowCommand="GVLibrary_RowCommand"
                                                                    OnRowDataBound="GVLibrary_RowDataBound">
                                                                    <RowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNewsLetterId" runat="server" Visible="false" Text='<%#Eval("IntNewsLetterId") %>'></asp:Label>
                                                                                <span title='<%#Eval("StrTitle").ToString() %>'>
                                                                                    <%#AppLib.GetSubString(Eval("StrTitle").ToString(), 30)%></span>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkFavoriteNewsLetter" CssClass="lnkBtn" runat="server" Text='<%#Eval("AddRemoveFromFavorite") %>'
                                                                                    CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="AddToFavorite"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

