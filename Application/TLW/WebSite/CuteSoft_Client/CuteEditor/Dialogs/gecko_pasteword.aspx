<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head>
		<title>[[PasteWord]] 
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
		<link rel="stylesheet" href='gecko_style.css'>
		<script src=gecko_dialog.js></script><script src=../_shared.js></script>
		<script language="javascript">
			var OxO4595=["availWidth","availHeight","dialogArguments","onload","contentWindow","htmlSource","designMode","document","on","contentEditable","body","fontFamily","style","Tahoma","fontSize","11px","color","black","background","white","innerHTML","length","returnValue","","\x3C$1B\x3E ","\x3C$1I\x3E ","\x3CP\x3E","\x0A\x3CT","\x3CTD\x3E","\x0A\x3C/TR\x3E","\x3C/TR\x3E"]; window.resizeTo(0x1c2,0x190) ; window.moveTo((screen[OxO4595[0x0]]-0x258)/0x2,(screen[OxO4595[0x1]]-0x190)/0x2) ;var editor=top[OxO4595[0x2]]; window[OxO4595[0x3]]=function (){var iframe=document.getElementById(OxO4595[0x5])[OxO4595[0x4]]; iframe[OxO4595[0x7]][OxO4595[0x6]]=OxO4595[0x8] ; iframe[OxO4595[0x7]][OxO4595[0xa]][OxO4595[0x9]]=true ; iframe[OxO4595[0x7]][OxO4595[0xa]][OxO4595[0xc]][OxO4595[0xb]]=OxO4595[0xd] ; iframe[OxO4595[0x7]][OxO4595[0xa]][OxO4595[0xc]][OxO4595[0xe]]=OxO4595[0xf] ; iframe[OxO4595[0x7]][OxO4595[0xa]][OxO4595[0xc]][OxO4595[0x10]]=OxO4595[0x11] ; iframe[OxO4595[0x7]][OxO4595[0xa]][OxO4595[0xc]][OxO4595[0x12]]=OxO4595[0x13] ; iframe.focus() ;}  ; function insertContent(){var iframe=document.getElementById(OxO4595[0x5])[OxO4595[0x4]];var Ox4db=iframe[OxO4595[0x7]][OxO4595[0xa]][OxO4595[0x14]];if(Ox4db&&Ox4db[OxO4595[0x15]]>0x0){ top[OxO4595[0x16]]=_CleanCode(Ox4db) ; top.close() ;} ;}  ; function _CleanCode(h){ h=h.replace(/<st1:.*>/g,OxO4595[0x17]) ; h=h.replace(/<(\/)?strong>/ig,OxO4595[0x18]) ; h=h.replace(/<(\/)?em>/ig,OxO4595[0x19]) ; h=h.replace(/<P class=[^>]*>/gi,OxO4595[0x1a]) ; h=h.replace(/<\\?\??xml[^>]>/gi,OxO4595[0x17]) ; h=h.replace(/<\/?\w+:[^>]*>/gi,OxO4595[0x17]) ; h=h.replace(/<SPAN[^>]*>/gi,OxO4595[0x17]) ; h=h.replace(/<\/SPAN>/gi,OxO4595[0x17]) ; h=h.replace(/<TBODY>/gi,OxO4595[0x17]) ; h=h.replace(/<\/TBODY>/gi,OxO4595[0x17]) ; h=h.replace(/<T/gi,OxO4595[0x1b]) ; h=h.replace(/<TD>\n/gi,OxO4595[0x1c]) ; h=h.replace(/<\/TR>/gi,OxO4595[0x1d]) ; h=h.replace(/<\/TR>\n/gi,OxO4595[0x1e]) ;return h;}  ;
		</script>
	</HEAD>
	<body>
		<table border="0" cellpadding="0" cellspacing="2" align="center" height="100%" width="100%">
        <tr>
            <td class="title">[[PasteWord]]</td>
            <td align="right" nowrap="nowrap">
            </td> 
        </tr>
        <tr>
            <td colspan="2">[[UseCtrl_VtoPaste]]</td>
        </tr>
        <tr>
            <td colspan="2" align="center" height="100%">
                <iframe id="htmlSource" contenteditable="true" src="../template.aspx" scrolling="yes" style="width: 100%; height: 100%;background-color:white;border:1px solid #000;"></iframe>
			</td>
        </tr>
        <tr>
            <td width="50%" align="left"><input type="button" id="insert" name="insert" value="[[Insert]]" onclick="insertContent();" /></td>
            <td width="50%" align="right"><input type="button" value="[[Cancel]]" onclick="window.close();" /></td>
        </tr>
    </table>
</body>
</HTML>
