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
		var OxO5ed8=["dialogArguments","keyboard_area","length","value"];var editor=top[OxO5ed8[0x0]]; function do_insert(){var Ox6b2=document.getElementById(OxO5ed8[0x1]);if(Ox6b2[OxO5ed8[0x3]][OxO5ed8[0x2]]>0x0){ editor.PasteHTML(Ox6b2.value) ;} ;}  ; function do_cancel(){ top.close() ;}  ;
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
