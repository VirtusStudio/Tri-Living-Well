<%@ Page language="c#" CodeFile="logs.aspx.cs" AutoEventWireup="True" Inherits="logs" MasterPageFile="aspNetForumMaster.Master" ValidateRequest="false" %>

<%@ Register Src="~/Controls/UC_PAL_EntryView.ascx" TagName="UC_PAL_View" TagPrefix="uc1" %>

<%--  Commented by Netsmartz for resolving compile time issues
<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>--%>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">

<!--popUpWin-->
<script type="text/javascript">

    function popUpWin(path, x, y) {
        var sURL = path;
        var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
        var windownew = window.open(sURL, "new_window", features);
        windownew.focus();
    }

    window.setInterval(move_box, 100);


    var MessageGroupID;
    var FromUserID;
    var ToUserID;
    var btnSaveComment;
    var Message;
    //var txtComment;




    function move_box() {
        if (bWaiting) {
            var offset = 000; // set offset (likely equal to your css top)
            var element = document.getElementById('divAddComment');

            element.style.top = (parseInt(divAddCommentTop_Original) + parseInt(top.document.documentElement.scrollTop + offset)) + 'px';
        }
    }

    var mousex = 0;
    var mousey = 0;
    var grabx = 0;
    var graby = 0;
    var orix = 0;
    var oriy = 0;
    var elex = 0;
    var eley = 0;
    var algor = 0;

    var dragobj = null;

    function falsefunc() { return false; } // used to block cascading events

    function initDrag() {
        document.onmousemove = update; // update(event) implied on NS, update(null) implied on IE
    }

    function getMouseXY(e) // works on IE6,FF,Moz,Opera7
    {
        if (!e) e = window.event; // works on IE, but not NS (we rely on NS passing us the event)

        if (e) {
            if (e.pageX || e.pageY) { // this doesn't work on IE6!! (works on FF,Moz,Opera7)
                mousex = e.pageX;
                mousey = e.pageY;
                algor = '[e.pageX]';
                if (e.clientX || e.clientY) algor += ' [e.clientX] '
            }
            else if (e.clientX || e.clientY) { // works on IE6,FF,Moz,Opera7
                mousex = e.clientX + document.body.scrollLeft;
                mousey = e.clientY + document.body.scrollTop;
                algor = '[e.clientX]';
                if (e.pageX || e.pageY) algor += ' [e.pageX] '
            }
        }
    }

    function update(e) {
        getMouseXY(e); // NS is passing (event), while IE is passing (null)
        /*
        document.getElementById('span_browser').innerHTML = navigator.appName;
        document.getElementById('span_winevent').innerHTML = window.event ? window.event.type : '(na)';
        document.getElementById('span_autevent').innerHTML = e ? e.type : '(na)';
        document.getElementById('span_mousex').innerHTML = mousex;
        document.getElementById('span_mousey').innerHTML = mousey;
        document.getElementById('span_grabx').innerHTML = grabx;
        document.getElementById('span_graby').innerHTML = graby;
        document.getElementById('span_orix').innerHTML = orix;
        document.getElementById('span_oriy').innerHTML = oriy;
        document.getElementById('span_elex').innerHTML = elex;
        document.getElementById('span_eley').innerHTML = eley;
        document.getElementById('span_algor').innerHTML = algor;
        document.getElementById('span_dragobj').innerHTML = dragobj ? (dragobj.id ? dragobj.id : 'unnamed object') : '(null)';
        */
    }

    function getTag() {
        var tagTemp = document.getElementById("tag0");
        tagTemp.style.display = "block";
        tagTemp.style.left = mousex - 25 + "px";
        tagTemp.style.top = mousey - 25 + "px";
        grab(tagTemp);
        hide('divAddComment');
    }
    function grab(context) {
        document.onmousedown = falsefunc; // in NS this prevents cascading of events, thus disabling text selection
        dragobj = context;
        dragobj.style.zIndex = 100; // move it to the top
        document.onmousemove = drag;
        document.onmouseup = drop;
        grabx = mousex;
        graby = mousey;
        elex = orix = dragobj.offsetLeft;
        eley = oriy = dragobj.offsetTop;
        update();
    }

    function drag(e) // parameter passing is important for NS family 
    {
        if (dragobj) {
            elex = orix + (mousex - grabx);
            eley = oriy + (mousey - graby);
            dragobj.style.position = "absolute";
            //dragobj.style.left = (elex).toString(10) + 'px';
            //dragobj.style.top  = (eley).toString(10) + 'px';

            dragobj.style.left = (elex).toString() + 'px';
            dragobj.style.top = (eley).toString() + 'px';
        }
        update(e);
        return false; // in IE this prevents cascading of events, thus text selection is disabled
    }
    var bSetTag = false;

    function setTag() {
        bSetTag = true;
        if (dragobj) {
            drop();
        }
    }

    function drop() {
        if (dragobj) {
            //dragobj.style.zIndex = 0;
            dragobj = null;
        }
        //update();
        if (bSetTag) {
            var divOffset = document.getElementById('divOffset');
            document.getElementById('MOUSE_X').value = parseInt(document.getElementById("tag0").style.left) - parseInt(divOffset.style.left);
            document.getElementById('MOUSE_Y').value = parseInt(document.getElementById("tag0").style.top) - parseInt(divOffset.style.top);
        }
        else {
            document.getElementById('tag0').style.display = "none";
            document.getElementById('MOUSE_X').value = "-1";
            document.getElementById('MOUSE_Y').value = "-1";
        }
        bSetTag = false;

        document.onmousemove = update;
        document.onmouseup = null;
        document.onmousedown = null;   // re-enables text selection on NS

        show('divAddComment');
        // document.getElementById("tag0").style.display = "none";
    }




    function showHideDiv(div, img) {
        var node = document.getElementById(div);
        var icon = document.getElementById(img);
        if (node != null && icon != null) {
            var string = icon.src;
            if (string.substring(icon.src.lastIndexOf('/') + 1, string.length) == "iconExpand_OFF.gif") {
                icon.src = "/images/buttons/iconCollapse_OFF.gif";
                node.style.display = "block";
            }
            else {
                icon.src = "/images/buttons/iconExpand_OFF.gif";
                node.style.display = "none";
            }
        }
            }


    function hide(objElementID) {
        document.getElementById(objElementID).style.display = "none";
    }


    function show(objElementID) {//////////////////////////////////////////////////////////////////////////
        document.getElementById(objElementID).style.display = "";
    }

    var bWaiting = false;
    var view = "comment";
    var divThumbnails;
    var divSlide;
    var ifNotes;
    var divComments;

    var thumbnail_selected = "thumbnail_selected";
    var thumbnail_over = "thumbnail_over";
    var thumbnail_out = "thumbnail_out";
    var lastSelectedDiv = null;



    var divAddCommentTop_Original;
    function init() {
        /*
        divThumbnails = document.getElementById("divThumbnails");
        divSlide = document.getElementById("divSlide");
        ifNotes = document.getElementById("ifNotes");
        divComments = document.getElementById("divComments");
        */
        // viewMode(0);
        // selectThumbnail(ITEM_ID);

        divAddCommentTop_Original = document.getElementById('divAddComment').style.top;
        hoverTransparency("divAddCommentTransparent");
    }

    function addComment(iFromUserID, iToUserID, sMessageGroupID) {

        MessageGroupID.value = sMessageGroupID;
        FromUserID.value = iFromUserID;
        ToUserID.value = iToUserID;
        // document.getElementById('TAG_ID').value = iTagID;


        show("divAddCommentTag1");
        alert("divAddCommentTag1");
        document.getElementById('divAddCommentTag0').innerHTML = "";

        show('divAddComment');
        alert("divAddComment");
        bWaiting = true;
    }

    function addActivity() {

        show('divAddComment');
        bWaiting = true;
    }

    function insertComment() {
        // Message.value = txtComment.Text;
        // alert(txtComment.Text);
        btnSaveComment.click();
    }

    var saTagAlreadySelected = new Array();

    function formatItemID(i) {
        var result = i.toString();
        while (result.length < 3) {
            result = "0" + result;
        }
        return result;
    }
    function hoverTransparency(sElementName) {
        var obj = document.getElementById(sElementName);
        obj.onmouseover = function () { this.className = ""; }
        obj.onmouseout = function () { this.className = "transparent"; }
        obj.onmouseenter = function () { this.onmouseover = null; this.onmouseout = null; this.className = ""; }
        obj.onmouseleave = function () { this.className = "transparent"; }
    }

