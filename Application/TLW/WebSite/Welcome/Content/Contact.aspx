<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" MasterPageFile="~/MasterPages/User.master" Title="Contact Us" Inherits="Contact" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">  
<div id="publicWrapper">
<div id="publicFrame">
 <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;">
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
                                                            Contact Us
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
                                            <table class="tblItems" cellpadding="2" cellspacing="2">
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top" style="width: 20%;">
                                                        <span class="required">*</span>Name:
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:TextBox CssClass="txtBox" ID="txtName" runat="server" Width="250px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                            CssClass="required" Display="Dynamic" ErrorMessage="*Required" ValidationGroup="CreateUserWizard1"
                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top">
                                                        <span class="required">*</span>Email:
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:TextBox CssClass="txtBox" ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtEmail"
                                                            CssClass="required" Display="Static" ErrorMessage="*Required" ValidationGroup="CreateUserWizard1"
                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegExpEmail" runat="server" ControlToValidate="txtEmail"
                                                            CssClass="required" Display="Static" ErrorMessage="Format (john@smith.com)"
                                                            SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top">
                                                        <span class="required">*</span>Phone:
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:TextBox CssClass="txtBox" ID="txtBphone" runat="server" MaxLength="15" Width="125px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBphone"
                                                            CssClass="required" Display="Static" ErrorMessage="*Required" SetFocusOnError="true"
                                                             ValidationGroup="CreateUserWizard1"
                                                            Visible="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top">
                                                        <span class="required">*</span>Subject:
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:TextBox CssClass="txtBox" ID="txtsubject" runat="server" MaxLength="15" Width="250px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsubject"
                                                            CssClass="required" Display="Static" ErrorMessage="*Required" SetFocusOnError="true"
                                                            ValidationGroup="CreateUserWizard1"
                                                            Visible="true"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="top">
                                                        Comments:
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:TextBox CssClass="txtBox" ID="txtComments" runat="server" MaxLength="15" Width="250px"
                                                            TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td align="left" valign="bottom">
                                                        <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to submit your information"
                                                        CausesValidation="true" ValidationGroup="CreateUserWizard1"
                                                            Width="65" ID="lnkBtnSearch" runat="server" OnClick="lnkBtnSearch_Click">Submit</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
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
</div>
</div>
</asp:Content>