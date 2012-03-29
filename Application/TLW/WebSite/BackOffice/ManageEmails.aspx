<%@ Page Title="Manage Emails" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="ManageEmails.aspx.cs" Inherits="BackOffice_ManageEmails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            Manage Emails
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
                                                                                    Email Details
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
                                                                            <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                                <tr style="height: 30px;">
                                                                                    <td align="left" valign="middle" style="width: 20%;">
                                                                                        <span class="keyword">Select Send To:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:DropDownList ID="ddlToEmails" AutoPostBack="true" runat="server" CssClass="form"
                                                                                            OnSelectedIndexChanged="ddlToEmails_SelectedIndexChanged">
                                                                                            <asp:ListItem Text="---All---" Value="0"></asp:ListItem>
                                                                                            <asp:ListItem Text="To All Companies" Value="1"></asp:ListItem>
                                                                                            <asp:ListItem Text="To Single Company" Value="2"></asp:ListItem>
                                                                                            <asp:ListItem Text="To All users of Company" Value="3"></asp:ListItem>
                                                                                            <asp:ListItem Text="To Single user of Company" Value="4"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr id="trCompany" runat="server" style="height: 30px;">
                                                                                    <td align="left" valign="middle">
                                                                                        <span class="keyword">Select Company:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:DropDownList ID="ddlCompany" AutoPostBack="true" runat="server" CssClass="form"
                                                                                            OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                                                                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr  id="trUsers" runat="server" >
                                                                                    <td align="left" valign="middle">
                                                                                        <span class="keyword">Select User:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:DropDownList ID="ddlUsers" AutoPostBack="false" runat="server" CssClass="form">
                                                                                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="height: 30px;">
                                                                                    <td align="left" valign="middle">
                                                                                        <span class="keyword">Enter From Address:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:TextBox ID="txtFromEmail" runat="server" CssClass="txtBox" Width="200"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="height: 35px;">
                                                                                    <td align="left" valign="middle">
                                                                                        <span class="keyword">Enter Subject:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:TextBox ID="txtSubject" runat="server"  CssClass="txtBox" Width="350"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left" valign="top">
                                                                                        <span class="keyword">Enter Content:</span>&nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <div style="width: 680;">
                                                                                            <telerik:RadEditor ID="reContent" runat="server">
                                                                                            </telerik:RadEditor>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr style="height:40px;">
                                                                                    <td>
                                                                                    </td>
                                                                                    <td align="left" valign="bottom">
                                                                                        <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to send" ID="lnkBtnUpdate"
                                                                                            runat="server" OnClick="lnkBtnUpdate_Click">Send</asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
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
