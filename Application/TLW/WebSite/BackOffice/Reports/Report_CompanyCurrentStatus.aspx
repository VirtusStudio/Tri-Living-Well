<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report_CompanyCurrentStatus.aspx.cs"
  MasterPageFile="~/MasterPages/BackOffice.master"  Inherits="Report_CompanyCurrentStatus" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

<script type="text/javascript">
    function grid(iMonthIndex) {
        document.getElementById('txtMonth').value = iMonthIndex;
        document.getElementById('btnMonth').click();
    }
    function cbAll_Change() {
        var bCheck = false; //defaultly uncheck all
        if (document.getElementById('cbAll').checked) {//select all other checkboxes
            bCheck = true;
        }

        var cbl = document.getElementById('cblFilter');
        var arrayOfCheckBoxes = cbl.getElementsByTagName("input");
        for (var i = 0; i < arrayOfCheckBoxes.length; i++) {
            arrayOfCheckBoxes[i].checked = bCheck;
        }
    }
    function cblFilter_Change() {
        document.getElementById('cbAll').checked = false;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<table><tr>
            <td align="left">
             <br />
            </td>
        </tr>
        </table>
     <div class="title" style="text-align:left;"> 
        Company Current Status
    </div>
     <div class="description">
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
            <td style="width:50%;">
                <span class="subTitle">Report Search Results:</span> <asp:Label ID="lblAll" runat="server"></asp:Label>
                <a style="display:none;" href="javascript:top.popUpWin('../../PopUpWin/Help_ReportsTransaction.aspx',400,600);">
                <img alt="" title="Click for Help"  border="0"
                src="../../images/icons/iconHelp.gif" />
                </a>
            </td>
            <td style="text-align:right; vertical-align:middle;" clsss="small">
            <table>
                <tr>
                    <td style="vertical-align:top; padding-top:4px;">            
                        From:                       
                    </td>
                    <td>
                        <telerik:raddatepicker id="rdpDateStart" runat="server" Width="90" Skin="WebBlue">
                          <Calendar Skin="Custom" ShowRowHeaders="False"></Calendar>
                        </telerik:raddatepicker>&nbsp;
                    </td>
                    <td style="vertical-align:top; padding-top:4px; padding-left:5px;">
                        To:  
                    </td>
                    <td>
                        <telerik:raddatepicker id="rdpDateEnd" runat="server" Width="90" Skin="WebBlue">
                           <Calendar Skin="Custom" ShowRowHeaders="False"></Calendar>
                        </telerik:raddatepicker>&nbsp;
                    </td>
                    <td>
                        <a class="aButtonSmall" href="javascript:document.getElementById('btnSubmit').click();">Search</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            
            
            

            </td>
        </tr>
        </table>
        
        <table class="tblItems">
        <tr>
            <td>Participants</td>
            <td>Registered</td>
            <td>Unregistered</td>
        </tr>
        <tr>
            <td>Main</td>
            <td><asp:Label ID="lblNumParticipantsMainRegistered" runat="server" Text="-"></asp:Label></td>
            <td><asp:Label ID="lblNumParticipantsMainUnregistered" runat="server"  Text="-"></asp:Label></td>
        </tr>
         <tr>
            <td>Extended</td>
            <td><asp:Label ID="lblNumParticipantsExtendedRegistered" runat="server" Text="-"></asp:Label></td>
            <td><asp:Label ID="lblNumParticipantsExtendedUnregistered" runat="server"  Text="-"></asp:Label></td>
        </tr>
        </table>
        
        <br />
        <center class="Round3"><center><center><center><center><center><center><center><center><center>
        <table class="Round3_tblHeader"><tr><td>Current Program Stages</td><td style="text-align:right;"></td></tr></table>      
<div  style=" padding-top:5px;border:solid 0px #CCCCCC;">



     <div id="divGrid" style="padding:5px; border:solid 1px #cccccc">
        <telerik:RadGrid AllowSorting="true" EnableEmbeddedSkins="False" id="RadGrid1" runat="server" 
                     BorderWidth="0px" AutoGenerateColumns="False" GridLines="None" 
                     onsortcommand="RadGrid1_SortCommand" OnItemDataBound="RadGrid1_ItemDataBound">
            <mastertableview NoMasterRecordsText="No results match the search criteria." ShowFooter="True">
                <Columns>    
                    <telerik:GridBoundColumn Visible="False" DataField="PROGRAM_ID" UniqueName="PROGRAM_ID"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="LEVEL_ID" UniqueName="LEVEL_ID"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="LEVEL_ID" UniqueName="LEVEL_ID"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_1" UniqueName="STEP_1"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_2" UniqueName="STEP_2"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_3" UniqueName="STEP_3"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_4" UniqueName="STEP_4"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_5" UniqueName="STEP_5"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_6" UniqueName="STEP_6"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_7" UniqueName="STEP_7"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_8" UniqueName="STEP_8"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_9" UniqueName="STEP_9"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_10" UniqueName="STEP_10"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_11" UniqueName="STEP_11"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_12" UniqueName="STEP_12"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="STEP_13" UniqueName="STEP_13"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn Visible="False" DataField="Completion" UniqueName="Completion"></telerik:GridBoundColumn>
                    
                    <telerik:GridBoundColumn DataField="PROGRAM_NAME" UniqueName="PROGRAM_NAME" HeaderText="Program" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Level" SortExpression="LEVEL_ID" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# (DataBinder.Eval(Container.DataItem, "LEVEL_ID").ToString() == "1") ? "Tri" : ""%>
                            <%# (DataBinder.Eval(Container.DataItem, "LEVEL_ID").ToString() == "2") ? "Living" : ""%>
                            <%# (DataBinder.Eval(Container.DataItem, "LEVEL_ID").ToString() == "3") ? "Well" : ""%>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    
                    <telerik:GridTemplateColumn HeaderText="1" SortExpression="STEP_1" UniqueName="tcStep1" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_1").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_1").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="2" SortExpression="STEP_2" UniqueName="tcStep2" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_2").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_2").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="3" SortExpression="STEP_3" UniqueName="tcStep3" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_3").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_3").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="4" SortExpression="STEP_4" UniqueName="tcStep4" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_4").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_4").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="5" SortExpression="STEP_5" UniqueName="tcStep5" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_5").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_5").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="6" SortExpression="STEP_6" UniqueName="tcStep6" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_6").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_6").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="7" SortExpression="STEP_7" UniqueName="tcStep7" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_7").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_7").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="8" SortExpression="STEP_8" UniqueName="tcStep8" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_8").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_8").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="9" SortExpression="STEP_9" UniqueName="tcStep9" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_9").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_9").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="10" SortExpression="STEP_10" UniqueName="tcStep10" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_10").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_10").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="11" SortExpression="STEP_11" UniqueName="tcStep11" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_11").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_11").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="12" SortExpression="STEP_12" UniqueName="tcStep12" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_12").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_12").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="13" SortExpression="STEP_13" UniqueName="tcStep13" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "STEP_13").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "STEP_13").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderText="Completion" SortExpression="Completion" UniqueName="tcCompletion" ItemStyle-HorizontalAlign="Center"><ItemTemplate>
                            <span class="<%# (DataBinder.Eval(Container.DataItem, "Completion").ToString() == "0") ? "empty" : ""%>">
                                <%# DataBinder.Eval(Container.DataItem, "Completion").ToString()%>
                            </span>
                    </ItemTemplate></telerik:GridTemplateColumn>
                   
                </Columns>
                <HeaderStyle CssClass="gridHeaderWrap" HorizontalAlign="Center"  />                  
                <AlternatingItemStyle CssClass="gridAltItem" />
                <ItemStyle CssClass="gridAltItem" />
                <FooterStyle CssClass="gridAltItem" />
            </mastertableview>
        </telerik:RadGrid> 
