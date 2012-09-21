<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Nutrition_BodyFatCalculator_PopUp.ascx.cs" Inherits="UC_Nutrition_BodyFatCalculator_PopUp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%--<link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
<link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
Above lines are commented by Netsmartz
--%>

<!--"Init();" must be placed for body onload-->
<!--"javascript:addEntry(sDate);" will open the popup-->
<!--"javascript:editEntry(sDate);" will open the popup-->

<script type="text/javascript">
    var cbEditTotals;
    var txtDdEntryID;
    var rdpDdEntryDate;


    var radTxtBField_01;

    function popupBodyFat() {
        show('divBodyFatCalculator');
        //bWaiting = true;  commented by Netsmartz
    }
    function hide(objElementID) {
        document.getElementById(objElementID).style.display = "none";

    }
    function show(objElementID) {
        document.getElementById(objElementID).style.display = "";
    }
</script>
<script runat="server">  

    protected void textLatestWeight_TextChanged(object sender, System.EventArgs e)
    {
        int firstWeight = Convert.ToInt32(textBaselineWeight.Text);
        if (firstWeight > 0)
        {
            int lastWeight = Convert.ToInt32(textLatestWeight.Text);
            textChangeWeight.Text = (firstWeight - lastWeight).ToString();
            textPercentChangeWeight.Text = ((firstWeight - lastWeight)/firstWeight).ToString();
        }
    }
    
    protected void textLatestWaist_TextChanged(object sender, System.EventArgs e)
    {
        int firstWaist = Convert.ToInt32(textBaselineWaist.Text);
        if (firstWaist > 0)
        { 
            int lastWaist = Convert.ToInt32(textLatestWaist.Text);
            textChangeWaist.Text = (firstWaist - lastWaist).ToString();
            textPercentChangeWaist.Text = ((firstWaist - lastWaist)/firstWaist).ToString();
        }
    }            

    protected void textLatestNeck_TextChanged(object sender, System.EventArgs e)
    {
        int firstNeck = Convert.ToInt32(textBaselineNeck.Text);
        if (firstNeck > 0)
        {
            int lastNeck = Convert.ToInt32(textLatestNeck.Text);
            textChangeNeck.Text = (firstNeck - lastNeck).ToString();
            textPercentChangeNeck.Text = ((firstNeck - lastNeck) / firstNeck).ToString();
        }
    }

    protected void textLatestHips_TextChanged(object sender, System.EventArgs e)   
    {
        int firstHips = Convert.ToInt32(textBaselineHips.Text);
        if (firstHips > 0)
        {
            int lastHips = Convert.ToInt32(textLatestHips.Text);
            textChangeHips.Text = (firstHips - lastHips).ToString();
            textPercentChangeHips.Text = ((firstHips - lastHips)/firstHips).ToString();
        }
    }                
    
</script>  


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<!--Transparency-->
<script type="text/javascript">
    function hoverTransparency2(sElementName) {
        var obj = document.getElementById(sElementName);

        obj.onmouseover = function () { this.className = ""; }
        obj.onmouseout = function () { this.className = "transparent"; }
        obj.onmouseenter = function () { this.onmouseover = null; this.onmouseout = null; this.className = ""; }
        obj.onmouseleave = function () { this.className = "transparent"; }

    }

    function submitCalorie() {
       // document.getElementById(' < % = btn Calorie Submit.ClientID %   >').click();
        hide('divBodyFatCalculator');
    }

    function WeightChanged() {

    }
    
    function WaistChanged() {

    }
    
    function NeckChanged() {

    }

    function HipsChanged() {

    }
</script>

