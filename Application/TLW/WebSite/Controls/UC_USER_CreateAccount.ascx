﻿<%@ Control Language="C#" Debug="true" AutoEventWireup="true" CodeFile="UC_USER_CreateAccount.ascx.cs"
    Inherits="Control_UC_USER_CreateAccount" %>
<%--
<%@ Register Src="UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc3" %>--%>
<%--<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
 
<asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
<asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BorderStyle="Solid" BorderWidth="0px"
    OnCreatedUser="CreateUserWizard1_CreatedUser" OnCreateUserError="CreateUserWizard1_CreatedUserError"
    Width="700px" CreateUserButtonText="Submit" InvalidPasswordErrorMessage="Password must be Non Albhanumeric with minimum length of {0} characters">
    <WizardSteps>
        <asp:CreateUserWizardStep runat="server" ID="CreateUserWizardStep1">
            <ContentTemplate>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td align="left">
                                                                    <b>Login Information</b>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="tblItems">
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Email:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="UserName" runat="server" Width="250px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Email." ValidationGroup="CreateUserWizard1"
                                                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegExpEmail" runat="server" ControlToValidate="UserName"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Invalid Email Format (john@smith.com)."
                                                                        SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                        ValidationGroup="CreateUserWizard1"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle; display: none;">
                                                                <td>
                                                                </td>
                                                                <td class="small">
                                                                    *Email address will be your User Name
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Email (confirm):
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="Email" runat="server" Width="250px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Email(Confirm)."
                                                                        ValidationGroup="CreateUserWizard1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="UserName"
                                                                        ControlToValidate="Email" SetFocusOnError="true" CssClass="required" Display="Dynamic"
                                                                        ErrorMessage="Email & confirm Email must match" ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Password:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="Password" runat="server" TextMode="Password" Width="125px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Password." SetFocusOnError="true"
                                                                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Password (confirm):
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="ConfirmPassword" runat="server" TextMode="Password"
                                                                        Width="125px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                                        SetFocusOnError="true" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Password(Confirm)."
                                                                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="Password"
                                                                        ControlToValidate="ConfirmPassword" SetFocusOnError="true" CssClass="required"
                                                                        Display="Dynamic" ErrorMessage="Password & Confirm Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td align="left">
                                                                    <b>Personal Information</b>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table>
                                                            <tr>
                                                                <td class="top" style="width: 50%;">
                                                                    <table class="tblItems">
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Gender:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlGender" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="ddlGender"
                                                                                    CssClass="required" SetFocusOnError="True" ErrorMessage="Please Select Gender."
                                                                                    ValidationGroup="CreateUserWizard1" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                First Name:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox CssClass="txtBox" ID="txtFname" runat="server" MaxLength="50"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="FNameRequiredField" runat="server" ControlToValidate="txtFname"
                                                                                    CssClass="required" Display="Dynamic" ErrorMessage="Please Enter First Name."
                                                                                    ValidationGroup="CreateUserWizard1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Middle Initial:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox CssClass="txtBox" ID="txtMname" runat="server" Width="30px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Last Name:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox CssClass="txtBox" ID="txtLname" runat="server"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="LNameRequiredField" runat="server" ControlToValidate="txtLname"
                                                                                    CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Last Name."
                                                                                    ValidationGroup="CreateUserWizard1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle; display: none;">
                                                                            <td align="left">
                                                                                Degree:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlDegree" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlDegree"
                                                                                    CssClass="required" ErrorMessage="Please Select Degree." ValidationGroup="na"
                                                                                    Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle; display: none;">
                                                                            <td align="left">
                                                                                Your Role:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlYourRole" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddlYourRole"
                                                                                    CssClass="required" ErrorMessage="Please Select Role." ValidationGroup="na" Operator="GreaterThan"
                                                                                    ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td class="top">
                                                                    <table class="tblItems">
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Height:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox CssClass="txtBox" ID="txtHeight" runat="server" Width="30px"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtHeight"
                                                                                    CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Height." SetFocusOnError="true"
                                                                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Family Status:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlFamilyStatus" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="ddlFamilyStatus"
                                                                                    CssClass="required" ErrorMessage="Please Select Family Status." ValidationGroup="CreateUserWizard1"
                                                                                    Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Relationship:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:DropDownList ID="ddlAccountFromRelationship" runat="server">
                                                                                </asp:DropDownList>
                                                                                <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="ddlAccountFromRelationship"
                                                                                    CssClass="required" ErrorMessage="Please Select Relationship." ValidationGroup="CreateUserWizard1"
                                                                                    Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px; vertical-align: middle;">
                                                                            <td align="left">
                                                                                Date of Birth:
                                                                            </td>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="rdpDateBirth" CssClass="txtBox" runat="server" Width="90"></asp:TextBox>
                                                                                <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="rdpDateBirth" PopupButtonID="rdpDateBirth"
                                                                                    Format="MM/dd/yyyy" runat="server">
                                                                                </cc1:CalendarExtender>
                                                                                <asp:CompareValidator ID="cvDate" runat="server" CssClass="required" ValidationGroup="CreateUserWizard1"
                                                                                    ControlToValidate="rdpDateBirth" SetFocusOnError="True" Operator="GreaterThan"
                                                                                    Type="Date" ErrorMessage="Invalid Date." ValueToCompare="01/01/1900"></asp:CompareValidator>
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rdpDateBirth"
                                                                                    CssClass="required" Display="Dynamic" ErrorMessage="Please Select Date" SetFocusOnError="true"
                                                                                    ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td align="left">
                                                                    <b>Professional Information</b>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="tblItems">
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    <!--Name of Organization:-->
                                                                    Name of Company:
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlCompany" runat="server">
                                                                    </asp:DropDownList>
                                                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="ddlCompany"
                                                                        CssClass="required" ErrorMessage="Please Select Company." ValidationGroup="CreateUserWizard1"
                                                                        Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    <b>Contact Information</b>
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="tblItems">
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Country:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlCountry"
                                                                        CssClass="required" ErrorMessage="Please Select Country." Operator="GreaterThan"
                                                                        ValidationGroup="CreateUserWizard1" ValueToCompare="0"></asp:CompareValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Address:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="txtAddress1" runat="server" MaxLength="255" Width="250px"
                                                                        ValidationGroup="CreateUserWizard1"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Address." SetFocusOnError="true"
                                                                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator><br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="txtAddress2" runat="server" Width="250px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    City:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="txtCity" runat="server" MaxLength="100" Width="250px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity"
                                                                        SetFocusOnError="true" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter City."
                                                                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    State/Prov./Terr.:
                                                                </td>
                                                                <td align="left" style="height: 30px;">
                                                                    <asp:DropDownList ID="ddlState" runat="server">
                                                                    </asp:DropDownList>
                                                                    <asp:TextBox CssClass="txtBox" ID="txtStateText" runat="server" Style="display: none;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Zip/Postal Code:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="txtZip" runat="server" MaxLength="15" Width="75px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtZip" SetFocusOnError="true"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Zip/Postal Code"
                                                                        ValidationGroup="CreateUserWizard1"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle;">
                                                                <td align="left">
                                                                    Phone:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="txtBphone" runat="server" MaxLength="15" Width="125px"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBphone"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Phone." SetFocusOnError="true"
                                                                        Visible="false"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Invalid Phone -- 10 Numeric digits (0-9)"
                                                                        ControlToValidate="txtBphone" CssClass="required" SetFocusOnError="True" ValidationExpression="\d{10}"
                                                                        Visible="false">
                                                                    </asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 30px; vertical-align: middle; display: none;">
                                                                <td align="left">
                                                                    Fax:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:TextBox CssClass="txtBox" ID="txtFax" runat="server" MaxLength="25" Width="125px"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFax"
                                                                        CssClass="required" ErrorMessage="Invalid Fax -- 10 Numeric digits (0-9)" ValidationExpression="\d{10}"
                                                                        ValidationGroup="na" Visible="false"></asp:RegularExpressionValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td align="left">
                                                                    Join e-mail list:
                                                                </td>
                                                                <td align="left">
                                                                    <asp:RadioButton ID="rbtnYEmail" runat="server" Checked="True" GroupName="emaillist"
                                                                        Text="Yes" />
                                                                    <asp:RadioButton ID="rbtnNEmail" runat="server" GroupName="emaillist" Text="No" />
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
            </ContentTemplate>
        </asp:CreateUserWizardStep>
        <asp:CompleteWizardStep runat="server" ID="CompleteUserWizardStep1">
            <ContentTemplate>
                <div>
                    <table class="tblItems">
                        <tr>
                            <td>
                                Congratulations! You have successfully registered an account at
                                <%= ConfigurationSettings.AppSettings["SITE_LINK"]%>.
                            </td>
                        </tr>
                        <tr>
                            <td>
                                A confirmation email has been sent to the email address you provided.<br />
                                <br />
                                <div style="border: solid 1px #990000; padding: 3px;">
                                    <div style="color: #990000; text-decoration: underline; padding-bottom: 2px;">
                                        Important SPAM Message</div>
                                    If the email you provided does not receive an email in the next 24 hours
                                    <br />
                                    confirming this registration,<br />
                                    you may have a spam filter blocking it out. If so, please contact your
                                    <br />
                                    network administrator to have it removed.<br />
                                </div>
                                <br />
                                Should you require additional assistance, please contact us at <span style="font-weight: normal;
                                    white-space: nowrap;">
                                    <%= ConfigurationSettings.AppSettings["SITE_PHONE"]%></span>.<br />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td>
                                                                    Login Information
                                                                </td>
                                                                <td style="text-align: right;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="tblItems">
                                                            <tr>
                                                                <td>
                                                                    Email Address:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td>
                                                                    Personal Information
                                                                </td>
                                                                <td style="text-align: right;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table>
                                                            <tr>
                                                                <td class="top" style="width: 50%;">
                                                                    <table class="tblItems">
                                                                        <tr>
                                                                            <td>
                                                                                Gender:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                First Name:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblFname" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Middle Initial:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblMname" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Last Name:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblLname" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none;">
                                                                            <td>
                                                                                Degree:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblDegree" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none;">
                                                                            <td>
                                                                                Your Role:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblRole" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td class="top">
                                                                    <table class="tblItems">
                                                                        <tr>
                                                                            <td>
                                                                                Height:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblHeight" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Family Status:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblFamilyStatus" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Relationship:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblAccountFromRelationship" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                Date of Birth:
                                                                            </td>
                                                                            <td>
                                                                                <asp:Label ID="lblDateBirth" runat="server"></asp:Label>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td>
                                                                    Professional Information
                                                                </td>
                                                                <td style="text-align: right;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="tblItems">
                                                            <tr>
                                                                <td style="width: 160px">
                                                                    Organization:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblOrganization" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    Is Your Organization An Accredited Provider:
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblIsAccredited" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                    Specialty:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblSpecialty" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                    Affiliation:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblAffiliation" runat="server"></asp:Label>
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
                                                        <table class="Round3_tblHeader">
                                                            <tr>
                                                                <td>
                                                                    Contact Information
                                                                </td>
                                                                <td style="text-align: right;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="tblItems">
                                                            <tr>
                                                                <td>
                                                                    Country:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblCountry" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Address 1:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblAddress1" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Address 2:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblAddress2" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    City:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblCity" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    State/Prov./Terr.:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblState" runat="server" Visible="false"></asp:Label>
                                                                    <asp:Label ID="lblStateText" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Zip/Postal Code:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblZip" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Phone:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblPhone" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                    Fax:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblFax" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td>
                                                                    On Email List:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblEmailList" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
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
            </ContentTemplate>
        </asp:CompleteWizardStep>
    </WizardSteps>
    <CreateUserButtonStyle Height="30" CssClass="aButtonSmall" />
    <ContinueButtonStyle />
</asp:CreateUserWizard>
<%--Commented by Netsmartz for resolving compile time issues
<telerik:AjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" Height="75px" Width="75px">
    <asp:Image ID="Image1" runat="server" AlternateText="Loading..." ImageUrl="~/RadControls/Ajax/Skins/Default/loading2.gif" />
</telerik:AjaxLoadingPanel>--%>
<%--<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="UC_USER_CreateAccount1$CreateUserWizard1$CreateUserStepContainer$ddlCountry">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="UC_USER_CreateAccount1$CreateUserWizard1$CreateUserStepContainer$ddlState" />
                <telerik:AjaxUpdatedControl ControlID="UC_USER_CreateAccount1$CreateUserWizard1$CreateUserStepContainer$txtStateText" />
                <telerik:AjaxUpdatedControl ControlID="UC_USER_CreateAccount1$CreateUserWizard1$CreateUserStepContainer$ddlStateRequired1" />
                <telerik:AjaxUpdatedControl ControlID="UC_USER_CreateAccount1$CreateUserWizard1$CreateUserStepContainer$ddlStateRequired2" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<uc3:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />--%>
