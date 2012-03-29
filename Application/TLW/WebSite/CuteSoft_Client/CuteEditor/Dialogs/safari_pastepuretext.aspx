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
			var OxO7f7f=["availWidth","availHeight","value","htmlSource","length","","dialogArguments","opener","editor","editdoc","Delete"]; window.resizeTo(0x1c2,0x190) ; window.moveTo((screen[OxO7f7f[0x0]]-0x258)/0x2,(screen[OxO7f7f[0x1]]-0x190)/0x2) ; window.focus() ; function insertContent(){var Ox4db=document.getElementById(OxO7f7f[0x3])[OxO7f7f[0x2]];if(Ox4db&&Ox4db[OxO7f7f[0x4]]>0x0){ Ox4db=Ox4db.replace(/<\?[^>]*>/ig,OxO7f7f[0x5]) ;var obj=window[OxO7f7f[0x7]][OxO7f7f[0x6]];var editor=obj[OxO7f7f[0x8]];var editdoc=obj[OxO7f7f[0x9]]; editdoc.execCommand(OxO7f7f[0xa],false,OxO7f7f[0x5]) ; editor.PasteHTML(Ox4db) ; top.close() ;} ;}  ;
		</script>
	</HEAD>
	<body>
		<table border="0" cellpadding="0" cellspacing="2" align="center" width="100%">
        <tr>
            <td class="title">[[PasteText]]</td>
            <td align="right" nowrap="nowrap">
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

