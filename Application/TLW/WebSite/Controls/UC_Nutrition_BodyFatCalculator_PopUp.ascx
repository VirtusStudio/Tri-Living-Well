<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Nutrition_BodyFatCalculator_PopUp.ascx.cs" Inherits="UC_Nutrition_BodyFatCalculator_PopUp" %>
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

    function popupBodyFat() {
        show('divBodyFatCalculator');
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

    function WeightChanged() {

    }
    
    function WaistChanged() {

    }
    
    function NeckChanged() {

    }

    function HipsChanged() {

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
        height:385px;
        padding:20px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
        
    }
    
    .inside 
    {
        background-color:#F9D4A8;
        width:100%;
        height:365px;
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
       </telerik:RadScriptBlock>      
          
        <div id="divBodyFatCalculator" class="fixed" style="display:none;">

            <div id="divContainer"  class="outside" >
                
                <div id="divInside"  class="inside" >

                    <div id="divTop">
                        <a href="#" >
                            <div style="position:absolute;top:30px;left:40px;width:100px;height:120px;background:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/measuring.png) no-repeat center center;" >
                                <span style="position:absolute;top:110px;left:25px;">Measuring</span>
                            </div>
                        </a>

                        <a href="#" >
                            <div style="position:absolute;top:30px;left:150px;width:100px;height:120px;background:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/tipsmen.png) no-repeat center center;" >
                                <span style="position:absolute;top:110px;left:15px;">Tips for Men</span>
                            </div>
                        </a>

                        <a href="#" >
                            <div style="position:absolute;top:30px;left:280px;width:120px;height:120px;background:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/tipswomen.png) no-repeat center center;" >
                                <span style="position:absolute;top:110px;left:5px;">Tips for Women</span>
                            </div>
                        </a>

                            <div style="position:absolute;top:95px;left:450px;width:100px;height:100px;" >
                                <p>Entry Date: </p>
                                <asp:TextBox ID="textEntryDate" runat="server" MaxLength="15" Columns="7"></asp:TextBox>
                                <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="img1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="textEntryDate" Display="Dynamic"
                                        ValidationGroup="Step5" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Date."
                                        CssClass="required"></asp:RequiredFieldValidator>  
                            </div>

                    </div><!-- end divTop -->
                
                    <div id="divMiddle" style="position:absolute;top:200px;left:50px;width:500px;height:300px;" >
                        <table>
                            <tr>
                                <th>Measurement</th>
                                <th>Baseline</th>
                                <th>Latest</th>
                                <th>Change</th>
                                <th>% Change</th>
                            </tr>
                            <tr>
                                <td colspan="5"><hr /></td>
                            </tr>
                            <tr>
                                <td>Weight (lbs)</td>
                                <td><asp:TextBox ID="textBaselineWeight" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textLatestWeight" Columns="5" runat="server" onchange="javascript: WeightChanged();" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textChangeWeight" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textPercentChangeWeight" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Waist (inches)</td>
                                <td><asp:TextBox ID="textBaselineWaist" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textLatestWaist" Columns="5" runat="server" onchange="javascript: WaistChanged();" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textChangeWaist" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textPercentChangeWaist" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Neck (inches)</td>
                                <td><asp:TextBox ID="textBaselineNeck" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textLatestNeck" Columns="5" runat="server" onchange="javascript: NeckChanged();" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textChangeNeck" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textPercentChangeNeck" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>Hips (inches)</td>
                                <td><asp:TextBox ID="textBaselineHips" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textLatestHips" Columns="5" runat="server" onchange="javascript: HipsChanged();" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textChangeHips" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                                <td><asp:TextBox ID="textPercentChangeHips" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="5" align="right">
                                    <asp:LinkButton  CssClass="aButtonSmall" ID="buttonSave" runat="server" OnClick="btnSave_Click" Text="Save"></asp:LinkButton>
                                    <a class="aButtonSmall" id="A1" onclick="hide('divBodyFatCalculator')" >Close</a>
                                </td>
                            </tr>                                                                                           
                        </table>
                    </div><!-- end divMiddle -->

                </div><!-- end divInside -->

            </div><!-- divContainer -->

        </div><!-- end divBodyFatCalculator -->


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
    var calcheight = 570;
    var calcWidth = 385;
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
    document.getElementById("divBodyFatCalculator").style.top = calcTop + 'px';
    document.getElementById("divBodyFatCalculator").style.left = calcLeft + 'px';

</script>