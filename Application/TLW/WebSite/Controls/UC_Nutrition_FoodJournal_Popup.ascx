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
    
    #divFoodJournalOutside 
    {
        background-color:#992E24;
        width:570px;
        height:650px;
        padding:20px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
        
    }
    
    #divFoodJournalTop 
    {
        background-color:#F9D4A8;
        width:100%;
        height:420px;
        padding-top:10px;
        padding-bottom:10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }

    #divFoodJournalInsideBottom 
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
<div id="divFoodJournal" class="fixed" style="display:none;z-index:222;" >

    <div id="divFoodJournalOutside" >

        <div id="divFoodJournalTop" >

            <table style="width:500px;">
                <tr>
                    <td colspan="8" align="right">
                        <asp:TextBox ID="textJournalDate" runat="server" MaxLength="15" Columns="10" OnTextChanged="On_textJournalDate_Changed"></asp:TextBox>
                        <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgJournalDate" />
                        <cc1:CalendarExtender ID="calExtJournalDate" TargetControlID="textJournalDate" PopupButtonID="imgJournalDate" Format="MM/dd/yyyy" runat="server"></cc1:CalendarExtender>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textPrintFrom" Display="Dynamic" ValidationGroup="Step5" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Date." CssClass="required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
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
                        <asp:HiddenField ID="FoodIntakeLogId1" runat="server" />
                        <asp:DropDownList ID="ddlMeal1" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textJournalTime1" runat="server" Columns="10"></asp:TextBox>
                        <cc1:MaskedEditExtender AcceptAMPM="true" ID="mexJournalTime1" MaskType="Time" Mask="99:99" runat="server" TargetControlID="textJournalTime1" />
                        <cc1:MaskedEditValidator ID="mevJournalTime1" runat="server"   
                            ControlExtender="mexJournalTime1"  
                            ControlToValidate="textJournalTime1"  
                            IsValidEmpty="False"  
                            EmptyValueMessage="Time is required"  
                            InvalidValueMessage="Time is invalid"  
                            Display="Dynamic"  
                            TooltipMessage="Input a time"  
                            ValidationGroup="MKE" />  
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
                        <asp:HiddenField ID="FoodIntakeLogId2" runat="server" />
                        <asp:DropDownList ID="ddlMeal2" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textJournalTime2" runat="server" Columns="10"></asp:TextBox>
                        <cc1:MaskedEditExtender AcceptAMPM="true" ID="mexJournalTime2" MaskType="Time" Mask="99:99" runat="server" TargetControlID="textJournalTime2" />
                        <cc1:MaskedEditValidator ID="mevJournalTime2" runat="server"  
                            ControlExtender="mexJournalTime2"  
                            ControlToValidate="textJournalTime2"  
                            IsValidEmpty="False"  
                            EmptyValueMessage="Time is required"  
                            InvalidValueMessage="Time is invalid"  
                            Display="Dynamic"  
                            TooltipMessage="Input a time"
                            ValidationGroup="MKE" />  
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
                        <asp:HiddenField ID="FoodIntakeLogId3" runat="server" />
                        <asp:DropDownList ID="ddlMeal3" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textJournalTime3" runat="server" Columns="10"></asp:TextBox>
                        <cc1:MaskedEditExtender AcceptAMPM="true" ID="mexJournalTime3" MaskType="Time" Mask="99:99" runat="server" TargetControlID="textJournalTime3" />
                        <cc1:MaskedEditValidator ID="mevJournalTime3" runat="server"  
                            ControlExtender="mexJournalTime3"  
                            ControlToValidate="textJournalTime3"  
                            IsValidEmpty="False"  
                            EmptyValueMessage="Time is required"  
                            InvalidValueMessage="Time is invalid"  
                            Display="Dynamic"  
                            TooltipMessage="Input a time"  
                            ValidationGroup="MKE" />  
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
                        <asp:HiddenField ID="FoodIntakeLogId4" runat="server" />
                        <asp:DropDownList ID="ddlMeal4" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textJournalTime4" runat="server" Columns="10"></asp:TextBox>
                        <cc1:MaskedEditExtender AcceptAMPM="true" ID="mexJournalTime4" MaskType="Time" Mask="99:99" runat="server" TargetControlID="textJournalTime4" />
                        <cc1:MaskedEditValidator ID="mevJournalTime4" runat="server"  
                            ControlExtender="mexJournalTime4"  
                            ControlToValidate="textJournalTime4"  
                            IsValidEmpty="False"  
                            EmptyValueMessage="Time is required"  
                            InvalidValueMessage="Time is invalid"  
                            Display="Dynamic"  
                            TooltipMessage="Input a time"  
                            ValidationGroup="MKE" />  
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
                        <asp:HiddenField ID="FoodIntakeLogId5" runat="server" />
                        <asp:DropDownList ID="ddlMeal5" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textJournalTime5" runat="server" Columns="10"></asp:TextBox>
                        <cc1:MaskedEditExtender AcceptAMPM="true" ID="mexJournalTime5" MaskType="Time" Mask="99:99" runat="server" TargetControlID="textJournalTime5" />
                        <cc1:MaskedEditValidator ID="mevJournalTime5" runat="server"  
                            ControlExtender="mexJournalTime5"  
                            ControlToValidate="textJournalTime5"  
                            IsValidEmpty="False"  
                            EmptyValueMessage="Time is required"  
                            InvalidValueMessage="Time is invalid"  
                            Display="Dynamic"  
                            TooltipMessage="Input a time"  
                            ValidationGroup="MKE" />  
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
                        <asp:HiddenField ID="FoodIntakeLogId6" runat="server" />
                        <asp:DropDownList ID="ddlMeal6" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="1" Text="Breakfast"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Snack"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Lunch"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Dinner"></asp:ListItem>
                        </asp:DropDownList> 
                    </td>
                    <td>
                        <asp:TextBox ID="textJournalTime6" runat="server" Columns="10"></asp:TextBox>
                        <cc1:MaskedEditExtender AcceptAMPM="true" ID="mexJournalTime6" MaskType="Time" Mask="99:99" runat="server" TargetControlID="textJournalTime6" />
                        <cc1:MaskedEditValidator ID="mevJournalTime6" runat="server"  
                            ControlExtender="mexJournalTime6"  
                            ControlToValidate="textJournalTime6"  
                            IsValidEmpty="False"  
                            EmptyValueMessage="Time is required"  
                            InvalidValueMessage="Time is invalid"  
                            Display="Dynamic"  
                            TooltipMessage="Input a time"
                            ValidationGroup="MKE" />  
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
                        <asp:TextBox ID="textTotalMilk" runat="server" MaxLength="7" Columns="5" ReadOnly="true" Text="0" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalFruit" runat="server" MaxLength="7" Columns="5" ReadOnly="true" Text="0" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalVeg" runat="server" MaxLength="7" Columns="5" ReadOnly="true" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalStarch" runat="server" MaxLength="7" Columns="5" ReadOnly="true" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalProtein" runat="server" MaxLength="7" Columns="5" ReadOnly="true" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textTotalFat" runat="server" MaxLength="7" Columns="5" ReadOnly="true" Text="0"></asp:TextBox>
                    </td> 
                </tr>

                <tr><td colspan="8"><hr /></td></tr>

                <tr>
                    <td align="right"><span style="padding-top:5px;font-weight:bold;">Goal</span></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="textGoalMilk" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalFruit" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalVeg" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalStarch" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalProtein" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="textGoalFat" runat="server" MaxLength="7" Columns="5" ReadOnly="true" BackColor="#F9D4A8" BorderStyle="None" Text="0"></asp:TextBox>
                    </td> 
                </tr>

                <tr>
                    <td align="right"><span style="padding-top:5px;font-weight:bold;">Notes</span></td>
                    <td colspan="7">
                        <asp:TextBox ID="textNotes" TextMode="MultiLine" Wrap="true" runat="server" Width="400" Height="50" style="padding-top:5px;" />
                    </td>
                </tr>

                <tr>
                    <td colspan="8">

                        <asp:LinkButton  CssClass="aButtonSmall" ID="buttonPrint" runat="server" OnClick="btnPrint_Click" CausesValidation="true" ValidationGroup="Step5" Text="Print"></asp:LinkButton>

                        <asp:TextBox ID="textPrintFrom" runat="server" MaxLength="15" Columns="10"></asp:TextBox>
                        <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgPrintFrom" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textPrintFrom" Display="Dynamic" ValidationGroup="Step5" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Date." CssClass="required"></asp:RequiredFieldValidator>
                        <cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="textPrintFrom" PopupButtonID="imgPrintFrom" Format="MM/dd/yyyy" runat="server"></cc1:CalendarExtender>
                        
                        <span style="padding-top:5px;font-weight:bold;">To</span>
                        
                        <asp:TextBox ID="textPrintTo" runat="server" MaxLength="15" Columns="10"></asp:TextBox>
                        <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgPrintTo" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="textPrintTo" Display="Dynamic" ValidationGroup="Step5" ID="RequiredFieldValidator3" ErrorMessage="Please Enter Date." CssClass="required"></asp:RequiredFieldValidator>
                        <cc1:CalendarExtender ID="CalendarExtender3" TargetControlID="textPrintTo" PopupButtonID="imgPrintTo" Format="MM/dd/yyyy" runat="server"></cc1:CalendarExtender>
                        
                        <asp:LinkButton  CssClass="aButtonSmall" ID="buttonSave" runat="server" OnClick="btnSave_Click" CausesValidation="true" ValidationGroup="Step5" Text="Save"></asp:LinkButton>
                        <a class="aButtonSmall" id="buttonClose" onclick="closeFoodJournal();" >Close</a>
                    </td> 
                </tr>


            </table>

        </div>

        <div id="divFoodJournalInsideBottom" >
            
            <div style="clear:both;"></div>

            <div style="float:right;margin-right:10px;">
                <asp:TextBox ID="textFoodSearch" runat="server" Columns="20"></asp:TextBox>&nbsp;&nbsp;<asp:ImageButton ID="btnSearch" CausesValidation="true" ImageUrl="~/Images/magnifying_glass.jpg" runat="server" OnClick="btnSearch_Click" />
            </div>
            
            <div style="clear:both;"></div>

            <div style="margin:10px;padding:10px;width=100%;height:100px;background-color:white;-moz-border-radius: 10px;-webkit-border-radius: 10px;-khtml-border-radius: 10px;border-radius: 10px;" align="center">
            <asp:Literal ID="searchTable" runat="server" />
            </div>


        </div>

    </div>
</div><!-- divFoodJournal -->

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
    document.getElementById("divFoodJournal").style.top = calcTop + 'px';
    document.getElementById("divFoodJournal").style.left = calcLeft + 'px';

</script>