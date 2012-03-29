<%@ Page Title="Manage NewsLetters" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="ManageNewsLetters.aspx.cs" Inherits="BackOffice_ManageNewsLetters" %>
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
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
                            Manage Newsletters
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
                                                                                    Add/Edit Newsletters
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
                                                                            <tr style="height: 40px; width: 20%;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Title:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txttitle" MaxLength="500" Width="350px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txttitle" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Title."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px; width: 20%;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Description:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtDescription" MaxLength="500"
                                                                                        TextMode="MultiLine" Width="350px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px; width: 20%;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Select Date:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtDate" MaxLength="500" Width="90"></asp:TextBox>
                                                                                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgCal" />
                                                                                       <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate" PopupButtonID="imgCal"
                                                                                    Format="MM/dd/yyyy" runat="server">
                                                                                </cc1:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Select PDF:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:FileUpload ID="fupPDF" Height="22" runat="server" />
                                                                                    <a href="" id="ancPrevious" target="_blank" runat="server" class="lnkBtn">View Previous
                                                                                        PDF</a>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:CheckBox ID="chkIsActive" Text="&nbsp;Is Active" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                </td>
                                                                                <td align="left" valign="bottom">
                                                                                    <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                                                                        ToolTip="Click here to add/update" ID="lnkBtnSearch" runat="server" OnClick="lnkBtnSearch_Click">Add/Update</asp:LinkButton>
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
                                                                                    Newsletters Details
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
                                                                            <asp:GridView ID="GVNews" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0" OnRowCommand="GVNews_RowCommand">
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbQuestionnaireId" runat="server" Visible="false" Text='<%#Eval("IntNewsLetterId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrTitle").ToString(), 30)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Description"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrDescription").ToString(), 20)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText=" Date"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%# Eval("StrNewsletterDate").ToString().Equals("1/1/1999 12:00:00 AM") ? "" : AppLib.GetFormattedDate(Eval("StrNewsletterDate").ToString())%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Date Created"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%# AppLib.GetFormattedDate(Eval("DtCreatedOn").ToString())%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" SortExpression="ChrIsActive"
                                                                                        HeaderText="Current Status" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton CssClass="lnkBtn" OnClientClick="return ConfirmBid('change the status')"
                                                                                                ID="lnkSatus" ToolTip="Click here to change the status" runat="server" CommandName="StatusChanged"
                                                                                                CommandArgument='<%#Eval("IntNewsLetterId") %>'>
                                                                                             <%# Eval("ChrIsActive").ToString().Equals("Y")?"Active":"Deactive"%></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Edit"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkEditQuestionnaire" CssClass="lnkBtn" runat="server" Text="Edit"
                                                                                                CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="EditNews"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Delete"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkDeleteQuestionnaire" CssClass="lnkBtn" runat="server" Text="Delete"
                                                                                             OnClientClick="return ConfirmDelete('Newsletter')"
                                                                                                CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="DeleteNews"></asp:LinkButton>
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
