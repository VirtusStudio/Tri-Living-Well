<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Full_MealExchange.aspx.cs" MasterPageFile="~/MasterPages/User.master"  Title="Food Exchange"
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
                            <td style="width:140px; vertical-align:top;"><div style="padding-bottom:15px;">
                                Select a category</div>
                                <asp:Label ID="lblNavigation" runat="server"></asp:Label>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <a name="1"></a>
                                            <div class="subTitle boxPadding">
                                                MILK</div>
                                            <table cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <asp:Label ID="lblMilk" runat="server"></asp:Label>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <a name="2"></a>
                                            <div class="subTitle boxPadding">
                                                FRUIT</div>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFurit" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <a name="3"></a>
                                            <div class="subTitle boxPadding">
                                                VEGETABLES</div>
                                            <table cellspacing ="0" cellpadding ="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblVegetablee" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <a name="4"></a>
                                            <div class="subTitle boxPadding">
                                                STARCH LISTS</div>
                                            <table >
                                                <tr>
                                                    <td>
                                                       <asp:Label ID = "lblstarchlists" runat = "server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <a name="5"></a>
                                            <div class="subTitle boxPadding">
                                                PROTEINS</div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPROTEINS" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <a name="6"></a>
                                            <div class="subTitle boxPadding">
                                                FATS</div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFats" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="subTitle boxPadding">
                                                SNACKS</div>
                                            <table cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblSnacks" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                            <p>
                                                &nbsp;
                                            </p>
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