<style type="text/css">

    td 
    {
        padding-left:10px; 
        padding-bottom: 5px;   
        border:none;
    }


    #divBodyFatCalculatorOutside 
    {
        background-color:#992E24;
        width:570px;
        height:385px;
        padding:20px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
        
    }
    
    #divBodyFatCalculatorTop 
    {
        background-color:#F9D4A8;
        width:100%;
        height:130px;
        margin-bottom:20px;
        padding-top:10px;
        padding-bottom:10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }
    
   #divBodyFatCalculatorBottom 
    {
        background-color:#F9D4A8;
        width:100%;
        height:195px;
        padding-top:10px;
        padding-bottom:10px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;
    }
    
    hr 
    {
        height:3px;
        color:#000;
        background-color: #000;   
    }
    
    .aButtonSmall
    {
      display:inline-table;
      padding:2px 5px 2px 5px;
      border:none;
      text-align:center;
      color:#ffffff;
      text-decoration:none;
      vertical-align:middle;
      line-height:27px;
      font-weight:bold;
      font-size:12px;
      background-color:#1581AE;
    }
    
    .instructions
    {
        display:none;
        color:#fff;
        background-color:Navy;   
        width: 700px ;
        margin-left: auto ;
        margin-right: auto ;   
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        -khtml-border-radius: 10px;
        border-radius: 10px;   
    }
    
    .modalBackground
    {
        background-color: Black;
        opacity: 0.8;
    }

    .modalPopup
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 300px;
        height: 300px;
    }
        
</style>
       </telerik:RadScriptBlock>      

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="panelMeasuring" TargetControlID="hyperMeasuring" CancelControlID="btnClose1" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelMeasuring" runat="server" CssClass="modalPopup" >
    <h2>Measuring Instructions</h2>
    <p>
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
        enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
        nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
        in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
        luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
    </p>
    <asp:Button ID="btnClose1" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="panelTipsForMen" TargetControlID="hyperTipsForMen" CancelControlID="btnClose2" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelTipsForMen" runat="server" CssClass="modalPopup" >
    <h2>Tips For Men</h2>
    <p>
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
        enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
        nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
        in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
        luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
    </p>
    <asp:Button ID="btnClose2" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="panelTipsForWomen" TargetControlID="hyperTipsForWomen" CancelControlID="btnClose3" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelTipsForWomen" runat="server" CssClass="modalPopup" >
    <h2>Tips For Women</h2>
    <p>
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
        nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
        enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
        nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
        in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
        facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
        luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
    </p>
    <asp:Button ID="btnClose3" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" PopupControlID="panelWeightInstructions" TargetControlID="WeightInstructions" CancelControlID="btnClose4" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelWeightInstructions" runat="server" CssClass="modalPopup" >
            <h2>Measuring Weight</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
                enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
                nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
                in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
                facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
                luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
            </p>
    <asp:Button ID="btnClose4" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="ModalPopupExtender4" runat="server" PopupControlID="panelWaistInstructions" TargetControlID="WaistInstructions" CancelControlID="btnClose5" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelWaistInstructions" runat="server" CssClass="modalPopup" >
            <h2>Measuring Waist</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
                enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
                nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
                in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
                facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
                luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
            </p>
    <asp:Button ID="btnClose5" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="ModalPopupExtender5" runat="server" PopupControlID="panelNeckInstructions" TargetControlID="NeckInstructions" CancelControlID="btnClose6" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelNeckInstructions" runat="server" CssClass="modalPopup" >
            <h2>Measuring Neck</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
                enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
                nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
                in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
                facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
                luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
            </p>
    <asp:Button ID="btnClose6" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->

<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="ModalPopupExtender6" runat="server" PopupControlID="panelHipsInstructions" TargetControlID="HipsInstructions" CancelControlID="btnClose7" BackgroundCssClass="modalBackground"></cc1:ModalPopupExtender>
<asp:Panel ID="panelHipsInstructions" runat="server" CssClass="modalPopup" >
            <h2>Measuring Hips</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy 
                nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi 
                enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis 
                nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit 
                in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla 
                facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
                luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
            </p>
    <asp:Button ID="btnClose7" Height="30" Width="60" runat="server" Text="Close" />
