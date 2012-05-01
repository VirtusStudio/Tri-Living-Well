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
        <%--<div class="topmainheadings">
            <h1>
                <img src="images/mydashbordhead.png" alt="" border="0"></h1>
        </div>--%>
        <div class="clear">
        </div>

    <div>
        <div style="float:left;width:310px;height:350px;background-image:url('../Images/dashboard/dashboard_nutrition.gif');background-repeat:no-repeat; display:none;"></div>
        <div style="float:left;width:300px;height:350px;background-image:url('../Images/dashboard/dash_fitness_empty.jpg');background-repeat:no-repeat;padding-top:42px;padding-left:3px;padding-right:3px;padding-bottom:40px; display:none;">
            <div style="text-align:center;height:265px;width:280px;background-image:url('../Images/dashboard/dash_fitness_bkgd.jpg');background-repeat:repeat;">
            <span style="font-weight:bold;font-size:larger;">METABOLIC MINUTE PROGRESS</span>
            <span><img src="../Images/dashboard/dash_fitness_triangle.jpg" /></span>
            <hr style="margin-top:20px;margin-bottom:10px;" />
            <span style="font-weight:bold;">Last Workout</span><br />
            <span style="font-weight:normal;"><ASP:Label ID="labelLastWorkout" runat="server"></ASP:Label></span><br />
            <span style="font-weight:bold;">Workout History: (7 days)</span><br />
            <span style="font-weight:bold;">
                <asp:HyperLink ID="LinkLast1" runat="server"></asp:HyperLink>&nbsp;
                <asp:HyperLink ID="LinkLast2" runat="server"></asp:HyperLink>&nbsp;
                <asp:HyperLink ID="LinkLast3" runat="server"></asp:HyperLink>&nbsp;
                <asp:HyperLink ID="LinkLast4" runat="server"></asp:HyperLink>&nbsp;
                <asp:HyperLink ID="LinkLast5" runat="server"></asp:HyperLink>&nbsp;
                <asp:HyperLink ID="LinkLast6" runat="server"></asp:HyperLink>&nbsp;
                <asp:HyperLink ID="LinkLast7" runat="server"></asp:HyperLink>
            </span><br />
            <hr style="margin-top:10px;margin-bottom:10px;" />
            <span style="text-align:center;font-weight:bold;">CURRENT STAGE</span>
            <table style="margin-left:10px;width:260px;">
                <tr style="height:15px;">
                    <td><asp:Literal ID="litStage1Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage2Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage3Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage4Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage5Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage6Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage7Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage8Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage9Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage10Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage11Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage12Row1" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage13Row1" runat="server"></asp:Literal></td>
                </tr>
                <tr style="height:15px;">
                    <td><asp:Literal ID="litStage1Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage2Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage3Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage4Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage5Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage6Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage7Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage8Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage9Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage10Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage11Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage12Row2" runat="server"></asp:Literal></td>
                    <td><asp:Literal ID="litStage13Row2" runat="server"></asp:Literal></td>
                </tr>
            </table>    
            </div>
        </div>


        <!-- Graph start here -->
        <div class="graphwrapper">
            <div class="mid_box">
                <div class="mid_boxhead">
                    Nutritional Journal</div>
                <div class="mid_boxbody">
                    <img src="images/graph1.png" alt="" border="0">
                </div>
            </div>
            <div class="mid_box">
                <div class="mid_boxhead">
                    Physical Fitness</div>
                <div class="mid_boxbody">
                    <img src="images/graph2.png" alt="" border="0">
                </div>
            </div>
            <div class="mid_box">
                <div class="mid_boxhead">
                    Brain Power</div>
                <div class="mid_boxbody">
                   <%-- <a href="../Welcome/Content/WellnessDairy.aspx"><img src="images/graph3.png"  alt="" border="0" /></a>--%>
                   <%-- <a href="javascript:popUpWin('Welcome/Content/WellnessDairy.aspx',900,1200);"><img src="images/graph3.png"  alt="" border="0" /></a>--%>
                  <%--  <a href="javascript:OpenPopup();"><img src="images/graph3.png"  alt="" border="0" /></a>--%>

                    <a href="../Welcome/Content/WellnessDairy.aspx" onclick="basicPopup(this.href);return false"><img src="images/graph3.png"  alt="" border="0" /></a>


                </div>
            </div>
        </div>
        <!-- Graph End here -->
        <div class="clear">
        </div>
        <!-- left area start here -->
        <div class="left_informations">
            <h1>
                Information Portal</h1>
            <ul>
                <li class="news"><a href="../Users/ViewNewsletters.aspx" onclick="newsletterpopup(this.href);return false"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Newsletters</p></a></li>
                <li class="current"><a href="#"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Current</p></a></li>
                <li class="library"><a href="../Users/ViewLibraries.aspx" onclick="viewlibrarypopup(this.href);return false"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Library</p></a></li>
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
                        <li class="myprogram"><a href="javascript:popUpWin('Main/MyProgram/MyProgram.aspx',900,650);">
                            <img src ="../Images/iconssetimg.png" alt="" border="0"><p>My program</p></a></li>
                        <li class="nutrition"><a href="javascript:popUpWin('Main/MyNutrition/MyNutrition.aspx',900,650);">
                            <img src="../Images/iconssetimg.png" alt="" border="0"><p>Nutrition</p></a></li>
                        <li class="activity_calendar"><a href="../Main/PALs/PAL_TABS.aspx"><img src="../Images/iconssetimg.png" alt="" border="0"><p>Activity Calendar</p></a></li>
                        <li class="mealexchange"><a href="javascript:popUpWin('Main/DDs/MealExchange/HTML_MealExchange.aspx',900,650);">
                            <img src="../images/iconssetimg.png" alt="" border="0"><p>Meal Exchange</p></a></li>
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
