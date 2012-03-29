<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Home_1_Control.ascx.cs" Inherits="UC_Home_1_Control" %>
<%@ Register Src="~/Controls/UC_Chart_RecentEntries.ascx" TagName="UC_Chart_RecentEntries" TagPrefix="uc6" %>
<%@ Register Src="~/controls/UC_USER_UserAssesment.ascx" TagName="UC_USER_UserAssesment" TagPrefix="uc4" %>

<%@ Register Src="~/controls/UC_DD_Nutrition_Caluclator_PopUp.ascx" TagName="UC_DD_Nutrition_Caluclator_PopUp" TagPrefix="uc5" %>
<%@ Register Src="~/controls/UC_PAL_Steps.ascx" TagName="UC_PAL_Steps" TagPrefix="uc3" %>
<%@ Register Src="~/controls/UC_PAL_PalStarts_PopUp.ascx" TagName="UC_PAL_PalStarts_PopUp" TagPrefix="uc2" %>
    
<%@ Register Src="~/controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
 
<uc4:UC_USER_UserAssesment ID="UC_USER_UserAssesment1" runat="server" />

<div id="divProgram" runat="server">
        <div class="title">My Wellness Program</div>
        <div class="description">
            <table>
            <tr>
                <td class="top">
                    <center class="Round3"><center><center><center><center><center><center><center><center><center>
                        <table class="Round3_tblHeader"><tr><td>My Health Level</td><td style="text-align:right;"></td></tr></table>
                        <asp:Label ID="lblLevelID" runat="server"></asp:Label>
                    </center></center></center></center></center></center></center></center></center></center>
                </td>
                <td class="top">
                    <center class="Round3"><center><center><center><center><center><center><center><center><center>
                        <table class="Round3_tblHeader">
                        <tr>
                            <td>Recent Activities <span class="small">(Last 2 Weeks)</span></td>
                            <td style="text-align:right;"><a href="javascript:load('Main/Pals/Pal_TABS.aspx');">Personal Activity Log</a></td>
                        </tr>
                        </table>
                        <table>
                        <tr>
                            <td class="top">Workouts (<asp:Label ID="lblActivityCount" runat="server"></asp:Label>)</td>
                            <td class="top" style="padding-left:10px;">
                                <asp:Label ID="lblPalRecentActivities" runat="server"></asp:Label>
                            </td>
                        </tr>
                        </table>
                        
                    </center></center></center></center></center></center></center></center></center></center>
                </td>
            </tr>
            </table>

            <center class="Round3"><center><center><center><center><center><center><center><center><center>
                <table class="Round3_tblHeader"><tr><td>Recent Logged Information <span class="small">(Last 90 Days)</span></td><td style="text-align:right;"></td></tr></table>
                <uc6:UC_Chart_RecentEntries ID="UC_Chart_RecentEntries1" runat="server" />
            </center></center></center></center></center></center></center></center></center></center>

            <center class="Round3"><center><center><center><center><center><center><center><center><center>
                <table class="Round3_tblHeader">
                <tr>
                    <td>Program: <asp:Label ID="lblProgramName" runat="server"></asp:Label> <a href="javascript:editPalStart();">(Change)</a></td>
                    <td style="text-align:right;"> <a href="javascript:popUpWin('MyProgram/MyProgram.aspx',900,650);">My Program |</a> <asp:Label ID="lblCurrentForum" runat="server"></asp:Label></td>
                </tr>
                </table>
                 <div style="white-space:nowrap;">
                    <uc3:UC_PAL_Steps ID="UC_PAL_Steps1" runat="server" />
                 </div>
                 <table class="tblItems" style="width:100%; display:none;">
                <tr>
                    <td style="width:200px;">
                    Current Program: 
                     
                    </td>
        
                    <td>
                        Current Step: 
                        <asp:Label ID="lblProgramCurrentStep" runat="server"></asp:Label>
                    </td>
            
                    <td>
                        Total Steps: 
                        <asp:Label ID="lblNumSteps" runat="server"></asp:Label>
                    </td>
                </tr>
                 </table>
            </center></center></center></center></center></center></center></center></center></center>                        
                 
            <center class="Round3"><center><center><center><center><center><center><center><center><center>
            <table class="Round3_tblHeader">
            <tr>
                <td>Nutrition Center</td>
                <td style="text-align:right;"><a href="javascript:top.popUpWin('Main/MyNutrition/NutritionOverview.html',900,650);">Nutrition Overview |</a> <a href="javascript:top.popUpWin('Main/MyNutrition/MyNutrition.aspx',900,650);">My Nutrition |</a> <a href="../../Main/DDs/DD.aspx">Daily Diary</a></td>
            </tr>
            </table>   
            <table class="tblItems">
            <tr>
                <td>Current Daily Calorie: </td>
                <td><asp:Label ID="lblCurrentCalorie" runat="server"></asp:Label></td>
            </tr>
            </table>
            <a href="javascript:editCalorie();" class="aButtonSmall">Show Calculator</a>
        </center></center></center></center></center></center></center></center></center></center>   
       

         
         
        </div>              
   
<uc5:UC_DD_Nutrition_Caluclator_PopUp id="UC_DD_Nutrition_Caluclator_PopUp1" runat="server"></uc5:UC_DD_Nutrition_Caluclator_PopUp>
<uc2:UC_PAL_PalStarts_PopUp ID="UC_PAL_PalStarts_PopUp1" runat="server" />
   

<div style="display:none;">
                             <asp:Label ID="lblBMIHeight" runat="server" Text="lblBMIHeight" visible="false" ></asp:Label>
                            
                                    <asp:Label ID="lblBMIWeight" runat="server" Text="lblBMIWeight" visible="false" ></asp:Label>
                                    
                                    <asp:Label Visible="false" ID="lblBMIGraph" runat="server" Text="lblBMIGraph" ></asp:Label>
    &nbsp;&nbsp;
    <asp:Label ID="lblStressGraph" Visible="false" runat="server" Text="lblStressGraph" ></asp:Label>
    &nbsp;&nbsp;
    <asp:Label ID="lblSleepGraph" Visible="false" runat="server" Text="lblSleepGraph"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    
</div>
             
</div>