<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Nutrition_FoodJournal_Popup.ascx.cs" Inherits="Controls_UC_Nutrition_FoodJournal_Popup" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<script type="text/javascript">

    function popupFoodJournal() {
        show('divFoodJournal');
    }

    function closeFoodJournal() {
        hide('divFoodJournal');
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

    //function submitCalorie() {
    //    // document.getElementById(' < % = btn Calorie Submit.ClientID %   >').click();
    //    hide('divCalorieCalculator');
    //}
</script>
</telerik:RadScriptBlock>      
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
        height:600px;
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
        height:385px;
        padding-top:10px;
        padding-bottom:10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }

    .insideBottom 
    {
        background-color:#F9D4A8;
        width:100%;
        height:155px;
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
<div id="divFoodJournal" class="fixed" style="left:400px;top:120px;z-index:1000;display:none;" >

    <div class="outside" >

        <div class="inside" >

            <table style="width:500px;">
                <tr>
                    <th>Meal</th>
                    <th>Time</th>
                    <th>Milk</th>
                    <th>Fruit</th>
                    <th>Veg</th>
                    <th>Starch</th>
                    <th>Protein</th>
                    <th>Fat</th> 
                </tr>
                <tr><td colspan="8"><hr /></td></tr>
                <tr>
                    <td style="width:150px;">
                        <asp:DropDownList ID="ddlMeal1" runat="server">
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textTime1" runat="server" Columns="10"></asp:TextBox>
                    </td>
                    <td >
                        <asp:TextBox ID="txtMilkRecord1" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareMilkValidator1" ControlToValidate="txtMilkRecord1" runat="server"
                            ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFruitRecord1" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFruitValidator1" ControlToValidate="txtFruitRecord1" runat="server"
                            ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVegetablesRecord1" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareVegetablesValidator1" ControlToValidate="txtVegetablesRecord1"
                            runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStarchRecord1" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareStarchValidator1" ControlToValidate="txtStarchRecord1"
                            runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProteinRecord1" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareProteinValidator1" ControlToValidate="txtProteinRecord1"
                            runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatRecord1" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFatValidator1" ControlToValidate="txtFatRecord1" runat="server"
                            ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                     </td> 
                </tr>



                <tr>
                    <td>
                        <asp:DropDownList ID="ddlMeal2" runat="server">
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textTime2" runat="server" Columns="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMilkRecord2" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareMilkValidator2" ControlToValidate="txtMilkRecord2" runat="server"
                            ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFruitRecord2" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFruitValidator2" ControlToValidate="txtFruitRecord2" runat="server"
                            ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVegetablesRecord2" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareVegetablesValidator2" ControlToValidate="txtVegetablesRecord2"
                            runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStarchRecord2" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareStarchValidator2" ControlToValidate="txtStarchRecord2"
                            runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProteinRecord2" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareProteinValidator2" ControlToValidate="txtProteinRecord2"
                            runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatRecord2" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFatValidator2" ControlToValidate="txtFatRecord2" runat="server"
                            ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td> 
                </tr>

                <tr>
                    <td>
                        <asp:DropDownList ID="ddlMeal3" runat="server">
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textTime3" runat="server" Columns="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMilkRecord3" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareMilkValidator3" ControlToValidate="txtMilkRecord3" runat="server"
                            ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFruitRecord3" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFruitValidator3" ControlToValidate="txtFruitRecord3" runat="server"
                            ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVegetablesRecord3" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareVegetablesValidator3" ControlToValidate="txtVegetablesRecord3"
                            runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStarchRecord3" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareStarchValidator3" ControlToValidate="txtStarchRecord3"
                            runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProteinRecord3" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareProteinValidator3" ControlToValidate="txtProteinRecord3"
                            runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatRecord3" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFatValidator3" ControlToValidate="txtFatRecord3" runat="server"
                            ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td> 
                </tr>

                <tr>
                    <td>
                        <asp:DropDownList ID="ddlMeal4" runat="server">
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textTime4" runat="server" Columns="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMilkRecord4" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareMilkValidator4" ControlToValidate="txtMilkRecord4" runat="server"
                            ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFruitRecord4" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFruitValidator4" ControlToValidate="txtFruitRecord4" runat="server"
                            ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVegetablesRecord4" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareVegetablesValidator4" ControlToValidate="txtVegetablesRecord4"
                            runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStarchRecord4" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareStarchValidator4" ControlToValidate="txtStarchRecord4"
                            runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProteinRecord4" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareProteinValidator4" ControlToValidate="txtProteinRecord4"
                            runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatRecord4" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFatValidator4" ControlToValidate="txtFatRecord4" runat="server"
                            ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td> 
                </tr>

                <tr>
                    <td>
                        <asp:DropDownList ID="ddlMeal5" runat="server">
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textTime5" runat="server" Columns="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMilkRecord5" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareMilkValidator5" ControlToValidate="txtMilkRecord5" runat="server"
                            ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFruitRecord5" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFruitValidator5" ControlToValidate="txtFruitRecord5" runat="server"
                            ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVegetablesRecord5" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareVegetablesValidator5" ControlToValidate="txtVegetablesRecord5"
                            runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStarchRecord5" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareStarchValidator5" ControlToValidate="txtStarchRecord5"
                            runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProteinRecord5" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareProteinValidator5" ControlToValidate="txtProteinRecord5"
                            runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatRecord5" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFatValidator5" ControlToValidate="txtFatRecord5" runat="server"
                            ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td> 
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="ddlMeal6" runat="server">
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textTime6" runat="server" Columns="10"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtMilkRecord6" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareMilkValidator6" ControlToValidate="txtMilkRecord6" runat="server"
                            ErrorMessage="Invalid Milk Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFruitRecord6" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFruitValidator6" ControlToValidate="txtFruitRecord6" runat="server"
                            ErrorMessage="Invalid Fruit Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVegetablesRecord6" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareVegetablesValidator6" ControlToValidate="txtVegetablesRecord6"
                            runat="server" ErrorMessage="Invalid Vegetables Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStarchRecord6" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareStarchValidator6" ControlToValidate="txtStarchRecord6"
                            runat="server" ErrorMessage="Invalid Starch Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtProteinRecord6" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareProteinValidator6" ControlToValidate="txtProteinRecord6"
                            runat="server" ErrorMessage="Invalid Protein Record." ValidationGroup="Step5"
                            Display="Dynamic" CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Double"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatRecord6" runat="server" MaxLength="7" Columns="5"></asp:TextBox>
                        <asp:CompareValidator ID="CompareFatValidator6" ControlToValidate="txtFatRecord6" runat="server"
                            ErrorMessage="Invalid Fat Record." ValidationGroup="Step5" Display="Dynamic"
                            CssClass="errorMsg" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
                    </td> 
                </tr>

                <tr>
                    <td align="right"><span style="padding-top:5px;font-weight:bold;">Totals</span></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="textTotalMilk" runat="server" MaxLength="7" Columns="5" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalFruit" runat="server" MaxLength="7" Columns="5" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalVeg" runat="server" MaxLength="7" Columns="5" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalStarch" runat="server" MaxLength="7" Columns="5" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalProtein" runat="server" MaxLength="7" Columns="5" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalFat" runat="server" MaxLength="7" Columns="5" ReadOnly="true"></asp:TextBox>
                    </td> 
                </tr>

                <tr><td colspan="8"><hr /></td></tr>

                <tr>
                    <td align="right"><span style="padding-top:5px;font-weight:bold;">Goal</span></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="textGoalMilk" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalFruit" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalVeg" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalStarch" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalProtein" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalFat" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None"></asp:TextBox>
                    </td> 
                </tr>

                <tr>
                    <td align="right"><span style="padding-top:5px;font-weight:bold;">Notes</span></td>
                    <td colspan="7">
                        <asp:TextBox ID="textNotes"  runat="server" Width="400" Height="50" style="padding-top:5px;" ></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="8">

                        <asp:Button ID="buttonPrint" Height="25" runat="server" Text="Print" CssClass="aButtonSmall"
                            ValidationGroup="Step5" CausesValidation="true" OnClick="btnPrint_Click" />

                        &nbsp;&nbsp;

                        <asp:TextBox ID="textPrintFrom" runat="server" MaxLength="15" Columns="7"></asp:TextBox>
                        
                        <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="img1" />
                        
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textPrintFrom" Display="Dynamic"
                            ValidationGroup="Step5" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Date."
                            CssClass="required"></asp:RequiredFieldValidator>
                        
                        <cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="textPrintFrom" PopupButtonID="imgCal"
                            Format="MM/dd/yyyy" runat="server">
                        </cc1:CalendarExtender>
                        
                        &nbsp;&nbsp;
                        
                        <span style="padding-top:5px;font-weight:bold;">To</span>
                        
                        &nbsp;&nbsp;
                        
                        <asp:TextBox ID="textPrintTo" runat="server" MaxLength="15" Columns="7"></asp:TextBox>
                        
                        <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="img2" />
                        
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textPrintTo" Display="Dynamic"
                            ValidationGroup="Step5" ID="RequiredFieldValidator3" ErrorMessage="Please Enter Date."
                            CssClass="required"></asp:RequiredFieldValidator>
                        
                        <cc1:CalendarExtender ID="CalendarExtender3" TargetControlID="textPrintTo" PopupButtonID="imgCal"
                            Format="MM/dd/yyyy" runat="server">
                        </cc1:CalendarExtender>
                        
                        &nbsp;&nbsp;
                        
                        <asp:Button ID="buttonSave" Height="25" runat="server" Text="Save" CssClass="aButtonSmall"
                            ValidationGroup="Step5" CausesValidation="true" OnClick="btnSave_Click" />

                        <asp:Button ID="buttonClose" Height="25" runat="server" Text="Close" CssClass="aButtonSmall" OnClientClick="javascript:closeFoodJournal();"  />
                    </td> 
                </tr>


            </table>

        </div>

        <div class="insideBottom" >
            
            <div style="clear:both;"></div>

            <div style="float:right;margin-right:10px;">
                <asp:TextBox ID="textFoodSearch" runat="server" Columns="20"></asp:TextBox>&nbsp;&nbsp;<img src="../Images/magnifying_glass.jpg" />
            </div>
            
            <div style="clear:both;"></div>

            <div style="margin:10px;padding:10px;width=100%;height:100px;background-color:white;-moz-border-radius: 10px;-webkit-border-radius: 10px;-khtml-border-radius: 10px;border-radius: 10px;" align="center">

                <table>
                    <tr>
                        <th>Food Type</th><th># Starch</th><th># Fat</th><th>Portion Size</th>
                    </tr>

                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                    </tr>

                </table>

            </div>


        </div>

    </div>

</div><!-- divFoodJournal -->

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