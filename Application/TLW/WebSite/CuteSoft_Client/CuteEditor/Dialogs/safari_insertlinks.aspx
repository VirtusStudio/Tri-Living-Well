<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head>
		<title>[[Hyperlink_Information]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta name="content-type" content="text/html ;charset=Unicode">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<script src=Safari_dialog.js></script>
		<link rel="stylesheet" href='Safari_style.css'>
	</head>
	<body>
		
		<fieldset><legend>[[Hyperlink_Information]]</legend>
			<table class="normal">
				<tr>
					<td style="width:60px">[[Url]]:</td>
					<td colspan=3><input type="text" id="inp_src" style="width:260px"></td>
				</tr>
				<tr>
					<td>[[Target]]</td>
					<td><SELECT id="sel_target" NAME="sel_target">
							<OPTION value="">[[NotSet]]</OPTION>
							<OPTION value="_blank">[[Newwindow]]</OPTION>
							<OPTION value="_self">[[Samewindow]]</OPTION>
							<OPTION value="_top">[[Topmostwindow]]</OPTION>
							<OPTION value="_parent">[[Parentwindow]]</OPTION>
						</SELECT>
					</td>
					<td nowrap>[[Color]]:</td>
					<td>
						<input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px">	
						<img id="inp_color_Preview" src="../images/colorpicker.gif" onclick="SelectColor('inp_color','inp_color_preview');" align="absMiddle">
					</td>
				</tr>
				<tr>
					<td style="width:60px">[[Title]]:</td>
					<td colspan=3><input type="text" id="inp_title" style="width:260px"></td>
				</tr>
				<tr>
					<td style="width:60px">[[CssClass]]:</td>
					<td colspan=3><input type="text" id="inp_cssclass" style="width:260px"></td>
				</tr>
			</table>
		</fieldset>
		<div style="text-align:right;padding-top:8px;padding-bottom:2px;padding-right:12px;">		
			<input type="button" id="btnok" value="[[OK]]" style="width:80px" onclick="SyncTo();top.close();">&nbsp;
			<input type="button" id="btncc" value="[[Cancel]]" style="width:80px" onclick="top.close();">
		</div>
	</body>
</html>

<script>
	
	var OxO9725=["availWidth","availHeight","dialogArguments","opener","editor","editdoc","","h","inp_src","sel_target","inp_cssclass","inp_title","inp_color","inp_color_Preview","A","value","href","innerHTML","title","className","selectedIndex","target","color","style","class","DIV","Delete"]; window.resizeTo(0x1cc,0xd6) ; window.moveTo((screen[OxO9725[0x0]]-0x258)/0x2,(screen[OxO9725[0x1]]-0x190)/0x2) ;var obj=window[OxO9725[0x3]][OxO9725[0x2]];var editor=obj[OxO9725[0x4]];var editdoc=obj[OxO9725[0x5]]; window.focus() ;var linkhtml=OxO9725[0x6]; linkhtml=obj[OxO9725[0x7]] ;var inp_src=document.getElementById(OxO9725[0x8]);var sel_target=document.getElementById(OxO9725[0x9]);var inp_cssclass=document.getElementById(OxO9725[0xa]);var inp_title=document.getElementById(OxO9725[0xb]);var inp_color=document.getElementById(OxO9725[0xc]);var inp_color_Preview=document.getElementById(OxO9725[0xd]); function SyncToView(){if(element){} ;}  ; function SyncTo(){var Ox146=document.createElement(OxO9725[0xe]); Ox146[OxO9725[0x10]]=inp_src[OxO9725[0xf]] ; Ox146[OxO9725[0x11]]=linkhtml ;if(linkhtml=OxO9725[0x6]&&inp_title[OxO9725[0xf]]){ Ox146[OxO9725[0x11]]=inp_title[OxO9725[0xf]] ;} else { Ox146[OxO9725[0x12]]=inp_title[OxO9725[0xf]] ;} ; Ox146[OxO9725[0x13]]=inp_cssclass[OxO9725[0xf]] ;if(sel_target[OxO9725[0x14]]!=-0x1){ Ox146[OxO9725[0x15]]=sel_target[OxO9725[0xf]] ;} ;try{ Ox146[OxO9725[0x17]][OxO9725[0x16]]=inp_color[OxO9725[0xf]]||OxO9725[0x6] ;} catch(x){ Ox146[OxO9725[0x17]][OxO9725[0x16]]=OxO9725[0x6] ;} ;if(Ox146[OxO9725[0x12]]==OxO9725[0x6]){ Ox146.removeAttribute(OxO9725[0x12]) ;} ;if(Ox146[OxO9725[0x15]]==OxO9725[0x6]){ Ox146.removeAttribute(OxO9725[0x15]) ;} ;if(Ox146[OxO9725[0x13]]==OxO9725[0x6]){ Ox146.removeAttribute(OxO9725[0x18]) ;} ;var div=document.createElement(OxO9725[0x19]); div.appendChild(Ox146) ; editdoc.execCommand(OxO9725[0x1a],false,OxO9725[0x6]) ; editor.PasteHTML(div.innerHTML) ; top.close() ;}  ; function SelectColor(Ox683,Ox19a){var Ox3b6= new ColorPicker(Ox19a,Ox683); Ox3b6.showPopup() ;}  ;
</script>

