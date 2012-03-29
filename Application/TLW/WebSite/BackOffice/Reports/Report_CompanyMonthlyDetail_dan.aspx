<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/MasterPages/BackOffice.master"   CodeFile="Report_CompanyMonthlyDetail_dan.aspx.cs" Inherits="Report_CompanyMonthlyDetail" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

<script type="text/javascript">
function grid(iMonthIndex)
{
    document.getElementById('txtMonth').value = iMonthIndex;
    document.getElementById('btnMonth').click();
}
function cbAll_Change()
{
    var bCheck = false;//defaultly uncheck all
    if(document.getElementById('cbAll').checked)
    {//select all other checkboxes
        bCheck = true;
    }
    
    var cbl = document.getElementById('cblFilter');
    var arrayOfCheckBoxes = cbl.getElementsByTagName("input");
    for(var i = 0; i < arrayOfCheckBoxes.length; i++)
    {
      arrayOfCheckBoxes[i].checked = bCheck;
    }
}
function cblFilter_Change()
{
    document.getElementById('cbAll').checked = false;
}
</script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="title" style="text-align:left;"> 
        Company Monthly Detail
    </div>
    
     <div class="description">
            <div style="color:#990000">
                          <br />
            </div>
<div id="divMonths" style="text-align:center;padding: 2px 2px 2px 2px; border:solid 1px #cccccc;" >
        <table border="1" id="tblMonths">
        <tr>
            <td style="width:110px;padding-bottom:2px;" class="txtSmall">Yearly Summary<br /><asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="False" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
            
            </td>

            <td><a class="aButtonSmall" href="javascript:grid(1);">Jan</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(2);">Feb</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(3);">Mar</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(4);">Apr</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(5);">May</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(6);">Jun</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(7);">Jul</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(8);">Aug</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(9);">Sep</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(10);">Oct</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(11);">Nov</a></td>
            <td><a class="aButtonSmall" href="javascript:grid(12);">Dec</a></td>
            <td><a class="aButtonSmall" href="javascript:document.getElementById('btnAll').click();">Total Events</a></td>
        </tr>
        <tr style="display:none;">
             <td>
            </td>
            <td><asp:Label ID="lblMonth1" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth2" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth3" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth4" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth5" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth6" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth7" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth8" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth9" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth10" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth11" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblMonth12" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblTotal" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="14" class="small" style="text-align:left;padding-top:2px;">
                <table class="tblItems">
                    <tr>
                        <td><b>Filter Options:</b></td>
                        <td>   
                            <input id="cbAll" type="checkbox" checked="checked" onclick="cbAll_Change()" /><label for="cbAll"> <b>All</b></label>
                        </td> 
                        <td style="text-align:center;">|</td>
                        <td>
                            <asp:CheckBoxList ID="cblFilter" runat="server" 
                                RepeatDirection="Horizontal" 
                                onselectedindexchanged="cblFilter_SelectedIndexChanged" 
                                AutoPostBack="False" Width="180px">
                                <asp:ListItem Selected="True" Value="Main" onclick="cblFilter_Change()"> Main</asp:ListItem>
                                <asp:ListItem Selected="True" Value="Extended" onclick="cblFilter_Change()"> Extended</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        </table>
        </div>


        <table>
        <tr>
            <td>
                <span class="subTitle">Report Search Results:</span> <asp:Label ID="lblAll" runat="server"></asp:Label>
                <a style="display:none;" href="javascript:popUpWin('PopUpWin/Help_ReportsTransaction.aspx',400,600);"><img title="Click for Help" src="../../images/icons/iconHelp.gif" /></a>
            </td>
            <td style="text-align:right;" class="small">
                From                        
                    <telerik:raddatepicker id="rdpDateStart" runat="server" Width="90" Skin="WebBlue">
                      <Calendar Skin="Custom" ShowRowHeaders="False"></Calendar>
                    </telerik:raddatepicker>&nbsp;
                    To:  
                    <telerik:raddatepicker id="rdpDateEnd" runat="server" Width="90" Skin="WebBlue">
                       <Calendar Skin="Custom" ShowRowHeaders="False"></Calendar>
                    </telerik:raddatepicker>&nbsp;
                <a class="aButtonSmall" href="javascript:document.getElementById('btnSubmit').click();">Search</a>&nbsp;&nbsp;
            </td>
        </tr>
        </table>
    <br />
    <center class="Round3"><center><center><center><center><center><center><center><center><center>
        <table class="Round3_tblHeader"><tr><td>Personal Activity Logs</td><td style="text-align:right;"></td></tr></table>       
