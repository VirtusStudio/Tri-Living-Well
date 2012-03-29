<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_USER_EditAccount.ascx.cs"
    Inherits="UC_USER_EditAccount" %>
<%@ Register Src="UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 
<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <script type="text/javascript">
        function changePassword() {
            document.getElementById('<%=spanPassword.ClientID %>').style.display = 'none';
            document.getElementById('<%=divPassword.ClientID %>').style.display = '';
            document.getElementById('<%=txtPassword.ClientID %>').focus();
        }


    </script>
</telerik:RadScriptBlock>
 
<div id="div" style="width: 100%; height: 100%; text-align: left; vertical-align: middle;">
    <div style="width: 700px;">
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
                                                    <tr id="trOriginalEmail" runat="server">
                                                        <td>
                                                            Original Email:
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblPerson" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Email:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="UserName"  Enabled="false" CssClass="txtBox" runat="server" MaxLength="100" Width="225px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                                                ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Email."
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="UserName"
                                                                    CssClass="required" Display="Dynamic" ErrorMessage="*Must be in format (joe@smith.com)"
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True"></asp:RegularExpressionValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 50px;">
                                                            <div style="padding-top: 3px; padding-bottom: 10px;">
                                                                Password:</div>
                                                            Password (confirm):
                                                        </td>
                                                        <td>
                                                            <span id="spanPassword" runat="server" style="cursor: hand;" onclick="changePassword()">
                                                                <asp:Label ID="lblChangePassword" runat="server" Text="<a>Change Password</a>"></asp:Label></span>
                                                            <div id="divPassword" runat="server" style="display: none;">
                                                                <div style="padding-bottom: 6px;">
                                                                    <asp:TextBox ID="txtPassword" CssClass="txtBox" AutoComplete="off" runat="server"
                                                                        MaxLength="100" Width="225px" TextMode="Password"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="requiredPassword" runat="server" ControlToValidate="txtPassword"
                                                                        CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Password." SetFocusOnError="True"
                                                                        ValidationGroup="EditUser"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <asp:TextBox ID="txtPasswordConfirm" CssClass="txtBox" runat="server" MaxLength="100" Width="225px"
                                                                    TextMode="Password"></asp:TextBox>
                                                                <!--note this validates txtPassword and not txtPasswordConfirm
                    this is to get it positioned here, minimizing validation controls since this is only checked if(txtPassword.Text != "")
                  -->
                                                                <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtPassword"
                                                                    ControlToCompare="txtPasswordConfirm" ValidationGroup="EditUser" CssClass="required"
                                                                    Display="Dynamic" ErrorMessage="*Password & Confirm Must Match." SetFocusOnError="True"></asp:CompareValidator>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr id="spAccess" runat="server">
                                                        <td>
                                                            Access:
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rbAccessTrue" CssClass="txtBox" runat="server" GroupName="access"
                                                                Text="True" />
                                                            &nbsp;
                                                            <asp:RadioButton ID="rbAccessFalse" CssClass="txtBox" runat="server" GroupName="access"
                                                                Text="False" />
                                                        </td>
                                                    </tr>
                                                    <tr id="spRole" runat="server">
                                                        <td>
                                                            User Type:
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rbRoleUser" Visible="false" runat="server" Text="User" GroupName="Role" />
                                                            &nbsp;
                                                            <asp:RadioButton ID="rbRoleAdministrator" Visible="false" runat="server" Text="Administrator" GroupName="Role" />
                                                            <asp:Label ID="lblUserRole" runat="server"></asp:Label>

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
                                                                        <asp:DropDownList ID="ddlGender" CssClass="txtBox" runat="server">
                                                                        </asp:DropDownList>
                                                                        <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddlGender"
                                                                            ValidationGroup="EditUser" CssClass="required" ErrorMessage="Please Select Gender."
                                                                            Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        First Name:
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtFname" CssClass="txtBox" runat="server" MaxLength="50"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="FNameRequiredField" runat="server" ControlToValidate="txtFname"
                                                                            ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter First Name."
                                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Middle Initial:
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtMname" CssClass="txtBox" runat="server" Width="30px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Last Name:
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtLname" CssClass="txtBox" runat="server" MaxLength="50"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="LNameRequiredField" runat="server" ControlToValidate="txtLname"
                                                                            ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Last Name."
                                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td>
                                                                        Degree:
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDegree" CssClass="txtBox" runat="server">
                                                                        </asp:DropDownList>
                                                                        <asp:CompareValidator ID="CompareValidator4" ValidationGroup="na" runat="server"
                                                                            ControlToValidate="ddlDegree" CssClass="required" ErrorMessage="Please Select Degree."
                                                                            Operator="GreaterThan" SetFocusOnError="True" ValueToCompare="0"></asp:CompareValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr style="display: none;">
                                                                    <td>
                                                                        Your Role:
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlYourRole" CssClass="txtBox" runat="server">
                                                                        </asp:DropDownList>
                                                                        <asp:CompareValidator ID="CompareValidator2" ValidationGroup="na" runat="server"
                                                                            ControlToValidate="ddlYourRole" CssClass="required" ErrorMessage="Please Select Role."
                                                                            Operator="GreaterThan" SetFocusOnError="True" ValueToCompare="0"></asp:CompareValidator>
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
                                                                        <asp:TextBox ID="txtHeight" CssClass="txtBox" runat="server" Width="30px"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtHeight"
                                                                            ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Height."
                                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Family Status:
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList CssClass="txtBox" ID="ddlFamilyStatus" runat="server">
                                                                        </asp:DropDownList>
                                                                        <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="ddlFamilyStatus"
                                                                            ValidationGroup="EditUser" CssClass="required" ErrorMessage="Please Select Family Status."
                                                                            Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Relationship:
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList CssClass="txtBox" ID="ddlAccountFromRelationship" runat="server">
                                                                        </asp:DropDownList>
                                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlAccountFromRelationship"
                                                                            ValidationGroup="EditUser" CssClass="required" ErrorMessage="Please Select Relationship."
                                                                            Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        Date of Birth:
                                                                    </td>
                                                                    <td>
                                                                        <telerik:RadDatePicker ID="rdpDateBirth" runat="server" Width="90" Skin="WebBlue"
                                                                            MinDate="01/01/1900">
                                                                            <Calendar ID="Calendar1" runat="server" ShowRowHeaders="False" RangeMinDate="01/01/1900">
                                                                            </Calendar>
                                                                        </telerik:RadDatePicker>
                                                                        <asp:CompareValidator ID="cvDate" runat="server" ValidationGroup="EditUser" CssClass="required"
                                                                            ControlToValidate="rdpDateBirth" SetFocusOnError="True" Operator="GreaterThan"
                                                                            Type="Date" ValueToCompare="01/01/1900"></asp:CompareValidator>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="rdpDateBirth"
                                                                            ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Select Date of Birth."
                                                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                                    <tr style="display: none;">
                                                        <td>
                                                            Account:
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblAccountName" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Name of Organization:
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="txtOrganization" runat="server" MaxLength="100" Width="200px"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td>
                                                            Specialty:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtSpecialty" CssClass="txtBox" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td>
                                                            Affiliation:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtAffiliation" CssClass="txtBox" runat="server" MaxLength="100"
                                                                Width="200px"></asp:TextBox>
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
                                                            <asp:DropDownList ID="ddlCountry" CssClass="txtBox" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddlCountry"
                                                                ValidationGroup="EditUser" CssClass="required" ErrorMessage="Please Select Country."
                                                                Operator="GreaterThan" ValueToCompare="0" SetFocusOnError="True"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Address:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtAddress1" CssClass="txtBox" runat="server" MaxLength="255" Width="250px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAddress1"
                                                                ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Address."
                                                                SetFocusOnError="true"></asp:RequiredFieldValidator><br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtAddress2" CssClass="txtBox" runat="server" Width="250px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            City:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtCity" CssClass="txtBox" runat="server" MaxLength="100" Width="250px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity"
                                                                ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter City."
                                                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 30px">
                                                            State/Prov./Terr.:
                                                        </td>
                                                        <td style="height: 30px;">
                                                            <asp:DropDownList ID="ddlState" CssClass="txtBox" runat="server">
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="txtStateText" CssClass="txtBox" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Zip/Postal Code:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtZip" CssClass="txtBox" runat="server" MaxLength="9" Width="75px"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtZip"
                                                                ValidationGroup="EditUser" CssClass="required" Display="Dynamic" ErrorMessage="Please Enter Zip/Postal Code."
                                                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                                 <asp:CompareValidator ID="CompareValidator9" runat="server"  
                                                                        ControlToValidate="txtZip" SetFocusOnError="true" CssClass="required" Display="Dynamic"
                                                                        Operator="DataTypeCheck" Type="Integer"
                                                                        ErrorMessage="Only integers are allowed1" ValidationGroup="EditUser"></asp:CompareValidator>
                                                             
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Phone:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtPhone" CssClass="txtBox" runat="server" MaxLength="15" Width="125px"></asp:TextBox>
                                                                 <span class="required">(xxx-xxx-xxxx)</span>  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Phone!"
                                                                    ValidationExpression="\d{3}\-\d{3}-\d{4}" Display="Dynamic" SetFocusOnError="true"
                                                                    ValidationGroup="EditUser" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                                                                </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td>
                                                            Fax:
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtFax" CssClass="txtBox" runat="server" MaxLength="15" Width="125px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td>
                                                            Join e-mail list:
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rbtnYEmail" CssClass="txtBox" runat="server" Checked="True"
                                                                GroupName="emaillist" Text="Yes" />
                                                            <asp:RadioButton ID="rbtnNEmail" CssClass="txtBox" runat="server" GroupName="emaillist"
                                                                Text="No" />
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
        <span style="visibility: hidden;">
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit IT"
                ValidationGroup="EditUser" />
            <input type="text" id="txtSuccess" runat="server" value="0" />
            <asp:TextBox ID="txtRegistrationFlg" runat="server" Text="0"></asp:TextBox>
            ERROR:<asp:TextBox ID="txtError" runat="server" Text=""></asp:TextBox>
        </span>
        <table>
            <tr>
                <td>
                    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                        <a class="aButtonSmall" href="javascript:document.getElementById('<%=btnSubmit.ClientID %>').click();">
                            Update</a> <a class="aButtonSmall" href="javascript:history.back();">Cancel</a>
                    </telerik:RadCodeBlock>
                    <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <%--<telerik:RadAjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" Height="75px"
        Width="75px">
        <asp:Image ID="Image1" runat="server" AlternateText="Loading..." ImageUrl="~/RadControls/Ajax/Skins/Default/loading2.gif" />
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnSubmit">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtSuccess" />
                    <telerik:AjaxUpdatedControl ControlID="txtError" />
                    <telerik:AjaxUpdatedControl ControlID="lblError" LoadingPanelID="AjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ddlCountry">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlCountry" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtStateText" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlState" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlStateRequired1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlStateRequired2" />
                    <telerik:AjaxUpdatedControl ControlID="lblStateLabel" LoadingPanelID="AjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>--%>
    <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
</div>
