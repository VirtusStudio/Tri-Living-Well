<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucEditCompanyDetails.ascx.cs"
    Inherits="Controls_wucEditCompanyDetails" %>
<script src="../Scripts/Common.js" type="text/javascript"></script>
<table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            &nbsp;
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
                                                                                Edit Company Details
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <table width="100%" border="0" cellpadding="2" cellspacing="2">
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Company Email:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:Label ID="lblEmailId" runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Company Name<span class="required">*</span>:</span>&nbsp;
                                                                                        </td>
                                                                                        <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                            <asp:TextBox CssClass="txtBox" runat="server" ID="txtCompanyName" MaxLength="100"
                                                                                                Width="150px"></asp:TextBox>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyName" Display="Static"
                                                                                                ValidationGroup="CompanyRegistration" ID="rfvCompanyName" ErrorMessage="Please Enter Company Name."
                                                                                                CssClass="required"></asp:RequiredFieldValidator>
                                                                                            <asp:RegularExpressionValidator ID="revLastName" runat="server" ValidationGroup="CompanyRegistration"
                                                                                                ControlToValidate="txtCompanyName" ValidationExpression="[a-zA-Z0-9.,' ]*" ErrorMessage="Invalid Company Name."
                                                                                                Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Company Phone:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:TextBox CssClass="txtBox" runat="server" ID="txtPhone" onKeyUp="javascript:return mask(this.value,this,'3,7','-');"
                                                                                                onBlur="javascript:return mask(this.value,this,'3,7','-');" MaxLength="12" Width="150px"></asp:TextBox>
                                                                                            <span class="required">(xxx-xxx-xxxx)</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Phone!"
                                                                                                ValidationExpression="\d{3}\-\d{3}-\d{4}" Display="Dynamic" SetFocusOnError="true"
                                                                                                ValidationGroup="CompanyRegistration" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Company Fax:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:TextBox runat="server" CssClass="txtBox" ID="txtFax" MaxLength="12" Width="150px"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Country:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="txtBox" 
                                                                                            AutoPostBack="true"  OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">State:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:DropDownList ID="ddlState" runat="server"  CssClass="txtBox" 
                                                                                            AutoPostBack="false"  >

                                                                                            </asp:DropDownList>
                                                                                             <asp:TextBox CssClass="txtBox" ID="txtStateText" runat="server" Style="display: none;"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">City:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:TextBox runat="server" ID="txtCity" MaxLength="50" Width="150px" CssClass="txtBox"></asp:TextBox>
                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="CompanyRegistration"
                                                                                                ControlToValidate="txtCity" ValidationExpression="[a-zA-Z0-9.,' ]*" ErrorMessage="Invalid City"
                                                                                                Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Company Address:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:TextBox runat="server" ID="txtAddress" Width="150px" TextMode="MultiLine" CssClass="txtBox"></asp:TextBox>
                                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="CompanyRegistration"
                                                                                                ControlToValidate="txtAddress" ValidationExpression="[a-zA-Z0-9:.,' ]*" ErrorMessage="Invalid Address"
                                                                                                Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="trStatus" runat="server" style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Current Status:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:RadioButtonList Width="40%" ID="rblStatus" runat="server" RepeatColumns="3"
                                                                                                RepeatDirection="Horizontal" CssClass="rdoBtn">
                                                                                                <asp:ListItem Value="Y" Text="Active"></asp:ListItem>
                                                                                                <asp:ListItem Value="N" Text="Deactive"></asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="trApprovedStatus" runat="server" style="height: 30px;">
                                                                                        <td align="left" valign="middle">
                                                                                            <span class="keyword">Aprroved:</span>
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <asp:RadioButtonList Width="32%" ID="rblApproved" runat="server" RepeatColumns="3"
                                                                                                RepeatDirection="Horizontal" CssClass="rdoBtn">
                                                                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                                                                <asp:ListItem Value="N">No</asp:ListItem>
                                                                                            </asp:RadioButtonList>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td style="white-space: nowrap;">
                                                                                            <asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" ValidationGroup="CompanyRegistration"
                                                                                                OnClick="lnkBtnSubmit_Click">Update</asp:LinkButton>
                                                                                                 <asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnBack" runat="server" 
                                                                                                 CausesValidation="false"
                                                                                                 
                                                                                                OnClick="lnkBtnBack_Click">Back</asp:LinkButton>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
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
