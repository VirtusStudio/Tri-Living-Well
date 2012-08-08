<%@ Page Title="Risk Stratification Process Step3" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep3.aspx.cs" Inherits="Users_RiskStratificationProcessStep3" %>
    <script runat="server">

    protected void menuTabs_MenuItemClick(object sender, MenuEventArgs e)
    {
        multiTabs.ActiveViewIndex = Int32.Parse(menuTabs.SelectedValue);
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="../Styles/fluid.css" rel="stylesheet" type="text/css" />
<link href="../Styles/tab.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="wrapper">
<div id="contentFrame">
<div id="mainContent>
<asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
<div id="contentHeader"><asp:Label ID="lblCMSText" runat="server"></asp:Label></div>
<div id="contentBody">
<table width="100%"><tr><td align="center">Based on your health score of <asp:Label ID="lblScore" runat="server"></asp:Label> category.</td></tr><tr><td colspan="2" style="height: 10px;"></td></tr><tr><td align="center"><img alt="" id="imgCategory" runat="server" src="~/images/icons/iconPalLevel1.jpg" /></td></tr></table><br /><br />
     <asp:Menu
        id="menuTabs"
        CssClass="menuTabs"
        StaticMenuItemStyle-CssClass="tab"
        StaticSelectedStyle-CssClass="selectedTab"
        Orientation="Horizontal"
        OnMenuItemClick="menuTabs_MenuItemClick"
        Runat="server">
        <Items>
        <asp:MenuItem
            Text="Tri"
            Value="0" 
            Selected="true" />
        <asp:MenuItem
            Text="Living" 
            Value="1"/>
        <asp:MenuItem
            Text="Well"
            Value="2" />
        </Items>
    </asp:Menu>   
    <div class="tabBody">
    <asp:MultiView
        id="multiTabs"
        ActiveViewIndex="0"
        Runat="server">
        <asp:View ID="view1" runat="server">
        
        <asp:Label ID="lblCMSTri" runat="server"></asp:Label>
        
        </asp:View>
        <asp:View ID="view2" runat="server">
        
        <asp:Label ID="lblCMSLiving" runat="server"></asp:Label>
        
        </asp:View>
        <asp:View ID="view3" runat="server">
        
        <asp:Label ID="lblCMSWell" runat="server"></asp:Label>
        
        </asp:View>
    </asp:MultiView>    
    </div>
<div id="continueBtn"> <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50" CausesValidation="false" OnClick="lnkBack_Click">Back</asp:LinkButton><asp:LinkButton CssClass="aButtonSmall" ID="LinkButton2" runat="server" Width="50" ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton></div>
</div>
</div>
</div>
</div>                                                                                                                                              
</asp:Content>
