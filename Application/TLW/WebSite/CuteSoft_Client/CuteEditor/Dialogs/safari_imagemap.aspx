<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<%
	string QUERY_STRING=Request.ServerVariables["QUERY_STRING"];
%>
<HTML>
	<HEAD>
		<title>[[ImageMap]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='Safari_style.css'>
		<script src=gecko_dialog.js></script><script src=../_shared.js></script>		
		<style>
		.row { HEIGHT: 22px }
		.cb { VERTICAL-ALIGN: middle }
		.itemimg { VERTICAL-ALIGN: middle }
		.editimg { VERTICAL-ALIGN: middle }
		.cell1 { VERTICAL-ALIGN: middle }
		.cell2 { VERTICAL-ALIGN: middle }
		.cell3 { PADDING-RIGHT: 4px; VERTICAL-ALIGN: middle; TEXT-ALIGN: right }
		.cb { }
		</style>
	</HEAD>
	<body unselectable="on">
		<table border="0" cellspacing="0" cellpadding="5" width="100%" align="center"  unselectable="on">
			<tr>
				<td style="padding:4px 0 1px 4px">						
						&nbsp;&nbsp;&nbsp;
						<IMG src="../images/ImageMap.gif" onclick="newMap();" Alt="[[AddHotSpot]]" class="dialogButton"
						onMouseOver="Check(this,1)" onMouseOut="Check(this,0)">
						<IMG src="../images/link.gif" onclick="Addlink(this);" Alt="[[insertlink]]" class="dialogButton"
						onMouseOver="Check(this,1)" onMouseOut="Check(this,0)">								
				</td>
			</tr>
			<tr>
				<td valign="top" height="280">
					<iframe id="iframe" MARGINHEIGHT="1" MARGINWIDTH="1" width="100%" src="../template.aspx"  scrolling="yes" height="100%"></iframe>
				</td>
			</tr>
			<tr>
				<td class="dialogFooter" vAlign="top" align="right" style="PADDING-RIGHT: 13px; PADDING-LEFT: 13px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
					<table cellSpacing="0" cellPadding="1">
						<tbody>
							<tr>
								<td>
									<input type="button" value="[[Update]]" onclick="do_update()">&nbsp;&nbsp;
									<input type="button" value="[[Cancel]]" onclick="do_cancel()">&nbsp;
								</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>			
		

<script src="addvars.js"></script>
<script>

var OxOd32b=["dialogArguments","editor","window","document","img","contentWindow","iframe","onload","designMode","on","contentEditable","body","fontFamily","style","Tahoma","fontSize","11px","color","black","background","white","padding","10px","unselectable","innerHTML","useMap","","MAP","length","name","#","areas","href","target","alt","coords",",","\x3Cimg id=\x27myIMAGE","\x27 border=1 src=\x27../images/space.gif\x27 alt=\x27[[AddLinktoImageMap]]\x27 style=\x27position:absolute;left:","px;top:","px;width:","px;height:","px;zIndex:","\x27\x3E","parentNode","tagName","startOffset","endOffset","startContainer","endContainer","nodeType","childNodes","IMG","myIMAGE","id","width=350,height=212,resizable=0,toolbars=0,menubar=0,status=0","returnValue","frameloaded","keyCode","\x27  border=1 src=\x27../images/space.gif\x27 alt=\x27[[AddLinktoImageMap]]\x27 style=\x27position:absolute;zIndex:",";width:40;height:40;left:10;top:10\x27\x3E","\x3Carea shape=\x27rect\x27 coords=\x27","\x27","href=\x27","\x27 ","target=\x27","alt=\x27","\x3E","\x3Cmap name=\x27","\x3C/map\x3E","off","AutoMap","nodeName","\x3C","attributes","nodeValue"," ","=\x22","\x22","\x3C![CDATA[","]]\x3E","\x26",";","\x3C!--","--\x3E","HR","BR","INPUT"];var obj=top[OxOd32b[0x0]];var editor=obj[OxOd32b[0x1]];var editwin=obj[OxOd32b[0x2]];var editdoc=obj[OxOd32b[0x3]];var oImg=obj[OxOd32b[0x4]];var oMap=null;var aMapName= new Array();var aLeft= new Array();var aTop= new Array();var aWidth= new Array();var aHeight= new Array();var aHref= new Array();var aTarget= new Array();var aTitle= new Array();var aCoords= new Array();var iframe=document.getElementById(OxOd32b[0x6])[OxOd32b[0x5]]; window[OxOd32b[0x7]]=function (){ iframe[OxOd32b[0x3]][OxOd32b[0x8]]=OxOd32b[0x9] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0xa]]=true ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0xd]][OxOd32b[0xc]]=OxOd32b[0xe] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0xd]][OxOd32b[0xf]]=OxOd32b[0x10] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0xd]][OxOd32b[0x11]]=OxOd32b[0x12] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0xd]][OxOd32b[0x13]]=OxOd32b[0x14] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0xd]][OxOd32b[0x15]]=OxOd32b[0x16] ; oImg[OxOd32b[0x17]]=OxOd32b[0x9] ; iframe.focus() ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0x18]]=getOuterHTML(oImg) ;var Ox523=oImg[OxOd32b[0x19]];if(Ox523!=OxOd32b[0x1a]){ Ox523=Ox523.toUpperCase() ;var Ox524=editdoc[OxOd32b[0xb]].getElementsByTagName(OxOd32b[0x1b]);for(var i=0x0;i<Ox524[OxOd32b[0x1c]];i++){ aMapName[i]=Ox524[i][OxOd32b[0x1d]].toUpperCase() ;if((OxOd32b[0x1e]+aMapName[i])==Ox523){ oMap=Ox524[i] ;} ;} ;} ;if(oMap){for(var i=0x0;i<oMap[OxOd32b[0x1f]][OxOd32b[0x1c]];i++){ aHref[i]=oMap[OxOd32b[0x1f]][i][OxOd32b[0x20]] ; aTarget[i]=oMap[OxOd32b[0x1f]][i][OxOd32b[0x21]] ; aTitle[i]=oMap[OxOd32b[0x1f]][i][OxOd32b[0x22]] ; aCoords[i]=oMap[OxOd32b[0x1f]][i][OxOd32b[0x23]] ;var Ox146=aCoords[i].split(OxOd32b[0x24]); aLeft[i]=parseInt(Ox146[0x0]) ; aTop[i]=parseInt(Ox146[0x1]) ; aWidth[i]=parseInt(Ox146[0x2])-aLeft[i] ; aHeight[i]=parseInt(Ox146[0x3])-aTop[i] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0x18]]+=OxOd32b[0x25]+i+OxOd32b[0x26]+aLeft[i]+OxOd32b[0x27]+aTop[i]+OxOd32b[0x28]+aWidth[i]+OxOd32b[0x29]+aHeight[i]+OxOd32b[0x2a]+(i+0x1)+OxOd32b[0x2b] ;} ;} ;}  ; function SearchSelectionElement(Ox130){var sel=iframe.getSelection();var r=sel.getRangeAt(0x0);var Ox2f=Range_GetParentElement(r);for(var e=Ox2f;e!=null&&e!=iframe[OxOd32b[0x3]][OxOd32b[0xb]];e=e[OxOd32b[0x2c]]){if(e[OxOd32b[0x2d]]==Ox130){return e;} ;} ;return null;}  ; function Range_GetParentElement(Ox175){var Ox32e=Ox175[OxOd32b[0x2e]];var Ox32f=Ox175[OxOd32b[0x2f]];var Ox330=Ox175[OxOd32b[0x30]];var Ox331=Ox175[OxOd32b[0x31]];if(Ox32e==Ox32f&&Ox330==Ox331){if(Ox330[OxOd32b[0x32]]==0x3){return Ox330[OxOd32b[0x2c]];} ;return Ox330;} ;if(Ox32f-Ox32e==0x1&&Ox330==Ox331){return Ox330[OxOd32b[0x33]][Ox32e];} ;var Ox334=[];for(var Ox335=Ox330;Ox335!=null;Ox335=Ox335[OxOd32b[0x2c]]){ Ox334[Ox334[OxOd32b[0x1c]]]=Ox335 ;} ; Ox334.reverse() ;var Ox336=[];for(var Ox335=Ox330;Ox335!=null;Ox335=Ox335[OxOd32b[0x2c]]){ Ox336[Ox336[OxOd32b[0x1c]]]=Ox335 ;} ; Ox336.reverse() ;var Ox337=null;var Ox194=Math.min(Ox334[OxOd32b[0x1c]],Ox336.length);for(var i=0x0;i<Ox194;i++){if(Ox334[i]==Ox336[i]){ Ox337=Ox334[i] ;} else {break ;} ;} ;if(Ox337[OxOd32b[0x32]]==0x3){ Ox337=Ox337[OxOd32b[0x2c]] ;} ;return Ox337;}  ; function Addlink(){var Oxb9=SearchSelectionElement(OxOd32b[0x34]);if(Oxb9){if((Oxb9[OxOd32b[0x36]]).indexOf(OxOd32b[0x35])==-0x1){return ;} ;var Ox527=Oxb9[OxOd32b[0x36]];var Ox528=parseInt(Ox527.substr(0x7));var obj={href:aHref[Ox528],target:aTarget[Ox528],title:aTitle[Ox528]}; showModalDialog('Gecko_ mapLink.aspx?<%= QUERY_STRING %>',obj,OxOd32b[0x37],function (Ox2dc,Ox18d){if(Ox18d[OxOd32b[0x38]]){var arr=Ox18d[OxOd32b[0x38]];if(arr){ aHref[Ox528]=arr[0x0] ; aTarget[Ox528]=arr[0x1] ; aTitle[Ox528]=arr[0x2] ;} ;} ;} ) ;} ;return false;}  ;if(!top[OxOd32b[0x39]]){ top[OxOd32b[0x39]]=true ;} ; function do_cancel(){ top[OxOd32b[0x38]]=null ; top.close() ;}  ; function IsDigit(){return ((event[OxOd32b[0x3a]]>=0x30)&&(event[OxOd32b[0x3a]]<=0x39));}  ; function newMap(){var n=aHref[OxOd32b[0x1c]]; aHref[n]=OxOd32b[0x1a] ; aTarget[n]=OxOd32b[0x1a] ; aTitle[n]=OxOd32b[0x1a] ; iframe[OxOd32b[0x3]][OxOd32b[0xb]][OxOd32b[0x18]]+=OxOd32b[0x25]+n+OxOd32b[0x3b]+(n+0x1)+OxOd32b[0x3c] ; iframe.scrollBy(0x0,0x0) ; iframe.focus() ;}  ; function do_update(){var b=false;for(var i=0x0;i<aHref[OxOd32b[0x1c]];i++){var obj=iframe[OxOd32b[0x3]].getElementById(OxOd32b[0x35]+i);if(obj){ b=true ;} ;} ;if(b){var Oxaf=OxOd32b[0x1a];for(var i=0x0;i<aHref[OxOd32b[0x1c]];i++){var obj=iframe[OxOd32b[0x3]].getElementById(OxOd32b[0x35]+i);if(obj){var Ox52a=parseInt(obj[OxOd32b[0xd]].left);var Ox52b=parseInt(obj[OxOd32b[0xd]].top);var Ox52c=parseInt(obj[OxOd32b[0xd]].width);var Ox52d=parseInt(obj[OxOd32b[0xd]].height);var Ox52e=Ox52a+Ox52c;var Ox52f=Ox52b+Ox52d; Oxaf+=OxOd32b[0x3d]+Ox52a+OxOd32b[0x24]+Ox52b+OxOd32b[0x24]+Ox52e+OxOd32b[0x24]+Ox52f+OxOd32b[0x3e] ;if(aHref[i]!=OxOd32b[0x1a]){ Oxaf+=OxOd32b[0x3f]+aHref[i]+OxOd32b[0x40] ;} ;if(aTarget[i]!=OxOd32b[0x1a]&&aTarget[i]){ Oxaf+=OxOd32b[0x41]+aTarget[i]+OxOd32b[0x40] ;} ;if(aTitle[i]!=OxOd32b[0x1a]){ Oxaf+=OxOd32b[0x42]+aTitle[i]+OxOd32b[0x40] ;} ; Oxaf+=OxOd32b[0x43] ;} ;} ;if(oMap){ oMap[OxOd32b[0x18]]=Oxaf ;} else { sUseMap=getAutoMapName() ; oImg[OxOd32b[0x19]]=OxOd32b[0x1e]+sUseMap ; editor.PasteHTML(OxOd32b[0x44]+sUseMap+OxOd32b[0x2b]+Oxaf+OxOd32b[0x45]) ;} ;} else {if(oMap){} ; oImg[OxOd32b[0x19]]=OxOd32b[0x1a] ;} ; oImg[OxOd32b[0x17]]=OxOd32b[0x46] ; oImg.removeAttribute(OxOd32b[0x17]) ; window[OxOd32b[0x38]]=oImg ; window.close() ; top.close() ;}  ; function getAutoMapName(){var b=true;var n=0x0;var Ox25=OxOd32b[0x1a];while(b){ n++ ; Ox25=OxOd32b[0x47]+n ;if(isValidMapName(Ox25)){ b=false ;} ;} ;return Ox25;}  ; function isValidMapName(Ox1f){ Ox1f=Ox1f.toUpperCase() ;for(var i=0x0;i<aMapName[OxOd32b[0x1c]];i++){if(aMapName[i]==Ox1f){return false;} ;} ;return true;}  ; function do_cancel(){ oImg.removeAttribute(OxOd32b[0x17]) ; top[OxOd32b[0x38]]=null ; top.close() ;}  ; function getOuterHTML(Ox27e){var Ox1f=OxOd32b[0x1a];switch(Ox27e[OxOd32b[0x32]]){case 0x1: Ox1f+=OxOd32b[0x49]+Ox27e[OxOd32b[0x48]] ;for(var i=0x0;i<Ox27e[OxOd32b[0x4a]][OxOd32b[0x1c]];i++){if(Ox27e[OxOd32b[0x4a]].item(i)[OxOd32b[0x4b]]!=null){ Ox1f+=OxOd32b[0x4c] ; Ox1f+=Ox27e[OxOd32b[0x4a]].item(i)[OxOd32b[0x48]] ; Ox1f+=OxOd32b[0x4d] ; Ox1f+=Ox27e[OxOd32b[0x4a]].item(i)[OxOd32b[0x4b]] ; Ox1f+=OxOd32b[0x4e] ;} ;} ;if(Ox27e[OxOd32b[0x33]][OxOd32b[0x1c]]==0x0&&leafElems[Ox27e[OxOd32b[0x48]]]){ Ox1f+=OxOd32b[0x43] ;} else { Ox1f+=OxOd32b[0x43] ; Ox1f+=getInnerHTML(Ox27e) ; Ox1f+=OxOd32b[0x49]+Ox27e[OxOd32b[0x48]]+OxOd32b[0x43] ;} ;break ;case 0x3: Ox1f+=Ox27e[OxOd32b[0x4b]] ;break ;case 0x4: Ox1f+=OxOd32b[0x4f]+Ox27e[OxOd32b[0x4b]]+OxOd32b[0x50] ;break ;case 0x5: Ox1f+=OxOd32b[0x51]+Ox27e[OxOd32b[0x48]]+OxOd32b[0x52] ;break ;case 0x8: Ox1f+=OxOd32b[0x53]+Ox27e[OxOd32b[0x4b]]+OxOd32b[0x54] ;break ;;;;;;} ;return Ox1f;}  ;var _leafElems=[OxOd32b[0x34],OxOd32b[0x55],OxOd32b[0x56],OxOd32b[0x57]];var leafElems={};for(var i=0x0;i<_leafElems[OxOd32b[0x1c]];i++){ leafElems[_leafElems[i]]=true ;} ;
</script>
	</body>
</HTML>
