<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Nutrition_HealthScale_PopUp.ascx.cs" Inherits="UC_Nutrition_HealthScale_PopUp" %>
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

    function popupHealthScale() {
        show('divHealthScale');
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

</script>
<style type="text/css">

    td 
    {
        padding-left:10px; 
        padding-bottom: 5px;   
        border:none;
    }
    
    .outside 
    {
        background-color:#992E24;
        width:570px;
        height:260px;
        padding:20px;
        margin-right:-20px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
        
    }
    
    .inside 
    {
        background-color:#F9D4A8;
        width:550px;
        height:100px;
        padding:10px;        
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }

    .insideBottom 
    {
        background-color:#F9D4A8;
        width:550px;
        height:100px;
        padding-left:20px;
        margin-top:20px;
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
      border:solid 1px #1F000A;
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
       </telerik:RadScriptBlock>      
          
        <div id="divHealthScale" class="fixed" style="display:none;">

            <div id="divContainer"  class="outside" >
                <div class="inside" >

                    <div style="float:left;margin-right:10px;">
                        <p>Goal Weight (lbs): <asp:TextBox ID="textGoalWeight" runat="server" Columns="20"></asp:TextBox></p>
                        <p>Weight Loss Goal:&nbsp;<asp:TextBox ID="textWeightLossGoal" runat="server" Columns="20"></asp:TextBox></p>
                    </div>
            
                    <div style="float:right;margin-right:10px;">
                        <a href="#" onclick="" >
                            <div style="position:relative;background-image:url(../Images/nutrition/weightcalculator.png);background-repeat:no-repeat;background-position:center;width:150px;height:60px;">
                                <p style="position:absolute;top:45px;left:23px;" >Weight Calculator</p>
                            </div>
                        </a>
                    </div>

                </div><!-- inside -->
        
                <div class="insideBottom" >

                    <table>                                                                                                                                                                             <table style="width:500px;">
                        <tr>
                            <th>Measurement</th>
                            <th>Baseline</th>
                            <th>Latest</th>
                            <th>Change %/#</th>
                            <th>Target Date</th>
                        </tr>
                        <tr><td colspan="8"><hr /></td></tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="textTime1" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox4" runat="server" Columns="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox8" runat="server" Columns="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox9" runat="server" Columns="10"></asp:TextBox>
                            </td>
                        </tr>
                    </table>

                </div><!-- insideBottom -->

            </div><!-- divContainer -->

        </div><!-- end divScorecard -->


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
    var calcheight = 260;
    var calcWidth = 570;

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
    document.getElementById("divHealthScale").style.top = calcTop + 'px';
    document.getElementById("divHealthScale").style.left = calcLeft + 'px';

</script>