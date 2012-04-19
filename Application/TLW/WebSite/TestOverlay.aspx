<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/TLWSite.master" AutoEventWireup="true" CodeFile="TestOverlay.aspx.cs" Inherits="TestOverlay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popupOpen(path, x, y) {
            var sURL = path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:Button ID="lnkBtnRecordActivity" Text="Display" runat="server" />
   
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" style="display:none;border-width:2px;border-color:Black; border-style:outset;" ScrollBars="Auto" Width="800" Height="600" Wrap="true" BackColor="#97A8B9" Direction="LeftToRight">
    <div style="position:absolute;">
        <h2 style="position:absolute;top:-10px;left:5px;width:300px;">Record Physical Activity</h2>
        <asp:Label ID="labelOverview" />

        <div style="position:absolute;top:20px;left:20px;width:300px;">
            <h3>Your Weekly Cumulative</h3>    
            <p>Duration:<asp:Label id="textWeeklyDuration" runat="server" /></p>
            <p>MET Minutes:<asp:Label id="textWeeklyMetMinutes" runat="server" /></p>
            <p>Calories:<asp:Label id="textWeeklyCalories" runat="server" /></p>
        </div>
        <div style="position:absolute;top:20px;left:400px;width:300px;">
            <h3>Your Total Cumulative</h3>
            <p>Duration:<asp:Label id="textTotalDuration" runat="server" /></p>
            <p>MET Minutes:<asp:Label id="textTotalMinutes" runat="server" /></p>
            <p>Calories:<asp:Label id="textTotalCalories" runat="server" /></p>
        </div>
        <hr style="position:absolute;top:140px;left:20px;width:760px;" /> 
 
        <div style="position:absolute;top:150px;left:20px;width:300px;">  

            <p>
            Cycling:<br />
            <asp:DropDownList ID="ddlCycling" runat="server" Width="290" >
            <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>
            <asp:ListItem Value="bicycling, general" Text="bicycling, general"></asp:ListItem>
            <asp:ListItem Value="bicycling 10 mph, leisure, to work or for pleasure" Text="bicycling 10 mph, leisure, to work or for pleasure"></asp:ListItem>
            <asp:ListItem Value="bicycling 10-11.9 mph, leisure, slow, light effort" Text="bicycling 10-11.9 mph, leisure, slow, light effort"></asp:ListItem>
            <asp:ListItem Value="bicycling 12-13.9 mph, leisure, moderate effort" Text="bicycling 12-13.9 mph, leisure, moderate effort"></asp:ListItem>
            <asp:ListItem Value="bicycling 14-15.9 mph, racing or leisure, fast, vigorous effort" Text="bicycling 14-15.9 mph, racing or leisure, fast, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="bicycling 16-19 mph, racing/not drafting or > 19 mph, very fast, racing general" Text="bicycling 16-19 mph, racing/not drafting or > 19 mph, very fast, racing general"></asp:ListItem>
            <asp:ListItem Value="bicycling > 20 mph, racing, not drafting" Text="bicycling > 20 mph, racing, not drafting"></asp:ListItem>
            <asp:ListItem Value="bicycling, BMX or mountain" Text="bicycling, BMX or mountain"></asp:ListItem>
            </asp:DropDownList>
            </p>
            <p>
            Running:<br />
            <asp:DropDownList ID="ddlRunning" runat="server" Width="290" >
            <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>
            <asp:ListItem Value="jogging, general" Text="jogging, general"></asp:ListItem>
            <asp:ListItem Value="running 5 mph (12 minute mile)" Text="running 5 mph (12 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 5.2 mph (11.5 minute mile)" Text="running 5.2 mph (11.5 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 6 mph (10 minute mile)" Text="running 6 mph (10 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 6.7 mph (9 minute mile)" Text="running 6.7 mph (9 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 7 mph (8.5 minute mile)" Text="running 7 mph (8.5 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 7.5 mph (8 minute mile)" Text="running 7.5 mph (8 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 8 mph (7.5 minute mile)" Text="running 8 mph (7.5 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 8.6 mph (7 minute mile)" Text="running 8.6 mph (7 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 9 mph (6.5 minute mile)" Text="running 9 mph (6.5 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 10 mph (6 minute mile)" Text="running 10 mph (6 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running 10.9 mph (5.5 minute mile)" Text="running 10.9 mph (5.5 minute mile)"></asp:ListItem>
            <asp:ListItem Value="running cross country" Text="running cross country"></asp:ListItem>
            <asp:ListItem Value="running, general" Text="running, general"></asp:ListItem>
            </asp:DropDownList>
            </p>
            <p>
            Swimming:<br />
            <asp:DropDownList ID="ddlSwimming" runat="server" Width="290" >
            <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>
            <asp:ListItem Value="swimming laps freestyle, slow, moderate or light effort" Text="swimming laps freestyle, slow, moderate or light effort"></asp:ListItem>
            <asp:ListItem Value="swimming laps freestyle, fast, vigorous effort" Text="swimming laps freestyle, fast, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="swimming crawl, slow (50 yds/min), moderate or light effort" Text="swimming crawl, slow (50 yds/min), moderate or light effort"></asp:ListItem>
            <asp:ListItem Value="swimming crawl, fast (75 yds/min), vigorous effort" Text="swimming crawl, fast (75 yds/min), vigorous effort"></asp:ListItem>
            <asp:ListItem Value="swimming backstroke, general" Text="swimming backstroke, general"></asp:ListItem>
            <asp:ListItem Value="swimming sidestroke, general" Text="swimming sidestroke, general"></asp:ListItem>
            <asp:ListItem Value="swimming breaststroke, general" Text="swimming breaststroke, general"></asp:ListItem>
            <asp:ListItem Value="swimming butterfly, general" Text="swimming butterfly, general"></asp:ListItem>
            <asp:ListItem Value="swimming lake, ocean, river" Text="swimming lake, ocean, river"></asp:ListItem>
            <asp:ListItem Value="swimming , leisurely, not lap swimming, general" Text="swimming , leisurely, not lap swimming, general"></asp:ListItem>
            <asp:ListItem Value="swimming, synchronized" Text="swimming, synchronized"></asp:ListItem>
            </asp:DropDownList>
            </p>
            <p>
            ConditioningExercises:<br />
            <asp:DropDownList ID="ddlConditioningExercises" runat="server" Width="290" >
            <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>
            <asp:ListItem Value="aerobic, general" Text="aerobic, general"></asp:ListItem>
            <asp:ListItem Value="aerobic dancing, low impact" Text="aerobic dancing, low impact"></asp:ListItem>
            <asp:ListItem Value="aerobic dancing, high impact" Text="aerobic dancing, high impact"></asp:ListItem>
            <asp:ListItem Value="aerobic step w/6-8 inch step" Text="aerobic step w/6-8 inch step"></asp:ListItem>
            <asp:ListItem Value="aerobic step w/10-12 inch step" Text="aerobic step w/10-12 inch step"></asp:ListItem>
            <asp:ListItem Value="teaching aerobic exercise class" Text="teaching aerobic exercise class"></asp:ListItem>
            <asp:ListItem Value="dancing, general (Greek, Middle Eastern, hula, flamenco, belly, swing dancing, Irish step, polka, contra, country, line dancing)" Text="dancing, general (Greek, Middle Eastern, hula, flamenco, belly, swing dancing, Irish step, polka, contra, country, line dancing)"></asp:ListItem>
            <asp:ListItem Value="bicycling stationary, general" Text="bicycling stationary, general"></asp:ListItem>
            <asp:ListItem Value="bicycling stationary, 50 watts, very light effort" Text="bicycling stationary, 50 watts, very light effort"></asp:ListItem>
            <asp:ListItem Value="bicycling stationary, 100 watts, light effort" Text="bicycling stationary, 100 watts, light effort"></asp:ListItem>
            <asp:ListItem Value="bicycling stationary, 150 watts, moderate effort" Text="bicycling stationary, 150 watts, moderate effort"></asp:ListItem>
            <asp:ListItem Value="bicycling stationary, 200 watts, vigorous effort" Text="bicycling stationary, 200 watts, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="bicycling stationary, 250 watts, very vigorous effort" Text="bicycling stationary, 250 watts, very vigorous effort"></asp:ListItem>
            <asp:ListItem Value="calisthenics (push-ups, sit-ups, pull-ups, jumping jacks), vigorous effort" Text="calisthenics (push-ups, sit-ups, pull-ups, jumping jacks), vigorous effort"></asp:ListItem>
            <asp:ListItem Value="calisthenics, home exercise, light or moderate effort, general" Text="calisthenics, home exercise, light or moderate effort, general"></asp:ListItem>
            <asp:ListItem Value="circuit training, including some aerobic movement with minimal rest, general" Text="circuit training, including some aerobic movement with minimal rest, general"></asp:ListItem>
            <asp:ListItem Value="weight lifting (free weight, nautilus or universal type), power lifting or body building, vigorous effort" Text="weight lifting (free weight, nautilus or universal type), power lifting or body building, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="weight lifting (free weight, nautilus or universal type), light or moderate effort, light workout, general" Text="weight lifting (free weight, nautilus or universal type), light or moderate effort, light workout, general"></asp:ListItem>
            <asp:ListItem Value="health club exercise, general" Text="health club exercise, general"></asp:ListItem>
            <asp:ListItem Value="rowing, stationary ergometer, general" Text="rowing, stationary ergometer, general"></asp:ListItem>
            <asp:ListItem Value="rowing stationary, 50 watts, light effort" Text="rowing stationary, 50 watts, light effort"></asp:ListItem>
            <asp:ListItem Value="rowing stationary, 100 watts, moderate effort" Text="rowing stationary, 100 watts, moderate effort"></asp:ListItem>
            <asp:ListItem Value="rowing stationary, 150 watts, vigorous effort" Text="rowing stationary, 150 watts, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="rowing stationary, 200 watts, very vigorous effort" Text="rowing stationary, 200 watts, very vigorous effort"></asp:ListItem>
            <asp:ListItem Value="stair-treadmill ergometer, general" Text="stair-treadmill ergometer, general"></asp:ListItem>
            <asp:ListItem Value="ski machine, general" Text="ski machine, general"></asp:ListItem>
            <asp:ListItem Value="slimnastics, jazzercise" Text="slimnastics, jazzercise"></asp:ListItem>
            <asp:ListItem Value="stretching, hatha yoga" Text="stretching, hatha yoga"></asp:ListItem>
            <asp:ListItem Value="mild stretching" Text="mild stretching"></asp:ListItem>
            <asp:ListItem Value="water aerobics, water calisthenics" Text="water aerobics, water calisthenics"></asp:ListItem>
            </asp:DropDownList>
            </p>
            <p>
            Sports:<br />
            <asp:DropDownList ID="ddlSports" runat="server" Width="290" >
            <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>			
            <asp:ListItem Value="basketball game" Text="basketball game"></asp:ListItem>
            <asp:ListItem Value="basketball, non-game, general" Text="basketball, non-game, general"></asp:ListItem>
            <asp:ListItem Value="boxing, in ring, general" Text="boxing, in ring, general"></asp:ListItem>
            <asp:ListItem Value="boxing, punching bag" Text="boxing, punching bag"></asp:ListItem>
            <asp:ListItem Value="boxing, sparring" Text="boxing, sparring"></asp:ListItem>
            <asp:ListItem Value="canoeing, rowing, 2.0 – 3.9 mph, light effort" Text="canoeing, rowing, 2.0 – 3.9 mph, light effort"></asp:ListItem>
            <asp:ListItem Value="canoeing, rowing, 4.0 -  5.9 mph, moderate effort" Text="canoeing, rowing, 4.0 -  5.9 mph, moderate effort"></asp:ListItem>
            <asp:ListItem Value="canoeing, rowing, > 6.0 mph, vigorous effort" Text="canoeing, rowing, > 6.0 mph, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="canoeing, rowing, for pleasure, general" Text="canoeing, rowing, for pleasure, general"></asp:ListItem>
            <asp:ListItem Value="canoeing, rowing, in competition, or crew or sculling" Text="canoeing, rowing, in competition, or crew or sculling"></asp:ListItem>
            <asp:ListItem Value="golf, general" Text="golf, general"></asp:ListItem>
            <asp:ListItem Value="golf, walking and pulling clubs" Text="golf, walking and pulling clubs"></asp:ListItem>
            <asp:ListItem Value="golf, using power cart" Text="golf, using power cart"></asp:ListItem>
            <asp:ListItem Value="gymnastics, general" Text="gymnastics, general"></asp:ListItem>
            <asp:ListItem Value="ice hockey" Text="ice hockey"></asp:ListItem>
            <asp:ListItem Value="horseback riding, general" Text="horseback riding, general"></asp:ListItem>
            <asp:ListItem Value="judo, jujitsu, karate, kick boxing, tae kwon do" Text="judo, jujitsu, karate, kick boxing, tae kwon do"></asp:ListItem>
            <asp:ListItem Value="lacrosse" Text="lacrosse"></asp:ListItem>
            <asp:ListItem Value="kayaking" Text="kayaking"></asp:ListItem>
            <asp:ListItem Value="racquetball, competitive" Text="racquetball, competitive"></asp:ListItem>
            <asp:ListItem Value="racquetball, casual, general" Text="racquetball, casual, general"></asp:ListItem>
            <asp:ListItem Value="rock climbing, ascending rock" Text="rock climbing, ascending rock"></asp:ListItem>
            <asp:ListItem Value="rock or mountain climbing, rappelling" Text="rock or mountain climbing, rappelling"></asp:ListItem>
            <asp:ListItem Value="rope jumping, fast" Text="rope jumping, fast"></asp:ListItem>
            <asp:ListItem Value="rope jumping, moderate, general" Text="rope jumping, moderate, general"></asp:ListItem>
            <asp:ListItem Value="rope jumping, slow" Text="rope jumping, slow"></asp:ListItem>
            <asp:ListItem Value="roller skating" Text="roller skating"></asp:ListItem>
            <asp:ListItem Value="roller blading (in-line skating)" Text="roller blading (in-line skating)"></asp:ListItem>
            <asp:ListItem Value="skiing, cross country, 2.5 mph, slow or light effort, ski walking" Text="skiing, cross country, 2.5 mph, slow or light effort, ski walking"></asp:ListItem>
            <asp:ListItem Value="skiing, cross country, 4.0-4.9 mph, moderate speed and effort, general" Text="skiing, cross country, 4.0-4.9 mph, moderate speed and effort, general"></asp:ListItem>
            <asp:ListItem Value="skiing, cross country, 5.0-7.9 mph, brisk speed, vigorous effort" Text="skiing, cross country, 5.0-7.9 mph, brisk speed, vigorous effort"></asp:ListItem>
            <asp:ListItem Value="skiing, cross country, > 8.0 mph, racing" Text="skiing, cross country, > 8.0 mph, racing"></asp:ListItem>
            <asp:ListItem Value="skiing, cross country, hard snow, uphill, maximum, snow mountaineering" Text="skiing, cross country, hard snow, uphill, maximum, snow mountaineering"></asp:ListItem>
            <asp:ListItem Value="skiing, downhill, light effort" Text="skiing, downhill, light effort"></asp:ListItem>
            <asp:ListItem Value="skiing, downhill, moderate effort, general" Text="skiing, downhill, moderate effort, general"></asp:ListItem>
            <asp:ListItem Value="skiing, downhill, vigorous effort, racing" Text="skiing, downhill, vigorous effort, racing"></asp:ListItem>
            <asp:ListItem Value="snow shoeing" Text="snow shoeing"></asp:ListItem>
            <asp:ListItem Value="soccer, competitive" Text="soccer, competitive"></asp:ListItem>
            <asp:ListItem Value="soccer, casual, general" Text="soccer, casual, general"></asp:ListItem>
            <asp:ListItem Value="surfing, body or board" Text="surfing, body or board"></asp:ListItem>
            <asp:ListItem Value="tennis, general" Text="tennis, general"></asp:ListItem>
            <asp:ListItem Value="tennis, doubles" Text="tennis, doubles"></asp:ListItem>
            <asp:ListItem Value="tennis, singles" Text="tennis, singles"></asp:ListItem>
            <asp:ListItem Value="volleyball, competitive, beach, in gymnasium" Text="volleyball, competitive, beach, in gymnasium"></asp:ListItem>
            <asp:ListItem Value="volleyball, non-competitive" Text="volleyball, non-competitive"></asp:ListItem>
            <asp:ListItem Value="water skiing" Text="water skiing"></asp:ListItem>
            </asp:DropDownList>
            </p>
            <p>
            Walking:<br />
            <asp:DropDownList ID="ddlWalking" runat="server" Width="290" >
            <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>
            <asp:ListItem Value="walking, less than 2.0 mph, level ground, strolling, very slow" Text="walking, less than 2.0 mph, level ground, strolling, very slow"></asp:ListItem>
            <asp:ListItem Value="walking, 2.0 mph, level, slow pace, firm surface" Text="walking, 2.0 mph, level, slow pace, firm surface"></asp:ListItem>
            <asp:ListItem Value="walking 2.5 mph, downhill" Text="walking 2.5 mph, downhill"></asp:ListItem>
            <asp:ListItem Value="walking 2.5 mph, firm surface" Text="walking 2.5 mph, firm surface"></asp:ListItem>
            <asp:ListItem Value="walking 3.0 mph, level, moderate pace, firm surface" Text="walking 3.0 mph, level, moderate pace, firm surface"></asp:ListItem>
            <asp:ListItem Value="walking 3.5 mph, level, brisk, firm surface, walking for exercise" Text="walking 3.5 mph, level, brisk, firm surface, walking for exercise"></asp:ListItem>
            <asp:ListItem Value="walking 3.5 mph, uphill" Text="walking 3.5 mph, uphill"></asp:ListItem>
            <asp:ListItem Value="walking 4.0 mph, level, firm surface, very brisk pace" Text="walking 4.0 mph, level, firm surface, very brisk pace"></asp:ListItem>
            <asp:ListItem Value="walking 4.5 mph, level, firm surface, very, very brisk pace" Text="walking 4.5 mph, level, firm surface, very, very brisk pace"></asp:ListItem>
            <asp:ListItem Value="walking, 5.0 mph" Text="walking, 5.0 mph"></asp:ListItem>
            <asp:ListItem Value="walking the dog" Text="walking the dog"></asp:ListItem>
            <asp:ListItem Value="walking for pleasure" Text="walking for pleasure"></asp:ListItem>
            <asp:ListItem Value="hiking, cross country" Text="hiking, cross country"></asp:ListItem>
            </asp:DropDownList>
            </p>
             
        </div> 
 
        <div style="position:absolute;top:150px;left:400px;width:380px;">
 
            <p>Date:<br />
                <asp:TextBox ID="textRecordDate" runat="server" ReadOnly="true" />
                <asp:ImageButton ID="buttonRecordDate" runat="server" ImageUrl="../images/icons/iconcalendar.jpg" Width="20" height="20" />
                <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="textRecordDate" PopupButtonID="buttonRecordDate" />
            </p>
            <p>
                Weight (lbs):<br /><asp:TextBox ID="textRecordWeight" runat="server" />
                <asp:RegularExpressionValidator  Runat="server" ID="valNumbersOnly" ControlToValidate="textRecordWeight" Display="Dynamic" ErrorMessage="Please enter numbers only." ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
            </p>
            <p>
                Duration (minutes):<br /><asp:TextBox ID="textRecordDuration" runat="server" />
                <asp:RegularExpressionValidator  Runat="server" ID="RegularExpressionValidator1" ControlToValidate="textRecordDuration" Display="Dynamic" ErrorMessage="Please enter numbers only." ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
            </p>
            <p>
                MET Minutes:<br /><asp:TextBox ID="textRecordMet" runat="server" />
                <asp:RegularExpressionValidator  Runat="server" ID="RegularExpressionValidator2" ControlToValidate="textRecordMet" Display="Dynamic" ErrorMessage="Please enter numbers only." ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
            </p>
            <p>
                Energy Expended:<br /><asp:TextBox ID="textRecordEnergy" runat="server" />
                <asp:RegularExpressionValidator  Runat="server" ID="RegularExpressionValidator3" ControlToValidate="textRecordEnergy" Display="Dynamic" ErrorMessage="Please enter numbers only." ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
            <p>
                Intensity:<br />
                <asp:DropDownList ID="ddlRecordIntensity" runat="server">
                    <asp:ListItem Value="not selected" Text="not selected" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="Very Light" Text="Very Light"></asp:ListItem>
                    <asp:ListItem Value="Light" Text="Light"></asp:ListItem>
                    <asp:ListItem Value="Moderate" Text="Moderate"></asp:ListItem>
                    <asp:ListItem Value="Hard (Vigorous)" Text="Hard (Vigorous)"></asp:ListItem>
                    <asp:ListItem Value="Very Hard" Text="Very Hard"></asp:ListItem>
                    <asp:ListItem Value="Maximum" Text="Maximum"></asp:ListItem>
                </asp:DropDownList>
            </p>
            
        </div>

        <div style="position:absolute;top:423px;left:20px;width:760px;">
            <p>User Comments:<br /><asp:TextBox id="textareaRecordComments" TextMode="multiline" runat="server" style="width:760px;height:75px;" /></p>
        </div>

        <div style="position:absolute;top:540px;left:20px;width:300px;">
            <asp:Button ID="buttonOK" runat="server" Text="OK" Width="100" Height="25" OnClick="buttonOKClick"  />
            <asp:Button ID="buttonCancel" runat="server" Text="Cancel" Width="100" Height="25" />
        </div>
    </div>
</asp:Panel>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="lnkBtnRecordActivity"
PopupControlID="Panel1" BackgroundCssClass="modalBackground" OkControlID="buttonOK"
OnOkScript="onOk()" CancelControlID="imgClose" DropShadow="true" />

</asp:Content>
