<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/BackOffice.master"
    CodeFile="Main_FRAME.aspx.cs" Inherits="Main_FRAME" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfBaseUrl" runat="server" Value="test" />
     <div style="padding-left: 300px;">
        <table>
              <tr>
                <td>
                    <br />
                </td>
            </tr>  <tr>
                <td>
                    <br />
                </td>
            </tr>  <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/iconTemplates.gif" />
                </td>
                <td align="left">
                    <a href="Templates/ManageCMS.aspx">Templates</a><br />
                    <span class="small">View/edit website templates</span>
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/iconUsers.gif" />
                </td>
                <td align="left">
                    <a href="UserUtilities/UserUtilities.aspx">Manage Users</a><br />
                    <span class="small">Add, edit and delete users from the system</span>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/iconReports.gif" />
                </td>
                <td align="left">
                    <a href="Reports/Report_VisitLog.aspx">Visit Log</a><br />
                    <span class="small">Tracks usage of the website</span>
                </td>
            </tr>
            
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/iconUsers.gif" />
                </td>
                <td align="left">
                    <a id="A1" runat="server"  href="~/BackOffice/ManageQuestionnaires.aspx">Manage Questionnaires</a><br />
                    <span class="small">Add, edit, delete, activate and deactivate the questionnaires.</span>
                </td>
            </tr><tr>
                <td>
                    <br /> <br /><br /> <br />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
