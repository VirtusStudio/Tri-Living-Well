<%@ Page Language="C#" ContentType="text/x-component" Inherits="CuteEditor.EditorCulturePage" %>
<%
//FEATURE:DROP-DOWN-COLORPICKER
%>
<PUBLIC:COMPONENT>
	<PUBLIC:EVENT ID="event_oncolorchange" NAME="oncolorchange" />
	<PUBLIC:EVENT ID="event_oncolorpopup" NAME="oncolorpopup" />
	<PUBLIC:PROPERTY NAME="selectedColor" GET="_get_selectedColor" PUT="_set_selectedColor"/>
	<PUBLIC:METHOD NAME="popupColor" INTERNALNAME="_mtd_popupColor" />
	<PUBLIC:ATTACH EVENT="onclick" ONEVENT="_mtd_onclick()" />
</PUBLIC:COMPONENT>

<!--#include file="CuteEditorconstants.js" -->
<!-- #include file="_sharedie.htm" -->

<SCRIPT>

var OxOb38f=["dialogWidth:530px;dialogHeight:355px;help:0;status:0;resizable:1","disableVisual","?culture=[[_culture_]]","\x26[[DNN_Arg]]","","\x3CDIV style=\x27width=140;cursor:default;position:absolute;z-index:88888888;background-color:white;border:0px;overflow:visible;\x27\x3E","length","\x3Ctable cellpadding=0 cellspacing=5 style=\x27width:100%;font-family: Verdana; font-size: 6px; BORDER: #666666 1px solid;\x27 bgcolor=#f9f8f7\x3E\x3Ctr\x3E\x3Ctd\x3E","\x3Ctable cellpadding=0 cellspacing=0 style=\x27font-size: 3px;\x27\x3E","\x3Ctr\x3E","uniqueID","\x3Ctd colspan=10 align=center style=\x22padding:2px;border:solid 1px #f9f8f7;margin:1px\x22 onmouseup=\x22document.all.","._cphtc_sel(this.ColorValue)\x22  ColorValue=\x22\x22 onmouseover=\x22CuteEditor_ColorPicker_ButtonOver(this);\x22\x3E","\x3Ctable cellspacing=0 cellpadding=0 border=0 width=90% style=\x22font-size:3px\x22\x3E","\x3Ctr\x3E\x3Ctd width=18\x3E\x3Cdiv style=\x22background-color:#000000; border:solid 1px #808080; width:12px; height:12px; font-size: 3px;\x22\x3E\x26nbsp;\x3C/div\x3E\x3C/td\x3E\x3Ctd align=center style=\x22font:normal 11px verdana;\x22\x3E\x26nbsp;[[Automatic]]\x3C/td\x3E\x3C/tr\x3E","\x3C/table\x3E","\x3C/td\x3E","\x3C/tr\x3E","\x3Ctr\x3E\x3Ctd\x3E\x26nbsp;\x3C/td\x3E\x3C/tr\x3E","\x3Ctd align=center style=\x22padding:2px;border:solid 1px #f9f8f7;\x22 onmouseover=\x22CuteEditor_ColorPicker_ButtonOver(this);\x22 ColorValue=\x22","\x22 onmouseup=\x22document.all.","._cphtc_sel(this.ColorValue);\x22\x3E","\x3Cdiv style=\x22background-color:","; border:solid 1px #808080; width:12px; height:12px; font-size: 3px;\x22\x3E\x26nbsp;\x3C/div\x3E","\x3C/td\x3E\x3C/tr\x3E","\x3Ctd colspan=10 align=center style=\x22padding:2px;border:solid 1px #f9f8f7;\x22 onmouseover=\x22CuteEditor_ColorPicker_ButtonOver(this);\x22 onmouseup=\x22document.all.","._cphtc_dlg();\x22\x3E","\x3Ctr\x3E\x3Ctd width=18\x3E\x3Cdiv style=\x22background-color:#000000; border:solid 1px #808080; width:12px; height:12px;font-size: 3px;\x22\x3E\x3C/div\x3E\x3C/td\x3E\x3Ctd align=center style=\x22font-size:11px\x22\x3E[[MoreColors]]\x3C/td\x3E\x3C/tr\x3E","innerHTML","body","document","onclick","SELECT","all","visibility","currentStyle","hidden","style","runtimeStyle","_visibility","top","left","display","block","offsetHeight","unselectable","on","none"];var dlgurl='<%=ProcessWebPath("ColorPicker.Aspx")%>'; function element._cphtc_sel(Ox6b){ _color=Ox6b ; event_oncolorchange.fire() ;}  ; function element._cphtc_dlg(){ CloseDiv() ; event_oncolorpopup.fire() ;var Ox73=OxOb38f[0x0];if(element[OxOb38f[0x1]]){var Ox74=showModalDialog(dlgurl+OxOb38f[0x2]+OxOb38f[0x3],{color:Ox75},Ox73);if(Ox74!=null&&Ox74!=false){ _color=Ox74 ; event_oncolorchange.fire() ;} ;} else {var Ox75=_color;var Ox74=showModalDialog(dlgurl+OxOb38f[0x2]+OxOb38f[0x3],{color:Ox75,onchange:Ox76},Ox73);if(Ox74!=null&&Ox74!=false){ _color=Ox74 ;} else { _color=Ox75 ;} ; event_oncolorchange.fire() ; function Ox76(Ox5b){ _color=Ox5b ; event_oncolorchange.fire() ;}  ;} ;}  ;var _color=OxOb38f[0x4]; function _get_selectedColor(){return _color;}  ; function _set_selectedColor(Ox5b){ _color=Ox5b ;}  ;var div;var selects;var isopen=false; function _mtd_onclick(){ _mtd_popupColor() ;}  ; function _mtd_popupColor(){if(div==null){ div=document.createElement(OxOb38f[0x5]) ;var Ox7f=OxOb38f[0x4];var Ox80=colorsArray[OxOb38f[0x6]];var Ox81=0x8; Ox7f+=OxOb38f[0x7] ; Ox7f+=OxOb38f[0x8] ; Ox7f+=OxOb38f[0x9] ; Ox7f+=OxOb38f[0xb]+element[OxOb38f[0xa]]+OxOb38f[0xc] ; Ox7f+=OxOb38f[0xd] ; Ox7f+=OxOb38f[0xe] ; Ox7f+=OxOb38f[0xf] ; Ox7f+=OxOb38f[0x10] ; Ox7f+=OxOb38f[0x11] ; Ox7f+=OxOb38f[0x12] ;for(var i=0x0;i<Ox80;i++){if((i%Ox81)==0x0){ Ox7f+=OxOb38f[0x9] ;} ; Ox7f+=OxOb38f[0x13]+colorsArray[i]+OxOb38f[0x14]+element[OxOb38f[0xa]]+OxOb38f[0x15] ; Ox7f+=OxOb38f[0x16]+colorsArray[i]+OxOb38f[0x17] ; Ox7f+=OxOb38f[0x10] ;if(((i+0x1)>=Ox80)||(((i+0x1)%Ox81)==0x0)){ Ox7f+=OxOb38f[0x11] ;} ;} ; Ox7f+=OxOb38f[0x12] ; Ox7f+=OxOb38f[0xf] ; Ox7f+=OxOb38f[0x18] ;if(ShowMoreColors){ Ox7f+=OxOb38f[0x9] ; Ox7f+=OxOb38f[0x19]+element[OxOb38f[0xa]]+OxOb38f[0x1a] ; Ox7f+=OxOb38f[0xd] ; Ox7f+=OxOb38f[0x1b] ; Ox7f+=OxOb38f[0xf] ; Ox7f+=OxOb38f[0x10] ; Ox7f+=OxOb38f[0x11] ;} ; Ox7f+=OxOb38f[0xf] ; div[OxOb38f[0x1c]]=Ox7f ; element[OxOb38f[0x1e]][OxOb38f[0x1d]].appendChild(div) ; div[OxOb38f[0x1f]]=CloseDiv ;} ;if(isopen){ CloseDiv() ;} ; isopen=true ; selects=[] ;var coll=element[OxOb38f[0x1e]][OxOb38f[0x21]].tags(OxOb38f[0x20]);for(var i=0x0;i<coll[OxOb38f[0x6]];i++){var sel=coll[i];if(sel[OxOb38f[0x23]][OxOb38f[0x22]]!=OxOb38f[0x24]){ selects[selects[OxOb38f[0x6]]]=sel ;var Ox83=sel[OxOb38f[0x26]]||sel[OxOb38f[0x25]]; Ox83[OxOb38f[0x27]]=Ox83[OxOb38f[0x22]] ; Ox83[OxOb38f[0x22]]=OxOb38f[0x24] ;} ;} ; div[OxOb38f[0x25]][OxOb38f[0x28]]=0x0 ; div[OxOb38f[0x25]][OxOb38f[0x29]]=0x0 ; div[OxOb38f[0x25]][OxOb38f[0x2a]]=OxOb38f[0x2b] ;var Ox84=CalcPosition(div,element); Ox84[OxOb38f[0x28]]+=element[OxOb38f[0x2c]] ; AdjustMirror(div,element,Ox84) ; div[OxOb38f[0x25]][OxOb38f[0x29]]=Ox84[OxOb38f[0x29]] ; div[OxOb38f[0x25]][OxOb38f[0x28]]=Ox84[OxOb38f[0x28]] ;var coll=div[OxOb38f[0x21]];for(var i=0x0;i<coll[OxOb38f[0x6]];i++){ coll[i][OxOb38f[0x2d]]=OxOb38f[0x2e] ;} ; div.focus() ;var Ox85= new CaptureManager(element,handlelosecapture); Ox85.AddElement(div) ;}  ; function handlelosecapture(){ CloseDiv() ;}  ; function CloseDiv(){ CaptureManager.Unregister(element) ; isopen=false ; div[OxOb38f[0x25]][OxOb38f[0x2a]]=OxOb38f[0x2f] ;for(var i=0x0;i<selects[OxOb38f[0x6]];i++){var sel=selects[i]; sel[OxOb38f[0x26]][OxOb38f[0x22]]=sel[OxOb38f[0x26]][OxOb38f[0x27]] ;} ;}  ;

</SCRIPT>