<table>
<tr>
    <td style="width:100%;">
        <table class="tblItems">
        <tr>
            <td>Number of PAL Entries:</td>
            <td><asp:Label ID="lblNumPal" runat="server" Text="-"></asp:Label></td>
        </tr>
        <tr>
            <td>Avg MET/PAL:</td>
            <td><asp:Label ID="lblAvgMetPal" runat="server" Text="-"></asp:Label></td>
        </tr>
        </table>
    </td>
    <td style="padding-right:10px;">
            <telerik:RadChart ID="RadChart_PAL_Enrties" runat="server" SkinsOverrideStyles="false" Width="300" Height="275" Skin="Classic">
                <ChartTitle Visible="True">
                    <TextBlock Text="Number of PAL Entries:" ></TextBlock>
                </ChartTitle>
                <Series>
                    <telerik:ChartSeries Name="# PAL" Type="Bar">
                        <Appearance FillStyle-FillType="Solid" FillStyle-MainColor="Maroon">
                            <LabelAppearance Visible="True"></LabelAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <Legend Visible="False"></Legend>
                <PlotArea Appearance-Position-Y="300">
                    <XAxis AutoScale="False" MinValue="0" MaxValue="0" Step="1" LabelStep="1" >
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </XAxis>
                    <YAxis AutoScale="True" MinValue="0" MaxValue="5">
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </YAxis>
                </PlotArea>
            </telerik:RadChart>
    </td>
    <td>
            <telerik:RadChart ID="RadChart_PAL_Average_MET" runat="server" SkinsOverrideStyles="false" Width="300" Height="275" Skin="Classic">
                <ChartTitle Visible="True">
                    <TextBlock Text="Avg MET/PAL:"></TextBlock>
                </ChartTitle>
                <Series>
                    <telerik:ChartSeries Name="Avg MET/PAL" Type="Bar">
                        <Appearance FillStyle-FillType="Solid" FillStyle-MainColor="lightsteelblue">
                            <LabelAppearance Visible="True"></LabelAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <Legend Visible="False"></Legend>
                <PlotArea Appearance-Position-Y="300">
                    <XAxis AutoScale="False" MinValue="0" MaxValue="0" Step="1" LabelStep="1" >
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </XAxis>
                    <YAxis AutoScale="True" MinValue="0" MaxValue="5">
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </YAxis>
                </PlotArea>
            </telerik:RadChart>
    </td>
</tr>
</table>
    </center></center></center></center></center></center></center></center></center></center>
    
    <center class="Round3"><center><center><center><center><center><center><center><center><center>
        <table class="Round3_tblHeader"><tr><td>Daily Diary Logs</td><td style="text-align:right;"></td></tr></table>       
<table>
<tr>
    <td>
            <telerik:RadChart ID="RadChart_PAL_Duration" runat="server" Width="400px"  Skin="Classic" DefaultType="Pie">
                <ChartTitle>
                    <TextBlock Text="Duration">
                        <Appearance TextProperties-Font="Verdana, 11.25pt">
                        </Appearance>
                    </TextBlock>
                    <Appearance Corners="Round, Round, Round, Round, 6" Dimensions-Margins="4%, 10px, 14px, 0%"
                        Position-AlignedPosition="Top">
                        <FillStyle GammaCorrection="False" MainColor="224, 224, 224">
                        </FillStyle>
                        <Border Color="DimGray" />
                    </Appearance>
                </ChartTitle>
                <Series>
                    <telerik:ChartSeries Name="Duration" Type="Pie">
                        <Appearance>
                             
                            <FillStyle MainColor="255, 206, 38" SecondColor="255, 247, 221">
                            </FillStyle>
                            <Border Color="DimGray" />
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <Legend Visible="False">
                    <Appearance Visible="False">
                        <ItemTextAppearance TextProperties-Color="DimGray">
                        </ItemTextAppearance>
                        <Border Color="DimGray" />
                    </Appearance>
                </Legend>
                <PlotArea>
                    <XAxis AutoScale="False" MinValue="0" MaxValue="0" Step="1" >
                        <AxisLabel Visible="True">
                            <Appearance Visible="True">
                            </Appearance>
                            <TextBlock Text="">
                                <Appearance TextProperties-Font="Verdana, 9.75pt, style=Bold">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                        <Appearance>
                            <MajorGridLines Color="DimGray" Width="0" />
                        </Appearance>
                        <Items>
                            <telerik:ChartAxisItem>
                            </telerik:ChartAxisItem>
                        </Items>
                    </XAxis>
                    <YAxis>
                        <AxisLabel Visible="True">
                            <Appearance Visible="True">
                            </Appearance>
                            <TextBlock Text="">
                                <Appearance TextProperties-Font="Verdana, 9.75pt, style=Bold">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                        <Appearance>
                            <MajorGridLines Color="DimGray" />
                        </Appearance>
                    </YAxis>
                    <DataTable>
                        <Appearance TextProperties-Font="Verdana, 2pt">
                        </Appearance>
                    </DataTable>
                    <YAxis2>
                        <AxisLabel>
                            <TextBlock>
                                <Appearance TextProperties-Font="Verdana, 9.75pt, style=Bold">
                                </Appearance>
                            </TextBlock>
                        </AxisLabel>
                    </YAxis2>
                    <Appearance Corners="Round, Round, Round, Round, 6">
                        <FillStyle FillType="Solid" MainColor="White">
                        </FillStyle>
                        <Border Color="DimGray" />
                    </Appearance>
                </PlotArea>
            </telerik:RadChart>
    </td>
    <td>
            <telerik:RadChart ID="RadChart_PAL_Intensity" runat="server" SkinsOverrideStyles="false" Width="212" Height="275" Skin="Classic">
                <ChartTitle Visible="True">
                    <TextBlock Text="Intensity"></TextBlock>
                </ChartTitle>
                <Series>
                    <telerik:ChartSeries Name="Intensity" Type="Pie">
                        <Appearance FillStyle-FillType="Solid"  FillStyle-MainColor="Maroon">
                            <LabelAppearance Visible="True"></LabelAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <Legend Visible="False"></Legend>
                <PlotArea>
                    <XAxis AutoScale="False" MinValue="0" MaxValue="0" Step="1" LabelStep="1" >
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </XAxis>
                    <YAxis AutoScale="True">
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </YAxis>
                </PlotArea>
            </telerik:RadChart>
    </td>
