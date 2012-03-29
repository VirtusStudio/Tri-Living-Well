<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucFoodJournal.ascx.cs"
    Inherits="Controls_wucFoodJournal" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<table>
    <tr style="height: 40px; vertical-align: middle">
        <td align="center">
            <b>Food Journal</b>
        </td>
    </tr> <tr>
        <td align="right">
            <a onclick="javascript:return history.back();" href='#'>Back</a>
        </td>
    </tr>
    <tr style="vertical-align: middle">
        <td align="center">
            <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
        </td>
    </tr>
   
    <tr>
        <td align="left">
            <table width="20%;">
                <tr style="height: 30px; vertical-align: middle;">
                    <td align="right" style="width: 30%;">
                        Date:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="txtBox" MaxLength="15"></asp:TextBox>
                        <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgCal" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDate" Display="Dynamic"
                            ValidationGroup="Step5" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Date."
                            CssClass="required"></asp:RequiredFieldValidator>
                        <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate" PopupButtonID="imgCal"
                            Format="MM/dd/yyyy" runat="server">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
                <tr style="height: 30px; vertical-align: middle;">
                    <td align="right">
                        Current Calorie Range:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtCurrentCalorie" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height: 30px; vertical-align: middle;">
                    <td align="left" colspan="2">
                        Recommended Level (Based on Current Calorie Range)
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="1" cellpadding="2" cellspacing="2">
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td align="left" valign="top">
                                    <b>Record</b>
                                </td>
                                <td align="right" valign="top">
                                    <b>Daily Total</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Milk</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblMilk" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtMilkRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtMilkRecord" runat="server"
                                        ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                                        CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtMilkDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtMilkDailyTotal"
                                        runat="server" ErrorMessage="Invalid Milk Daily Total." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Fruit</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblFruit" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtFruitRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtFruitRecord" runat="server"
                                        ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                                        CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtFruitDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator4" ControlToValidate="txtFruitDailyTotal"
                                        runat="server" ErrorMessage="Invalid Fruit Total." ValidationGroup="Step5" Display="Dynamic"
                                        CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Vegetables</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblVegetables" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtVegetablesRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator6" ControlToValidate="txtVegetablesRecord"
                                        runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtVegetablesDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator5" ControlToValidate="txtVegetablesDailyTotal"
                                        runat="server" ErrorMessage="Invalid Vegetables Total." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Starch</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblStarch" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtStarchRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator7" ControlToValidate="txtStarchRecord"
                                        runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtStarchDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator8" ControlToValidate="txtStarchDailyTotal"
                                        runat="server" ErrorMessage="Invalid Starch Daily Total." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Protein</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblProtein" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtProteinRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator9" ControlToValidate="txtProteinRecord"
                                        runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtProteinDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator10" ControlToValidate="txtProteinDailyTotal"
                                        runat="server" ErrorMessage="Invalid Protein Daily Total." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Fat</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblFat" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtFatRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator12" ControlToValidate="txtFatRecord" runat="server"
                                        ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                                        CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtFatDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator11" ControlToValidate="txtFatDailyTotal"
                                        runat="server" ErrorMessage="Invalid Fat Daily Total." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Water</b>
                                </td>
                                <td>
                                    <asp:Label ID="lblWater" runat="server"></asp:Label>
                                </td>
                                <td align="left" valign="top">
                                    <asp:TextBox ID="txtWaterRecord" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator13" ControlToValidate="txtWaterRecord"
                                        runat="server" ErrorMessage="Invalid Water Record." ValidationGroup="Step5" Display="Dynamic"
                                        CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                                </td>
                                <td align="right" valign="top">
                                    <asp:TextBox ID="txtWaterDailyTotal" runat="server" CssClass="txtBox" MaxLength="7"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator14" ControlToValidate="txtWaterDailyTotal"
                                        runat="server" ErrorMessage="Invalid Water Daily Total." ValidationGroup="Step5"
                                        Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                                        Type="Double"></asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="right">
                    </td>
                    <td align="left">
                        <asp:Button ID="btnSave" Height="25" runat="server" Text="Save" CssClass="aButtonSmall"
                            ValidationGroup="Step5" CausesValidation="true" OnClick="btnSave_Click" />
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="right">
                    </td>
                    <td align="right">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Main/MyNutrition/NutritionOverview.html'
                            target="_blank" class="lnkBtn">Print Nutrition Journal</a>
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="left">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/FoodIntakeWeeklyView.aspx' class="lnkBtn">
                            Opt for Weekly View</a>
                    </td>
                    <td align="right">
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="left">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/FoodIntakeDailyView.aspx' class="lnkBtn">
                            Opt for Daily View</a>
                    </td>
                    <td align="right">
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="left">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Popups/PrintWeeklyLogReport.aspx' target="_blank"
                            class="lnkBtn">Print Weekly Log</a>
                    </td>
                    <td align="right">
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="left">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Popups/PrintDailyLogReport.aspx' target="_blank"
                            class="lnkBtn">Print Daily Log</a>
                    </td>
                    <td align="right">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
