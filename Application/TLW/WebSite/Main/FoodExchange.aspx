<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FoodExchange.aspx.cs" MasterPageFile="~/MasterPages/User.master"  Title="Food Exchange"
Inherits="FoodExchange" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register src="~/Controls/UC_PAL_Steps.ascx" tagname="UC_PAL_Steps" tagprefix="uc2" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <link href="../../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../../../../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../../../../Styles/Grid.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .boxPadding
        {
            margin-top: 20px;
            padding: 10px 0px 10px 0px;
            border-top: solid 2px navy;
            text-align: center;
        }
    </style>

    <!--MENU system-->
    <script  type="text/javascript">
        function load(sUrl) {
            document.getElementById(iframeName).src = sUrl;
        }
        function Init() {
            window.focus();
            //document.getElementById(iframeName).src = tabStrip.SelectedTab.Value;
        }
    </script>
  
    <script type="text/javascript">
    function Init()
    {
        window.focus();
    }
    </script>

    <!--anchor-->
    <script type="text/javascript">
    function setIframeSection(anchorID)
    {
        document.getElementById("IFRAME_CONTENT").src = document.getElementById("IFRAME_CONTENT").src.split('#')[0] + "#" + anchorID;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; height: 600px; overflow:auto;"
        <table style="width:auto;">
        <tr>
            <td>                
                <div class="description">
                    <table>
                        <tr>
                            <td style="width:140px; vertical-align:top;">
                                <div style="padding-bottom:15px;">Select a category</div>
                                <div style="padding-bottom:15px;"><a class="aButton" href='#Milk' >Milk</a></div>
                                <div style="padding-bottom:15px;"><a class="aButton" href=#Fruit' >Fruit</a></div>
                                <div style="padding-bottom:15px;"><a class="aButton" href='#Vegetables' >Vegetables</a></div>
                                <div style="padding-bottom:15px;"><a class="aButton" href='#Starch' >Starch</a></div>
                                <div style="padding-bottom:15px;"><a class="aButton" href='#Protein' >Proteins</a></div>
                                <div style="padding-bottom:15px;"><a class="aButton" href='#Fat' >Fats</a></div>
                                <div style="padding-bottom:15px;"><a class="aButton" href='#Water' >Water</a></div>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Literal ID="literalFoodExchange" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        </table>
    </div>
</asp:Content>
