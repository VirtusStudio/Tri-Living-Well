<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<html>
	<head>
		<title>[[Anchor]] 
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

		var OxO4019=["dialogArguments","name","returnValue","value","anchor1"];var oControl=top[OxO4019[0x0]]; alert( typeof (oControl)) ;var V_anchor_name=oControl.getAttribute(OxO4019[0x1]); function insert_link(){ oControl.setAttribute(OxO4019[0x1],anchor_name.value) ; top[OxO4019[0x2]]=true ; top.close() ;}  ; function Init(){ anchor_name[OxO4019[0x3]]=V_anchor_name||OxO4019[0x4] ;}  ;
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
						<fieldset><legend>[[Anchor]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td style='vertical-align:middle'>[[Name]]:</td>
									<td style='vertical-align:middle'><input type="text" id="anchor_name" style="width:210"></td>
								</tr>
							</table>
						</fieldset>
					</div>
					<div style="margin-top:8px;width:60%; text-align:center">
						<input class="inputbuttoninsert" type="button" value="[[Insert]]" style="width:80px" onclick="insert_link()">&nbsp;&nbsp;
						<input class="inputbuttoncancel" type="button" value="[[Cancel]]" style="width:80px" onclick="top.returnValue=false;top.close()">
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
