<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Chart_RecentEntries.ascx.cs" Inherits="UC_Home_2_Control" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">

<script type="text/javascript">

function updateChart()
{
    document.getElementById('<%= btnUpdateChart.ClientID %>').click();             
}

function ChartViewAvailibility()
{
    if(document.getElementById('<%= rbDays1Month.ClientID %>').checked == true || document.getElementById('<%= rbViewWeekly.ClientID %>').checked == true)
    {
        if(document.getElementById('<%= rbViewDaily.ClientID %>').checked == true)
        {
            document.getElementById('<%= rbViewWeekly.ClientID %>').checked = true;
        }   
        document.getElementById('<%= rbViewDaily.ClientID %>').checked = true;
        
        document.getElementById('<%= rbViewDaily.ClientID %>').disabled = false;
        document.getElementById('<%= rbViewWeekly.ClientID %>').disabled = true;
        document.getElementById('<%= rbViewMonthly.ClientID %>').disabled = true;
    }
    if(document.getElementById('<%= rbDays3Month.ClientID %>').checked == true)
    {
        if(document.getElementById('<%= rbViewDaily.ClientID %>').checked == true)
        {
            document.getElementById('<%= rbViewWeekly.ClientID %>').checked = true;
        }   
        document.getElementById('<%= rbViewDaily.ClientID %>').disabled = true;
        document.getElementById('<%= rbViewWeekly.ClientID %>').disabled = false;
        document.getElementById('<%= rbViewMonthly.ClientID %>').disabled = false;
    }
    if(document.getElementById('<%= rbDays6Month.ClientID %>').checked == true)
    {
        if(document.getElementById('<%= rbViewDaily.ClientID %>').checked == true || document.getElementById('<%= rbViewWeekly.ClientID %>').checked == true)
        {
        document.getElementById('<%= rbViewMonthly.ClientID %>').checked = true;
        } 
    
        document.getElementById('<%= rbViewDaily.ClientID %>').disabled = true;
        document.getElementById('<%= rbViewWeekly.ClientID %>').disabled = true;
        document.getElementById('<%= rbViewMonthly.ClientID %>').disabled = false;
    }
}



</script>
</telerik:RadScriptBlock>

<div id="divProgram" runat="server">
                 <telerik:RadChart ID="RadChart1" runat="server" SkinsOverrideStyles="true" Width="490" Height="270" Skin="Classic">
                                                <ChartTitle Visible="False">
                                                    <TextBlock Text="Recent Logged Information"></TextBlock>
                                                </ChartTitle>
                                                <Series>
                                                    <telerik:ChartSeries Name="BMI" Type="Line">
                                                        <Appearance>
                                                            <LabelAppearance Visible="False"></LabelAppearance>
                                                        </Appearance>
                                                    </telerik:ChartSeries>
                                                    <telerik:ChartSeries Name="Sleep" Type="Line">
                                                        <Appearance>
                                                            <LabelAppearance Visible="False"></LabelAppearance>
                                                        </Appearance>
                                                    </telerik:ChartSeries>
                                                    <telerik:ChartSeries Name="Stress" Type="Line">
                                                        <Appearance>
                                                            <LabelAppearance Visible="False"></LabelAppearance>
                                                        </Appearance>
                                                    </telerik:ChartSeries>
                                                    <telerik:ChartSeries Name="MET" Type="Line" >
                                                        <Appearance>
                                                            <LabelAppearance Visible="False"></LabelAppearance>
                                                        </Appearance>
                                                    </telerik:ChartSeries>
                                                </Series>
                                                <Legend Visible="True"></Legend>
                                                <PlotArea Appearance-Position-Y="300" >
                                                    <XAxis AutoScale="False" MinValue="0" MaxValue="10" Step="1" LabelStep="14">
                                                        <Appearance><MajorGridLines Color="red" PenStyle="solid" Width="3"/></Appearance>
                                                        <AxisLabel Visible="True" TextBlock-Text=""></AxisLabel>
                                                    </XAxis>
                                                    <YAxis AutoScale="False" MinValue="0" MaxValue="5">
                                                        <AxisLabel Visible="True" TextBlock-Text="BMI(%)" ></AxisLabel>
                                                    </YAxis>
                                                    <YAxis2 AutoScale="False" MinValue="0" MaxValue="5" Visible="True">
                                                        <AxisLabel Visible="False" TextBlock-Text="Sleep/Stress Levels"></AxisLabel>
                                                    </YAxis2>
                                                </PlotArea>
                                            </telerik:RadChart>
                                            <table class="tblItems">
                                                <tr>
                                                    <td>
                                                        Include Fields:
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbBMI" runat="server" Text="BMI" Checked="true" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbSleep" runat="server" Text="Sleep" Checked="true" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbStress" runat="server" Text="Stress" Checked="true" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbMET" runat="server" Text="MET" Checked="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Time frame:
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartDays" runat="server" ID="rbDays1Month" OnClick="ChartViewAvailibility();" Text="1 Month" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartDays" runat="server" ID="rbDays3Month" OnClick="ChartViewAvailibility();"  Text="3 Months" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartDays" runat="server" ID="rbDays6Month" OnClick="ChartViewAvailibility();" Text="6 Months" Checked="true" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Average View:
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartView" runat="server" ID="rbViewDaily" Text="Daily"  />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartView" runat="server" ID="rbViewWeekly" Text="Weekly" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartView" runat="server" ID="rbViewMonthly" Text="Monthly" Checked="true"  />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Graph View:
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartType" runat="server" ID="rbTypeLine" Text="Line" Checked="true"  />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartType" runat="server" ID="rbTypeBar" Text="Bar" />
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton GroupName="rbgChartType" runat="server" ID="rbTypePoint" Text="Point" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table><div style="padding-top:5px;">
                                                        <a href="javascript:updateChart();" class="aButtonSmall">Update Chart</a>
                                                    </div>
                                                    <div style=" display:none;">
                                                        <asp:Button ID="btnUpdateChart" runat="server" Text="Update Chart" CssClass="aButtonSmall" OnClick="btnUpdateChart_Click" />
                                                    </div>
                   
    

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

<script type="text/javascript">
//this function needs to be called after radio buttons are displayed.
    ChartViewAvailibility();
</script>


</div>