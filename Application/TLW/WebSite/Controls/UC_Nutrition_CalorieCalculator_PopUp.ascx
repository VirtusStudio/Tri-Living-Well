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

    function popupCalorieCalculator() {
        show('divCalorieCalculator');
    }

    function editCalorie() {
        show('divCalorieCalculator');
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
           
<style type="text/css">

    td 
    {
        padding-left:10px; 
        padding-bottom: 5px;   
        border:none;
    }
    
    #divCalorieCalculatorOutside 
    {
        background-color:#992E24;
        width:450px;
        height:280px;
        padding:20px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
        
    }
    
    #divCalorieCalculatorTop 
    {
        background-color:#F9D4A8;
        width:100%;
        height:50px;
        margin-bottom:20px;
        padding-top:10px;
        padding-bottom:10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }
    
   #divCalorieCalculatorBottom 
    {
        background-color:#F9D4A8;
        width:100%;
        height:175px;
        padding-top:10px;
        padding-bottom:10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }
    

    hr 
    {
        height:3px;
        color:#000;
        background-color: #000;   
    }
    
    .aButtonSmall
    {
      display:inline-table;
      padding:2px 5px 2px 5px;
      border:none;
      text-align:center;
      color:#ffffff;
      text-decoration:none;
      vertical-align:middle;
      line-height:27px;
      font-weight:bold;
      font-size:12px;
      background-color:#1581AE;
    }

</style>
          
    <div id="divCalorieCalculator" class="fixed" style="display:none;">

        <div id="divCalorieCalculatorOutside" >

            <div id="divCalorieCalculatorTop" >
                <table>
                    <tr>
                        <td>Caloric Requirement</td>
                        <td><asp:Label ID="labelCalories" runat="server" Text=""></asp:Label></td>
                    </tr>                        
                    <tr>
                        <td>Daily Goal Calories</asp:Label></td>
                        <td><asp:Label ID="labelGoalCalories" runat="server" Text=""></asp:Label></td>
                    </tr> 
                </table>
            </div>                    

            <div id="divCalorieCalculatorBottom" >
                <table>
                    <tr>
                        <td>Weight</td>
                        <td><asp:Label ID="labelWeight" runat="server" Text="" ></asp:Label></td>
                    </tr>                        
                    <tr>
                        <td>Lean Body Mass</td>
                        <td><asp:Label ID="labelLeanBodyMass" runat="server" Text=""></asp:Label></td>
                    </tr> 
                    <tr>
                        <td>Loss Frequency Goal</td>
                        <td>
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
                        </td>
                    </tr> 
                    <tr>
                        <td>Activity Level</td>
                        <td>
                            <asp:DropDownList ID="ddlActivityLevel" runat="server" Width="140">
                                <asp:ListItem Value="1">Sedentary - little or no exercise</asp:ListItem>
                                <asp:ListItem Value="2">Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem>
                                <asp:ListItem Value="3">Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem>
                                <asp:ListItem Value="4">Very Active - hard exercise/sports 6-7 days/week</asp:ListItem>
                                <asp:ListItem Value="5">Extra Active - very hard daily exercise/sports & physical job or 2X day training</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div style="padding-left:10px;padding-right:10px;">
                            <asp:Label ID="labelLBM1" runat="server" Text="Please use the " ></asp:Label>
                            <asp:HyperLink ID="hylinkLBM" runat="server" onclick="hide('divCalorieCalculator');popupBodyFat();">Body % Fat Calculator</asp:HyperLink>
                            <asp:Label ID="labelLBM2" runat="server" Text="to calculate Lean Body Mass prior to updating Caloric Requirements." ></asp:Label>
                            </div>
                        </td>
                    </tr>                                              
                    <tr>
                        <td colspan="2" align="right">
                            <asp:LinkButton  CssClass="aButtonSmall" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" ValidationGroup="vgCalculator" Text="Update"></asp:LinkButton>
                            <a class="aButtonSmall" id="btnClose" onclick="hide('divCalorieCalculator')" >Close</a>
                        </td>
                    </tr>                                              
                        
                         
                </table>
            </div>                        

        </div><!-- divCalorieCalculatorOutside -->

    </div><!-- end divCalorieCalculator -->


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
<script type="text/javascript">

    var myWidth;
    var myHeight;
    var calcheight = 280;
    var calcWidth = 450;

    // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
    if (typeof window.innerWidth != 'undefined') {
        myWidth = window.innerWidth;
        myHeight = window.innerHeight;
    }
    // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)  
    else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0) {
        myWidth = document.documentElement.clientWidth;
        myHeight = document.documentElement.clientHeight;
    }
    // older versions of IE   
    else {
        myWidth = document.getElementsByTagName('body')[0].clientWidth;
        myHeight = document.getElementsByTagName('body')[0].clientHeight;
    }


    var calcTop = (myHeight - calcheight) / 2;
    var calcLeft = (myWidth - calcWidth) / 2;
    document.getElementById("divCalorieCalculator").style.top = calcTop + 'px';
    document.getElementById("divCalorieCalculator").style.left = calcLeft + 'px';

</script>