</tr>
</table>
<table>
<tr>
     <td>
            <telerik:RadChart ID="RadChart_PAL_Time" runat="server" SkinsOverrideStyles="false" Width="212" Height="275" Skin="Classic">
                <ChartTitle Visible="True">
                    <TextBlock Text="Time"></TextBlock>
                </ChartTitle>
                <Series>
                    <telerik:ChartSeries Name="Time" Type="Pie">
                        <Appearance FillStyle-FillType="Solid"  FillStyle-MainColor="Maroon">
                            <LabelAppearance Visible="True"></LabelAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <Legend Visible="False"></Legend>
                <PlotArea>
                    <XAxis AutoScale="False" MinValue="0" MaxValue="0" Step="1" LabelStep="1" >
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </XAxis>
                    <YAxis AutoScale="True">
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </YAxis>
                </PlotArea>
            </telerik:RadChart>
    </td>
    <td>
            <telerik:RadChart ID="RadChart_PAL_Type" runat="server" SkinsOverrideStyles="false" Width="212" Height="275" Skin="Classic">
                <ChartTitle Visible="True">
                    <TextBlock Text="Activity Type"></TextBlock>
                </ChartTitle>
                <Series>
                    <telerik:ChartSeries Name="Type" Type="Pie">
                        <Appearance FillStyle-FillType="Solid"  FillStyle-MainColor="Maroon">
                            <LabelAppearance Visible="True"></LabelAppearance>
                        </Appearance>
                    </telerik:ChartSeries>
                </Series>
                <Legend Visible="False"></Legend>
                <PlotArea>
                    <XAxis AutoScale="False" MinValue="0" MaxValue="0" Step="1" LabelStep="1" >
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </XAxis>
                    <YAxis AutoScale="True">
                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                    </YAxis>
                </PlotArea>
            </telerik:RadChart>
    </td>
</tr>
</table>


    </center></center></center></center></center></center></center></center></center></center>
        </div>


<telerik:radajaxmanager id="RadAjaxManager1" runat="server"  UpdatePanelsRenderMode="Inline">
        <ClientEvents></ClientEvents>
                <AjaxSettings>
                 
                    <telerik:AjaxSetting AjaxControlID="btnMonth">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblAll" />
                            <telerik:AjaxUpdatedControl ControlID="rdpDateStart" />
                            <telerik:AjaxUpdatedControl ControlID="rdpDateEnd" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Enrties" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Average_MET" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumPal" />
                            <telerik:AjaxUpdatedControl ControlID="lblSumMet" />
                            <telerik:AjaxUpdatedControl ControlID="lblAvgMetPal" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Duration" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Intensity" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Time" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Type" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btnSubmit">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Enrties" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Average_MET" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumPal" />
                            <telerik:AjaxUpdatedControl ControlID="lblSumMet" />
                            <telerik:AjaxUpdatedControl ControlID="lblAvgMetPal" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Duration" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Intensity" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Time" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Type" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btnAll">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="rdpDateStart" />
                            <telerik:AjaxUpdatedControl ControlID="rdpDateEnd" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Enrties" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Average_MET" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumPal" />
                            <telerik:AjaxUpdatedControl ControlID="lblSumMet" />
                            <telerik:AjaxUpdatedControl ControlID="lblAvgMetPal" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Duration" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Intensity" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Time" />
                            <telerik:AjaxUpdatedControl ControlID="RadChart_PAL_Type" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
        </AjaxSettings>
        </telerik:radajaxmanager>
  <span style="visibility:hidden;position:absolute;z-index:-1;top:0px;left:0px;">
        <asp:TextBox ID="txtMonth" runat="server"></asp:TextBox>
        <asp:Button ID="btnMonth" runat="server" OnClick="btnMonth_Click" />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"/>
        <asp:Button ID="btnAll" runat="server" OnClick="btnAll_Click" />
    </span>
        <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
   </asp:Content>