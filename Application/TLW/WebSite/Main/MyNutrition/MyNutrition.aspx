<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyNutrition.aspx.cs" MasterPageFile="~/MasterPages/User.master"  Title="My Nutrition"
Inherits="MyNutrition" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register src="~/Controls/UC_PAL_Steps.ascx" tagname="UC_PAL_Steps" tagprefix="uc2" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;">
        <div class="demoContent">
            <div class="overview">
            <table>
                <tr>
                    <td>
                        <uc1:uc_textarea id="UC_TextArea1" runat="server" textarea_name="MyNutritionOverview" />
                       
                    </td>
                </tr>
            </table>
            </div>
            <div class="programBlock">
            <table>
                <tr>
                   <td style="display:none;">
                        <div style="padding:0px 15px 0px 0px; text-align:right; vertical-align:middle;">
                            <asp:Label ID="lblEmailCoach" runat="server"></asp:Label>
                            <asp:Label ID="lblProgramForum" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
            </table>
            </div>
            <div class="description">
                    <center class="Round3"><center><center><center><center><center><center><center><center><center>
                        <table>
                        <tr>
                            <td><uc2:UC_PAL_Steps ID="UC_PAL_Steps1" runat="server" /></td>
                            <td style="text-align:right;"><asp:Label ID="lblLevelID" runat="server"></asp:Label></td>
                        </tr>
                        </table>
                    </center></center></center></center></center></center></center></center></center></center>
            </div>   
            <telerik:RadMenu ID="RadMenu1" runat="server" SkinID="" Skin="Web20" Width="100%">
            </telerik:RadMenu>
          
            <iframe runat="server" frameborder="0" name="IFRAME_CONTENT" id="IFRAME_CONTENT" 
                class="IFRAME_CONTENT IFRAME_TAB" style="height:375px;overflow-y:scroll;overflow-x:hidden;"></iframe>
        </div>             
                <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </div>
</asp:Content>


