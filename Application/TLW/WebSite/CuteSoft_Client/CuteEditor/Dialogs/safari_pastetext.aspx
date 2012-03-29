<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head>
		<title>[[PasteText]] 
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
			var OxOa777=["availWidth","availHeight","value","htmlSource","length","checked","linebreaks","\x0D\x0A","ig","\x3Cbr /\x3E","\x0D","\x0A","dialogArguments","opener","editor","editdoc","Delete",""]; window.resizeTo(0x1c2,0x190) ; window.moveTo((screen[OxOa777[0x0]]-0x258)/0x2,(screen[OxOa777[0x1]]-0x190)/0x2) ; window.focus() ; function insertContent(){var Ox4db=document.getElementById(OxOa777[0x3])[OxOa777[0x2]];if(Ox4db&&Ox4db[OxOa777[0x4]]>0x0){if(document.getElementById(OxOa777[0x6])[OxOa777[0x5]]){ Ox4db=Ox4db.replace(( new RegExp(OxOa777[0x7],OxOa777[0x8])),OxOa777[0x9]) ; Ox4db=Ox4db.replace(( new RegExp(OxOa777[0xa],OxOa777[0x8])),OxOa777[0x9]) ; Ox4db=Ox4db.replace(( new RegExp(OxOa777[0xb],OxOa777[0x8])),OxOa777[0x9]) ;} ;var obj=window[OxOa777[0xd]][OxOa777[0xc]];var editor=obj[OxOa777[0xe]];var editdoc=obj[OxOa777[0xf]]; editdoc.execCommand(OxOa777[0x10],false,OxOa777[0x11]) ; editor.PasteHTML(Ox4db) ; top.close() ;} ;}  ;
		</script>
	</HEAD>
	<body>
		<table border="0" cellpadding="0" cellspacing="2" align="center" width="100%">
        <tr>
            <td class="title">[[PasteText]]</td>
            <td align="right" nowrap="nowrap">
                <input type="checkbox" name="linebreaks" id="linebreaks" checked="checked" />[[KeepLinebreaks]]
            </td> 
        </tr>
        <tr>
            <td colspan="2">[[UseApple_VtoPaste]]</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <textarea name="htmlSource" id="htmlSource"  rows="15" cols="100" style="width: 430; height: 250; font-family: 'Courier New',Courier,mono; font-size: 12px;" dir="ltr" wrap="soft"></textarea>
            </td>
        </tr>
        <tr>
			<td align=left>
				<input type="button" value="[[CleanUpBox]]" onclick="document.getElementById('htmlSource').value='';" />
			</td>
            <td align=right>
				<input type="button" id="insert" name="insert" value="[[Insert]]" onclick="insertContent();" />&nbsp;&nbsp;&nbsp;
				<input type="button" value="[[Cancel]]" onclick="window.close();" />
			</td>
        </tr>
    </table>
</body>
</HTML>

