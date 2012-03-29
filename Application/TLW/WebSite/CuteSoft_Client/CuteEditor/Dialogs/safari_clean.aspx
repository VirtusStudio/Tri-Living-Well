<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head runat=server ID="Head1" NAME="Head1">
		<title>[[CleanCode]] 
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
		<link rel="stylesheet" href='Safari_style.css'>
		<script language="javascript">
			var OxOa90a=["availWidth","availHeight","dialogArguments","opener","ig","","\x3C/?[^\x3E]*\x3E","\x3C\x5C?xml[^\x3E]*\x3E","\x3C/?[a-z]+:[^\x3E]*\x3E","(\x3C[^\x3E]+) class=[^ |^\x3E]*([^\x3E]*\x3E)","$1 $2","(\x3C[^\x3E]+) style=\x22[^\x22]*\x22([^\x3E]*\x3E)","\x3Cspan[^\x3E]*\x3E\x3C/span[^\x3E]*\x3E","\x3Cspan\x3E\x3Cspan\x3E","\x3Cspan\x3E","\x3C/span\x3E\x3C/span\x3E","\x3C/span\x3E","[ ]*\x3E","\x3E","\x3C/?font[^\x3E]*\x3E","\x3C/?span[^\x3E]*\x3E","span","font","css","word","allhtml"]; window.resizeTo(0xf0,0xe1) ; window.focus() ; window.moveTo((screen[OxOa90a[0x0]]-0x258)/0x2,(screen[OxOa90a[0x1]]-0x190)/0x2) ;var editor=window[OxOa90a[0x3]][OxOa90a[0x2]]; function execRE(Ox180,Ox4da,Ox4db){ oReg= new RegExp(Ox180,OxOa90a[0x4]) ;return Ox4db.replace(oReg,Ox4da);}  ; function getContent(){if(editor.getHTML()){return editor.getHTML();} else {return OxOa90a[0x5];} ;}  ; function setContent(Ox4db){try{ editor.setHTML(Ox4db) ;} catch(e){} ;}  ; function codeCleaner(Ox318){var Ox4db=getContent();switch(Ox318){case OxOa90a[0x19]: Ox4db=execRE(OxOa90a[0x6],OxOa90a[0x5],Ox4db) ;break ;case OxOa90a[0x18]: Ox4db=execRE(OxOa90a[0x7],OxOa90a[0x5],Ox4db) ; Ox4db=execRE(OxOa90a[0x8],OxOa90a[0x5],Ox4db) ; Ox4db=execRE(OxOa90a[0x9],OxOa90a[0xa],Ox4db) ; Ox4db=execRE(OxOa90a[0xb],OxOa90a[0xa],Ox4db) ; Ox4db=execRE(OxOa90a[0xc],OxOa90a[0x5],Ox4db) ; Ox4db=execRE(OxOa90a[0xd],OxOa90a[0xe],Ox4db) ; Ox4db=execRE(OxOa90a[0xf],OxOa90a[0x10],Ox4db) ; Ox4db=execRE(OxOa90a[0x11],OxOa90a[0x12],Ox4db) ;break ;case OxOa90a[0x17]: Ox4db=execRE(OxOa90a[0x9],OxOa90a[0xa],Ox4db) ; Ox4db=execRE(OxOa90a[0xb],OxOa90a[0xa],Ox4db) ;break ;case OxOa90a[0x16]: Ox4db=execRE(OxOa90a[0x13],OxOa90a[0x5],Ox4db) ;break ;case OxOa90a[0x15]: Ox4db=execRE(OxOa90a[0x14],OxOa90a[0x5],Ox4db) ;break ;;;;;;} ; setContent(Ox4db) ;}  ;
		</script>
		<style type=text/css>
			.codebutton
			{
				width:200px; 
				height:30px; 
				TEXT-ALIGN: left; 
				font:normal 9pt MS Sans Serif;
			    padding: 1px 3px 1px 3px;
				color: #000;		
				BACKGROUND-COLOR: #d7d3cc;
				BORDER-RIGHT: buttonshadow 1px solid; BORDER-TOP: buttonhighlight 1px solid; BORDER-LEFT: buttonhighlight 1px solid; BORDER-BOTTOM: buttonshadow 1px solid; VERTICAL-ALIGN: middle;
			}
		</style>

	</HEAD>
	<body>
			<fieldset title="Code Sweeper" style="padding:5px 5px 10px 5px;" align="middle">
				<legend>[[CleanCode]]</legend>
				<table border="0" cellspacing="0" cellpadding="5" width="100%"  class="normal">
					<tr>
						<td align="left">
							<input type="button" onclick="codeCleaner('allhtml');" value="[[RemoveHTMLTags]]">&nbsp;
						</td>
					</tr>
					<tr>
						<td align="left">
							<input type="button" onclick="codeCleaner('word');" value="[[RemoveWordMarkup]]">&nbsp;
						</td>
					</tr>
					<tr>
						<td align="left">
							<input type="button" onclick="codeCleaner('css');" value="[[CleanupCSS]]">&nbsp;
						</td>
					</tr>
					<tr>
						<td align="left">
							<input type="button" onclick="codeCleaner('font');" value="[[CleanupFont]] ">&nbsp;
						</td>
					</tr>
					<tr>
						<td align="left">
							<input type="button" onclick="codeCleaner('span');" value="[[CleanupSpan]]">&nbsp;
						</td>
					</tr>
				</table>				
			</fieldset>
		<div style="margin-top:8px;width:60%; text-align:center">
			<input class="inputbuttoncancel" type="button" value="[[Cancel]]" style="width:80px" onClick="window.close();">
		</div>
</body>
</HTML>
