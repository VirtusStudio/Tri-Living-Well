<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="Main_FRAME.aspx.cs" Inherits="Main_Main_FRAME" Title="Dashboard" %>
    <%@ Register Src="~/controls/UC_DD_Nutrition_Caluclator_PopUp.ascx" TagName="UC_DD_Nutrition_Caluclator_PopUp" TagPrefix="uc5" %>
<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog"
    TagPrefix="uc5" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_Home_1_Control.ascx" TagName="UC_Home_1_Control"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server"
        frameborder="0" style="display:none;" src="Content/Home.aspx"></iframe>
    <table>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <table width="20%" border="1">
                                <tr>
                                    <td align="center" valign="top">
                                        Water
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblWaterAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/MilkDairy.aspx')" class="lnkBtn">
                                            Milk/ Dairy</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblDairyAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Fruit.aspx')" class="lnkBtn">
                                            Fruit</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblFruitAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Vegetables.aspx')" class="lnkBtn">
                                            Vegetables</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblVegetableAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Starch.aspx')" class="lnkBtn">
                                            Starch</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblStarchAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Protein.aspx')" class="lnkBtn">
                                            Protein</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblProteinAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Fats.aspx')" class="lnkBtn">
                                            Fats</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblFATAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        Calories
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblCaloriesAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/FoodJournal.aspx' class="lnkBtn">Food
                                            Journal</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Main/MyNutrition.aspx' class="lnkBtn">My Nutrition</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <a href="javascript:editCalorie();" class="lnkBtn">Re-Calculate</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" align="center">
                            <table width="200" border="1">
                                <tr><td colspan="2"><h2>Physical Fitness</h2></td></tr>
                                <tr><td>Current METS</td><td>500</td></tr>
                                <tr><td>Last Workout Date</td><td>Monday April 14, 2012</td></tr>
                                <tr><td>Last Workout METS</td><td>503</td></tr>
                                <tr><td>Workout History (7 Days)</td><td>4/1/2012, 4/2/2012, 4/4/2012</td></tr
                                <tr><td colspan="2">View Past 2 Weeks Workouts</td></tr>
                                <tr><td>Current Stage</td><td>6</td></tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:LinkButton CssClass="aButtonSmall" CausesValidation="false" ToolTip="Click here to record activity." ID="lnkBtnRecordActivity" runat="server">
                                            Record Activity
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        
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
            <asp:DropDownList ID="ddlCycling" runat="server" Width="290" OnSelectedIndexChanged="Cycling_Index_Changed" >
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
            <asp:CustomValidator runat="server" id="cusCustom" controltovalidate="ddlCycling" onservervalidate="ddlCustom_ServerValidate" errormessage="You must select and activity!" />
            </p>
            <p>
            Running:<br />
            <asp:DropDownList ID="ddlRunning" runat="server" Width="290" OnSelectedIndexChanged="Running_Index_Changed" >
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
            <asp:CustomValidator runat="server" id="CustomValidator1" controltovalidate="ddlRunning" onservervalidate="ddlCustom_ServerValidate" errormessage="You must select and activity!" />
            </p>
            <p>
            Swimming:<br />
            <asp:DropDownList ID="ddlSwimming" runat="server" Width="290" OnSelectedIndexChanged="Swimming_Index_Changed" >
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
            <asp:CustomValidator runat="server" id="CustomValidator2" controltovalidate="ddlSwimming" onservervalidate="ddlCustom_ServerValidate" errormessage="You must select and activity!" />
            </p>
            <p>
            ConditioningExercises:<br />
            <asp:DropDownList ID="ddlConditioningExercises" runat="server" Width="290" OnSelectedIndexChanged="ConditioningExercises_Index_Changed" >
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
            </asp:DropDownList><asp:CustomValidator runat="server" id="CustomValidator3" controltovalidate="ddlConditioningExercises" onservervalidate="ddlCustom_ServerValidate" errormessage="You must select and activity!" />
            </p>
            <p>
            Sports:<br />
            <asp:DropDownList ID="ddlSports" runat="server" Width="290" OnSelectedIndexChanged="Sports_Index_Changed" >
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
            <asp:CustomValidator runat="server" id="CustomValidator4" controltovalidate="ddlSports" onservervalidate="ddlCustom_ServerValidate" errormessage="You must select and activity!" />
            </p>
            <p>
            Walking:<br />
            <asp:DropDownList ID="ddlWalking" runat="server" Width="290" OnSelectedIndexChanged="Walking_Index_Changed" >
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
            <asp:CustomValidator runat="server" id="CustomValidator5" controltovalidate="ddlWalking" onservervalidate="ddlCustom_ServerValidate" errormessage="You must select and activity!" />
            </p>
             
        </div> 
 
        <div style="position:absolute;top:150px;left:400px;width:380px;">
 
            <p>Date:<br />
                <asp:TextBox ID="textRecordDate" runat="server" ReadOnly="true" />
                <asp:ImageButton ID="buttonRecordDate" runat="server" ImageUrl="../images/icons/iconcalendar.jpg" Width="20" height="20" />
                <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="textRecordDate" PopupButtonID="buttonRecordDate" />
            </p>
            <p>Time:<br />
                <asp:DropDownList ID="ddlPalEntryTime" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required"
                    ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryTime"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>            
            </p>


            <p>
                Weight (lbs):<br /><asp:TextBox ID="textRecordWeight" runat="server" />
                <asp:RegularExpressionValidator  Runat="server" ID="valNumbersOnly" ControlToValidate="textRecordWeight" Display="Dynamic" ErrorMessage="Please enter numbers only." ValidationExpression="(^([0-9]*|\d*\d{1}?\d*)$)"></asp:RegularExpressionValidator>
            </p>
            <p>
                Duration (minutes):<br />
                <asp:DropDownList ID="ddlPalEntryDuration" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="required"
                    ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryDuration"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                <asp:DropDownList ID="ddlPalEntryIntensity" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required"
                    ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryIntensity"
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </p>
            
        </div>

        <div style="position:absolute;top:423px;left:20px;width:760px;">
            <p>User Comments:<br /><asp:TextBox id="textareaRecordComments" TextMode="multiline" runat="server" style="width:760px;height:75px;" /></p>
        </div>

        <div style="position:absolute;top:540px;left:20px;width:300px;">
            <asp:Button ID="buttonOK" runat="server" Text="OK" Width="100" Height="25" OnClick="buttonOKClick"  />
            <asp:Button ID="buttonCancel" runat="server" Text="Cancel" Width="100" Height="25" />
        </div>
    
    </asp:Panel>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="lnkBtnRecordActivity" PopupControlID="Panel1" BackgroundCssClass="modalBackground" OkControlID="buttonOK" OnOkScript="onOk()" CancelControlID="imgClose" DropShadow="true" />
                                
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            Brain Power
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table><tr style="height:15px;"><td align="center">&nbsp;</td></tr>
                                <tr><td align="center"><b>Information Portal</b></td></tr><tr style="height:15px;"><td align="center">&nbsp;</td></tr>
                                <tr>
                                    <td align="center">
                                       <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/ViewNewsletters.aspx'>
                                        <img alt="newsletter" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_newsLetter.bmp'
                                       
                                         border="0" />
                                       </a> 
                                    </td>
                                </tr>
                                <tr style="height:50px; vertical-align:middle;">
                                    <td align="center">
                                        Current Icon
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                          <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/ViewLibraries.aspx'>
                                            <img alt="library" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_library.bmp'
                                       
                                         border="0" />
                                          </a> 
                                 
                                    </td>
                                </tr>
                                 <tr>
                                    <td align="center">
                                       <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/ViewToolsResources.aspx'>
                                       <%-- <img alt="newsletter" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_newsLetter.bmp'
                                         border="0" />--%>
                                        Tools/Resources
                                       </a> 
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                      <a href='<%=AppConfig.GetBaseSiteUrl() %>Forum/default.aspx'>
                                           <img alt="forum" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_forum.bmp'
                                       
                                         border="0" /><a></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Visit us on
                                        <br />
                                        <asp:DataList ID="dlLinks" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <table cellpadding="2" cellspacing="2" border="0">
                                                    <tr>
                                                        <td>
                                                            <a href='<%#Eval("StrValue") %>' target="_blank">
                                                                <img runat="server" id="imgLinks" src='<%#GetImagePath(Eval("StrValueCode").ToString()) %>'
                                                                    alt="" height="30" width="30" border="0" /></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2" align="left">
                            <table>
                                <tr>
                                    <td>
                                        <center class="Round5">
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <center>
                                                                <center>
                                                                    <center>
                                                                        <center>
                                                                            <center>
                                                                                <table class="Round5_tblHeader">
                                                                                    <tr>
                                                                                        <td>
                                                                                            What's Hot
                                                                                        </td>
                                                                                        <td style="text-align: right;">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <div class="gridItem">
                                                                                    <asp:DataList ID="dlHotLinks" runat="server" RepeatColumns="1" RepeatDirection="Horizontal">
                                                                                        <ItemTemplate>
                                                                                            <table cellpadding="2" cellspacing="2" border="0">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <a href='<%#AppConfig.GetBaseSiteUrl() + "Users/hotsectiondetails.aspx#"+Eval("IntHotSectionId") %>'>
                                                                                                            <%#AppLib.GetSubString(Eval("StrHeading").ToString(), 100)%>
                                                                                                        </a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                </div>
                                                                            </center>
                                                                        </center>
                                                                    </center>
                                                                </center>
                                                            </center>
                                                        </center>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </td>


                                </tr>

                                <tr><td>
                                    <table>

                                        <tr><td colspan="4">
                                            <center class="Round5">
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <center>
                                                                <center>
                                                                    <center>
                                                                        <center>
                                                                            <center>
                                                                                <table class="Round5_tblHeader">
                                                                                    <tr>
                                                                                        <td>
                                                                                            Quick Links
                                                                                        </td>
                                                                                        <td style="text-align: right;">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                 </center>
                                                                        </center>
                                                                    </center>
                                                                </center>
                                                            </center>
                                                        </center>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>

                                        </td></tr>
                                        <tr><td valign="top" align="center">
                                              <a href="javascript:popupOpen('MyProgram/MyProgram.aspx',700,600);">
                                              <img src='<%=AppConfig.GetBaseSiteUrl() %>images/myProgram.bmp' alt="" border="0" /></a>
                                      
                                        </td>
                                        <td valign="top" align="center"><a href="javascript:popupOpen('MyNutrition/MyNutrition.aspx',700,600);"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/myNutrition.bmp' alt="" border="0" /></a>
                                        </td><td valign="top" align="center">
                                            Activity Icon
                                        </td>
                                        <td valign="top" align="center">
                                        <a href="javascript:popupOpen('DDs/MealExchange/HTML_MealExchange.aspx',700,600);"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/meal_exchange.bmp' alt="" border="0" /></a>
                                        </td>
                                        </tr>
                                    </table>
                                </td></tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td>      <uc5:UC_DD_Nutrition_Caluclator_PopUp id="UC_DD_Nutrition_Caluclator_PopUp1" runat="server"></uc5:UC_DD_Nutrition_Caluclator_PopUp>
         </td></tr>
        <tr style="display:none;">
            <td class="top">
                <div class="title">
                    What's New?</div>
                <div class="description">
                     
                    <center class="Round3">
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <table class="Round3_tblHeader">
                                                                <tr>
                                                                    <td>
                                                                        Announcements
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        <%--      <div class="gridItem">
                                                                <asp:GridView ID="GVAnnouncements" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                    Width="100%" AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="1"
                                                                    CellPadding="0" BorderWidth="1" GridLines="None" OnRowCommand="GVAnnouncements_RowCommand"
                                                                    OnRowDataBound="GVAnnouncements_RowDataBound">
                                                                    <RowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNewsLetterId" runat="server" Visible="false" Text='<%#Eval("IntNewsLetterId") %>'></asp:Label>
                                                                                <span title='<%#Eval("StrTitle").ToString() %>'>
                                                                                    <%#AppLib.GetSubString(Eval("StrTitle").ToString(), 30)%></span>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkFavoriteNewsLetter" CssClass="lnkBtn" runat="server" Text='<%#Eval("AddRemoveFromFavorite") %>'
                                                                                    CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="AddToFavorite"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>--%>
                                                        </center>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                    <center class="Round3">
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <table class="Round3_tblHeader">
                                                                <tr>
                                                                    <td>
                                                                        Events
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <div class="gridItem">
                                                             <%--   <asp:GridView ID="GVEvents" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                    Width="100%" AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="1"
                                                                    CellPadding="0" BorderWidth="1" GridLines="None" OnRowCommand="GVEvents_RowCommand"
                                                                    OnRowDataBound="GVEvents_RowDataBound">
                                                                    <RowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNewsLetterId" runat="server" Visible="false" Text='<%#Eval("IntNewsLetterId") %>'></asp:Label>
                                                                                <span title='<%#Eval("StrTitle").ToString() %>'>
                                                                                    <%#AppLib.GetSubString(Eval("StrTitle").ToString(), 30)%></span>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkFavoriteNewsLetter" CssClass="lnkBtn" runat="server" Text='<%#Eval("AddRemoveFromFavorite") %>'
                                                                                    CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="AddToFavorite"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>--%>
                                                            </div>
                                                        </center>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                     
                </div>
            </td>
            <td style="width: 3px;">
            </td>
            <td style="display: none;" class="top">
               <%-- <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <uc3:UC_Home_1_Control ID="UC_Home_1_Control1" runat="server" />
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <uc2:UC_Login_Register ID="UC_Login_Register1" runat="server" />
                    </AnonymousTemplate>
                </asp:LoginView>--%>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function ShowPopup(varPagePath) {
            var varPath = '<%=AppConfig.GetBaseSiteUrl() %>' + varPagePath;
            OpenPopup(varPath, "Popup", 600, 500);
        }
       
    </script>
</asp:Content>
