<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/BackOffice.master"
    CodeFile="Main_FRAME.aspx.cs" Inherits="Main_FRAME" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfBaseUrl" runat="server" Value="test" />
     <div style="width:550px">
        <table>
            <tr>
                <td>
                    <a href="Templates/ManageCMS.aspx"><img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/cms-icon.jpg" /></a>
                </td>
                <td>
                    <a href="UserUtilities/UserUtilities.aspx"><img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/member-icon.png" /></a>
                </td>             
            </tr>
            <tr>
                 <td align="left">
                    <a href="Templates/ManageCMS.aspx">CMS</a><br />
                    <span class="small">View/edit website pages</span>
                </td>
                <td align="left">
                    <a href="UserUtilities/UserUtilities.aspx">Manage Users</a><br />
                    <span class="small">Add, edit and delete users from the system</span>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="Reports/Report_VisitLog.aspx"><img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/metrics-icon.jpg" /></a>
                </td>
                 <td>
                    <a id="A2" runat="server"  href="~/BackOffice/ManageQuestionnaires.aspx"><img alt="" src="<%=AppConfig.GetBaseSiteUrl()  %>images/icons/risk-icon.png" /></a>
                </td>
            </tr>
            <tr>
               <td align="left">
                    <a href="Reports/Report_VisitLog.aspx">Site Metrics</a><br />
                    <span class="small">Tracks usage of the website</span>
                </td>
                <td align="left">
                    <a id="A1" runat="server"  href="~/BackOffice/ManageQuestionnaires.aspx">Manage Questions</a><br />
                    <span class="small">Manage Risk Stratification Questions</span>
                </td>
            </tr><tr>
                <td>
                    <br /> <br /><br /> <br />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
