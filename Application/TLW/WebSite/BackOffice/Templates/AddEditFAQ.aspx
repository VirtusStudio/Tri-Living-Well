<%@ Page Title="Add Edit FAQ" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master" AutoEventWireup="true" CodeFile="AddEditFAQ.aspx.cs" Inherits="BackOffice_Templates_AddEditFAQ" %>

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
                          <asp:Label ID="lblHeading" runat="server" Text="Add FAQ"></asp:Label>
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
                                                                <tr><td> <br /><br /></td></tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                            <tr style="height: 40px; width: 20%;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Select Topic:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    
                                                                                    <asp:DropDownList ID="ddlTopic" runat="server" CssClass="txtBox">
                                                                                     
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Question:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtQuestion" MaxLength="500"
                                                                                    Rows="5"
                                                                                        TextMode="MultiLine" Width="350px"></asp:TextBox>
                                                                                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuestion" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Question."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                           
                                                                             <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Answer:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtAnswer" MaxLength="500"
                                                                                    TextMode="MultiLine" Rows="5"
                                                                                        Width="350px"></asp:TextBox>
                                                                                         <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAnswer" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Answer."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                     
                                                                                </td>
                                                                            </tr>   <tr style="height:18px;"><td colspan="2">&nbsp;</td></tr>
                                                                        
                                                                            <tr>
                                                                                <td>
                                                                                </td>
                                                                                <td align="left" valign="bottom">
                                                                                    <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"

                                                                                        ID="lnkBtnSubmit" runat="server" OnClick="lnkBtnSubmit_Click">Add</asp:LinkButton>
                                                                                   <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                                                                        ToolTip="Click here to back" ID="lnkCancel" runat="server" OnClick="lnkBtnCancel_Click">Cancel</asp:LinkButton>
                                                                               
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
