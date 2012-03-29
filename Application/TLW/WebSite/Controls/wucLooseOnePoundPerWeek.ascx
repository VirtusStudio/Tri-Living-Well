<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucLooseOnePoundPerWeek.ascx.cs" Inherits="Controls_wucLooseOnePoundPerWeek" %>
<table>
    <tr style="height: 40px; vertical-align: middle">
        <td align="center">
            <b>Loose 1 Pound Per Week</b>
        </td>
    </tr>
    <tr>
        <td>
        There are 3500 calories in a pound of fat. To lose 1 pound of fat per week, you must reduce total caloric intake by 3500 calories each week. TLW recommends a combination of calorie reduction (Nutrition) and an increase in the level of exercise (Physical Activity) as the most effective way to achieve a permanent weight loss.
	
	 <br />
            <br />
            <b>
For
Nutrition</b><br />	Reduce energy intake (calories) by 1750 calories per week or reduce your daily caloric requirements by 250 calories per day.
	(Click on Re-calculate button on My Dashboard’s Nutrition Center Pyramid to view new daily caloric requirements.)
     <br />
            <br />
            <b>
For 
PhysicalActivity</b><br />	Increase your physical activity to generate an additional energy 
	expenditure (calories burned) of 1750 calories per week above your current activity level.
	
	TLW estimates the calories expended according to the metabolic equivalent (MET) level of each activity in our exercise programs.
	Each physical activity or exercise has a corresponding MET. 

Select from METs Table, the activity or exercise you will perform to determine the number of minutes (approximation) you need to increase to achieve an additional 1750 calories burned per week.

           
        </td>
    </tr>
    <tr>
        <td align="left">
            <table width="20%;">
                <tr style="height: 30px; vertical-align: middle;">
                    <td align="right" style="width: 30%;">
                        Weight(in Pounds):
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtWeight" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWeight" Display="Dynamic"
                            ValidationGroup="Step5" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Weight."
                            CssClass="required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtWeight" runat="server"
                            ErrorMessage="Weight Should be in Integer/Decimal." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="required" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                </tr>
                <tr style="height: 30px; vertical-align: middle;">
                    <td align="right">
                        Select Activity Type:
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlActivityType" runat="server" CssClass="txtBox">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height: 40px; vertical-align: middle;">
                    <td align="right">
                        Calculate Additional Minute Added:
                    </td>
                    <td align="left">
                        <asp:Button ID="btnCalculate" Height="25" runat="server" Text="Calculate" CssClass="aButtonSmall"
                        ValidationGroup="Step5"  CausesValidation="true"
                            OnClick="btnCalculate_Click" />
                    </td>
                </tr>
                <tr style="height: 30px; vertical-align: middle;">
                    <td align="right">
                        Additional Minute To be Added:
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtAdditionalMinuteAdded" runat="server" CssClass="txtBox" MaxLength="5"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>