﻿<%@ Page Title="View Libraries" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="ViewLibraries.aspx.cs" Inherits="Users_ViewLibraries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popUpWin(path, x, y) {

            var sURL = '<%=AppConfig.GetBaseSiteUrl() %>' + path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
        function load(Filepath) {
            if (Filepath.indexOf("//") > -1) {
                window.location = Filepath;
            }
            else {
                window.location = '<%=AppConfig.GetBaseSiteUrl() %>' + Filepath;
            }
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;">  
            <div>
                <asp:Label ID="lbltextcontent" runat="server"></asp:Label>
            </div>
      
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table>
                <tr>
                    <td align="right">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Main/Main_Frame.aspx'>Back</a>
                    </td>
                </tr>
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
                                      
                                       <asp:LinkButton ID="lnkViewLabraries" CssClass="lnkBtn" runat="server" Text='<%#Eval("StrTitle").ToString() %>'
                                            CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="PathViewlabrariesFile"></asp:LinkButton>
                                      
                                  
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
