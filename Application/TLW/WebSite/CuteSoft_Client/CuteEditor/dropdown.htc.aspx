<%@ Page Language="C#" ContentType="text/x-component"  %>
<%@ OutputCache Location="Client" Duration="243600" VaryByParam="None" %>
<PUBLIC:COMPONENT URN="http://cutesoft.net/">
	<PUBLIC:PROPERTY NAME="width" GET="_get_width" PUT="_set_width" PERSIST="false" />
	<PUBLIC:PROPERTY NAME="height" GET="_get_height" PUT="_set_height" PERSIST="false" />
	<PUBLIC:PROPERTY NAME="selectedIndex" GET="_get_selectedIndex" PUT="_set_selectedIndex" PERSIST="false" />
	<PUBLIC:PROPERTY NAME="options" GET="_get_options" PERSIST="false" />
	<PUBLIC:PROPERTY NAME="value" GET="_get_value" PUT="_set_value" PERSIST="false" />
	<PUBLIC:PROPERTY NAME="length" GET="_get_length" PUT="_set_length" PERSIST="false" />
	<PUBLIC:METHOD NAME="add" INTERNALNAME="_mtd_add" />
	<PUBLIC:METHOD NAME="item" INTERNALNAME="_mtd_item" />
	<PUBLIC:METHOD NAME="remove" INTERNALNAME="_mtd_remove" />
	<PUBLIC:EVENT ID="id_onchange" NAME="onchange" />
	<PUBLIC:EVENT ID="id_onpropertychange" NAME="onpropertychange" />
</PUBLIC:COMPONENT>
<HTML>
	<BODY>
	</BODY>
</HTML>

<!-- #include file="_sharedie.htm" -->

<script>
var OxO25ff=["darkblue","white","marginBottom","style","-3px","cursor","default"];var bordercolorover=OxO25ff[0x0];var bordercolor=OxO25ff[0x1];var min_height=0x28;var max_height=0x140; element[OxO25ff[0x3]][OxO25ff[0x2]]=OxO25ff[0x4] ; element[OxO25ff[0x3]][OxO25ff[0x5]]=OxO25ff[0x6] ;
</script>

