<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackOffice.aspx.cs" Inherits="BackOffice_BackOffice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>BackOffice Utilties</title>
    <%--<link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    Above lines are commented by Netsmartz
    --%>
</head>
<body onload="top.setIframeHeight();" class="body2">
    <form id="form1" runat="server">
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
                <td>
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
                <td>
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
                <td>
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
                <td>
                    <a runat="server"  href="~/BackOffice/ManageQuestionnaires.aspx">Manage Questionnaires</a><br />
                    <span class="small">Add, edit, delete, activate and deactivate the questionnaires.</span>
                </td>
            </tr> <tr>
                <td>
                    <br /> <br />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
