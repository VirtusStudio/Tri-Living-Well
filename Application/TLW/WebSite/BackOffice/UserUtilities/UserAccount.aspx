﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true"
    CodeFile="UserAccount.aspx.cs" Inherits="BackOffice_UserUtilities_UserAccount" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_USER_EditAccount.ascx" TagName="UC_USER_EditAccount"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
<!--
        function btnCancel_onclick() {
            document.location.href = "UserUtilities.aspx";
        }
// -->
    </script>
    <!--AJAX etc-->
    <script type="text/javascript">
        var bIsPostBack = false;
        function Page_Load() {
            if (!bIsPostBack) {  // INITIAL PAGE LOAD
                //alert("Initial Page Load");
                bIsPostBack = true;
            }
            else {
                if (document.getElementById("UC_USER_EditAccount1_txtSuccess").value == "1") {
                    document.location.href = "UserUtilities.aspx";
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto;
        padding: 10px; width: 886px; overflow: hidden;">
    <table width="100%">
        <tr>
            <td align="left">
                <img alt="" runat="server" id="imgEditUser" src="~/Images/icons/iconEditUser.gif" />
            </td>
        </tr>
        <tr>
            <td align="left">
                <table class="title">
                    <tr>
                        <td>
                            Edit User
                        </td>
                    </tr>
                </table>
                <div class="description">
                    <uc1:UC_USER_EditAccount ID="UC_USER_EditAccount1" runat="server"></uc1:UC_USER_EditAccount>
                </div>
                <uc2:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
