<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Title="Tri Living Well" Inherits="Welcome_Login" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc3" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc1" %>
<%@ Register Src="~/Controls/UC_Announcements.ascx" TagName="UC_Announcements" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   
   <style type ="text/css">
   
   .right_quicklinks ul li a 
   {font-size:12px;
       
       }
   </style>
    <link href="../Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Website.css" rel="stylesheet" type="text/css" />
      <link href="../Styles/centerRound4.css" rel="stylesheet" type="text/css" />
    <!--popUpWin-->

    <!--iframe height resizing-->
    <script type="text/javascript">
        // IFRAME HEIGHT STUFF
        var iframeName = "IFRAME_CONTENT";

        function getDocHeight(doc) {
            var docHt = 0, sh, oh;
            if (doc.height) docHt = doc.height;
            else if (doc.body) {
                if (doc.body.scrollHeight) docHt = sh = doc.body.scrollHeight;
                if (doc.body.offsetHeight) docHt = oh = doc.body.offsetHeight;
                if (sh && oh) docHt = Math.max(sh, oh);
            }
            return docHt;
        }

        function setIframeHeightForOutSide() {
            refresh();
            var iframeWin = window.frames[iframeName];
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                if (bTopScroll) iframeEl.style.height = "800px"; //causes a top scroll to occur & help resize for some shorter content pages
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);


                iframeEl.style.height = "800px";
                iframeEl.style.width = '960px';

            }

        }
        function setIframeHeight() {
            refresh();
            var iframeWin = window.frames[iframeName];
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                if (bTopScroll) iframeEl.style.height = "auto"; //causes a top scroll to occur & help resize for some shorter content pages
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);
                if (docHt)//
                {
                    if (docHt < 300)//
                    {
                        docHt = 300;
                    }
                    iframeEl.style.height = docHt + 50 + "px";
                    iframeEl.style.width = '960px';
                }
            }

        }



        var bTopScroll = true;
        function setIframeHeight_NoTopScroll() {
            bTopScroll = false;
            setIframeHeight();
            bTopScroll = true;
        }

        function setIframeHeightPlus(i) {
            var iframeWin = window.frames[iframeName];
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                iframeEl.style.height = "auto"; // helps resize (for some) if new doc shorter than previous  
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);
                if (docHt) {
                    iframeEl.style.height = docHt + i + "px";
                    iframeEl.style.width = '960px';
                }
                //iframeEl.style.width = "100%";
            }


        }

    </script>
    <!--refreshing user status-->
    <script type="text/javascript">
        function refresh() {
            document.getElementById('btnRefresh').click();
        }
    </script>

    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   <!--[if lte IE 8]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
   
  <title></title>
  <meta name="description" content="">

  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="css/style.css">

  <script src="js/libs/modernizr-2.5.3.min.js"></script>
  
  <!-- Menu -->
  <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
	<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" />
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/ddsmoothmenu.js">
	</script>	
	<script type="text/javascript">

	    ddsmoothmenu.init({
	        mainmenuid: "smoothmenu1", //menu DIV id
	        orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	        classname: 'ddsmoothmenu', //class added to menu's outer DIV
	        //customtheme: ["#1c5a80", "#18374a"],
	        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
	    })

	    ddsmoothmenu.init({
	        mainmenuid: "smoothmenu2", //Menu DIV id
	        orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	        classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	        //customtheme: ["#804000", "#482400"],
	        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
	    })
	
	</script>
</head>