</div>
</div>
        </center></center></center></center></center></center></center></center></center></center>
</div>
<telerik:radajaxmanager id="RadAjaxManager1" runat="server" ClientEvents-OnResponseEnd="top.setIframeHeight_NoTopScroll()" UpdatePanelsRenderMode="Inline">
        <ClientEvents OnResponseEnd="top.setIframeHeight_NoTopScroll()"></ClientEvents>
                <AjaxSettings>
                 
                    <telerik:AjaxSetting AjaxControlID="btnMonth">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="lblAll" />
                            <telerik:AjaxUpdatedControl ControlID="rdpDateStart" />
                            <telerik:AjaxUpdatedControl ControlID="rdpDateEnd" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsMainRegistered" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsMainUnregistered" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsExtendedRegistered" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsExtendedUnregistered" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btnSubmit">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsMainRegistered" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsMainUnregistered" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsExtendedRegistered" />
                            <telerik:AjaxUpdatedControl ControlID="lblNumParticipantsExtendedUnregistered" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btnAll">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="rdpDateStart" />
                            <telerik:AjaxUpdatedControl ControlID="rdpDateEnd" />
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
        </AjaxSettings>
        </telerik:radajaxmanager>
  <span style="visibility:hidden;">
  <br />
        <asp:TextBox ID="txtMonth" runat="server"></asp:TextBox>
        <asp:Button ID="btnMonth" runat="server" OnClick="btnMonth_Click" />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"/>
        <asp:Button ID="btnAll" runat="server" OnClick="btnAll_Click" />
      <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </span>
  </asp:Content>