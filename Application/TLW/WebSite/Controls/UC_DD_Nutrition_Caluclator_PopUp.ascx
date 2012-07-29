<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_DD_Nutrition_Caluclator_PopUp.ascx.cs" Inherits="UC_DD_Nutrition_Caluclator_PopUp" %>
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

function editCalorie()
{
    alert("test");
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
function hoverTransparency2(sElementName)
{ 
    var obj = document.getElementById(sElementName);
    
    obj.onmouseover = function(){this.className = "";}
    obj.onmouseout = function(){this.className = "transparent";}
    obj.onmouseenter = function(){this.onmouseover = null; this.onmouseout = null; this.className = "";}
    obj.onmouseleave = function(){this.className = "transparent";}
    
}

function submitCalorie()
{
    document.getElementById('<%= btnCalorieSubmit.ClientID %>').click();
    hide('divCalorieCalculator');
}
</script>
       </telerik:RadScriptBlock>      
          
        <div id="divCalorieCalculator" class="fixed" style="left:200px;top:200px;z-index:300;display:none;" >
             <center class="Round1"><center><center><center><center><center><center><center><center><center>
             
             Calorie Calculator<br />
             <br />
             <table class="tblItems">
             <tr><td colspan="2" align="center"><asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label> </td></tr>
             <tr>
                <td>Height</td>
                <td><asp:TextBox ID="txtHeight" runat="server" Text="70"></asp:TextBox> inches</td>
             </tr>
             <tr>
                <td>Weight</td>
                <td><asp:TextBox ID="txtWeight" runat="server" Text="188"></asp:TextBox> pounds</td>
             </tr>
             <tr>
                <td>Age</td>
                <td><asp:TextBox ID="txtAge" runat="server" Text="32"></asp:TextBox> yrs</td>
             </tr>
             <tr>
                <td>Gender</td>
                <td>
                    <asp:DropDownList ID="ddlGender" runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female" Selected="True">Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
             </tr>
             <tr>
                <td>Activity&nbsp;Level</td>
                <td>
                    <asp:DropDownList ID="ddlActivityLevel" runat="server">
                        <asp:ListItem Value="1">Sedentary - little or no exercise</asp:ListItem>
                        <asp:ListItem Value="2">Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem>
                        <asp:ListItem Value="3">Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem>
                        <asp:ListItem Value="4">Very Active - hard exercise/sports 6-7 days/week</asp:ListItem>
                        <asp:ListItem Value="5">Sedentary - very hard daily exercise/sports & physical job or 2X day training</asp:ListItem>
                        <asp:ListItem Value="Female">Extra Active</asp:ListItem>
                    </asp:DropDownList>
                </td>
             </tr>
             <tr><td></td><td><a class="aButtonSmall" href="javascript:calcCalories();">Calculate</a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblViewSampleMeals" runat="server"></asp:Label></td></tr>
             <tr>
                <td>Recommended&nbsp;Calories</td>
                <td><table><tr><td>
                
                        <asp:TextBox ID="txtCalories" runat="server"></asp:TextBox> calories
                
                </td><td>
                
                                <a class="aButtonSmall" href="javascript:submitCalorie();">Save</a>
                                <a class="aButtonSmall" href="javascript:hide('divCalorieCalculator');">Cancel</a>
                           </td></tr></table>
                </td>
             </tr>
             </table><div style="display:none;">
             <hr />
            <asp:DropDownList ID="ddlCalorieNumber" runat="server"></asp:DropDownList>
            <br /><br />
            
            <asp:Button ID="btnCalorieSubmit" runat="server" Text="Submit" OnClick="btnCalorieSubmit_Click" style="visibility:hidden;" />
            </div>
            </center></center></center></center></center></center></center></center></center></center>
    </div>


<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
<!--Harris-Benedict Formula-->
<script type="text/javascript">
function calcCalories()
{
    var iCalories = Math.round(calcBmr() * calcActivityFactor() / 100) * 100;

    document.getElementById('<%=lblViewSampleMeals.ClientID %>').innerHTML = "<a href=\"javascript:popUpWin('Main/MyNutrition/HTML_SampleMeals.aspx#" + iCalories + "',900,650);\">View Sample Meals</a>";

    document.getElementById('<%=txtCalories.ClientID %>').value = iCalories.toString();
}
function calcBmr()
{
    var iHeight = Number(document.getElementById('<%=txtHeight.ClientID %>').value);
    var iWeight = Number(document.getElementById('<%=txtWeight.ClientID %>').value);
    var iAge = Number(document.getElementById('<%=txtAge.ClientID %>').value);
 
    var iBmr;
    
        
    
    if(document.getElementById('<%=ddlGender.ClientID %>').value == "Female")
    {
        iBmr = 655 + (9.6 * 0.453 * iWeight) + (1.8 * 0.393 * iHeight) - (4.7 * iAge);
    }
    else if(document.getElementById('<%=ddlGender.ClientID %>').value == "Male")
    {
        iBmr = 66 + (13.7 * 0.453 * iWeight) + (5 * 0.393 * iHeight) - (6.8 * iAge);
    }
    
  
    
    return iBmr;
}
function calcActivityFactor()
{
    var sActivityLevel = document.getElementById('<%=ddlActivityLevel.ClientID %>').value;
    
    if(sActivityLevel == "1") return 1.2;
    if(sActivityLevel == "2") return 1.375;
    if(sActivityLevel == "3") return 1.55;
    if(sActivityLevel == "4") return 1.725;
    if(sActivityLevel == "5") return 1.9;
}
</script>
</telerik:RadScriptBlock>