</asp:Panel>
<!-- ModalPopupExtender -->
         <div id="divBodyFatCalculator" class="fixed" style="display:none;z-index:333;">

            <div id="divBodyFatCalculatorOutside" >

                <div id="divBodyFatCalculatorTop">
                <asp:HiddenField ID="hiddenPersonalSummaryId" runat="server" />
                    <table>
                        <tr>
                            <td>
                                 <asp:HyperLink ID="hyperMeasuring" runat="server" >
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/nutrition/measuring.png" />
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="Measuring"></asp:Label>
                                </asp:HyperLink>                          
                            </td>
                            <td>
                                <asp:HyperLink ID="hyperTipsForMen" runat="server" >
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/nutrition/tipsmen.png" />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text="Tips For Men"></asp:Label>
                                </asp:HyperLink>                            
                            </td>
                            <td>
                                <asp:HyperLink ID="hyperTipsForWomen" runat="server" >
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/nutrition/tipswomen.png" />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text="Tips For Women"></asp:Label>
                                </asp:HyperLink>                            
                            </td>
                            <td>
                                <p>Entry Date: </p>
                                <asp:TextBox ID="textEntryDate" runat="server" MaxLength="15" Columns="10"></asp:TextBox>
                                <img alt="" src="<%=AppConfig.GetBaseSiteUrl() %>images/Calendar.png" id="imgEntryDate" />
                                <cc1:CalendarExtender ID="calExtJournalDate" TargetControlID="textEntryDate" PopupButtonID="imgEntryDate" Format="yyyy-MM-dd" runat="server"></cc1:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="textEntryDate" Display="Dynamic" ValidationGroup="Step5" ID="RequiredFieldValidator2" ErrorMessage="Please Enter Date." CssClass="required"></asp:RequiredFieldValidator>  
                            </td>
                        </tr>
                    </table>
                </div><!-- end divBodyFatCalculatorTop -->
                
                <div id="divBodyFatCalculatorBottom" >
                    <table>
                        <tr>
                            <th>Measurement</th>
                            <th>Baseline</th>
                            <th>Latest</th>
                            <th>Change</th>
                            <th>% Change</th>
                        </tr>
                        <tr>
                            <td colspan="5"><hr /></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="WeightInstructions" runat="server" >Weight (lbs)</asp:HyperLink></td>
                            <td><asp:TextBox ID="textBaselineWeight" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textLatestWeight" Columns="5" runat="server" OnTextChanged="textLatestWeight_TextChanged" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textChangeWeight" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textPercentChangeWeight" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="WaistInstructions" runat="server" >Waist (inches)</asp:HyperLink></td>
                            <td><asp:TextBox ID="textBaselineWaist" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textLatestWaist" Columns="5" runat="server" OnTextChanged="textLatestWaist_TextChanged" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textChangeWaist" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textPercentChangeWaist" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="NeckInstructions" runat="server" >Neck (inches)</asp:HyperLink></td>
                            <td><asp:TextBox ID="textBaselineNeck" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textLatestNeck" Columns="5" runat="server" OnTextChanged="textLatestNeck_TextChanged" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textChangeNeck" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textPercentChangeNeck" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:HyperLink ID="HipsInstructions" runat="server" >Hips (inches)</asp:HyperLink></td>
                            <td><asp:TextBox ID="textBaselineHips" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textLatestHips" Columns="5" runat="server" OnTextChanged="textLatestHips_TextChanged" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textChangeHips" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                            <td><asp:TextBox ID="textPercentChangeHips" Columns="5" ReadOnly="true" runat="server" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="5" align="right">
                                <asp:LinkButton  CssClass="aButtonSmall" ID="buttonSave" runat="server" OnClick="btnSave_Click" Text="Save"></asp:LinkButton>
                                <a class="aButtonSmall" id="A1" onclick="hide('divBodyFatCalculator')" >Close</a>
                            </td>
                        </tr>                                                                                           
                    </table>
                </div><!-- end divBodyFatCalculatorBottom -->

            </div><!-- divBodyFatCalculatorOutside -->

        </div><!-- end divBodyFatCalculator -->

<script type="text/javascript">

    var myWidth;
    var myHeight;
    var calcheight = 570;
    var calcWidth = 385;
    // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
    if (typeof window.innerWidth != 'undefined') {
        myWidth = window.innerWidth;
        myHeight = window.innerHeight;
    }
    // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)  
    else if (typeof document.documentElement != 'undefined' && typeof document.documentElement.clientWidth != 'undefined' && document.documentElement.clientWidth != 0) {
        myWidth = document.documentElement.clientWidth;
        myHeight = document.documentElement.clientHeight;
    }
    // older versions of IE   
    else {
        myWidth = document.getElementsByTagName('body')[0].clientWidth;
        myHeight = document.getElementsByTagName('body')[0].clientHeight;
    }

    var calcTop = (myHeight - calcheight) / 2;
    var calcLeft = (myWidth - calcWidth) / 2;
    document.getElementById("divBodyFatCalculator").style.top = calcTop + 'px';
    document.getElementById("divBodyFatCalculator").style.left = calcLeft + 'px';

</script>