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
		<link rel="stylesheet" href='Safari_style.css'>
		<script language="javascript">
			var OxO24dc=["availWidth","availHeight","onload","contentWindow","htmlSource","designMode","document","on","contentEditable","body","fontFamily","style","Tahoma","fontSize","11px","color","black","background","white","innerHTML","length","dialogArguments","opener","editor","editdoc","Delete","","\x3C$1B\x3E ","\x3C$1I\x3E ","\x3CP\x3E","\x0A\x3CT","\x3CTD\x3E","\x0A\x3C/TR\x3E","\x3C/TR\x3E"]; window.resizeTo(0x1c2,0x190) ; window.moveTo((screen[OxO24dc[0x0]]-0x258)/0x2,(screen[OxO24dc[0x1]]-0x190)/0x2) ; window.focus() ; window[OxO24dc[0x2]]=function (){var iframe=document.getElementById(OxO24dc[0x4])[OxO24dc[0x3]]; iframe[OxO24dc[0x6]][OxO24dc[0x5]]=OxO24dc[0x7] ; iframe[OxO24dc[0x6]][OxO24dc[0x9]][OxO24dc[0x8]]=true ; iframe[OxO24dc[0x6]][OxO24dc[0x9]][OxO24dc[0xb]][OxO24dc[0xa]]=OxO24dc[0xc] ; iframe[OxO24dc[0x6]][OxO24dc[0x9]][OxO24dc[0xb]][OxO24dc[0xd]]=OxO24dc[0xe] ; iframe[OxO24dc[0x6]][OxO24dc[0x9]][OxO24dc[0xb]][OxO24dc[0xf]]=OxO24dc[0x10] ; iframe[OxO24dc[0x6]][OxO24dc[0x9]][OxO24dc[0xb]][OxO24dc[0x11]]=OxO24dc[0x12] ; iframe.focus() ;}  ; function insertContent(){var iframe=document.getElementById(OxO24dc[0x4])[OxO24dc[0x3]];var Ox4db=iframe[OxO24dc[0x6]][OxO24dc[0x9]][OxO24dc[0x13]];if(Ox4db&&Ox4db[OxO24dc[0x14]]>0x0){var obj=window[OxO24dc[0x16]][OxO24dc[0x15]];var editor=obj[OxO24dc[0x17]];var editdoc=obj[OxO24dc[0x18]]; editdoc.execCommand(OxO24dc[0x19],false,OxO24dc[0x1a]) ; editor.PasteHTML(_CleanCode(Ox4db)) ; top.close() ;} ;}  ; function _CleanCode(h){ h=h.replace(/<st1:.*>/g,OxO24dc[0x1a]) ; h=h.replace(/<(\/)?strong>/ig,OxO24dc[0x1b]) ; h=h.replace(/<(\/)?em>/ig,OxO24dc[0x1c]) ; h=h.replace(/<P class=[^>]*>/gi,OxO24dc[0x1d]) ; h=h.replace(/<\\?\??xml[^>]>/gi,OxO24dc[0x1a]) ; h=h.replace(/<\/?\w+:[^>]*>/gi,OxO24dc[0x1a]) ; h=h.replace(/<SPAN[^>]*>/gi,OxO24dc[0x1a]) ; h=h.replace(/<\/SPAN>/gi,OxO24dc[0x1a]) ; h=h.replace(/<TBODY>/gi,OxO24dc[0x1a]) ; h=h.replace(/<\/TBODY>/gi,OxO24dc[0x1a]) ; h=h.replace(/<T/gi,OxO24dc[0x1e]) ; h=h.replace(/<TD>\n/gi,OxO24dc[0x1f]) ; h=h.replace(/<\/TR>/gi,OxO24dc[0x20]) ; h=h.replace(/<\/TR>\n/gi,OxO24dc[0x21]) ;return h;}  ;
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
            <td colspan="2">[[UseApple_VtoPaste]]</td>
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
