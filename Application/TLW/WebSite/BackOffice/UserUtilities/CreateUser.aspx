<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" MasterPageFile="~/MasterPages/BackOffice.master"
    Inherits="Administrator_UserUtilities_CreateUser" %>
<%@ Register Src="../../Controls/UC_USER_CreateAccount.ascx" TagName="UC_USER_CreateAccount"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        var btnSubmit;
        function init() {
            btnSubmit = document.getElementById('UC_USER_CreateAccount1_CreateUserWizard1___CustomNav0_StepNextButtonButton');
            btnSubmit.style.visibility = "hidden";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td align="left">
                <img src="../../Images/icons/iconCreateUser.gif" />
            </td>
        </tr>
        <tr>
            <td align="left">
                <table class="title">
                    <tr>
                        <td align="left">
                            Create User
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td align="right"><a class="aButtonSmall" href="javascript:history.back();">Back</a></td></tr>
        <tr>
            <td align="left">
                <div class="description">
                    <uc1:UC_USER_CreateAccount ID="UC_USER_CreateAccount1" runat="server" USER_MODE="false">
                    </uc1:UC_USER_CreateAccount>
                </div>
                
            </td>
        </tr>
    </table>
</asp:Content>
