<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head>
		<title></title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel=stylesheet href='style.css' >
		<style>
		body,textarea,input,td,select{font:normal 9pt MS Sans Serif;}
		div		{position:absolute;}
		.simple	{font-size:11pt;}
		.double	{font-size:9pt;}
		.simpledia	{font-size:11pt;color:red}
		.doubledia	{font-size:9pt;color:red}
		.action	{font-size:7pt;color:white;}
		.clavier	{font-size:7pt;color:blue;}
		.sign		{font-size:7pt;color:gray;}
		</style>
		<script>
		var OxO7ba5=["availWidth","availHeight","dialogArguments","opener","editor","editdoc","keyboard_area","length","value","Delete",""]; window.focus() ; window.moveTo((screen[OxO7ba5[0x0]]-0x258)/0x2,(screen[OxO7ba5[0x1]]-0x190)/0x2) ;var obj=window[OxO7ba5[0x3]][OxO7ba5[0x2]];var editor=obj[OxO7ba5[0x4]];var editdoc=obj[OxO7ba5[0x5]]; function do_insert(){var Ox6b2=document.getElementById(OxO7ba5[0x6]);if(Ox6b2[OxO7ba5[0x8]][OxO7ba5[0x7]]>0x0){ editdoc.execCommand(OxO7ba5[0x9],false,OxO7ba5[0xa]) ; editor.PasteHTML(Ox6b2.value) ; top.close() ;} ;}  ; function do_cancel(){ top.close() ;}  ;
		</script>
	</HEAD>
		<body>
		<textarea id="keyboard_area" cols="40" rows="4" style="width:100%;height:60px;"></textarea>
		<script language="javascript" src="keyboard-data.js"></script>
		<script language="javascript" src="keyboard-diacritic.js"></script>
		<script language="javascript" src="keyboard-dialogue.js"></script>
		<script language="javascript" src="keyboard-multihexa.js"></script>
		<div align="center" style="width: 300px; position: absolute; height: 30px; left:60px;top:235px">
			<input type="button" value="[[Insert]]" onclick="do_insert()">&nbsp;
			<input type="button" value="[[Cancel]]" onclick="do_cancel()">
		</div>
		</body>
	</html>
</HTML>
