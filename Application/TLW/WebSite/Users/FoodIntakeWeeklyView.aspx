<%@ Page Title="Food Intake Weekly View" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="FoodIntakeWeeklyView.aspx.cs" Inherits="Users_FoodIntakeWeeklyView" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .black_overlay
        {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }
        .white_content
        {
            display: none;
            position: absolute;
            top: 35%;
            left: 25%;
            width: 30%;
            height: 90%;
            padding: 5px;
            border: 1px solid orange;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td align="left">
                <table class="title">
                    <tr>
                        <td align="left">
                            Weekly View of Food Intake
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                <a class="aButtonSmall" href="javascript:history.back();">Back</a>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadCalendar ID="RadCalendar1" runat="server" EnableMultiSelect="False" ShowRowHeaders="False"
                    UseRowHeadersAsSelectors="False" Skin="WebBlue" Width="100%" AutoPostBack="false"
                    OnDayRender="RadCalendar1_DayRender">
                    <WeekendDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" />
                    <DayOverStyle BackColor="#CCCCFF" BorderColor="#69798C" />
                    <SelectedDayStyle BackColor="#FFCCCC" BorderColor="#69798C" />
                    <OtherMonthDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" />
                    <DayStyle BorderColor="#69798C" />
                    <SpecialDays>
                        <telerik:RadCalendarDay Date="">
                            <ItemStyle BackColor="#CCFFCC" BorderColor="#69798C" />
                        </telerik:RadCalendarDay>
                    </SpecialDays>
                </telerik:RadCalendar>
            </td>
        </tr>
    </table>
    <div id="divFoodIntakeDetails" class="white_content">
    </div>
    <div id="fade" class="black_overlay">
    </div>
    <script language="javascript" type="text/javascript">
        function DisplayDetails(varHTML) {
            document.getElementById('divFoodIntakeDetails').style.display = 'block';
            document.getElementById('fade').style.display = 'block'
            document.getElementById("divFoodIntakeDetails").innerHTML = varHTML;
        }
        function HideDetails() {
            document.getElementById('fade').style.display = 'none'
            document.getElementById("divFoodIntakeDetails").style.display = 'none';

        }
    </script>
</asp:Content>
