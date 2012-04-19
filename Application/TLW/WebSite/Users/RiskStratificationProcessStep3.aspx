<%@ Page Title="Risk Stratification Process Step3" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep3.aspx.cs" Inherits="Users_RiskStratificationProcessStep3" %>

   <%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
    <%--<%@ Register assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>--%>
    <script runat="server">

    //protected void menuTabs_MenuItemClick(object sender, MenuEventArgs e)
    //{
    //    multiTabs.ActiveViewIndex = Int32.Parse(menuTabs.SelectedValue);
    //}
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/BGT_Text_Arial.css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
     <link href="../Styles/tab.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
.fancy .ajax__tab_header 
{
	font-size:13px;
	font-weight:bold;
	color:#000000;
    font-family:sans-serif;
     background:url(../Images/blue_bg.jpg) repeat-x;
}
.fancy .ajax__tab_active .ajax__tab_outer,
.fancy .ajax__tab_header .ajax__tab_outer,
.fancy .ajax__tab_hover .ajax__tab_outer
{
    height:46px;
    background:url(../Images/blue_left.jpg) no-repeat left top;
}
.fancy .ajax__tab_active .ajax__tab_inner,
.fancy .ajax__tab_header .ajax__tab_inner,
.fancy .ajax__tab_hover .ajax__tab_inner
{
    height:46px;
    margin-left:16px; /* offset the width of the left image */
    background:url(../Images/blue_right.jpg) no-repeat right top;
}
.fancy .ajax__tab_active .ajax__tab_tab,
.fancy .ajax__tab_hover .ajax__tab_tab,
.fancy .ajax__tab_header .ajax__tab_tab
{
	margin:16px 16px 0px 0px;
}
.fancy .ajax__tab_hover .ajax__tab_tab,
.fancy .ajax__tab_active .ajax__tab_tab 
{
	color:#fff;
	font-weight:bold;
}
.fancy .ajax__tab_body 
{
    font-family:verdana,tahoma,helvetica;
    font-size:10pt;
    border:1px solid #999999;
    border-top:0;
    padding:2px;
    background-color:#fff;
}

 
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="title">
                Risk Stratification Process Step 3
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <center class="Round3">
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Screen 3
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" cellpadding="4" cellspacing="4" border="0">
                                                                        <tr>
                                                                            <td align="left">
                                                                              
                                                                             <%--   <div>
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
      
          <asp:Label ID="lblTriCMSText" runat="server"></asp:Label>
        
        </asp:View>
        <asp:View ID="view2" runat="server">
           <asp:Label ID="lblLivingCMSText" runat="server"></asp:Label>
        
        
        </asp:View>
        <asp:View ID="view3" runat="server">
         <asp:Label ID="lblWellCMSText" runat="server"></asp:Label>
        
        
        </asp:View>
    </asp:MultiView>    
    </div>
    </div>--%>



        <div>
            <table cellpadding="2" cellspacing="2" width="50%" bgcolor="#ffccff">
                <tr>
                    <td align="left">
                        <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" Width="100%" CssClass="fancy"
                            ActiveTabIndex="0">
                            <ajaxToolkit:TabPanel ID="TabTri" runat="server" HeaderText="Tri">
                                <ContentTemplate>
                                    <asp:Label ID="lblTriCMSText" runat="server"></asp:Label>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabLiving" runat="server" HeaderText="Living">
                                <ContentTemplate>
                                    <asp:Label ID="lblLivingCMSText" runat="server"></asp:Label>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                            <ajaxToolkit:TabPanel ID="TabWell" runat="server" HeaderText="Well">
                                <ContentTemplate>
                                   <asp:Label ID="lblWellCMSText" runat="server"></asp:Label>
                                </ContentTemplate>
                            </ajaxToolkit:TabPanel>
                           
                        </ajaxToolkit:TabContainer>
                    </td>
                </tr>
            </table>
        </div>

                                                                            
                                                                            
                                                                            </td>
                                                                        </tr>
                                                                     <tr>
                                                                     <td>
                                                                     <br />
                                                                     </td>
                                                                     </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                Your score: <b><asp:Label ID="lblScore" runat="server"></asp:Label></b>,
                                                                                Based on your health score, below is the category in which you lies.
                                                                                   
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 40px;">
                                                                            <td align="center">
                                                                                <img alt="" id="imgCategory" runat="server" src="~/images/icons/iconPalLevel1.jpg" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:CheckBox ID="chkWaiverAgreement" runat="server" Text="I accept the Waiver Agreement" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right"> <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50"
                                                                                    CausesValidation="false" OnClick="lnkBack_Click">Back</asp:LinkButton>
                                                                      &nbsp;
                                                                    <asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50"
                                                                        ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                </center>
            </td>
        </tr>
    </table>
  
</asp:Content>