<script>
var OxOe619=["boolean","string","ok","true","yes","on","-1","1","length","value","","innerText","innerHTML","html","SPAN","document","text"," ","DIV","option","div","NOBR","createPopup","RenderItemBorder","cssText","style","width:100%;padding:3px 5px 5px 4px;border:solid 1px #eeeeee; margin:4px 10px 4px 0; vertical-align:middle;","this.runtimeStyle.cssText=\x27rem-background-color:highlight;border-style:solid;border-width:1px;border-color:highlight\x27;","onmouseover","this.runtimeStyle.cssText=\x27\x27;","onmouseout","width:100%;padding:2px;vertical-align:middle;","this.runtimeStyle.cssText=\x27background-color:highlight;color:highlightText\x27;","body","all","unselectable","propertyName","children","width","10px","overflow","visible","\x3CTABLE cellpadding=\x270\x27 cellspacing=\x270\x27 border=\x271\x27 borderColor=\x27","\x27"," style=\x27font-family: MS Sans Serif; font-size: 9pt; display:inline;border-collapse:collapse;\x27\x3E\x3CTR\x3E","\x3CTD style=\x27background-color:white;vertical-align:middle;padding:2px 4px 1px 4px;\x27\x3ELoading\x3C/TD\x3E","\x3CTD style=\x27width:8px;padding:0px 1px 1px 1px;color:black;text-align:center;font-family:Webdings;font-size:8px;\x27\x3E6\x3C/TD\x3E","\x3C/TR\x3E\x3C/TABLE\x3E","beforeEnd","\x3CDIV style=\x27display:none;z-index:88888888;font-family:arial;position:absolute;background-color:white;border:1px solid;width:80px;height:80px;overflow-x:visible;overflow-y:auto;font-size:12px;padding:2px;\x27\x3E","borderColor","display","none"]; function ConvertToBoolean(Ox5b){if( typeof (Ox5b)==OxOe619[0x0]){return Ox5b;} ;if( typeof (Ox5b)==OxOe619[0x1]){switch(Ox5b.toLowerCase()){case OxOe619[0x7]:case OxOe619[0x6]:case OxOe619[0x5]:case OxOe619[0x4]:case OxOe619[0x3]:case OxOe619[0x2]:return true;;;;;;;} ;return false;} ;return Ox5b?true:false;}  ; function _get_options(){return element;}  ;var table;var td1;var panel;var isopen=false;var selindex=0x0;var arr=[]; function _get_selectedIndex(){if(arr[OxOe619[0x8]]==0x0){return -0x1;} ;return selindex;}  ; function _set_selectedIndex(Ox5b){ Ox5b=parseInt(Ox5b) ;if(Ox5b>=0x0&&Ox5b<arr[OxOe619[0x8]]){ selindex=Ox5b ;} else { selindex=-0x1 ;} ; UpdateDisplay() ; FireValuePropChanged() ;}  ; function _get_value(){var Ox73=arr[selindex];if(Ox73){return Ox73[OxOe619[0x9]]||OxOe619[0xa];} ;return OxOe619[0xa];}  ; function _set_value(Ox5b){for(var i=0x0;i<arr[OxOe619[0x8]];i++){if(arr[i][OxOe619[0x9]]==Ox5b){ selindex=i ; UpdateDisplay() ; FireValuePropChanged() ;return ;} ;} ; selindex=-0x1 ; UpdateDisplay() ; FireValuePropChanged() ;}  ; function _mtd_default(Oxd7){return arr[Oxd7];}  ; function _mtd_item(Oxd7){return arr[Oxd7];}  ; function SetOptionTo(Ox73,Ox10a){ Ox10a[OxOe619[0xb]]=OxOe619[0xa] ;if(Ox73[OxOe619[0xd]]||Ox73[OxOe619[0xc]]){var Ox19b=element[OxOe619[0xf]].createElement(OxOe619[0xe]); Ox19b[OxOe619[0xc]]=Ox73[OxOe619[0xd]]||Ox73[OxOe619[0xc]] ; Ox10a.appendChild(Ox19b) ;} else { Ox10a[OxOe619[0xb]]=Ox73[OxOe619[0x10]]||OxOe619[0x11] ;} ;}  ; function _mtd_add(Ox73){var div=element[OxOe619[0xf]].createElement(OxOe619[0x12]); div[OxOe619[0x13]]=Ox73 ; Ox73[OxOe619[0x14]]=div ;var Ox3e9=element[OxOe619[0xf]].createElement(OxOe619[0x15]);if(window[OxOe619[0x16]]){ Ox3e9.mergeAttributes(Ox73) ;} ; div.appendChild(Ox3e9) ; SetOptionTo(Ox73,Ox3e9) ; arr[arr[OxOe619[0x8]]]=Ox73 ;if(ConvertToBoolean(Ox73.selected)){ selindex=arr[OxOe619[0x8]]-0x1 ; UpdateDisplay() ; FireValuePropChanged() ;} ;if(element[OxOe619[0x17]]==OxOe619[0x3]){ div[OxOe619[0x19]][OxOe619[0x18]]=OxOe619[0x1a] ; div[OxOe619[0x1c]]= new Function(OxOe619[0xa],OxOe619[0x1b]) ; div[OxOe619[0x1e]]= new Function(OxOe619[0xa],OxOe619[0x1d]) ;} else { div[OxOe619[0x19]][OxOe619[0x18]]=OxOe619[0x1f] ; div[OxOe619[0x1c]]= new Function(OxOe619[0xa],OxOe619[0x20]) ; div[OxOe619[0x1e]]= new Function(OxOe619[0xa],OxOe619[0x1d]) ;} ; panel.appendChild(div) ; document[OxOe619[0x21]].appendChild(Ox73) ;}  ; function _mtd_remove(Ox73){for(var i=0x0;i<arr[OxOe619[0x8]];i++){if(arr[i]==Ox73){for(var j=i;j<arr[OxOe619[0x8]]-0x1;j++){ arr[j]=arr[j+0x1] ;} ; arr[OxOe619[0x8]]=arr[OxOe619[0x8]]-0x1 ; Ox73[OxOe619[0x14]].removeNode(true) ; Ox73.removeNode(true) ;if(selindex>i){ selindex=i-0x1 ; UpdateDisplay() ; FireValuePropChanged() ;} else {if(selindex==i){ selindex=-0x1 ; UpdateDisplay() ; FireValuePropChanged() ;} ;} ;break ;} ;} ;}  ; function SelectOption(Ox73){for(var i=0x0;i<arr[OxOe619[0x8]];i++){if(arr[i]==Ox73){ selindex=i ; UpdateDisplay() ; FireValuePropChanged() ; id_onchange.fire() ;} ;} ;}  ; function UpdateDisplay(){ td1[OxOe619[0xb]]=OxOe619[0xa] ; option=arr[selindex] ;if(option){var Ox3e9=element[OxOe619[0xf]].createElement(OxOe619[0x15]); td1.appendChild(Ox3e9) ;if(window[OxOe619[0x16]]){ Ox3e9.mergeAttributes(option) ;} ; SetOptionTo(option,Ox3e9) ;var coll=td1[OxOe619[0x22]];for(var i=0x0;i<coll[OxOe619[0x8]];i++){ coll[i][OxOe619[0x23]]=OxOe619[0x5] ;} ;} ;}  ; function FireValuePropChanged(){var Ox1a5=createEventObject(); Ox1a5[OxOe619[0x24]]=OxOe619[0x9] ; id_onpropertychange.fire(Ox1a5) ;}  ; function Initialize(){var Ox3ee=element[OxOe619[0x25]];var coll=[];for(var i=0x0;i<Ox3ee[OxOe619[0x8]];i++){ coll[i]=Ox3ee.item(i) ;} ;if(element[OxOe619[0x19]][OxOe619[0x26]]==OxOe619[0xa]){ element[OxOe619[0x19]][OxOe619[0x26]]=OxOe619[0x27] ;} ; element[OxOe619[0x19]][OxOe619[0x28]]=OxOe619[0x29] ;var Ox19b=element[OxOe619[0xf]].createElement(OxOe619[0xe]); Ox19b[OxOe619[0xc]]=OxOe619[0x2a]+bordercolor+OxOe619[0x2b]+OxOe619[0x2c]+OxOe619[0x2d]+OxOe619[0x2e]+OxOe619[0x2f] ; element.insertAdjacentElement(OxOe619[0x30],Ox19b.children(0x0)) ; table=element.children(element[OxOe619[0x25]][OxOe619[0x8]]-0x1) ; td1=table.rows(0x0).cells(0x0) ; panel=element[OxOe619[0xf]].createElement(OxOe619[0x31]) ; element.appendChild(panel) ;for(var i=0x0;i<coll[OxOe619[0x8]];i++){ _mtd_add(coll[i]) ;} ; element[OxOe619[0x23]]=OxOe619[0x5] ;var coll=element[OxOe619[0x22]];for(var i=0x0;i<coll[OxOe619[0x8]];i++){ coll[i][OxOe619[0x23]]=OxOe619[0x5] ;} ; UpdateDisplay() ;}  ; function CloseDiv(Ox3ef){ isopen=false ; table[OxOe619[0x32]]=bordercolor ; panel[OxOe619[0x19]][OxOe619[0x33]]=OxOe619[0x34] ; CaptureManager.Unregister(table) ;}  ;

