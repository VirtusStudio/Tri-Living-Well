<%@ Page Title="Add Edit Event" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="AddEditEvents.aspx.cs" Inherits="BackOffice_AddEditEvents" %>

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
                            <asp:Label ID="lblHeading" runat="server" Text="Add Event"   ></asp:Label>
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
                                                                                   <asp:Label ID="lblSubHeading" runat="server" Text="Add Event Details"   ></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                <a class="aButtonSmall" href="<%=AppConfig.GetBaseSiteUrl() %>BackOffice/ManageEvents.aspx">Back</a>
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
                                                                                    <span class="keyword">Select Date:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtDate" MaxLength="500" Width="90"></asp:TextBox>
                                                                                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgCal" />
                                                                                    <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate" PopupButtonID="imgCal"
                                                                                        Format="MM/dd/yyyy" runat="server">
                                                                                    </cc1:CalendarExtender>
                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator2" ErrorMessage="Please Select Date."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Activity:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtActivity" MaxLength="100" Width="350px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtActivity" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Activity."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Location:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtLocation" MaxLength="50" Width="350px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLocation" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator3" ErrorMessage="Please Enter Location."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Comments:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtComments" MaxLength="500" TextMode="MultiLine"
                                                                                        Width="350px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="right" valign="middle">
                                                                                    <span class="keyword">Is Approved?:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:RadioButtonList ID="rdoApproved" runat="server" Width="100" RepeatColumns="2"
                                                                                        RepeatDirection="Horizontal">
                                                                                        <asp:ListItem Value="A" Text="&nbsp;Yes" Selected="True"></asp:ListItem>
                                                                                        <asp:ListItem Value="D" Text="&nbsp;No"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="right" valign="middle">
                                                                                    <span class="keyword">Is Active?:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:RadioButtonList ID="rdoIsActive" runat="server" Width="100" RepeatColumns="2"
                                                                                        RepeatDirection="Horizontal">
                                                                                        <asp:ListItem Value="Y" Text="&nbsp;Yes" Selected="True"></asp:ListItem>
                                                                                        <asp:ListItem Value="N" Text="&nbsp;No"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" valign="bottom">
                                                                                    <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                                                                        ToolTip="Click here to add" ID="lnkBtnSearch" runat="server" OnClick="lnkBtnSearch_Click">Save</asp:LinkButton>
                                                                                </td>
                                                                                <td align="left" valign="bottom">&nbsp;&nbsp;
                                                                                 <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="false"
                                                                                        ToolTip="Click here to cancel" ID="lnkCancel" runat="server" OnClick="lnkCancel_Click">Cancel</asp:LinkButton>
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
    </table>
</asp:Content>