</script>










<div class="location">
    <b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
    »
    <asp:Label ID="lblProfile" runat="server" EnableViewState="False" meta:resourcekey="lblProfileResource1">Personal Activity Log</asp:Label></b> : 
    <a href="mysubscriptions.aspx"><asp:Label ID="lblMySubs" runat="server" EnableViewState="False" meta:resourcekey="lblMySubsResource1">My subscriptions</asp:Label></a> |
    <a href="privateinbox.aspx"><asp:Label ID="lblInbox" runat="server" EnableViewState="False" meta:resourcekey="lblInboxResource1">Personal messages - Inbox</asp:Label></a> |
    <a href="privatesent.aspx"><asp:Label ID="lblSent" runat="server" EnableViewState="False" meta:resourcekey="lblSentResource1">Personal messages - Sent items</asp:Label></a> | 
    

</div>

<asp:Label ID="lblNotLoggedIn" runat="server" Visible="False" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblNotLoggedInResource1">You are not signed in as a member. Please sign in to access your profile.</asp:Label>
<div id="divMain" runat="server">
<div><asp:Label id="lblResult" runat="server" Font-Bold="True" meta:resourcekey="lblResultResource1"></asp:Label></div>

<table cellspacing="5" width="945" id="Table1" runat="server" enableviewstate="false">
	<tr>
		<th colspan="4"><asp:Label ID="Label1" runat="server" EnableViewState="False" meta:resourcekey="lblHistoryPswResource1">Most Recent Physical Activities</asp:Label></th>
		<th><a href="javascript:init();addActivity();"><b>Create Activity Log</b></a></th></tr>
	<tr>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View1" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View2" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View3" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View4" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View5" runat="server"></uc1:UC_PAL_View>
        </td>
	</tr>	<tr><td colspan="5">&nbsp;</td></tr>
	<tr>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View6" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View7" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View8" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View9" runat="server"></uc1:UC_PAL_View>
        </td>
		<td width="188">
            <uc1:UC_PAL_View id="UC_PAL_View10" runat="server"></uc1:UC_PAL_View>
        </td>
	</tr>

	</table>
	<div style="display:none;">
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</div>
<br /><div style="display:none;">
<table cellspacing="5" id="tblAvatar" runat="server" width="500">
    <tr><th colspan="2"><asp:Label ID="lblAvatar" runat="server" EnableViewState="False" meta:resourcekey="lblAvatarResource1">Avatar picture</asp:Label></th></tr>
    <tr><td colspan="2"><img id="imgAvatar" runat="server" visible="false" src="" alt="" /></td></tr>
    <tr valign="top">
	    <td>
	        <asp:Label ID="lblAvatar2" runat="server" EnableViewState="False" meta:resourcekey="lblAvatar2Resource1">Avatar picture</asp:Label>
	        <br />
	        (
	        max <asp:Label ID="lblMaxSize" runat="server" meta:resourcekey="lblMaxSizeResource1"></asp:Label> bytes,
	        max <asp:Label ID="lblMaxDimenstions" runat="server" meta:resourcekey="lblMaxDimenstionsResource1"></asp:Label> pixels)<br />
	        <asp:Label ID="lblLeaveBlank" runat="server" EnableViewState="False" meta:resourcekey="lblLeaveBlankResource1">leave blank to remove your current avatar</asp:Label>
	        ):</td>
		<td>
            <asp:FileUpload ID="avatarUpload" runat="server" meta:resourcekey="avatarUploadResource1" />
			</td>
	</tr>
	</table></div>
