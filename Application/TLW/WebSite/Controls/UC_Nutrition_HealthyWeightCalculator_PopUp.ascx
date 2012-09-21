<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Nutrition_HealthyWeightCalculator_PopUp.ascx.cs" Inherits="UC_Nutrition_HealthyWeightCalculator_PopUp" %>
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

    function popupHealthyWeightCalculator() {
        show('divHealthyWeightCalculator');
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
    
    #divHealthyWeightCalculatorOutside 
    {
        background-color:#992E24;
        width:570px;
        height:600px;
        padding:20px;
        margin-right:-20px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
        
    }
    
    #divHealthyWeightCalculatorInsideTop 
    {
        background-color:blue;
        width:100%;
        height:75px;
        padding-top:10px;
        padding-bottom:10px;
        margin-bottom:20px;        
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }

    #divHealthyWeightCalculatorInsideMiddle 
    {
        background-color:#F9D4A8;
        width:100%;
        height:45px;
        padding:10px;
        margin-bottom:20px;          
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }

    #divHealthyWeightCalculatorInsideBottom
    {
        background-color:#F9D4A8;
        width:100%;
        height:360px;
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
          
        <div id="divHealthyWeightCalculator" class="fixed" style="display:none;z-index:222;">

            <div id="divHealthyWeightCalculatorOutside" >

                <div class="divHealthyWeightCalculatorInsideTop" >
                    <asp:HiddenField ID="hiddenPersonalSummaryId" runat="server" />
                    <table>
                        <tr>
                            <td>
                                <p>Current Weight (lbs): <asp:TextBox ID="textCurrentWeight" runat="server" Columns="5"></asp:TextBox></p>
                                <p>Current Body Fat %:&nbsp;&nbsp;<asp:TextBox ID="textCurrentBodyFat" runat="server" Columns="5"></asp:TextBox></p>
                            </td>
                            <td>
                                <div style="margin-top:30px;"><asp:LinkButton  CssClass="aButtonSmall" ID="buttonUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update"></asp:LinkButton></div>
                            </td>
                            <td>
                                <a href="#" onclick="" >
                                    <div style="position:relative;background-image:url(../Images/nutrition/calculator.png);background-repeat:no-repeat;background-position:center;width:150px;height:60px;">
                                        <p style="position:absolute;top:45px;left:23px;" >Body Fat Calculator</p>
                                    </div>
                                </a>                            
                            </td>
                        </tr>
                    </table>

                </div><!-- divHealthyWeightCalculatorInsideTop -->
        
                <div class="divHealthyWeightCalculatorInsideMiddle" >

                    <div style="float:left;margin-left:10px;">
                        <p>Lean Body Mass: <asp:Label ID="labelLeanBodyMass" runat="server" Columns="20"></asp:Label></p>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div style="float:right;margin-right:10px;">
                        <p>Body Fat Weight:&nbsp;<asp:Label ID="labelBodyFatWeight" runat="server" Columns="20"></asp:Label></p>
                    </div>

                </div><!-- divHealthyWeightCalculatorInsideMiddle -->

                <div class="divHealthyWeightCalculatorInsideBottom" >

                    <div align="center" >Select a Weight Loss Method</div>
                    <br />
                    <div align="center" >
                        <asp:RadioButton ID="radFatGoal" runat="server" TextAlign="Right" Text="Fat % Goal" Checked="true" onclick="show('divFatGoal');hide('divWeightGoal');" ></asp:RadioButton>
                        &nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="radWeightGoal" runat="server" TextAlign="Right" Text="Weight Goal" onclick="show('divWeightGoal');hide('divFatGoal');" ></asp:RadioButton>
                    </div>
                    <br />
                    <div id="divFatGoal" align="center" >
                        <table>
                            <tr>
                                <th>Essential</th>
                                <th>Atheletes</th>
                                <th>Fitness</th>
                                <th>Average</th>
                                <th>Obese</th>
                            </tr>
                            <tr>
                                <td colspan="5"><hr /></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="labelEssential" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                                <td><asp:Label ID="labelAtheletes" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                                <td><asp:Label ID="labelFitness" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                                <td><asp:Label ID="labelAverage" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                                <td><asp:Label ID="labelObese" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <table>
                            <tr>
                                <td>Desired Body Fat %</td>
                                <td><asp:TextBox ID="textDesiredBodyFatPercentage" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Weight Loss Goal</td>
                                <td><asp:Label ID="labelWeightLossGoal1" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Loss Frequency</td>
                                <td>
                                    <asp:DropDownList ID="ddlLossFrequency1" runat="server" >
                                        <asp:ListItem value="half">1/2lb / week</asp:ListItem>
                                        <asp:ListItem value="one">1lb / week</asp:ListItem>
                                        <asp:ListItem value="two">2lbs / week</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>



                    <div id="divWeightGoal" align="center" style="display:none;">
                        <p>Healthy Weight Range</p>
                        <hr />
                        <p><asp:TextBox ID="textHealthyWeightRange" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></p>
                        <br />
                        <br />
                        <br />
                        <table>
                            <tr>
                                <td>Desired Weight</td>
                                <td><asp:Label ID="labelDesiredWeight" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Weight Loss Goal</td>
                                <td><asp:Label ID="labelWeightLossGoal2" Columns="5" ReadOnly="true" runat="server" ></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Loss Frequency</td>
                                <td>
                                    <asp:DropDownList ID="ddlLossFrequency2" runat="server" >
                                        <asp:ListItem value="half">1/2lb / week</asp:ListItem>
                                        <asp:ListItem value="one">1lb / week</asp:ListItem>
                                        <asp:ListItem value="two">2lbs / week</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div align="center">
                        Target Date: 
                        <asp:Label ID="labelTargetDate" Columns="5" ReadOnly="true" runat="server" ></asp:Label>
                        <asp:LinkButton  CssClass="aButtonSmall" ID="btnCalculate" runat="server" OnClick="btnCalculate_Click" Text="Calculate"></asp:LinkButton>
                        <a class="aButtonSmall" id="buttonClose" onclick="hide('divHealthyWeightCalculator');" >Close</a>
                    </div>
                    <div align="center"><p></p></div>

                </div><!-- divHealthyWeightCalculatorInsideBottom -->

            </div><!-- divHealthyWeightCalculatorOutside -->

        </div><!-- end divHealthyWeightCalculator -->


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
    var calcheight = 600;
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
    document.getElementById("divHealthyWeightCalculator").style.top = calcTop + 'px';
    document.getElementById("divHealthyWeightCalculator").style.left = calcLeft + 'px';

</script>