<%@ Page Title="My Nutrition" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="MyNutrition.aspx.cs" Inherits="Main_MyNutrition" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr><td align="right">
            <a onclick="javascript:return history.back();" href='#'>Back</a>
        </td></tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="center">
                <b>Nutrition Overview</b>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="lblNutritionOverview" runat="server"></asp:Label><br />
                <a onclick="javascript:return OpenCMSPopupWindow('MyNutritionOverview');" href="#"
                    target="_blank">Read More</a>
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="center">
                <b>What do you want to Achieve?</b>
            </td>
        </tr>
        <tr>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="center">
                Introduction (TLW will provide written content. First one or two sentences will
                be displayed, followed by Please read more…)
            </td>
        </tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="left">
                <b>Maintain</b>
            </td>
        </tr>
        <tr>
            <td align="left">
                Follow recommended daily caloric intake to maintain current weight. <a onclick="javascript:return OpenCMSPopupWindow('MyNutritionOverview');"
                    href="#" target="_blank">Click here</a> to review Daily Caloric Requirements
            </td>
        </tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="left">
                <a onclick="javascript:return OpenCMSPopupWindow('MyNutritionOverview');" href="#"
                    target="_blank">Loose Weight</a>
            </td>
        </tr>
        <tr>
            <td align="left">
                <table width="20%;">
                    <tr style="height: 30px; vertical-align: middle;">
                        <td align="right" style="width: 30%;">
                            Current Weight:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentWeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px; vertical-align: middle;">
                        <td align="right">
                            How Many Pounds Do You Want to Lose?:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtWeighttoLoose" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px; vertical-align: middle;">
                        <td align="right">
                            Weight Goal:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtWeightGoal" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px; vertical-align: middle;">
                        <td align="right">
                            Result So Far:
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtResultSoFar" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="left">
                <a onclick="javascript:return OpenPopupWindow('LooseHalfPoundPerWeek');" href='<%=AppConfig.GetBaseSiteUrl() %>Users/LooseHalfPoundPerWeek.aspx'>
                    Click on Lose ½ pound per week </a>
            </td>
        </tr>
        <tr style="height: 40px; vertical-align: middle">
            <td align="left">
                <a onclick="javascript:return OpenPopupWindow('LooseOnePoundPerWeek');" href="#"
                    target="_blank">Click on Lose 1 pound per week</a>
            </td>
        </tr>
        <tr>
            <td style="height: 40px; vertical-align: middle">
                <b>Personal Summary</b>
            </td>
        </tr>
        <tr>
            <td style="height: 40px; vertical-align: middle">
                The TLW Calculator provides you with personal results and a starting point as you
                begin your nutrition and fitness program. Your Personal Summary allows you to track
                and measure your success. Click on the TLW Calculator to determine your fitness
                measurements.
            </td>
        </tr>
        <tr>
            <td style="height: 40px; vertical-align: middle">
                <asp:LinkButton CssClass="aButtonSmall" CausesValidation="false" ToolTip="Click here to open TLW calculator"
                    ID="lnkBtnTLWCalculator" runat="server">TLW Calculator</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="4" cellspacing="4" border="0">
                    <tr>
                        <td>
                        </td>
                        <td align="left">
                            <b>Start Date</b>&nbsp;<asp:Label ID="lblStartDatePersonalSummary" runat="server"></asp:Label>
                        </td>
                        <td align="left">
                            <b>Current Date</b>&nbsp;<asp:Label ID="lblCurrentPersonalSummary" runat="server"></asp:Label>
                        </td>
                        <td align="left">
                            <b>Change</b>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Weight:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStartWeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartWeight" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator6" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator6" ControlToValidate="txtStartWeight" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentWeightPersonalSummary" runat="server" CssClass="txtBox"
                                MaxLength="5"></asp:TextBox>
                                 <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentWeightPersonalSummary" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator7" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator7" ControlToValidate="txtCurrentWeightPersonalSummary" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChangeWeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtChangeWeight" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator8" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator8" ControlToValidate="txtChangeWeight" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Waist:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStartWaist" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartWaist" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator9" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator9" ControlToValidate="txtStartWaist" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentWaist" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentWaist" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator10" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator10" ControlToValidate="txtCurrentWaist" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChangeWaist" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtChangeWaist" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator11" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator11" ControlToValidate="txtChangeWaist" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>BMI:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStartBMI" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartBMI" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator12" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator12" ControlToValidate="txtStartBMI" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentBMI" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentBMI" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator13" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator13" ControlToValidate="txtCurrentBMI" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChangeBMI" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtChangeBMI" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator14" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator14" ControlToValidate="txtChangeBMI" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Body Fat %:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStartBodyFAT" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartBodyFAT" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator15" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator15" ControlToValidate="txtStartBodyFAT" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentBodyFAT" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentBodyFAT" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator16" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator16" ControlToValidate="txtCurrentBodyFAT" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChangeBodyFAT" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="txtChangeBodyFAT" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator17" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator17" ControlToValidate="txtChangeBodyFAT" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Waist To Height:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStartWaistToHeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                             <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartWaistToHeight" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator18" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator18" ControlToValidate="txtStartWaistToHeight" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentWaistToHeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentWaistToHeight" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator19" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator19" ControlToValidate="txtCurrentWaistToHeight" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChangeWaistToHeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                 <asp:RequiredFieldValidator runat="server" ControlToValidate="txtChangeWaistToHeight" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator20" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator20" ControlToValidate="txtChangeWaistToHeight" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <b>Waist To Hip:</b>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtStartWaistToHips" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStartWaistToHips" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator21" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator21" ControlToValidate="txtStartWaistToHips" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCurrentWaistToHips" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                 <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCurrentWaistToHips" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator22" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator22" ControlToValidate="txtCurrentWaistToHips" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtChangeWaistToHips" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtChangeWaistToHips" Display="Dynamic"
                                ValidationGroup="UpdatePersonalSummary" ID="RequiredFieldValidator23" ErrorMessage="Required."
                                CssClass="required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator23" ControlToValidate="txtChangeWaistToHips" runat="server"
                                Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="UpdatePersonalSummary" CssClass="required"
                                Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 40px; vertical-align: middle">
                <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="UpdatePersonalSummary" CausesValidation="true"
                    OnClick="lnkBtnUpdatePersonalSummary_Click" ToolTip="Click here to update" ID="lnkBtnPersonalSummary"
                    runat="server">Update Personal Summary</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" cellpadding="2" cellspacing="2" border="0">
                    <tr>
                        <td align="left">
                            <a href='#' onclick="javascript:return PrintIndividualReport()" class="aButtonSmall">
                                Print Individual Report</a>
                        </td>
                        <td align="right">
                        <a href='#' onclick="javascript:return alert('Waiting For Client Response');" class="aButtonSmall">
                                Print Weight Chart</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" Style="display: none; background-color: Black;
                    width: 500px;" CssClass="modalPopup">
                    <table width="100%" cellpadding="3" cellspacing="3" border="0">
                        <tr>
                            <td style="display: none;" align="center">
                                <asp:Button Style='display: none;' ID="OkButton" runat="server" Text="OK" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
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
                                                                                            <td style="vertical-align: middle;">
                                                                                                TLW Calculator
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <a href='#'>
                                                                                                    <img id="imgClose" border="0" src="../images/reports/xRed.gif" width="12" height="12"
                                                                                                        alt='click here to close' title='click here to close' />
                                                                                                </a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" cellpadding="4" cellspacing="4" border="0">
                                                                                        <tr>
                                                                                            <td align="left" style="width: 30%;">
                                                                                                <b>Gender:</b>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:DropDownList ID="ddlGender" runat="server">
                                                                                                    <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                                                    <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <a href="#" onclick='javascript:void();'>How to Measure</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <b>Height(inches):</b>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtHeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHeight" Display="Dynamic"
                                                                                                    ValidationGroup="News" ID="RequiredFieldValidator3" ErrorMessage="Required."
                                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                                <asp:CompareValidator ID="CompareValidator5" ControlToValidate="txtHeight" runat="server"
                                                                                                    Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="News" CssClass="required"
                                                                                                    Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                                            </td><td align="right">
                                                                                                <a href="#" onclick='javascript:void();'>How to Measure</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <b>Weight(lbs):</b>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtWeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWeight" Display="Dynamic"
                                                                                                    ValidationGroup="News" ID="RequiredFieldValidator1" ErrorMessage="Required."
                                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                                <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtWeight" runat="server"
                                                                                                    Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="News" CssClass="required"
                                                                                                    Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>

                                                                                            </td><td align="right">
                                                                                                <a href="#" onclick='javascript:void();'>How to Measure</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <b>Waist:</b>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtWaist" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWaist" Display="Dynamic"
                                                                                                    ValidationGroup="News" ID="RequiredFieldValidator2" ErrorMessage="Required."
                                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtWaist" runat="server"
                                                                                                    Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="News" CssClass="required"
                                                                                                    Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                                            </td><td align="right">
                                                                                                <a href="#" onclick='javascript:void();'>How to Measure</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <b>Neck:</b>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtNeck" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNeck" Display="Dynamic"
                                                                                                    ValidationGroup="News" ID="RequiredFieldValidator4" ErrorMessage="Required."
                                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                                <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtNeck" runat="server"
                                                                                                    Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="News" CssClass="required"
                                                                                                    Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                                            </td><td align="right">
                                                                                                <a href="#" onclick='javascript:void();'>How to Measure</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="left">
                                                                                                <b>Hips:</b>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="txtHips" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHips" Display="Dynamic"
                                                                                                    ValidationGroup="News" ID="RequiredFieldValidator5" ErrorMessage="Required."
                                                                                                    CssClass="required"></asp:RequiredFieldValidator>
                                                                                                <asp:CompareValidator ID="CompareValidator4" ControlToValidate="txtHips" runat="server"
                                                                                                    Display="Dynamic" ErrorMessage="Invalid." ValidationGroup="News" CssClass="required"
                                                                                                    Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                                                                            </td><td align="right">
                                                                                                <a href="#" onclick='javascript:void();'>How to Measure</a>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                                                                                    ToolTip="Click here to calculate" ID="lnkBtnCalculate" OnClick="lnkBtnCalculate_Click"
                                                                                                    runat="server">Calculate</asp:LinkButton>
                                                                                            </td>
                                                                                            <td align="left">
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
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="lnkBtnTLWCalculator"
                    PopupControlID="Panel1" BackgroundCssClass="modalBackground" OkControlID="OkButton"
                    OnOkScript="onOk()" CancelControlID="imgClose" DropShadow="false" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function OpenCMSPopupWindow(varCMSTypeName) {
            var varPageName = '<%=AppConfig.GetBaseSiteUrl() %>' + "Popups/CMSPopup.aspx?cmstype=" + varCMSTypeName;
            OpenPopupCMSPopup(varPageName, varCMSTypeName);
            return false;
        }

        function PrintIndividualReport() {

            var varQueryString = '';
            var varCtrlddlGender = document.getElementById('<%=ddlGender.ClientID %>');
            varQueryString = "gender=" + varCtrlddlGender.options[varCtrlddlGender.selectedIndex].value;
            varQueryString = varQueryString + "&weight=" + document.getElementById('<%=txtCurrentWeightPersonalSummary.ClientID %>').value;
            varQueryString = varQueryString + "&waist=" + document.getElementById('<%=txtCurrentWaist.ClientID %>').value;
            varQueryString = varQueryString + "&bmi=" + document.getElementById('<%=txtCurrentBMI.ClientID %>').value;
            varQueryString = varQueryString + "&bFAT=" + document.getElementById('<%=txtCurrentBodyFAT.ClientID %>').value;
            varQueryString = varQueryString + "&wtheight=" + document.getElementById('<%=txtCurrentWaistToHeight.ClientID %>').value;
            varQueryString = varQueryString + "&wthip=" + document.getElementById('<%=txtCurrentWaistToHips.ClientID %>').value;

            var varPageName = '<%=AppConfig.GetBaseSiteUrl() %>' + "Popups/PrintIndividualReport.aspx?" + varQueryString;
            OpenPopup(varPageName, 'PrintIndividualReport', 400, 700);
            return false;
        }
    </script>
    <script language="javascript" type="text/javascript">
        function OpenPopupWindow(varCMSTypeName) {
            var varPageName = '<%=AppConfig.GetBaseSiteUrl() %>' + "Users/" + varCMSTypeName + ".aspx";
            OpenPopup(varPageName, varCMSTypeName, 550, 800);
            return false;
        }
    </script>
</asp:Content>
