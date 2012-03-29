<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucCompanyRegistration.ascx.cs"
    Inherits="Controls_wucCompanyRegistration" %>
<div>
    <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr style="height: 20px;">
            <td class="tbl_MainHeader">
                <table>
                    <tr>
                        <td align="left">
                            Company Registration
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">&nbsp;
                <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr id="trControls" runat="server">
            <td>
                <table class="tblItems" width="100%" border="0">
                    <tr>
                        <td style="width: 25%" align="left" valign="middle">
                            <span class="keyword">Company Email <span class="required">*</span>:</span>
                            <br />
                            <span class="required" style="font-size: 10px;">(this will be User ID)</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" ID="txtCompanyEmail" CssClass="txtBox" MaxLength="150"
                                Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyEmail" Display="Dynamic"
                                ValidationGroup="CompanyRegistration" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Company Email."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REVEmail" ValidationGroup="CompanyRegistration"
                                runat="server" ErrorMessage="Invalid Company Email." CssClass="required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtCompanyEmail" Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Password<span class="required">*</span>:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" ID="txtPassword" CssClass="txtBox" TextMode="Password"
                                MaxLength="150" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" Display="Dynamic"
                                ValidationGroup="CompanyRegistration" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Password."
                                CssClass="required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Confirm Password<span class="required">*</span>:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="txtBox" TextMode="Password"
                                MaxLength="150" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword"
                                Display="Static" ValidationGroup="CompanyRegistration" ID="RequiredFieldValidator3"
                                ErrorMessage="Please Enter Confirm Password." CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvPassword" runat="server" ValidationGroup="CompanyRegistration"
                                ErrorMessage="Password Mismatch(Password and Confirm Password)!" ControlToCompare="txtPassword"
                                ControlToValidate="txtConfirmPassword" Display="Dynamic">
                            </asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Company Name<span class="required">*</span>:</span>&nbsp;
                        </td>
                        <td align="left" valign="middle" style="white-space: nowrap;">
                            <asp:TextBox runat="server" ID="txtCompanyName" CssClass="txtBox" MaxLength="100"
                                Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCompanyName" Display="Static"
                                ValidationGroup="CompanyRegistration" ID="rfvCompanyName" ErrorMessage="Please Enter Company Name."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revLastName" runat="server" ValidationGroup="CompanyRegistration"
                                ControlToValidate="txtCompanyName" ValidationExpression="[a-zA-Z0-9.,' ]*" ErrorMessage="Invalid Company Name."
                                Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Company Phone:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" ID="txtPhone" CssClass="txtBox" onKeyUp="javascript:return mask(this.value,this,'3,7','-');"
                                onBlur="javascript:return mask(this.value,this,'3,7','-');" MaxLength="12" Width="150px"></asp:TextBox>
                            <span class="required">(xxx-xxx-xxxx)</span>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Phone!"
                                ValidationExpression="\d{3}\-\d{3}-\d{4}" Display="Dynamic" SetFocusOnError="true"
                                ValidationGroup="CompanyRegistration" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Company Fax:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" ID="txtFax" CssClass="txtBox" MaxLength="12" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Country:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:DropDownList ID="ddlCountry" CssClass="txtBox" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">State:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:DropDownList ID="ddlState" CssClass="txtBox" runat="server" AutoPostBack="false">
                            </asp:DropDownList>
                            <asp:TextBox CssClass="txtBox" ID="txtStateText" runat="server" Style="display: none;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">City:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" CssClass="txtBox" ID="txtCity" MaxLength="50" Width="150px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="CompanyRegistration"
                                ControlToValidate="txtCity" ValidationExpression="[a-zA-Z0-9.,' ]*" ErrorMessage="Invalid City"
                                Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="middle">
                            <span class="keyword">Company Address:</span>
                        </td>
                        <td align="left" valign="middle">
                            <asp:TextBox runat="server" CssClass="txtBox" ID="txtAddress" Width="150px" TextMode="MultiLine"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="CompanyRegistration"
                                ControlToValidate="txtAddress" ValidationExpression="[a-zA-Z0-9:.,' ]*" ErrorMessage="Invalid Address"
                                Display="Dynamic" SetFocusOnError="true"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="left">
                            <asp:LinkButton CssClass="aButtonSmall" Width="55" ID="lnkBtnSubmit" runat="server" ValidationGroup="CompanyRegistration"
                                OnClick="lnkBtnSubmit_Click">Submit</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
