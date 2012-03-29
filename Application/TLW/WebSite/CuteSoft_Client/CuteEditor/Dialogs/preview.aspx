<%@ Page Language="C#" ResponseEncoding="Unicode" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head runat=server ID="Head1">
		<title>[[Preview]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta name="content-type" content="text/html ;charset=Unicode">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='style.css'>
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script>		
			var OxO2457=["onload","availWidth","screen","window","availHeight","contentWindow","idSource","dialogArguments","outerHTML","documentElement","text/html","replace","document","onresize","dialogWidth","value","inc_width","dialogHeight","inc_height","px","dialogTop","dialogLeft","checked","W600","W800","W1024"];var ParentW;var ParentH; window[OxO2457[0x0]]=function (){ ParentW=top[OxO2457[0x3]][OxO2457[0x2]][OxO2457[0x1]] ; ParentH=top[OxO2457[0x3]][OxO2457[0x2]][OxO2457[0x4]] ;var iframe=document.getElementById(OxO2457[0x6])[OxO2457[0x5]];var editdoc=top[OxO2457[0x7]];var Ox17f=editdoc[OxO2457[0x9]][OxO2457[0x8]];var Ox5ea=iframe[OxO2457[0xc]].open(OxO2457[0xa],OxO2457[0xb]); Ox5ea.write(Ox17f) ; Ox5ea.close() ; ShowSizeInfo() ;}  ; window[OxO2457[0xd]]=ShowSizeInfo ; function ShowSizeInfo(){ document.getElementById(OxO2457[0x10])[OxO2457[0xf]]=self[OxO2457[0xe]] ; document.getElementById(OxO2457[0x12])[OxO2457[0xf]]=self[OxO2457[0x11]] ;}  ; function do_cancel(){ top.close() ;}  ; function ResizeThis(Ox2e,h){ self[OxO2457[0xe]]=Ox2e+OxO2457[0x13] ; self[OxO2457[0x11]]=h+OxO2457[0x13] ;var Ox5ef=ParentW/0x2-Ox2e/0x2;var Ox20c=ParentH/0x2-h/0x2; self[OxO2457[0x14]]=Ox20c+OxO2457[0x13] ; self[OxO2457[0x15]]=Ox5ef+OxO2457[0x13] ;switch(Ox2e){case 0x258: document.getElementById(OxO2457[0x17])[OxO2457[0x16]]=true ;break ;case 0x320: document.getElementById(OxO2457[0x18])[OxO2457[0x16]]=true ;break ;case 0x400: document.getElementById(OxO2457[0x19])[OxO2457[0x16]]=true ;break ;;;;} ;}  ;
			
		</script>
	</HEAD>
	<body>
		<form id="formSearch" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="5" width="100%" align="center">
				<tbody>
					<tr>
						<td style="HEIGHT: 100%" colspan="3">
							<iframe id="idSource" name="idSource" src="../template.aspx" scrolling="auto" style="WIDTH: 100%; HEIGHT: 100%"></iframe>
						</td>
					</tr>
					<tr>
						<td>
							<IMG src="../images/print.gif" onclick="window.print();" Alt="[[Print]]" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);">
						</td>
						<td align="right" style="PADDING-LEFT: 30px;" >
							[[Width]]: 
							<input type="text" name="inc_width" id="inc_width" size=5>&nbsp;&nbsp;
							[[Height]]: 
							<input type="text" name="inc_height" id="inc_height" size=5>
						</td>
						<td class="dialogFooter" vAlign="top" align="right" style="PADDING-RIGHT: 13px; PADDING-LEFT: 13px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
							[[Size]]: 
							<input type='radio' name="radio_size" id="W640" onclick='ResizeThis(640,480)'>640x480
							<input type='radio' name="radio_size" id="W800"  onclick='ResizeThis(800,600)'>800x600 
							<input type='radio' name="radio_size" id="W1024" onclick='ResizeThis(1024,768)'>1024x768
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="[[Cancel]]" onclick="do_cancel()">&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</HTML>