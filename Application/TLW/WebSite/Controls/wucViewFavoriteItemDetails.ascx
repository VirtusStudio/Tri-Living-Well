<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucViewFavoriteItemDetails.ascx.cs"
    Inherits="Controls_wucViewFavoriteItemDetails" %>
<table width="100%">
    <tr>
        <td align="left">
            <table class="title">
                <tr>
                    <td align="left">
                        Favorite List Details
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right">
            <a class="aButtonSmall" href="javascript:history.back();">Back</a>
        </td>
    </tr>
</table>
<div class="demoContent" style="padding: 0px 15px 15px 15px;">
    <table>
        <tr>
            <td align="left">
                <table width="100%">
                    <tr>
                        <td align="right" style="width: 20%;">
                            <b>Title:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtFavoriteTitle" CssClass="txtBox" TextMode="MultiLine" Rows="4"
                                Columns="70" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFavoriteTitle" Display="Static"
                                ValidationGroup="News" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Title."
                                CssClass="required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trNewsletter" runat="server">
            <td>
                <table cellpadding="4" cellspacing="4" border="0">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" style="width: 20%;" valign="top">
                            <b>Description:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblNewsletterDescription" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Date:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblNewsletterDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trNewsletterPDF" runat="server"  style="height: 30px;">
                        <td align="right" valign="top">
                             
                            <b>PDF:</b>&nbsp;&nbsp;
                              
                        </td>
                        <td align="left" valign="top">
                            <a href="" id="ancPrevious" target="_blank" runat="server" class="lnkBtn">View PDF</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px;">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trEvent" runat="server">
            <td>
                <table cellpadding="4" cellspacing="4" border="0" width="100%">
                    <tr style="height: 30px;" valign="top">
                        <td align="right" valign="top" style="width: 20%;">
                            <b>Date:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblEventDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Activity:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblEventActivity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Location:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblEventLocation" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Comments:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblEventComments" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px;">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trNewsAnnouncement" runat="server">
            <td>
                <table cellpadding="4" cellspacing="4" border="0">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="Label1" runat="server" CssClass="required"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" style="width: 20%;" valign="top">
                            <b>Description:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblNewsAnnouncementDescription" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trNewsAnnouncementDirectLink" runat="server"  style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Direct Link:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblNewsAnnouncementDirectLink" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trNewsAnnouncementPDF" runat="server"  style="height: 30px;">
                        <td align="right" valign="top">
                            <b>PDF:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <a href="" id="ancPreviousNewsAnnoucment" target="_blank" runat="server" class="lnkBtn">
                                View PDF</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px;">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="trLibrary" runat="server">
            <td>
                <table cellpadding="4" cellspacing="4" border="0">
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Label ID="Label2" runat="server" CssClass="required"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" style="width: 20%;" valign="top">
                            <b>Description:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblLibraryDescription" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Date:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblLibraryDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Category:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblLibraryCategory" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Category Type:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblLibraryCategoryType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trLibraryLink" runat="server" style="height: 30px;">
                        <td align="right" valign="top">
                            <b>Website Link:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <asp:Label ID="lblLibraryWebsiteLink" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr id="trLibraryPDF" runat="server" style="height: 30px;">
                        <td align="right" valign="top">
                            <b>PDF:</b>&nbsp;&nbsp;
                        </td>
                        <td align="left" valign="top">
                            <a href="" id="ancLibraryPDF" target="_blank" runat="server" class="lnkBtn">View PDF</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px;">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" valign="bottom">
                <table width="100%">
                    <tr>
                        <td align="right" style="width: 20%;">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                ToolTip="Click here to update" ID="lnkBtnSubmit" runat="server" Text="Update"
                                OnClick="lnkBtnSubmit_Click"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
