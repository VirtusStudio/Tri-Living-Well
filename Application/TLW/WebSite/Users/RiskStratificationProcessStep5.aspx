<%@ Page Title="Risk Stratification Process Step 5" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true"
    CodeFile="RiskStratificationProcessStep5.aspx.cs" Inherits="Users_RiskStratificationProcessStep5" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="../Styles/fluid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="wrapper">
<div id="contentFrame">
<div id="mainContent>
<asp:Label ID="lblError" runat="server"></asp:Label>
<div id="contentHeader"><asp:Label ID="lblDCRequirmentHTMLText" runat="server"></asp:Label><a href="<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/DailyCaloricRequirements.aspx" target="_blank">
                                                                                                Read More</a></div>
<div id="contentBody">
<div class="lblBioAlt">Height:</div><div class="dataBioAlt"><asp:TextBox ID="txtFeet" onblur="calcCaloriesOnBlur()" runat="server" CssClass="riskBox"
                        MaxLength="7"></asp:TextBox>&nbsp;ft.&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtInches" onblur="calcCaloriesOnBlur()" runat="server" CssClass="riskBox"
                        MaxLength="7"></asp:TextBox>&nbsp;in.</div>
<div class="lblBio">Weight:</div><div class="dataBio"><asp:TextBox ID="txtWeight" onblur="calcCaloriesOnBlur()" runat="server" CssClass="riskBox"
                        MaxLength="7"></asp:TextBox></div>                                                                                     
<div class="lblBioAlt">Age:</div><div class="dataBioAlt"><asp:TextBox ID="txtAge" onblur="calcCaloriesOnBlur()" runat="server" CssClass="riskBox"
                        MaxLength="7"></asp:TextBox></div>                                                                 
<div class="lblBio">Gender:</div><div class="dataBio">
                    <asp:DropDownList ID="ddlGender" onchange="javascript:calcCaloriesOnBlur()" runat="server">
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female" Selected="True">Female</asp:ListItem>
                    </asp:DropDownList></div>
<div class="bioRow"><div class="lblBioActive">How Active Are You?</div><div class="dataBioActive"><asp:Label ID="lblActiveAreYouHTMLText" runat="server"></asp:Label></div></div>
<div class="lblBio">What Is Your Current Activity Level?</div><div class="dataBio"><asp:DropDownList onchange="javascript:calcCaloriesOnBlur()" ID="ddlActivity" runat="server"
                        CssClass="txtBox">
                        <asp:ListItem Value="1">Sedentary - little or no exercise</asp:ListItem>
                        <asp:ListItem Value="2">Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem>
                        <asp:ListItem Value="3">Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem>
                        <asp:ListItem Value="4">Very Active - hard exercise/sports 6-7 days/week</asp:ListItem>
                    </asp:DropDownList></div>
<div class="alignCenter"><div class="dailyCal">Calories: &nbsp;<asp:TextBox ID="txtCalories" CssClass="calBox" onkeypress="return false;" runat="server"></asp:TextBox></div></div>
<div class="alignCenter"><div class="calcCal"><a class="aButtonSmall" href="javascript:calcCalories();">Calculate</a></div></div>                                                                        
<div id="continueBtn"> <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50" CausesValidation="false" OnClick="lnkBack_Click">Back</asp:LinkButton><asp:LinkButton CssClass="aButtonSmall" ID="LinkButton2" runat="server" Width="50" ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton></div>                                                                    
<div class="validators"><asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge" Display="Dynamic"
                        ValidationGroup="Step5" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Age."
                        CssClass="required"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFeet" Display="Static"
                        ValidationGroup="Step5" ID="RequiredFieldValidator3" ErrorMessage="Please Enter Height in Feet."
                        CssClass="required"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInches" Display="Static"
                        ValidationGroup="Step5" ID="RequiredFieldValidator4" ErrorMessage="Please Enter Height in Inches."
                        CssClass="required"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtWeight" Display="Static"
                        ValidationGroup="Step5" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Weight."
                        CssClass="required"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtWeight" runat="server"
                        ErrorMessage="Weight Should be a Whole Number." ValidationGroup="Step5" Display="Dynamic"
                        CssClass="required" Operator="DataTypeCheck" SetFocusOnError="True" Type="Double"></asp:CompareValidator>
</div>
</div>
<script language="javascript" type="text/javascript">

    function calcActivityFactor() {
        var sActivityLevel = document.getElementById('<%=ddlActivity.ClientID %>').value;

        if (sActivityLevel == "1") return 1.2;
        if (sActivityLevel == "2") return 1.375;
        if (sActivityLevel == "3") return 1.55;
        if (sActivityLevel == "4") return 1.725;
        if (sActivityLevel == "5") return 1.9;
    }

    function calcCalories() {
        var varRMR = 0;
        if (document.getElementById('<%=txtFeet.ClientID %>').value == '') {
            alert("Please Enter Height in Feet.");
            return;
        }
        if (document.getElementById('<%=txtInches.ClientID %>').value == '') {
            alert("Please Enter Height in Inches.");
            return;
        }
        if (document.getElementById('<%=txtWeight.ClientID %>').value == '') {
            alert("Please Enter Weight.");
            return;
        }
        if (document.getElementById('<%=txtAge.ClientID %>').value == '') {
            alert("Please Enter Age.");
            return;
        }


        if (document.getElementById('<%=ddlGender.ClientID %>').value == "Female") {
            varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * (parseFloat(document.getElementById('<%=txtFeet.ClientID %>').value) * 12) + parseFloat(document.getElementById('<%=txtInches.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(5);
        }
        else if (document.getElementById('<%=ddlGender.ClientID %>').value == "Male") {
            varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * (parseFloat(document.getElementById('<%=txtFeet.ClientID %>').value) * 12) + parseFloat(document.getElementById('<%=txtInches.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(161);
        }

        varRMR = parseFloat(varRMR) * parseFloat(calcActivityFactor());
        document.getElementById('<%=txtCalories.ClientID %>').value = varRMR.toFixed(0).toString();
    }


    function calcCaloriesOnBlur() {

        if (document.getElementById('<%=txtWeight.ClientID %>').value != "" &&
        document.getElementById('<%=txtFeet.ClientID %>').value != "" && document.getElementById('<%=txtInches.ClientID %>').value != "" &&
        document.getElementById('<%=txtAge.ClientID %>').value != "") {
            var varRMR = 0;


            if (document.getElementById('<%=ddlGender.ClientID %>').value == "Female") {
                varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * (parseFloat(document.getElementById('<%=txtFeet.ClientID %>').value) * 12) + parseFloat(document.getElementById('<%=txtInches.ClientID %>').value)) - ((4.92) * parseFloat(document.getElementById('<%=txtAge.ClientID %>').value)) + parseFloat(5);
            }
            else if (document.getElementById('<%=ddlGender.ClientID %>').value == "Male") {
                varRMR = ((9.99) * parseFloat(document.getElementById('<%=txtWeight.ClientID %>').value)) + ((6.25) * (parseFloat(document.getElementById('<%=txtFeet.ClientID %>').value) * 12) + parseFloat(document.getElementById('<%=txtInches.ClientID %>').value)) + parseFloat(161);
            }

            varRMR = parseFloat(varRMR) * parseFloat(calcActivityFactor());
            document.getElementById('<%=txtCalories.ClientID %>').value = varRMR.toFixed(0).toString();


        }
    }

    </script>
</div>
</div>                                                                                                                                             
</asp:Content>
