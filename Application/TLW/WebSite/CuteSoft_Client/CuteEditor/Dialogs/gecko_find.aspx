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
		<link rel="stylesheet" href='gecko_style.css'>
		<script language="javascript">
			var OxOd7ef=["availWidth","availHeight","dialogArguments","length","value","stringSearch","MatchWholeWord","checked","MatchCase","stringReplace","document","insertimage","#temp_url#","images","src","parentNode"]; window.resizeTo(0x181,0xb4) ; window.moveTo((screen[OxOd7ef[0x0]]-0x181)/0x2,(screen[OxOd7ef[0x1]]-0xb4)/0x2) ;var editwin=top[OxOd7ef[0x2]];var sel=editwin.getSelection();var r=sel.getRangeAt(0x0); function checkInputString(){if(document.getElementById(OxOd7ef[0x5])[OxOd7ef[0x4]][OxOd7ef[0x3]]<0x1){return false;} else {return true;} ;}  ; function FindTxt(){if(checkInputString()){var Ox509=document.getElementById(OxOd7ef[0x5])[OxOd7ef[0x4]];;; r.collapse(false) ; editwin.find(Ox509,document.getElementById(OxOd7ef[0x8])[OxOd7ef[0x7]],false,false,document.getElementById(OxOd7ef[0x6]).checked,false,false) ;} ;}  ; function ReplaceTxt(){if(checkInputString()){var Ox509=document.getElementById(OxOd7ef[0x5])[OxOd7ef[0x4]];;;var stringReplace=document.getElementById(OxOd7ef[0x9])[OxOd7ef[0x4]];if(document.getElementById(OxOd7ef[0x8])[OxOd7ef[0x7]]){ replaceSel(Ox509,stringReplace) ;} else { replaceSel(Ox509,stringReplace) ;} ; FindTxt() ;} ;}  ; function ReplaceAllTxt(){if(checkInputString()){ sel=editwin.getSelection() ; r=sel.getRangeAt(0x0) ; FindTxt() ;var Ox509=document.getElementById(OxOd7ef[0x5])[OxOd7ef[0x4]];;;var stringReplace=document.getElementById(OxOd7ef[0x9])[OxOd7ef[0x4]]; r.collapse(false) ;while(editwin.find(Ox509,document.getElementById(OxOd7ef[0x8])[OxOd7ef[0x7]],false,false,document.getElementById(OxOd7ef[0x6]).checked,false,false)){ replaceSel(Ox509,stringReplace) ;} ;} ;}  ; function replaceSel(Ox515,Ox1f){var editdoc=editwin[OxOd7ef[0xa]]; sel=editwin.getSelection() ; r=sel.getRangeAt(0x0) ;if(Ox1f.indexOf(Ox515)==-0x1){ r.deleteContents() ; r.insertNode(r.createContextualFragment(Ox1f)) ; r.collapse(false) ;} else { editdoc.execCommand(OxOd7ef[0xb],false,OxOd7ef[0xc]) ;var Ox35e=null;var Ox516=editdoc[OxOd7ef[0xd]];for(var j=0x0;j<Ox516[OxOd7ef[0x3]];j++){if(Ox516[j].getAttribute(OxOd7ef[0xe])==OxOd7ef[0xc]){ Ox35e=Ox516[j] ;break ;} ;} ;if(Ox35e){ Ox35e[OxOd7ef[0xf]].replaceChild(editdoc.createTextNode(Ox1f),Ox35e) ; r.collapse(false) ;} ;} ;}  ; 
		</script>
	</HEAD>
	<body>
			<table border="0" cellspacing="2" cellpadding="5" width="100%" align="center">
				<tr>
					<td class="normal" valign="top">
						<table border="0" cellspacing="2" cellpadding="0" width="100%"  class="normal" align="center">
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