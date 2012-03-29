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
		<link rel="stylesheet" href='gecko_style.css'>
		<script src=gecko_dialog.js></script><script src=../_shared.js></script>
		<script language="javascript">
			var OxO4ecf=["dialogArguments","ig","","\x3C/?[^\x3E]*\x3E","\x3C\x5C?xml[^\x3E]*\x3E","\x3C/?[a-z]+:[^\x3E]*\x3E","(\x3C[^\x3E]+) class=[^ |^\x3E]*([^\x3E]*\x3E)","$1 $2","(\x3C[^\x3E]+) style=\x22[^\x22]*\x22([^\x3E]*\x3E)","\x3Cspan[^\x3E]*\x3E\x3C/span[^\x3E]*\x3E","\x3Cspan\x3E\x3Cspan\x3E","\x3Cspan\x3E","\x3C/span\x3E\x3C/span\x3E","\x3C/span\x3E","[ ]*\x3E","\x3E","\x3C/?font[^\x3E]*\x3E","\x3C/?span[^\x3E]*\x3E","span","font","css","word","allhtml"]; window.resizeTo(0xf0,0x145) ;var editor=top[OxO4ecf[0x0]]; function execRE(Ox180,Ox4da,Ox4db){ oReg= new RegExp(Ox180,OxO4ecf[0x1]) ; r=Ox4db.replace(oReg,Ox4da) ;return r;}  ; function getContent(){if(editor.getHTML()){return editor.getHTML();} else {return OxO4ecf[0x2];} ;}  ; function setContent(Ox4db){try{ editor.setHTML(Ox4db) ;} catch(e){} ;}  ; function codeCleaner(Ox318){var Ox4db=getContent();switch(Ox318){case OxO4ecf[0x16]: Ox4db=execRE(OxO4ecf[0x3],OxO4ecf[0x2],Ox4db) ;break ;case OxO4ecf[0x15]: Ox4db=execRE(OxO4ecf[0x4],OxO4ecf[0x2],Ox4db) ; Ox4db=execRE(OxO4ecf[0x5],OxO4ecf[0x2],Ox4db) ; Ox4db=execRE(OxO4ecf[0x6],OxO4ecf[0x7],Ox4db) ; Ox4db=execRE(OxO4ecf[0x8],OxO4ecf[0x7],Ox4db) ; Ox4db=execRE(OxO4ecf[0x9],OxO4ecf[0x2],Ox4db) ; Ox4db=execRE(OxO4ecf[0xa],OxO4ecf[0xb],Ox4db) ; Ox4db=execRE(OxO4ecf[0xc],OxO4ecf[0xd],Ox4db) ; Ox4db=execRE(OxO4ecf[0xe],OxO4ecf[0xf],Ox4db) ;break ;case OxO4ecf[0x14]: Ox4db=execRE(OxO4ecf[0x6],OxO4ecf[0x7],Ox4db) ; Ox4db=execRE(OxO4ecf[0x8],OxO4ecf[0x7],Ox4db) ;break ;case OxO4ecf[0x13]: Ox4db=execRE(OxO4ecf[0x10],OxO4ecf[0x2],Ox4db) ;break ;case OxO4ecf[0x12]: Ox4db=execRE(OxO4ecf[0x11],OxO4ecf[0x2],Ox4db) ;break ;;;;;;} ; setContent(Ox4db) ;}  ;
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
					<tr><td align="left"><button class="codebutton" onClick="codeCleaner('allhtml');"><IMG src="../Images/code.gif" align="absMiddle" border="0"/> [[RemoveHTMLTags]] </button> <br/></td></tr>
					<tr><td align="left"><button class="codebutton" onClick="codeCleaner('word');"><IMG src="../Images/doc.gif" align="absMiddle" border="0"/> [[RemoveWordMarkup]] </button> <br/></td></tr>
					<tr><td align="left"><button class="codebutton" onClick="codeCleaner('css');"><IMG src="../Images/style.font.gif" align="absMiddle" border="0"/> [[CleanupCSS]] </button> <br/></td></tr>
					<tr><td align="left"><button class="codebutton" onClick="codeCleaner('font');"><IMG src="../Images/fontend.gif" align="absMiddle" border="0"/> [[CleanupFont]] </button> <br/></td></tr>
					<tr><td align="left"><button class="codebutton" onClick="codeCleaner('span');"><IMG src="../Images/spanend.gif" align="absMiddle" border="0"/> [[CleanupSpan]] </button> <br/></td></tr>
				</table>				
			</fieldset>
		<div style="margin-top:8px;width:60%; text-align:center">
			<input class="inputbuttoncancel" type="button" value="[[Cancel]]" style="width:80px" onClick="window.close();">
		</div>
</body>
</HTML>
