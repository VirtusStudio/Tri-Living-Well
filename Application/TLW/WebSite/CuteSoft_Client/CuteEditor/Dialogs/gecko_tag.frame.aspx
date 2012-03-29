<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<%@ Import Namespace="System.Xml"%>
<script runat="server">
public bool IsTagPattern(string tagname,string pattern)
{
	if(pattern=="*")return true;
	tagname=tagname.ToLower();
	pattern=pattern.ToLower();
	if(tagname==pattern)return true;
	foreach(string str in pattern.Split(",;|/".ToCharArray()))
	{
		if(str=="*")return true;
		if(str==tagname)return true;
		if(str=="-"+tagname)return false;
	}
	return false;
}
public string GetTagDisplayName(string tagname)
{
	switch(tagname.ToLower())
	{
		case "img":
			return "[[Image]]";
		case "object":
			return "[[ActiveXObject]]";
		case "table":
		case "inserttable":
			return "[["+tagname+"]]";
		default:
			return tagname;
	}
}
bool nocancel=false;
</script>
<%
	if(Context.Request.QueryString["NoCancel"]=="True")
		nocancel=true;
		
	string tagName=Context.Request.QueryString["Tag"];
	string tabName=Context.Request.QueryString["Tab"];
	XmlDocument doc=new XmlDocument();
	doc.Load(Server.MapPath("Gecko_tag.config"));
	string tabcontrol=null;
	string tabtext="";