<body>
  <!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
  
   <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  <!-- Header start here -->
  <header>
  	<div class="topwelcomeuser_wrapper">
		<div class="topwelcomeuser">
				<ul>
					<li>Welcome Guest! </li>
					<li><a href="#">Login</a></li>
				</ul>
			</div>
	</div>
	<div class="topwrapper">
		<div class="logo"><a href="#"><img src="images/logo.png" alt="" border="0"></a></div>
		
 		<div class="clear"></div>
		
		<!-- Start main menu here -->
		 <div class="mainmenu">
		 	<ul>
				<li><a href="main_frame.aspx"><span>H</span>ome</a></li>
				<li><a href="Content/About.aspx"><span>A</span>bout<span> U</span>s</a></li>
				<li><a href="Content/HowItWorks.aspx"><span>H</span>ow it<span> W</span>orks</a></li>
				<li><a href="Content/Contact.aspx"><span>C</span>ontact<span> U</span>s</a></li>
			</ul>
		 </div>
		<!-- Main menu End here -->
				
	</div>
	
  </header>
   <!-- Header End here -->

  <div role="main" class="contentarea">
		
		<div class="topmainheadings">
			<%--<h1><img src="images/mydashbordhead.png" alt="" border="0"></h1>--%>
           
		</div>
		
		<div class="clear"></div>
		<!-- Graph start here -->
		<div class="graphwrapper">
			
			<div class="mid_box">
				<div class="mid_boxhead">Nutritional Journal</div>
				<div class="mid_boxbody">
					<img src="images/graph1.png" alt="" border="0">
				</div>
			</div>
			
			<div class="mid_box">
				<div class="mid_boxhead">Physical Fitness</div>
				<div class="mid_boxbody">
					<img src="images/graph2.png" alt="" border="0">
				</div>
			</div>
			
			<div class="mid_box">
				<div class="mid_boxhead">Brain Power</div>
				<div class="mid_boxbody">
					<img src="images/graph3.png" alt="" border="0">
				</div>
			</div>
		
		</div>
 		<!-- Graph End here -->
		
		<div class="clear"></div>
		
		
		<!-- left area start here -->
		<div class="left_informations">
            <h1>
                Information Portal</h1>
            <ul>
                <li class="news"><a href="../Users/ViewNewsletters.aspx"><img src="../images/iconssetimg.png" alt="" border="0"><p>Newsletters</p></a></li>
                <li class="current"><a href="#"><img src="../images/iconssetimg.png" alt="" border="0"><p>Current</p></a></li>
                <li class="library"><a href="../Users/ViewLibraries.aspx"><img src="../images/iconssetimg.png" alt="" border="0"><p>Library</p></a></li>
                <li class="forum"><a href="../Forum/default.aspx"><img src="../images/iconssetimg.png" alt="" border="0"><p>Forum</p></a></li>
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
		
		 
                <div  style="float:left; width:300px; margin-left:50px;" class="top Round4Container">
				<%--<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.
				</p>
				<p> It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>--%>
			<uc1:uc_login_register id="UC_Login_Register1" runat="server" />
            </div>
             
		
		
		<div class="right_quicklinks">
			<div class="right_quicklinkshead"></div>
			<div class="right_quicklinkscenter">
                    <ul>
                        <li class="myprogram"><a href="javascript:popUpWin('Main/MyProgram/MyProgram.aspx',900,650);">
                            <img src="../images/iconssetimg.png" alt="" border="0"><p>My program</p></a></li>
                        <li class="nutrition"><a href="javascript:popUpWin('Main/MyNutrition/MyNutrition.aspx',900,650);">
                            <img src="../images/iconssetimg.png" alt="" border="0"><p>Nutrition</p></a></li>
                        <li class="activity_calendar"><a href="../Main/PALs/PAL_TABS.aspx"><img src="../images/iconssetimg.png" alt="" border="0"><p>Activity Calendar</p></a></li>
                        <li class="mealexchange"><a href="javascript:popUpWin('Main/DDs/MealExchange/HTML_MealExchange.aspx',900,650);">
                            <img src="../images/iconssetimg.png" alt="" border="0"><p>Meal Exchange</p></a></li>
                    </ul>
                   
                </div>
			
			<div class="right_quicklinksdown"></div>
  		</div>
		
		</div>
		<!-- right area End here -->
	

  </div>
  
  
  <div class="clear"></div>
  
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
  <script>      window.jQuery || document.write('<script src="js/libs/jquery-1.7.1.min.js"><\/script>')</script>

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
  </form>
</body>
</html>
