<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
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
		<script src=Gecko_dialog.js></script><script src=../_shared.js></script>
		<link rel="stylesheet" href='Safari_style.css'>
		<script language="javascript">
			var OxOb598=["dialogArguments","length","value","stringSearch","MatchWholeWord","checked","MatchCase","stringReplace","document","insertimage","#temp_url#","images","src","parentNode"]; window.resizeTo(0x181,0xb4) ;var editwin=top[OxOb598[0x0]];var sel=editwin.getSelection();var r=sel.getRangeAt(0x0); function checkInputString(){if(document.getElementById(OxOb598[0x3])[OxOb598[0x2]][OxOb598[0x1]]<0x1){return false;} else {return true;} ;}  ; function FindTxt(){if(checkInputString()){var Ox509=document.getElementById(OxOb598[0x3])[OxOb598[0x2]];;; r.collapse(false) ; editwin.find(Ox509,document.getElementById(OxOb598[0x6])[OxOb598[0x5]],false,false,document.getElementById(OxOb598[0x4]).checked,false,false) ;} ;}  ; function ReplaceTxt(){if(checkInputString()){var Ox509=document.getElementById(OxOb598[0x3])[OxOb598[0x2]];;;var stringReplace=document.getElementById(OxOb598[0x7])[OxOb598[0x2]];if(document.getElementById(OxOb598[0x6])[OxOb598[0x5]]){ replaceSel(Ox509,stringReplace) ;} else { replaceSel(Ox509,stringReplace) ;} ; FindTxt() ;} ;}  ; function ReplaceAllTxt(){if(checkInputString()){ sel=editwin.getSelection() ; r=sel.getRangeAt(0x0) ; FindTxt() ;var Ox509=document.getElementById(OxOb598[0x3])[OxOb598[0x2]];;;var stringReplace=document.getElementById(OxOb598[0x7])[OxOb598[0x2]]; r.collapse(false) ;while(editwin.find(Ox509,document.getElementById(OxOb598[0x6])[OxOb598[0x5]],false,false,document.getElementById(OxOb598[0x4]).checked,false,false)){ replaceSel(Ox509,stringReplace) ;} ;} ;}  ; function replaceSel(Ox515,Ox1f){var editdoc=editwin[OxOb598[0x8]]; sel=editwin.getSelection() ; r=sel.getRangeAt(0x0) ;if(Ox1f.indexOf(Ox515)==-0x1){ r.deleteContents() ; r.insertNode(r.createContextualFragment(Ox1f)) ; r.collapse(false) ;} else { editdoc.execCommand(OxOb598[0x9],false,OxOb598[0xa]) ;var Ox35e=null;var Ox516=editdoc[OxOb598[0xb]];for(var j=0x0;j<Ox516[OxOb598[0x1]];j++){if(Ox516[j].getAttribute(OxOb598[0xc])==OxOb598[0xa]){ Ox35e=Ox516[j] ;break ;} ;} ;if(Ox35e){ Ox35e[OxOb598[0xd]].replaceChild(editdoc.createTextNode(Ox1f),Ox35e) ; r.collapse(false) ;} ;} ;}  ; 
		</script>
	</HEAD>
	<body>
			<table border="0" cellspacing="2" cellpadding="5" width="96%" align="center">
				<tr>
					<td class="normal" valign="top">
						<table border="0" cellspacing="2" cellpadding="5" width="100%"  class="normal" align="center">
							<tr>
								<td valign="top" nowrap>[[Find what]]: </td>
								<td valign="top"><INPUT TYPE=TEXT SIZE=30 id="stringSearch" style="width : 180px;"></td>
							</tr>
							<tr>
								<td valign="top" nowrap>[[Replace with]]: </td>
								<td valign="top"><INPUT TYPE=TEXT SIZE=30 id="stringReplace" style="width : 180px;"></td>
							</tr>
						</table> 
						<INPUT TYPE=Checkbox SIZE=40 id="MatchWholeWord">[[Match whole word]]<br>
						<INPUT TYPE=Checkbox SIZE=40 id="MatchCase">[[Match case]]
					</td>
					<td valign="top" class="normal">
						<button name="Find" style="width:75px; height:22px;  margin-top:3px" onClick="FindTxt();">[[Find Next]]</button><br>
						<button name="Replace" style="width:75px; height:22px;  margin-top:7px" onClick="ReplaceTxt();">[[Replace]]</button><br>
						<button name="Replaceall" style="width:75px; height:22px;  margin-top:7px" onClick="ReplaceAllTxt();">[[Replace All]]</button><br>
						<button name="Cancel" style="width:75px; height:22px;  margin-top:7px" onClick="window.close();">[[Cancel]]</button><br>
					</td>
				</tr>
			</table>
	</body>
</HTML>