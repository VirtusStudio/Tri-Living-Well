<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Nutrition_CalorieCalculator_PopUp.ascx.cs" Inherits="UC_Nutrition_CalorieCalculator_PopUp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%--<link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
<link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
Above lines are commented by Netsmartz
--%>

<!--"Init();" must be placed for body onload-->
<!--"javascript:addEntry(sDate);" will open the popup-->
<!--"javascript:editEntry(sDate);" will open the popup-->

<script type="text/javascript">
    var cbEditTotals;
    var txtDdEntryID;
    var rdpDdEntryDate;


    var radTxtBField_01;

    function editCalorie() {
        show('divCalorieCalculator');
        //bWaiting = true;  commented by Netsmartz
    }
    function hide(objElementID) {
        document.getElementById(objElementID).style.display = "none";

    }
    function show(objElementID) {
        document.getElementById(objElementID).style.display = "";
    }



</script>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<!--Transparency-->
<script type="text/javascript">
    function hoverTransparency2(sElementName) {
        var obj = document.getElementById(sElementName);

        obj.onmouseover = function () { this.className = ""; }
        obj.onmouseout = function () { this.className = "transparent"; }
        obj.onmouseenter = function () { this.onmouseover = null; this.onmouseout = null; this.className = ""; }
        obj.onmouseleave = function () { this.className = "transparent"; }

    }

    function submitCalorie() {
       // document.getElementById(' < % = btn Calorie Submit.ClientID %   >').click();
        hide('divCalorieCalculator');
    }
</script>
       </telerik:RadScriptBlock>      
          
        <div id="divCalorieCalculator" class="fixed" style="left:470px;top:285px;z-index:1000;display:none;" >

            <div style="width:401px;height:312px;background-color:#fff;background-image:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/caloric.png);background-repeat:no-repeat;" >

                <div style="position:absolute;top:35px;left:50px;width:230px;height:100px;font-weight:bold;color:#000;">
                    <p>Caloric Requirement</p>
                    <p>Daily Goal Calories</p>
                </div>

                <div style="position:absolute;top:35px;left:200px;width:150px;height:100px;font-weight:bold;color:#000;text-align:right;">
                    <p><asp:Label ID="labelCalories" runat="server" Text=""></asp:Label></p>
                    <p><asp:Label ID="labelGoalCalories" runat="server" Text=""></asp:Label></p>
                </div>

                <div style="position:absolute;top:140px;left:50px;width:230px;height:100px;font-weight:bold;color:#000;">
                    <p style="line-height:50%" >Weight</p>
                    <p style="line-height:50%" >Lean Body Mass</p>
                    <p style="line-height:100%" >Loss Frequency Goal</p>
                    <p style="line-height:100%" >Activity Level</p>
                </div>

                <div style="position:absolute;top:140px;left:200px;width:150px;height:40px;font-weight:bold;color:#000;text-align:right;">
                    <p style="line-height:50%;" ><asp:Label ID="labelWeight" runat="server" Text="" ></asp:Label></p>
                    <p style="line-height:50%;" ><asp:Label ID="labelLeanBodyMass" runat="server" Text=""></asp:Label></p>
                </div>

                <div style="position:absolute;top:175px;left:210px;width:150px;height:20px;font-weight:bold;color:#000;">
                    <p> 
                        <asp:DropDownList ID="ddlLossFrequencyGoal" runat="server" Width="140">
                            <asp:ListItem Value="0.5">1/2 lb.</asp:ListItem>
                            <asp:ListItem Value="1.0">1 lb.</asp:ListItem>
                            <asp:ListItem Value="1.5">1 1/2 lb.</asp:ListItem>
                            <asp:ListItem Value="2">2 lb.</asp:ListItem>
                            <asp:ListItem Value="2.5">2 1/2 lb.</asp:ListItem>
                            <asp:ListItem Value="3.0">3 lb.</asp:ListItem>
                            <asp:ListItem Value="3.5">3 1/2 lb.</asp:ListItem>
                            <asp:ListItem Value="4.0">4 lb.</asp:ListItem>
                            <asp:ListItem Value="4.5">4 1/2 lb.</asp:ListItem>
                            <asp:ListItem Value="5.0">5 lb.</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                </div>
                
                <div style="position:absolute;top:200px;left:210px;width:150px;height:20px;font-weight:bold;color:#000;">
                    <p>
                        <asp:DropDownList ID="ddlActivityLevel" runat="server" Width="140">
                            <asp:ListItem Value="1">Sedentary - little or no exercise</asp:ListItem>
                            <asp:ListItem Value="2">Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem>
                            <asp:ListItem Value="3">Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem>
                            <asp:ListItem Value="4">Very Active - hard exercise/sports 6-7 days/week</asp:ListItem>
                            <asp:ListItem Value="5">Extra Active - very hard daily exercise/sports & physical job or 2X day training</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                </div>

                <div style="position:absolute;top:240px;left:150px;">
                    <asp:LinkButton  CssClass="aButtonSmall" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" ValidationGroup="vgCalculator" Text="Update"></asp:LinkButton>
                </div>

                <div style="position:absolute;top:240px;left:250px;">
                    <a class="aButtonSmall" id="btnClose" onclick="hide('divCalorieCalculator')" >Close</a>
                </div>

            </div>

        </div>


<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
<!--Harris-Benedict Formula-->
<script type="text/javascript">
/*
    function calcCalories() {
        var iCalories = Math.round(calcBmr() * calcActivityFactor() / 100) * 100;

        document.getElementById('<   % = lblViewSampleMeals.ClientID %  >  ').innerHTML = "<a href=\"j a vascript:popUpWin('Main/MyNutrition/HTML_SampleMeals.aspx#" + iCalories + "',900,650);\">View Sample Meals</a>";

        document.getElementById('<   %   =txtCalories.ClientID %  >').value = iCalories.toString();
    }
    function calcBmr() {
        var iHeight = Number(document.getElementById('<  %  =txtHeight.ClientID %  >').value);
        var iWeight = Number(document.getElementById('<  %  =txtWeight.ClientID %  >').value);
        var iAge = Number(document.getElementById('<  %  =txtAge.ClientID %  >  ').value);

        var iBmr;



        if (document.getElementById('< % =ddlGender.ClientID % >').value == "Female") {
            iBmr = 655 + (9.6 * 0.453 * iWeight) + (1.8 * 0.393 * iHeight) - (4.7 * iAge);
        }
        else if (document.getElementById('< %  =ddlGender.ClientID %  >').value == "Male") {
            iBmr = 66 + (13.7 * 0.453 * iWeight) + (5 * 0.393 * iHeight) - (6.8 * iAge);
        }



        return iBmr;
    }
    function calcActivityFactor() {
        var sActivityLevel = document.getElementById('<  %  =ddlActivityLevel.ClientID %  >').value;

        if (sActivityLevel == "1") return 1.2;
        if (sActivityLevel == "2") return 1.375;
        if (sActivityLevel == "3") return 1.55;
        if (sActivityLevel == "4") return 1.725;
        if (sActivityLevel == "5") return 1.9;
    }
</script>
</telerik:RadScriptBlock>