</script>
<script>
var OxO28f2=["designMode","document","on","disabled","borderColor","length","RichHideFirstItem","true","display","style","div","none","top","left","block","offsetHeight","offsetWidth","width","scrollHeight","height","all","unselectable","children","px","srcElement","parentNode","option"];if(element[OxO28f2[0x1]][OxO28f2[0x0]].toLowerCase()!=OxO28f2[0x2]){ Initialize() ; HookEvents() ;} ; function HookEvents(){ function table.onmouseover(){if(isopen){return ;} ;if(table.contains(event.fromElement)){return ;} ;if(element[OxO28f2[0x3]]){return ;} ; table[OxO28f2[0x4]]=bordercolorover ;}  ; function table.onmouseout(){if(isopen){return ;} ;if(table.contains(event.toElement)){return ;} ;if(element[OxO28f2[0x3]]){return ;} ; table[OxO28f2[0x4]]=bordercolor ;}  ; function table.onclick(){if(isopen){ CloseDiv() ;return ;} ;if(element[OxO28f2[0x3]]){return ;} ;for(var i=0x0;i<arr[OxO28f2[0x5]];i++){if(i==0x0&&element[OxO28f2[0x6]]==OxO28f2[0x7]){ arr[0x0][OxO28f2[0xa]][OxO28f2[0x9]][OxO28f2[0x8]]=OxO28f2[0xb] ;} ; SetOptionTo(arr[i],arr[i][OxO28f2[0xa]].children(0x0)) ;} ; table[OxO28f2[0x4]]=bordercolorover ; panel[OxO28f2[0x9]][OxO28f2[0xc]]=0x0 ; panel[OxO28f2[0x9]][OxO28f2[0xd]]=0x0 ; panel[OxO28f2[0x9]][OxO28f2[0x8]]=OxO28f2[0xe] ;var Ox84=CalcPosition(panel,table); Ox84[OxO28f2[0xc]]+=table[OxO28f2[0xf]]+0x1 ; AdjustMirror(panel,table,Ox84) ; panel[OxO28f2[0x9]][OxO28f2[0xc]]=Ox84[OxO28f2[0xc]] ; panel[OxO28f2[0x9]][OxO28f2[0xd]]=Ox84[OxO28f2[0xd]] ; panel[OxO28f2[0x9]][OxO28f2[0x11]]=table[OxO28f2[0x10]] ; panel[OxO28f2[0x9]][OxO28f2[0x13]]=Math.min(Math.max(panel[OxO28f2[0x12]]+0x6,min_height),max_height) ;var coll=panel[OxO28f2[0x14]];for(var i=0x0;i<coll[OxO28f2[0x5]];i++){ coll[i][OxO28f2[0x15]]=OxO28f2[0x2] ;} ;var coll=panel[OxO28f2[0x16]];var Ox81=0x0;for(var i=0x0;i<coll[OxO28f2[0x5]];i++){ Ox81=Math.max(coll[i].offsetWidth,Ox81) ;} ;for(var i=0x0;i<coll[OxO28f2[0x5]];i++){ coll[i][OxO28f2[0x9]][OxO28f2[0x11]]=Ox81+OxO28f2[0x17] ;} ; isopen=true ;var Ox85=CaptureManager.Register(table,CloseDiv); Ox85.AddElement(panel) ;}  ; function panel.onmouseup(){if(panel.contains(event.srcElement)){for(var e=event[OxO28f2[0x18]];e!=panel;e=e[OxO28f2[0x19]]){if(e[OxO28f2[0x1a]]){ CloseDiv() ; SelectOption(e.option) ;return ;} ;} ;} ;}  ;}  ;
</script>
