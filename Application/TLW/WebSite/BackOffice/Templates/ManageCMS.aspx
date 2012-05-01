<%@ Page Title="Manage CMS" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="ManageCMS.aspx.cs" Inherits="BackOffice_Templates_ManageCMS" %>

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
                           Page & Email Content Management
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
                                                                    <td align="left">
                                                                        <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                                <tr>
                                                                                    <td align="left" valign="middle" style="width: 20%;">
                                                                                        <span class="keyword">Content Type:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:DropDownList ID="ddlTemplateName" AutoPostBack="true" runat="server" CssClass="form"
                                                                                            OnSelectedIndexChanged="ddlTemplateName_SelectedIndexChanged">
                                                                                            <asp:ListItem Text="---Select Content Type---" Value="0"></asp:ListItem>
                                                                                            <asp:ListItem Text="Email Templates" Value="2"></asp:ListItem>
                                                                                            <asp:ListItem Text="Website Pages" Value="1"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <br />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left" valign="middle">
                                                                                        <span class="keyword">Content Name:</span>&nbsp;
                                                                                    </td>
                                                                                    <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                        <asp:DropDownList ID="ddlPage" AutoPostBack="true" runat="server" CssClass="form"
                                                                                            OnSelectedIndexChanged="ddlSelectPage_SelectedIndexChanged">
                                                                                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="required" align="left" colspan="2">
                                                                                        NOTE: Please don't change any string or character which are in the rectangle "[",
                                                                                        "]" braces in the HTML Editor below.
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <div style="width: 680;">
                                                                                            <telerik:RadEditor ID="reContent" runat="server" ImageManager-EnableImageEditor="true"
                                                                                                ImageManager-ViewPaths="~/Upload/EditorImages" ImageManager-UploadPaths="~/Upload/EditorImages"
                                                                                                ImageManager-DeletePaths="~/Upload/EditorImages" FlashManager-UploadPaths="~/Upload/EditorFlashImages"
                                                                                                FlashManager-DeletePaths="~/Upload/EditorFlashImages" FlashManager-MaxUploadFileSize="100000"
                                                                                                FlashManager-ViewPaths="~/Upload/EditorFlashImages">
                                                                                            </telerik:RadEditor>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        <br />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td align="left" valign="bottom">
                                                                                        <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to update" ID="lnkBtnUpdate"
                                                                                            runat="server" OnClick="lnkBtnUpdate_Click">Update</asp:LinkButton>
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
