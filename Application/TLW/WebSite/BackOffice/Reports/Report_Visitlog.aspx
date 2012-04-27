<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_Visitlog.aspx.cs"
    MasterPageFile="~/MasterPages/BackOffice.master" Title="Visit Log" Inherits="BackOffice_Reports_Report_Visitlog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="title">
                    <tr>
                        <td align="left">
                            Visit Log
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <div class="">
                    <center class="Round3">
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Search Details
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                            <tr style="height: 40px;">
                                                                                <td align="right" valign="middle" style="width: 18%;">
                                                                                    <span class="keyword">Select User Type:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap; width: 15%;">
                                                                                    <asp:DropDownList ID="ddlUserType" runat="server" CssClass="txtBox">
                                                                                        <asp:ListItem Value="x" Text="All"></asp:ListItem>
                                                                                        <asp:ListItem Value="Administrator" Text="Administrator"></asp:ListItem>
                                                                                        <asp:ListItem Value="User" Text="User"></asp:ListItem>
                                                                                        <asp:ListItem Value="Company" Text="Company"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td align="right" style="width: 15%;" valign="middle">
                                                                                    <span class="keyword">Section Visited:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap; width: 15%;">
                                                                                    <asp:TextBox ID="txtSectionVisited" runat="server" CssClass="txtBox"></asp:TextBox>
                                                                                </td>
                                                                                <td align="left" valign="bottom">
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="right" valign="middle" style="width: 13%;">
                                                                                    <span class="keyword">Visited Date From:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap; width: 15%;">
                                                                                    <asp:TextBox ID="txtVisitedFrom" runat="server" CssClass="txtBox"></asp:TextBox>
                                                                                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgVisitFrom" />
                                                                                    <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtVisitedFrom" PopupButtonID="imgVisitFrom"
                                                                                        Format="MM/dd/yyyy" runat="server">
                                                                                    </cc1:CalendarExtender>
                                                                                </td>
                                                                                <td align="right" valign="middle">
                                                                                    <span class="keyword">Visited Date To:</span>&nbsp;
                                                                                </td>
                                                                                <td colspan="2">
                                                                                    <asp:TextBox ID="txtVisitedTo" runat="server" CssClass="txtBox"></asp:TextBox>
                                                                                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgVisitTo" />
                                                                                    <cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="txtVisitedTo" PopupButtonID="imgVisitTo"
                                                                                        Format="MM/dd/yyyy" runat="server">
                                                                                    </cc1:CalendarExtender>
                                                                                </td>
                                                                                 
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="right" valign="middle" style="width: 13%;">
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap; width: 15%;">
                                                                                </td>
                                                                                <td align="right" valign="middle">
                                                                                </td>
                                                                                <td>
                                                                                </td>
                                                                                <td align="left" valign="bottom">
                                                                                    <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                                                                        ToolTip="Click here to search" ID="lnkBtnSearch" runat="server" OnClick="lnkBtnSearch_Click">Search</asp:LinkButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
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
                </div>
            </td>
        </tr>
        <%-- <tr><td align="right" style="padding-right:5px;">
            <a class="aButtonSmall" href="<%=AppConfig.GetBaseSiteUrl() %>BackOffice/AddEditEvents.aspx">Add New Event</a>
                                                                               </td></tr>--%>
        <tr>
            <td>
                <div class="">
                    <center class="Round3">
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Visited Details
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <asp:GridView ID="GVQuestion" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="true" AllowSorting="false" 
                                                                                PagerStyle-CssClass="paging" 
                                                                                CellSpacing="1" CellPadding="0" GridLines="None" BorderWidth="0"  
                                                                                   OnPageIndexChanging="GVQuestion_PageIndexChanging" 
                                                                                >
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSectionVisitedId" runat="server" Visible="false" Text='<%#Eval("IntSectionVisitedId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Visited Date"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("DtCreatedOn").ToString()%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="User Id"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrUserId").ToString(), 30)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="User Type"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("StrUserType").ToString()%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Machine IP"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("StrVisitedIP").ToString()%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Section Visited"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("StrSectionVisited").ToString()%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                   
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
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
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
