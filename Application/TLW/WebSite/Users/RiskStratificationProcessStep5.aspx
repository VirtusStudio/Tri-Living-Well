<%@ Page Title="Risk Stratification Process Step 5" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true"
    CodeFile="RiskStratificationProcessStep5.aspx.cs" Inherits="Users_RiskStratificationProcessStep5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table border="0">
        <tr>
            <td align="center">
                <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="title" valign="top">
                Risk Stratification Process Step 5
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
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
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Screen 5
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" cellpadding="4" cellspacing="4" border="0">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <br />
                                                                                Daily Caloric Requirements
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <asp:Label ID="lblDCRequirmentHTMLText" runat="server"></asp:Label>
                                                                                   <span style="text-align:left;"><a href="<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/DailyCaloricRequirements.aspx" target="_blank">
                                                                                                Read More</a></span><br />
                                                                                            <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left">
                                                                                Calculate Daily Caloric Requirements
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left">
                                                                                STEP 1: How Many Calories Do I Need?
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left" style="padding-left: 20px;">
                                                                                Height:
                                                                                <asp:TextBox ID="txtHeight" onblur="calcCaloriesOnBlur()" runat="server" CssClass="txtBox"
                                                                                    MaxLength="7"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHeight" Display="Static"
                                                                                    ValidationGroup="Step5" ID="RequiredFieldValidator3" ErrorMessage="Please Enter Height."
                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtHeight" runat="server"
                                                                                    ErrorMessage="Height Should be in Integer/Decimal." ValidationGroup="Step5" Display="Dynamic"
                                                                                    CssClass="required" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left" style="padding-left: 20px;">
                                                                                Weight:
                                                                                <asp:TextBox ID="txtWeight" onblur="calcCaloriesOnBlur()" runat="server" CssClass="txtBox"
                                                                                    MaxLength="7"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWeight" Display="Static"
                                                                                    ValidationGroup="Step5" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Weight."
                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtWeight" runat="server"
                                                                                    ErrorMessage="Weight Should be in Integer/Decimal." ValidationGroup="Step5" Display="Dynamic"
                                                                                    CssClass="required" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left" style="padding-left: 20px;">
                                                                                Age:
                                                                                <asp:TextBox ID="txtAge" onblur="calcCaloriesOnBlur()" runat="server" CssClass="txtBox"
                                                                                    MaxLength="7"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge" Display="Dynamic"
                                                                                    ValidationGroup="Step5" ID="RequiredFieldValidator2" ErrorMessage="Please Select Age."
                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtAge" runat="server"
                                                                                    ErrorMessage="Age Should be in Integer/Decimal." ValidationGroup="Step5" Display="Dynamic"
                                                                                    CssClass="required" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left" style="padding-left: 20px;">
                                                                                Gender:
                                                                                <asp:DropDownList ID="ddlGender" onchange="javascript:calcCaloriesOnBlur()" runat="server">
                                                                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                                                                    <asp:ListItem Value="Female" Selected="True">Female</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left">
                                                                                How Active Are You?
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left"><asp:Label ID="lblActiveAreYouHTMLText" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left">
                                                                                STEP 2: Apply Activity Factors
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left">
                                                                                Please select the following level of activity that describes best your current level
                                                                                of activity
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left">
                                                                                <asp:DropDownList onchange="javascript:calcCaloriesOnBlur()" ID="ddlActivity" runat="server"
                                                                                    CssClass="txtBox">
                                                                                    <asp:ListItem Value="1">Sedentary - little or no exercise</asp:ListItem>
                                                                                    <asp:ListItem Value="2">Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem>
                                                                                    <asp:ListItem Value="3">Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem>
                                                                                    <asp:ListItem Value="4">Very Active - hard exercise/sports 6-7 days/week</asp:ListItem>
                                                                                    <asp:ListItem Value="5">Extremely Active: Hard daily exercise or sports 2x/day</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <a class="aButtonSmall" href="javascript:calcCalories();">Calculate</a>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="left" style="padding-left: 20px;">
                                                                                Daily Recommended&nbsp;Calories :
                                                                                <asp:TextBox ID="txtCalories" CssClass="txtBox" onkeypress="return false;" runat="server"></asp:TextBox>
                                                                                calories
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <asp:CheckBox ID="chkWaiverAgreement" runat="server" Text="I accept the Waiver Agreement" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50" CausesValidation="false"
                                                                                    OnClick="lnkBack_Click">Back</asp:LinkButton>
                                                                                &nbsp;
                                                                                <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="Step5" ID="lnkBtnSubmit"
                                                                                    runat="server" Width="50" CausesValidation="true" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton>
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
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function calcActivityFactor() {
            var sActivityLevel = document.getElementById('<%=ddlActivity.ClientID %>').value;

            if (sActivityLevel == "1") return 1.2;
            if (sActivityLevel == "2") return 1.375;
            if (sActivityLevel == "3") return 1.55;
            if (sActivityLevel == "4") return 1.725;
            if (sActivityLevel == "5") return 1.9;
        }

        function calcCalories() {
            var varRMR = 0;
            if (document.getElementById('<%=txtHeight.ClientID %>').value == '') {
                alert("Please Enter Height.");
                return;
            }
            if (document.getElementById('<%=txtWeight.ClientID %>').value == '') {
                alert("Please Enter Weight.");
                return;
            }
            if (document.getElementById('<%=txtAge.ClientID %>').value == '') {
                alert("Please Enter Age.");
                return;
            }


            if (document.getElementById('<%=ddlGender.ClientID %>').value == "Female") {
                varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * parseFloat(document.getElementById('<%=txtHeight.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(5);
            }
            else if (document.getElementById('<%=ddlGender.ClientID %>').value == "Male") {
                varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * parseFloat(document.getElementById('<%=txtHeight.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(161);
            }

            varRMR = parseFloat(varRMR) * parseFloat(calcActivityFactor());
            document.getElementById('<%=txtCalories.ClientID %>').value = varRMR.toFixed(0).toString();
        }


        function calcCaloriesOnBlur() {

            if (document.getElementById('<%=txtWeight.ClientID %>').value != "" &&
        document.getElementById('<%=txtHeight.ClientID %>').value != "" &&
        document.getElementById('<%=txtAge.ClientID %>').value != "") {
                var varRMR = 0;


                if (document.getElementById('<%=ddlGender.ClientID %>').value == "Female") {
                    varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * parseFloat(document.getElementById('<%=txtHeight.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(5);
                }
                else if (document.getElementById('<%=ddlGender.ClientID %>').value == "Male") {
                    varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * parseFloat(document.getElementById('<%=txtHeight.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(161);
                }

                varRMR = parseFloat(varRMR) * parseFloat(calcActivityFactor());
                document.getElementById('<%=txtCalories.ClientID %>').value = varRMR.toFixed(0).toString();


            }
        }

    </script>
</asp:Content>