%>
<html>
	<link rel="stylesheet" href='gecko_style.css'>
	<script src=Gecko_dialog.js></script>
	<script src=../_shared.js></script>
	<%if(nocancel){%>
	<script>
	var OxOaa1c=[];var nocancel=true;
	</script>
	<%}else{%>
	<script>
	var OxOf875=[];var nocancel=false;
	</script>
	<%}%>
	<script>
	var OxO3052=["dialogArguments","element","editor","window","document","EnableAntiSpamEmailEncoder","nocancel","changed",""];var arg=top[OxO3052[0x0]];var element=arg[OxO3052[0x1]];var editor=arg[OxO3052[0x2]];var editwin=arg[OxO3052[0x3]];var editdoc=arg[OxO3052[0x4]];var EnableAntiSpamEmailEncoder=arg[OxO3052[0x5]]; top[OxO3052[0x6]]=nocancel ; top[OxO3052[0x7]]=top[OxO3052[0x7]]||arg[OxO3052[0x7]] ; function ParseToString(Ox1f){var Ox9=parseFloat(Ox1f);if(isNaN(Ox9)){return OxO3052[0x8];} ;return Ox9+OxO3052[0x8];}  ; function UpdateState(){}  ; function SyncTo(){}  ; function SyncToView(){}  ;
	</script>
	<body style="border-width:0px;padding-top:4px;padding-left:4px;padding-right:4px;;margin:0px;">
		<div style='font-size:12pt;font-weight:bold;TEXT-TRANSFORM: capitalize;'>
			<%=GetTagDisplayName(tagName)%>
		</div>
		<div id="controlparent" style="padding:5px">
			<table>
					<tr>
						<td id="menu">
						<%
							int index=0;
							foreach(XmlElement xe in doc.DocumentElement.SelectNodes("add"))
							{
								string tab=xe.GetAttribute("tab");
						
								if(IsTagPattern(tagName,xe.GetAttribute("pattern")))
								{
									bool isactive=(index==0&&(tabName==null||tabName==""))||(string.Compare(tab,tabName,true)==0);
									if(isactive)
									{
										tabcontrol=xe.GetAttribute("control");
										tabtext=xe.GetAttribute("text");
									}
									index++;
								}
							}	
						%>
						</td>
					</tr>
				</table>
			<%
				if(tabcontrol!=null)
				{
					try
					{
						Control ctrl=LoadControl("Tag//Gecko_"+tabcontrol);
						holder1.Controls.Add(ctrl);
					}
					catch
					{
						if(Context.Request.QueryString["_err"]=="2")
							throw;
						%>
			<iframe style="width:378;height:333" src='<%=Context.Request.RawUrl+"&_err=2"%>'></iframe>
			<%
					}
				}
			%>
			<asp:PlaceHolder ID="holder1" Runat="server"></asp:PlaceHolder>
		<div style="text-align:right;padding-top:8px;padding-bottom:2px;padding-right:12px;">		
			<input type="button" id="btn_editinwin" value="[[EditHtml]]" style="width:80px" onclick="btn_editinwin_onclick()">&nbsp;&nbsp;&nbsp;
			<input type="button" id="btnok" value="[[OK]]" style="width:80px" onclick="btnok_onclick()">&nbsp;
			<input type="button" id="btncc" value="[[Cancel]]" style="width:80px" onclick="btncc_onclick()">
		</div>
		</div>
	</body>
	<script>
	
	
	var OxO1a30=["*","tags","all","prototype","btn_editinwin","btncc","btnok","controlparent","display","style","none","innerHTML","","ESC()","onkeydown","keyCode","returnValue","length","skipAutoFireChanged","isnotinput","1","tagName","SELECT","INPUT","TEXTAREA","OnPropertyChange(this)","onpropertychange","if(!syncingtoview)FireUIChanged()","onchange","onkeypress","onkeyup","propertyName","value","checked","changed","attachEvent","on","addEventListener","../colorpicker.aspx","width=505,height=330,resizable=0,toolbars=0,menubar=0,status=0","backgroundColor"];var allGetter=function (){var Ox146=this.getElementsByTagName(OxO1a30[0x0]);var Ox27e=this; Ox146[OxO1a30[0x1]]=function (Ox41c){return Ox27e.getElementsByTagName(Ox41c);}  ;return Ox146;} ; HTMLDocument[OxO1a30[0x3]].__defineGetter__(OxO1a30[0x2],allGetter) ;var btn_editinwin=document.getElementById(OxO1a30[0x4]);var btncc=document.getElementById(OxO1a30[0x5]);var btnok=document.getElementById(OxO1a30[0x6]);var controlparent=document.getElementById(OxO1a30[0x7]); btn_editinwin[OxO1a30[0x9]][OxO1a30[0x8]]=OxO1a30[0xa] ; function btn_editinwin_onclick(){var Oxaf=editor.EditInWindow(element.innerHTML,window);if(Oxaf!=null&&Oxaf!=false){ element[OxO1a30[0xb]]=Oxaf ;} ;}  ; AttachDomEvent(document,OxO1a30[0xe], new Function(OxO1a30[0xc],OxO1a30[0xd])) ; function ESC(){if(event[OxO1a30[0xf]]==0x1b){ top[OxO1a30[0x10]]=false ; top.close() ;} ;}  ; function btnok_onclick(){ SyncTo() ; top[OxO1a30[0x10]]=true ; top.close() ;}  ; function btncc_onclick(){ top[OxO1a30[0x10]]=false ; top.close() ;}  ;if(nocancel){ btncc[OxO1a30[0x9]][OxO1a30[0x8]]=OxO1a30[0xa] ;} ;var syncingtoview=false;var coll=controlparent[OxO1a30[0x2]];if(coll){for(var i=0x0;i<coll[OxO1a30[0x11]];i++){var e=coll[i];if(e[OxO1a30[0x13]]==OxO1a30[0x14]||e.getAttribute(OxO1a30[0x12])){continue ;} ;if(e[OxO1a30[0x15]]==OxO1a30[0x16]||e[OxO1a30[0x15]]==OxO1a30[0x17]||e[OxO1a30[0x15]]==OxO1a30[0x18]){ AttachDomEvent(e,OxO1a30[0x1a], new Function(OxO1a30[0xc],OxO1a30[0x19])) ; AttachDomEvent(e,OxO1a30[0x1c], new Function(OxO1a30[0xc],OxO1a30[0x1b])) ; AttachDomEvent(e,OxO1a30[0x1d], new Function(OxO1a30[0xc],OxO1a30[0x1b])) ; AttachDomEvent(e,OxO1a30[0x1e], new Function(OxO1a30[0xc],OxO1a30[0x1b])) ;} ;} ;} ; SyncToViewInternal() ; setInterval(UpdateState,0x12c) ; function OnPropertyChange(Ox606){if(syncingtoview){return ;} ;if(event[OxO1a30[0x1f]]!=OxO1a30[0x20]&&event[OxO1a30[0x1f]]!=OxO1a30[0x21]){return ;} ; FireUIChanged() ;}  ; function FireUIChanged(){ top[OxO1a30[0x22]]=true ; SyncTo(element) ; UpdateState() ;}  ; function SyncToViewInternal(){ syncingtoview=true ;try{ SyncToView() ; UpdateState() ;} finally{ syncingtoview=false ;} ;}  ; function AttachDomEvent(obj,name,Ox1d5){if(obj[OxO1a30[0x23]]){ obj.attachEvent(OxO1a30[0x24]+name,Ox1d5) ;} ;if(obj[OxO1a30[0x25]]){ obj.addEventListener(name,Ox1d5,true) ;} ;}  ; function SelectColor(Ox19a,Ox566){var Ox567=OxO1a30[0x26]; showModalDialog(Ox567,null,OxO1a30[0x27],function (Ox2dc,Ox18d){if(Ox18d[OxO1a30[0x10]]){ document.getElementById(Ox19a)[OxO1a30[0x20]]=Ox18d[OxO1a30[0x10]].toUpperCase() ; document.getElementById(Ox19a)[OxO1a30[0x9]][OxO1a30[0x28]]=Ox18d[OxO1a30[0x10]] ; Ox566[OxO1a30[0x9]][OxO1a30[0x28]]=Ox18d[OxO1a30[0x10]] ;} ;} ) ;}  ;
	</script>
</html>
