<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" 
MasterPageFile="~/MasterPages/BackOffice.master"
Inherits="Main_UserUtilities_EditUser" %>
 
<%@ Register Src="~/Controls/UC_USER_EditAccount.ascx" TagName="UC_USER_EditAccount"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">  <!--AJAX etc-->
    <script type="text/javascript">
        var bIsPostBack = false;
        function Page_Load() {
            if (!bIsPostBack) {  // INITIAL PAGE LOAD
                //alert("Initial Page Load");
                bIsPostBack = true;
            }
            else {
                if (document.getElementById("UC_USER_EditAccount1_txtSuccess").value == "1") {
                    //document.location.href = "/Main/Content/Dashboard.aspx";commented by Netsmartz
                }
            }
        }

    </script>   <script type="text/javascript">
                    Sys.Application.add_load(Page_Load);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
 
    <div class="title" style="text-align :left;">
        Account Information
    </div>
    <div class="description">
        <uc1:UC_USER_EditAccount ID="UC_USER_EditAccount1" runat="server" USER_MODE="true" />
    </div>
  </asp:Content>
