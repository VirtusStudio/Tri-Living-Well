<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Main_Content_Home" %>

 
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_Home_1_Control.ascx" TagName="UC_Home_1_Control"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <%--
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />--%>
</head>
<!--MAIN-->
<script type="text/javascript">
    var bIsPostBack = false;
    var objMsgBoxLog;
    var bDebugeMode = false;

</script>
<!--AJAX etc-->
<script type="text/javascript">

    function Page_Load() {
        top.log("Hello");
        //top.log(document.getElementById('txtMsgBoxLog'));

        var bIsPostBack;
        if (!bIsPostBack) {  // INITIAL PAGE LOAD
            bIsPostBack = true;
            objMsgBoxLog = document.getElementById('txtMsgBoxLog') // Register Log Object
            if (bDebugeMode) {
                var objPAGEITEMS = document.getElementById('PAGEITEMS');
                objPAGEITEMS.style.visibility = 'visible';
                objPAGEITEMS.style.zIndex = '0';
                objPAGEITEMS.style.left = '250px';
                objPAGEITEMS.style.top = '650px';
            }
        }
        else {  // RETURING FROM AJAX REQUEST
        }
    }

</script>
<body onload="top.setIframeHeight();" class="body2">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript">
        Sys.Application.add_load(Page_Load);
    </script>
    <table>
        <tr>
            <td class="top">
                <div class="title">
                    What's New?</div>
                <div class="description">
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
                                                            <table class="Round3_tblHeader">
                                                                <tr>
                                                                    <td>
                                                                        Recent News
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="lblTemplateText1" runat="server"></asp:Label>
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
                                                            <table class="Round3_tblHeader">
                                                                <tr>
                                                                    <td>
                                                                        Announcements
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="lblTemplateText2" runat="server"></asp:Label>
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
                </div>
            </td>
            <td style="width: 3px;">
                &nbsp;
            </td>
            <td class="top">
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <uc3:UC_Home_1_Control ID="UC_Home_1_Control1" runat="server" />
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <uc2:UC_Login_Register ID="UC_Login_Register1" runat="server" />
                    </AnonymousTemplate>
                </asp:LoginView>
            </td>
        </tr>
    </table>
    
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnCalorieSubmit">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblCurrentCalorie" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    </form>
</body>
</html>
