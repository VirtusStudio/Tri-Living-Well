<%@ Page Language="C#" ResponseEncoding="Unicode" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head>
		<title>[[CodeEditor]] 
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
		<link rel="stylesheet" href='style.css'>
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script>
			var OxOff8e=["dialogArguments","editor","window","document","onload","contentWindow","idSource","innerHTML","body","contentEditable","clearAttributes","marginTop","style","4","marginLeft","10","fontFamily","Tahoma","fontSize","11px","color","black","background","white","selection","type","None"];var obj=top[OxOff8e[0x0]];var editor=obj[OxOff8e[0x1]];var editwin=obj[OxOff8e[0x2]];var editdoc=obj[OxOff8e[0x3]]; window[OxOff8e[0x4]]=function (){var iframe=document.getElementById(OxOff8e[0x6])[OxOff8e[0x5]]; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0x7]]=editdoc[OxOff8e[0x8]][OxOff8e[0x7]] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0x9]]=true ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xa]] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xc]][OxOff8e[0xb]]=OxOff8e[0xd] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xc]][OxOff8e[0xe]]=OxOff8e[0xf] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xc]][OxOff8e[0x10]]=OxOff8e[0x11] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xc]][OxOff8e[0x12]]=OxOff8e[0x13] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xc]][OxOff8e[0x14]]=OxOff8e[0x15] ; iframe[OxOff8e[0x3]][OxOff8e[0x8]][OxOff8e[0xc]][OxOff8e[0x16]]=OxOff8e[0x17] ; iframe.focus() ;}  ; function DoCommand(Ox4e2,Ox4e3){var iframe=document.getElementById(OxOff8e[0x6])[OxOff8e[0x5]];var Ox305=iframe[OxOff8e[0x3]][OxOff8e[0x18]].createRange();var Ox4e4=iframe[OxOff8e[0x3]][OxOff8e[0x18]][OxOff8e[0x19]];var Ox4e5=(Ox4e4==OxOff8e[0x1a]?iframe[OxOff8e[0x3]]:Ox305); Ox4e5.execCommand(Ox4e2,false,Ox4e3) ;}  ; function do_update(){ top.close() ;}  ; function do_cancel(){ top.close() ;}  ; function do_ok(){ top.close() ;}  ;		
			
		</script>
	</HEAD>
	<body>
		<form id="formSearch" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="0" width="100%" align="center">
				<tbody>
					<tr>
						<td style="padding:4px 0 1px 4px">
							<IMG src="../Themes/Custom/images/Cut.gif" onclick="DoCommand('Cut');" Alt="[[Cut]]" class="dialogButton"	onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> 
							<IMG src="../Themes/Custom/images/Copy.gif" onclick="DoCommand('Copy');" Alt="[[Copy]]" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> 
							<IMG src="../Themes/Custom/images/Paste.gif" onclick="DoCommand('Paste');" Alt="[[Paste]]" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> 
							<IMG src="../Themes/Custom/images/Undo.gif" onclick="DoCommand('Undo');" Alt="[[Undo]]" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);">
							<IMG src="../Themes/Custom/images/Redo.gif" onclick="DoCommand('Redo');" Alt="[[Redo]]" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);">
							<IMG src="../Themes/Custom/images/find.gif" onclick="DoCommand('Find');" Alt="[[Find]]" class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);">
						</td>
					</tr>
					<tr>
						<td style="HEIGHT: 100%">
							<iframe id="idSource" name="idSource" src="../template.aspx" scrolling="auto" style="WIDTH: 100%; HEIGHT: 100%"></iframe>
						</td>
					</tr>
					<tr>
						<td class="dialogFooter" vAlign="top" align="right" style="PADDING-RIGHT: 13px; PADDING-LEFT: 13px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
							<table cellSpacing="0" cellPadding="1">
								<tbody>
									<tr>
										<td width="100%">&#160;
											<input id="inpWrap" start="fileopen" type="checkbox"  CHECKED="true" size="20" value="on" name="inpWrap" /> <span id="txtLang" name="txtLang">Wrap Text</span> 
										</td>
										<td>
											<input type="button" value="[[Update]]" onclick="do_update()">&nbsp;
											<input type="button" value="[[Cancel]]" onclick="do_cancel()">&nbsp;
											<input type="button" value="[[OK]]" onclick="do_ok()">
										</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</HTML>