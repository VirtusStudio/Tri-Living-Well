<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<html>
	<head>
		<title>[[InsertAnchor]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel=stylesheet href='style.css' >
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script language="JavaScript">

			var OxOd169=["dialogArguments","editor","window","document","name","value","anchor_name","[[ValidName]]","returnValue","options","length","anchors","OPTION","text","selection","type","Unselect","parentElement","body","StartToStart","EndToEnd"];var obj=top[OxOd169[0x0]];var editor=obj[OxOd169[0x1]];var editwin=obj[OxOd169[0x2]];var editdoc=obj[OxOd169[0x3]];var name=obj[OxOd169[0x4]]; function insert_link(){var Ox534=document.getElementById(OxOd169[0x6])[OxOd169[0x5]];var Ox535=/[^a-z\d]/i;if(Ox535.test(Ox534)){ alert(OxOd169[0x7]) ;} else { top[OxOd169[0x8]]=Ox534 ; top.close() ;} ;}  ; function Init(){if(name){ document.getElementById(OxOd169[0x6])[OxOd169[0x5]]=name ;} ; updateList() ;}  ; function updateList(){while(allanchors[OxOd169[0x9]][OxOd169[0xa]]!=0x0){ allanchors[OxOd169[0x9]].remove(allanchors.options(0x0)) ;} ;for(var i=0x0;i<editdoc[OxOd169[0xb]][OxOd169[0xa]];i++){var Ox539=document.createElement(OxOd169[0xc]); Ox539[OxOd169[0xd]]=editdoc[OxOd169[0xb]][i][OxOd169[0x4]] ; Ox539[OxOd169[0x5]]=editdoc[OxOd169[0xb]][i][OxOd169[0x4]] ; allanchors[OxOd169[0x9]].add(Ox539) ;} ;}  ; function selectAnchor(Ox53b){ editor.FocusDocument() ;var Ox305=editdoc[OxOd169[0xe]].createRange();var Ox4e4=editdoc[OxOd169[0xe]][OxOd169[0xf]]; Ox305.execCommand(OxOd169[0x10]) ;for(var i=0x0;i<editdoc[OxOd169[0xb]][OxOd169[0xa]];i++){if(editdoc[OxOd169[0xb]][i][OxOd169[0x4]]==Ox53b){ document.getElementById(OxOd169[0x6])[OxOd169[0x5]]=Ox53b ;if(Ox305[OxOd169[0x11]]){var Ox613=editdoc[OxOd169[0x12]].createTextRange(); Ox613.moveToElementText(editdoc[OxOd169[0xb]][i]) ; Ox305.setEndPoint(OxOd169[0x13],Ox613) ; Ox305.setEndPoint(OxOd169[0x14],Ox613) ; Ox305.select() ;} ;} ;} ;}  ;
		</script>
		<style>
		.btn {border: 1px solid buttonface;padding: 1px;cursor: default;width:14px;height: 12px;vertical-align: middle;}
		select,input,td {font-family: MS Sans Serif; font-size: 9pt; vertical-align: top; cursor: hand;}
		</style>
	</head>
	<body onload="Init();" style="margin:0px;border-width:0px;padding:4px;">
		<table border="0" cellspacing="2" cellpadding="5" width="100%" align="center">
			<tr>
				<td nowrap>
					<div>
						<fieldset style="padding:2px" align="center"><legend>[[InsertAnchor]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td width="100%">
										<select size="5" name="allanchors" style="width: 255" id="allanchors" onchange="selectAnchor(this.value);"></select>
									</td>
									<td>
									</td>
								</tr>
							</table
							<br><br>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td style='vertical-align:middle'>[[Name]]:</td>
									<td style='vertical-align:middle'><input type="text" id="anchor_name" style="width:210"></td>
								</tr>
							</table>
						</fieldset>
					</div>
					<div style="margin-top:8px;width:90%; text-align:center">
						<input class="inputbuttoninsert" type="button" value="[[Insert]]" style="width:80px" onclick="insert_link()">&nbsp;&nbsp;
						<input class="inputbuttoncancel" type="button" value="[[Cancel]]" style="width:80px" onclick="top.close()">
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
