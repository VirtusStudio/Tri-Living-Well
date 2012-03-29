<%@ Page Language="C#" ResponseEncoding="Unicode" Inherits="CuteEditor.EditorUtilityPage"  %>
<HTML>
	<head>
		<title>[[Find]] 
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
	</HEAD>
	<body>
		<form method="post">
			<table border="0" cellspacing="2" cellpadding="5" width="96%" align="center">
				<tr>
					<td class="normal" valign="top">
						<table border="0" cellspacing="2" cellpadding="5" width="100%"  class="normal" align="center">
							<tr>
								<td valign="top" nowrap>[[Find what]]: </td>
								<td valign="top"><INPUT TYPE=TEXT SIZE=30 NAME=stringSearch id="stringSearch" style="width : 180px;"></td>
							</tr>
							<tr>
								<td valign="top" nowrap>[[Replace with]]: </td>
								<td valign="top"><INPUT TYPE=TEXT SIZE=30 NAME=stringReplace id="stringReplace" style="width : 180px;"></td>
							</tr>
						</table> 
						<INPUT TYPE=Checkbox SIZE=40 NAME=MatchWholeWord id="MatchWholeWord">[[Match whole word]]<br>
						<INPUT TYPE=Checkbox SIZE=40 NAME=MatchCase id="MatchCase">[[Match case]]
					</td>
					<td valign="top" class="normal">
						<button name="Find" style="width:75px; height:22px;  margin-top:3px" onClick="FindTxt();">[[Find Next]]</button><br>
						<button name="Replace" style="width:75px; height:22px;  margin-top:7px" onClick="ReplaceTxt();">[[Replace]]</button><br>
						<button name="Replaceall" style="width:75px; height:22px;  margin-top:7px" onClick="ReplaceAllTxt();">[[Replace All]]</button><br>
						<button name="Cancel" style="width:75px; height:22px;  margin-top:7px" onClick="window.close();">[[Cancel]]</button><br>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
	
		<script language="javascript">
			
			var OxOf0c1=["dialogArguments","MatchCase","MatchWholeWord","stringSearch","stringReplace","selection","document","checked","length","value","Nothing to search.\x0APlease enter some text in the field labeled Find what:","Finished Searching the document. Would you like to start again from the top?","textedit","text","","Word not found. Nothing replaced."," word(s) were replaced."];var editwin=top[OxOf0c1[0x0]];var MatchCase=document.getElementById(OxOf0c1[0x1]);var MatchWholeWord=document.getElementById(OxOf0c1[0x2]);var stringSearch=document.getElementById(OxOf0c1[0x3]);var stringReplace=document.getElementById(OxOf0c1[0x4]);var TxtRange; TxtRange=editwin[OxOf0c1[0x6]][OxOf0c1[0x5]].createRange() ; function matchtype(){var Ox504=0x0;var Ox505=0x0;var Ox506=0x0;if(MatchCase[OxOf0c1[0x7]]){ Ox505=0x4 ;} ;if(MatchWholeWord[OxOf0c1[0x7]]){ Ox506=0x2 ;} ; Ox504=Ox505+Ox506 ;return (Ox504);}  ; function checkInputString(){if(stringSearch[OxOf0c1[0x9]][OxOf0c1[0x8]]<0x1){ alert(OxOf0c1[0xa]) ;return false;} else {return true;} ;}  ; function FindTxt(){if(checkInputString()){var Ox509=stringSearch[OxOf0c1[0x9]]; TxtRange.collapse(false) ;if(TxtRange.findText(Ox509,0x3b9aca00,matchtype())){ TxtRange.select() ;} else {var Ox50a=confirm(OxOf0c1[0xb]);if(Ox50a){ TxtRange.expand(OxOf0c1[0xc]) ; TxtRange.collapse() ; TxtRange.select() ; FindTxt() ;} ;} ;} ;}  ; function ReplaceTxt(){if(checkInputString()){if(MatchCase[OxOf0c1[0x7]]){if(TxtRange[OxOf0c1[0xd]]==stringSearch[OxOf0c1[0x9]]){ TxtRange[OxOf0c1[0xd]]=stringReplace[OxOf0c1[0x9]] ;} ;} else {if(TxtRange[OxOf0c1[0xd]].toLowerCase()==stringSearch[OxOf0c1[0x9]].toLowerCase()){ TxtRange[OxOf0c1[0xd]]=stringReplace[OxOf0c1[0x9]] ;} ;} ; FindTxt() ;} ;}  ; function ReplaceAllTxt(){if(checkInputString()){var Ox509=stringSearch[OxOf0c1[0x9]];var Ox50d=0x0;var Ox1dc=OxOf0c1[0xe]; TxtRange.expand(OxOf0c1[0xc]) ; TxtRange.collapse() ; TxtRange.select() ;while(TxtRange.findText(Ox509,0x3b9aca00,matchtype())){ TxtRange.select() ; TxtRange[OxOf0c1[0xd]]=stringReplace[OxOf0c1[0x9]] ; Ox50d++ ;} ;if(Ox50d==0x0){ Ox1dc=OxOf0c1[0xf] ;} else { Ox1dc=Ox50d+OxOf0c1[0x10] ;} ; alert(Ox1dc) ;} ;}  ;
		</script>