</div>




                              
    <div id="divAddComment" class="fixed" style="left:100px;top:150px;width:380px;z-index:100;display:none;">
        <div id="divAddCommentTransparent" style="background-color:White;">
             <center class="Round1"><center><center><center><center><center><center><center><center><center>
             
             <table cellspacing="5" cellpadding="5" >
	            <tr>
		            <th colspan="2"><asp:Label ID="Label2" runat="server" EnableViewState="False" meta:resourcekey="lblPALResource1">New Personal Activity Log</asp:Label></th></tr>
	            <tr>
		            <td width="20%"><asp:Label ID="Label3" runat="server" EnableViewState="False" meta:resourcekey="lblUsernameResource1">Date:</asp:Label></td>
		            <td>
                       <%--
                       Commented by Netsmartz for resolving compile time issues
                        <radcln:raddatepicker id="Raddatepicker1" runat="server" Width="130">
                            <calendar enablerowselectors="False" Skin="Custom"></calendar>
                        </radcln:raddatepicker>--%>
                    </td>
	            </tr>
	         	<tr>
		            <td>
		            <asp:Label ID="lblEmail" runat="server" EnableViewState="False">Time:</asp:Label>
		            </td>
		            <td>
		            <asp:DropDownList ID="ddlTime" runat="server"></asp:DropDownList></td>
	            </tr>
	            <tr>
		            <td><asp:Label ID="lblHomepage" runat="server" EnableViewState="False" >Duration:</asp:Label></td>
		            <td>
		            <asp:DropDownList ID="ddlDuration" runat="server"></asp:DropDownList></td>
	            </tr>
	            <tr>
		            <td><asp:Label ID="lblLevel" runat="server" EnableViewState="False" >Level:</asp:Label></td>
		            <td>
		            <asp:DropDownList ID="ddlLevel" runat="server"></asp:DropDownList></td>
	            </tr>
	            <tr>
	                <td>
	                    <asp:Label ID="lblComment" runat="server" EnableViewState="False">Comment:</asp:Label>
            	    
	                </td>
		            <td><asp:TextBox id="tbComment" runat="server" TextMode="MultiLine" Rows="3" Width="100%"></asp:TextBox></td>
	            </tr>
	            <tr>
		            <th colspan="2">
			            <asp:Button CssClass="gradientbutton" id="Button1" runat="server" Text="Save Log" onclick="btnSave_Click" meta:resourcekey="btnSaveResource1"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			           <a href="javascript:init();hide('divAddComment');"><asp:Button CssClass="gradientbutton" id="Button2" runat="server" Text="Cancel"  meta:resourcekey="btnSaveResource1"></asp:Button></a>
			            </th>
			     </tr>
            </table>
                         
             
             
             
             
             
             
             

            </center></center></center></center></center></center></center></center></center></center>
        </div>
    </div>


</asp:Content>