<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="Main_FRAME.aspx.cs" Inherits="Main_Main_FRAME" Title="Dashboard" %>
    <%@ Register Src="~/controls/UC_DD_Nutrition_Caluclator_PopUp.ascx" TagName="UC_DD_Nutrition_Caluclator_PopUp" TagPrefix="uc5" %>
<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog"
    TagPrefix="uc5" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_Home_1_Control.ascx" TagName="UC_Home_1_Control"
    TagPrefix="uc3" %>
<%@ Register Src="~/Controls/UC_EnterActivity_PopUp.ascx" TagName="UC_EnterActivity_PopUp" TagPrefix="uc2" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../js/jquery.alerts.js" type="text/javascript"></script>
    <link href="../Styles/jquery.alerts.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popupOpen(path, x, y) {
            var sURL = path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
    </script>

    <style type = "text/css">
    
    .right_quicklinks ul li a 
    {
        font-size: 12px;
        }
    
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server"
        frameborder="0" style="display:none;" src="Content/Home.aspx"></iframe>
    <div role="main" class="contentarea">

        <div class="clear">
        </div>

    <div>
        <!-- Graph start here -->
        <div class="graphwrapper">
            <div class="mid_box">
                <div class="mid_boxhead">
                    Nutritional Center</div>
                <div class="mid_boxbody">
                    <div style="position:relative;height:293px;width:310px;" onclick="window.location = '../Main/NutritionCenter.aspx';" >
                        <div style="position:asolute;left:0px;top:0px;height:293px;width:261px;background-image:url(<%=AppConfig.GetBaseSiteUrl() %>images/dashboard/nutritioncenter.jpg);background-repeat:no-repeat;" onclick="window.location = '../Main/NutritionCenter.aspx';" >
                            <div id="nutrition-recalculate" name="nutrition-recalculate" style="position:absolute;left:75px;top:173px;height:18px;width:110px;" ></div>
                            <div id="nutrition-diary" name="nutrition-diary" style="position:absolute;left:75px;top:210px;height:18px;width:110px;" ></div>
                            <div id="nutrition-mynutrition" name="nutrition-diary" style="position:absolute;left:75px;top:234px;height:18px;width:110px" ></div>
                            <div id="nutrition-meal" name="nutrition-meal" style="position:absolute;left:75px;top:258px;height:18px;width:110px;" ></div>

                            <div id="nutrition-water" name="nutrition-water" style="position:absolute;left:227px;top:39px;height:15px;width:34px;" >
                                <span id="nutrition-water-number" name="nutrition-water-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                            <div id="nutrition-dairy" name="nutrition-dairy" style="position:absolute;left:227px;top:57px;height:15px;width:34px;" >
                                <span id="nutrition-dairy-number" name="nutrition-dairy-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                            <div id="nutrition-vegetable" name="nutrition-vegetable" style="position:absolute;left:227px;top:75px;height:15px;width:34px;" >
                                <span id="nutrition-vegetable-number" name="nutrition-vegetable-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                            <div id="nutrition-starch" name="nutrition-starch" style="position:absolute;left:227px;top:93px;height:15px;width:34px;" >
                                <span id="nutrition-starch-number" name="nutrition-starch-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                            <div id="nutrition-protein" name="nutrition-protein" style="position:absolute;left:227px;top:111px;height:15px;width:34px;" >
                                <span id="nutrition-protein-number" name="nutrition-protein-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                            <div id="nutrition-fats" name="nutrition-fats" style="position:absolute;left:227px;top:129px;height:15px;width:34px;" >
                                <span id="nutrition-fats-number" name="nutrition-fats-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                            <div id="nutrition-calories" name="nutrition-calories" style="position:absolute;left:227px;top:147px;height:15px;width:34px;" >
                                <span id="nutrition-calories-number" name="nutrition-calories-number" style="font-weight:bolder;color:black;" >0</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mid_box">
                <div class="mid_boxhead">
                    Personal Fitness</div>
                <div class="mid_boxbody">
                    <div style="position:relative;height:290px;width:290px;" onclick="window.location = '../Main/PersonalFitness.aspx';" >
                        <div id="pfTitle" style="position:absolute;top:0px;left:30px;font-size:larger;font-weight:bolder;">METABOLIC MINUTE PROGRESS</div>
                        <div style="position:absolute;top:20px;left:0px;height:95px;width:285px;background-image:url('../Images/dashboard/<asp:Literal ID="LiteralMetTriangleImage" runat="server" />');background-position:center;background-repeat:no-repeat;">
                            <div id="pfLeftRange" style="position:absolute;top:80px;left:30px;">0</div>
                            <div id="pfRightRange" style="position:absolute;top:80px;left:247px;">1000</div>
                        </div>
                        <div id="pfProgressTriangle" style="position:absolute;top:115px;left:<asp:Literal ID="LiteralProgressMarkerLeft" runat="server" />px;height:31px;width:47px;background-image:url('../Images/dashboard/currentmet.jpg');background-position:center;background-repeat:no-repeat;"> 
                            <div id="pfProgressNumber" style="position:absolute;top:10px;left:<asp:Literal ID="LiteralProgressNumberLeft" runat="server" />px;color:Blue;font-weight:bold;"><asp:Literal ID="LiteralProgressNumber" runat="server" /></div>
                        </div>
                        <div style="position:absolute;top:130px;left:5px;width:275px;height:5px;"><hr style="height:1px;background-color:Gray;" /></div>           
                        <div id="pfLastWorkoutTitle" style="position:absolute;top:145px;left:5px;font-weight:bolder;">Last Workout:</div>           
                        <div id="pfLastWorkoutDate" style="position:absolute;top:160px;left:5px;font-weight:smaller;"><asp:Literal ID="LiteralLastWorkout" runat="server" /></div>           
                        <div id="pfWorkoutHistoryTitle1" style="position:absolute;top:180px;left:5px;"><span style="font-size:nornal;font-weight:bold;">Workout History: </span><span id="pfWorkoutHistoryTitle2" style="font-size:normal;font-weight:normal;">(7 days)</span></div>           
                        <div id="pfWorkoutHistoryDates" style="position:absolute;top:200px;left:5px;font-size:smaller;font-weight:normal;"><asp:Literal ID="LiteralWorkoutHistory" runat="server" /></div>           
                        <div style="position:absolute;top:220px;left:5px;width:275px;height:5px;"><hr style="height:1px;background-color:Gray;" /></div>         
                        <div id="pfCurrentStageTitle" style="position:absolute;top:235px;left:80px;font-size:larger;font-weight:bolder;">CURRENT STAGE</div>         
                        <div id="pfCurrentStageImage" style="position:absolute;top:255px;left:0px;height:35px;width:285px;background-image:url('../Images/dashboard/<asp:Literal ID="LiteralCurrentStepImage" runat="server" />');background-position:center;"></div>         
                    </div>                
                </div>
            </div>

            <div class="mid_box">
                <div class="mid_boxhead">
                    Wellness Diary</div>
                <div class="mid_boxbody">
                    <a href="../Main/WellnessDairy.aspx"><img src="images/graph3.png"  alt="" border="0" /></a>
                </div>
            </div>
        </div>
        <!-- Graph End here -->
        <div class="clear">
        </div>
        <!-- left area start here -->
        <div class="left_informations">
            <h1 style="text-align:center">
                Information Portal</h1>
            <ul>
                <li class="news"><a href="../Users/ViewNewsletters.aspx"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Newsletters</p></a></li>
                <li class="tools"><a href="../Users/ViewToolsResources.aspx"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Tools</p></a></li>
                <li class="library"><a href="../Users/ViewLibraries.aspx"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Library</p></a></li>
                <li class="forum"><a href="../Forum/default.aspx"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Forum</p></a></li>
            </ul>
            <div class="visitusicons">
                <h1>
                    Visit Us on:</h1>
                <ul>
                    <li class="facebookicon"><a href="#"><img src="../images/visitusiconsimg.png" alt="" border="0">Facebook</a></li>
                    <li class="twittericon"><a href="#"><img src="../images/visitusiconsimg.png" alt="" border="0">twitter</a></li>
                    <li class="blogicon"><a href="#"><img src="../images/visitusiconsimg.png" alt="" border="0">blog</a></li>
                </ul>
            </div>
        </div>
        <!-- left area End here -->
        <!-- right area start here -->
        <div class="rightwrapper">
            <div class="rightwatshot">
                <div class="rightwatshothead">
                </div>
                <div class="rightwatshotcenter">
                   <%-- <p>
                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                        unknown printer took a galley of type and scrambled it to make a type specimen book.
                    </p>
                    <p>
                        It has survived not only five centuries, but also the leap into electronic typesetting,
                        remaining essentially unchanged. It was popularised in the 1960s with the release
                        of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                        publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>--%>

                         <%-- <div class="gridItem">--%>
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
                <%--     </div>--%>










                </div>
                <div class="rightwatshotdown">
                </div>
            </div>
            <div class="right_quicklinks">
                <div class="right_quicklinkshead">
                </div>
                <div class="right_quicklinkscenter">
                    <ul>
                        <li class="myprogram"><a href="../Main/MyProgram/MyProgram.aspx">
                            <img src ="../Images/iconssetimg.png" alt="" border="0"><p>My program</p></a></li>
                        <li class="nutrition"><a href="../Main/MyNutrition/MyNutrition.aspx">
                            <img src="../Images/iconssetimg.png" alt="" border="0"><p>My Nutrition</p></a></li>
                        <li class="activity_calendar"><a href="../Main/PALs/PAL_TABS.aspx"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Activity Calendar</p></a></li>
                        <li class="mealexchange"><a href="../Main/Full_MealExchange.aspx">
                            <img src="../images/iconssetimg.png" alt="" border="0"><p>Food Exchange</p></a></li>
                    </ul>
                   
                </div>
                <div class="right_quicklinksdown">
                </div>
            </div>
        </div>
        <!-- right area End here -->
    </div>
    <div class="clear">
    </div>
    <!-- footer start here -->
    <footer>
		<div class="footer_left">
			<p>Tri-Living Well</p>
			<p>1008 Upper Gulph Road</p>
			<p>Suite 300</p>
			<p>Wayne, PA 19087</p>
		</div>
		
		<div class="footer_right">
			<p>(484) 367-7016</p>
			<p>Email: <a href="mailto:support@TriLivingWell.com">support@TriLivingWell.com</a></p>
		</div>
		
  </footer>
    <!-- footer End here -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>        window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>
    <script src="js/plugins.js"></script>
    <script src="js/script.js"></script>
    <script>
        var _gaq = [['_setAccount', 'UA-XXXXX-X'], ['_trackPageview']];
        (function (d, t) {
            var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
            g.src = ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g, s)
        } (document, 'script'));
    </script>
    <script language="javascript" type="text/javascript">
        function ShowPopup(varPagePath) {
            var varPath = '<%=AppConfig.GetBaseSiteUrl() %>' + varPagePath;
            OpenPopup(varPath, "Popup", 600, 500);
        }
       
    </script>


    <script type="text/javascript">
        function popUpWin(path, x, y) {

            var sURL = '<%=AppConfig.GetBaseSiteUrl() %>' + path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
        function load(Filepath) {
            if (Filepath.indexOf("//") > -1) {
                window.location = Filepath;
            }
            else {
                window.location = '<%=AppConfig.GetBaseSiteUrl() %>' + Filepath;
            }
        }
        </script>

    <script language="javascript" type="text/javascript">
        function basicPopup(url) {
            popupWindow = window.open(url, 'popUpWindow', 'height=700,width=900,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
        }

        function newsletterpopup(url) {
            popupWindow = window.open(url, 'popUpWindow', 'height=700,width=900,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
        }
        function viewlibrarypopup(url) {
            popupWindow = window.open(url, 'popUpWindow', 'height=700,width=900,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
        }


</script>




</asp:Content>
