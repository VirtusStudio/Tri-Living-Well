<%@ Page Language="C#" ResponseEncoding="Unicode" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head>
		<title>[[InsertChars]] 
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
		<style type=text/css>
			body,input,textarea,button,select,fieldset
			{
				color: windowtext; font:normal 11px Tahoma;
			}
			button
			{
				padding-top: 1px;
				height: 22px;
			}
			fieldset
			{
				padding: 3px;
			}
			.normal
			{
				color: windowtext; font:normal 11px Tahoma;
			}
			body
			{
				background-color:#d7d3cc;
				overflow:hidden;
			}	
		</style>
		
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script language="javascript">
		var OxO9c3c=["dialogArguments","","\x3Ctr\x3E","\x3Ctd style=\x27align: left; height: 20; font-size: 12px; \x27 bgcolor=white width=\x2718\x27 align=center onClick=\x27getchar(this)\x27 onmouseover=\x27spcOver(this)\x27 onmouseout=\x27spcOut(this)\x27 title=\x27","\x27 \x3E","\x26#",";","\x3C/td\x3E","\x3C/tr\x3E","background","style","#0A246A","color","white","black","Verdana","innerHTML","Unicode","innerText","\x3Cspan style=\x27font-family:","\x27\x3E","\x3C/span\x3E"];var editor=top[OxO9c3c[0x0]];var tds=0x16; function writeChars(){var Ox1f=OxO9c3c[0x1];for(var i=0x21;i<0x100;){ document.write(OxO9c3c[0x2]) ;for(var j=0x0;j<=tds;j++){ document.write(OxO9c3c[0x3]+i+OxO9c3c[0x4]) ; document.write(OxO9c3c[0x5]+i+OxO9c3c[0x6]) ; document.write(OxO9c3c[0x7]) ; i++ ;} ; document.write(OxO9c3c[0x8]) ;} ;}  ; function spcOver(Ox2fc){ Ox2fc[OxO9c3c[0xa]][OxO9c3c[0x9]]=OxO9c3c[0xb] ; Ox2fc[OxO9c3c[0xa]][OxO9c3c[0xc]]=OxO9c3c[0xd] ;}  ; function spcOut(Ox2fc){ Ox2fc[OxO9c3c[0xa]][OxO9c3c[0x9]]=OxO9c3c[0xd] ; Ox2fc[OxO9c3c[0xa]][OxO9c3c[0xc]]=OxO9c3c[0xe] ;}  ; function getchar(obj){var h;var Ox541=getFontValue()||OxO9c3c[0xf];if(!obj[OxO9c3c[0x10]]){return ;} ; h=obj[OxO9c3c[0x10]] ;if(Ox541==OxO9c3c[0x11]){ h=obj[OxO9c3c[0x12]] ;} else {if(Ox541!=OxO9c3c[0xf]){ h=OxO9c3c[0x13]+Ox541+OxO9c3c[0x14]+obj[OxO9c3c[0x10]]+OxO9c3c[0x15] ;} ;} ; editor.PasteHTML(h) ;}  ; function cancel(){ top.close() ;}  ;
		</script>
	</HEAD>
	<body>
		<form id="Insert_chart" method="post" runat="server">
			<table border="0" cellspacing="2" cellpadding="2" width="96%" align="center">
				<tr>
					<td class="normal">
						[[FontName]]: <input type="radio" onpropertychange="sel_font_change()" id="selfont1" name="selfont" value=""
							checked><label for="selfont1">[[Default]]</label> <input type="radio" onpropertychange="sel_font_change()" id="selfont2" name="selfont" value="webdings"><label for="selfont2">Webdings</label>
						<input type="radio" onpropertychange="sel_font_change()" id="selfont3" name="selfont" value="wingdings"><label for="selfont3">Wingdings</label>
						<input type="radio" onpropertychange="sel_font_change()" id="selfont4" name="selfont" value="symbol"><label for="selfont4">Symbol</label>
						<input type="radio" onpropertychange="sel_font_change()" id="selfont5" name="selfont" value="Unicode"><label for="selfont5">Unicode</label>
						<script>
						var OxOb1b3=["selfont","length","checked","value","Verdana","display","style","charstable1","Unicode","block","none","charstable2","fontFamily"]; function getFontValue(){var coll=document.getElementsByName(OxOb1b3[0x0]);for(var i=0x0;i<coll[OxOb1b3[0x1]];i++){if(coll[i][OxOb1b3[0x2]]){return coll[i][OxOb1b3[0x3]];} ;} ;}  ; function sel_font_change(){var Ox546=getFontValue()||OxOb1b3[0x4]; document.getElementById(OxOb1b3[0x7])[OxOb1b3[0x6]][OxOb1b3[0x5]]=(Ox546!=OxOb1b3[0x8]?OxOb1b3[0x9]:OxOb1b3[0xa]) ; document.getElementById(OxOb1b3[0xb])[OxOb1b3[0x6]][OxOb1b3[0x5]]=(Ox546==OxOb1b3[0x8]?OxOb1b3[0x9]:OxOb1b3[0xa]) ; document.getElementById(OxOb1b3[0x7])[OxOb1b3[0x6]][OxOb1b3[0xc]]=Ox546 ;if(Ox546==OxOb1b3[0x8]){} ;}  ;
						</script>
					</td>
				</tr>
				<tr>
					<td align="center">
						<fieldset>
							<legend>
								[[InsertChars]]
							</legend>
							<br>
							<TABLE id="charstable1" width="95%" height="222" cellspacing="1" cellpadding="1" border="0"
								bordercolor="dimgray" align="center" bgcolor="dimgray" style="FONT-FAMILY: Verdana;">
								<SCRIPT>
								var OxO82ea=[]; writeChars() ;
								</SCRIPT>
							</TABLE>
							<TABLE id="charstable2" width="95%" height="222" cellspacing="1" cellpadding="1" border="0"
								bordercolor="dimgray" align="center" bgcolor="dimgray" style="FONT-FAMILY: Verdana;display:none;">
								<SCRIPT>
								var OxOc201=["\x26#402;","\x26#913;","\x26#914;","\x26#915;","\x26#916;","\x26#917;","\x26#918;","\x26#919;","\x26#920;","\x26#921;","\x26#922;","\x26#923;","\x26#924;","\x26#925;","\x26#926;","\x26#927;","\x26#928;","\x26#929;","\x26#931;","\x26#932;","\x26#933;","\x26#934;","\x26#935;","\x26#936;","\x26#937;","\x26#945;","\x26#946;","\x26#947;","\x26#948;","\x26#949;","\x26#950;","\x26#951;","\x26#952;","\x26#953;","\x26#954;","\x26#955;","\x26#956;","\x26#957;","\x26#958;","\x26#959;","\x26#960;","\x26#961;","\x26#962;","\x26#963;","\x26#964;","\x26#965;","\x26#966;","\x26#967;","\x26#968;","\x26#969;","\x26#977;","\x26#978;","\x26#982;","\x26#8226;","\x26#8230;","\x26#8242;","\x26#8243;","\x26#8254;","\x26#8260;","\x26#8472;","\x26#8465;","\x26#8476;","\x26#8482;","\x26#8501;","\x26#8592;","\x26#8593;","\x26#8594;","\x26#8595;","\x26#8596;","\x26#8629;","\x26#8656;","\x26#8657;","\x26#8658;","\x26#8659;","\x26#8660;","\x26#8704;","\x26#8706;","\x26#8707;","\x26#8709;","\x26#8711;","\x26#8712;","\x26#8713;","\x26#8715;","\x26#8719;","\x26#8722;","\x26#8727;","\x26#8730;","\x26#8733;","\x26#8734;","\x26#8736;","\x26#8869;","\x26#8870;","\x26#8745;","\x26#8746;","\x26#8747;","\x26#8756;","\x26#8764;","\x26#8773;","\x26#8800;","\x26#8801;","\x26#8804;","\x26#8805;","\x26#8834;","\x26#8835;","\x26#8836;","\x26#8838;","\x26#8839;","\x26#8853;","\x26#8855;","\x26#8901;","\x26#8968;","\x26#8969;","\x26#8970;","\x26#8971;","\x26#9001;","\x26#9002;","\x26#9674;","\x26#9824;","\x26#9827;","\x26#9829;","\x26#9830;","length","\x3Ctr\x3E","\x26","\x26amp;","\x3Ctd style=\x27align: left; height: 20; font-size: 12px; \x27 bgcolor=white width=\x2718\x27 align=center onClick=\x27getchar(this)\x27 onmouseover=\x27spcOver(this)\x27 onmouseout=\x27spcOut(this)\x27 title=\x27"," - ","\x27 \x3E","\x3C/td\x3E","\x3C/tr\x3E"];var arr=[OxOc201[0x0],OxOc201[0x1],OxOc201[0x2],OxOc201[0x3],OxOc201[0x4],OxOc201[0x5],OxOc201[0x6],OxOc201[0x7],OxOc201[0x8],OxOc201[0x9],OxOc201[0xa],OxOc201[0xb],OxOc201[0xc],OxOc201[0xd],OxOc201[0xe],OxOc201[0xf],OxOc201[0x10],OxOc201[0x11],OxOc201[0x12],OxOc201[0x13],OxOc201[0x14],OxOc201[0x15],OxOc201[0x16],OxOc201[0x17],OxOc201[0x18],OxOc201[0x19],OxOc201[0x1a],OxOc201[0x1b],OxOc201[0x1c],OxOc201[0x1d],OxOc201[0x1e],OxOc201[0x1f],OxOc201[0x20],OxOc201[0x21],OxOc201[0x22],OxOc201[0x23],OxOc201[0x24],OxOc201[0x25],OxOc201[0x26],OxOc201[0x27],OxOc201[0x28],OxOc201[0x29],OxOc201[0x2a],OxOc201[0x2b],OxOc201[0x2c],OxOc201[0x2d],OxOc201[0x2e],OxOc201[0x2f],OxOc201[0x30],OxOc201[0x31],OxOc201[0x32],OxOc201[0x33],OxOc201[0x34],OxOc201[0x35],OxOc201[0x36],OxOc201[0x37],OxOc201[0x38],OxOc201[0x39],OxOc201[0x3a],OxOc201[0x3b],OxOc201[0x3c],OxOc201[0x3d],OxOc201[0x3e],OxOc201[0x3f],OxOc201[0x40],OxOc201[0x41],OxOc201[0x42],OxOc201[0x43],OxOc201[0x44],OxOc201[0x45],OxOc201[0x46],OxOc201[0x47],OxOc201[0x48],OxOc201[0x49],OxOc201[0x4a],OxOc201[0x4b],OxOc201[0x4c],OxOc201[0x4d],OxOc201[0x4e],OxOc201[0x4f],OxOc201[0x50],OxOc201[0x51],OxOc201[0x52],OxOc201[0x53],OxOc201[0x54],OxOc201[0x54],OxOc201[0x55],OxOc201[0x56],OxOc201[0x57],OxOc201[0x58],OxOc201[0x59],OxOc201[0x5a],OxOc201[0x5b],OxOc201[0x5c],OxOc201[0x5d],OxOc201[0x5e],OxOc201[0x5f],OxOc201[0x60],OxOc201[0x61],OxOc201[0x61],OxOc201[0x62],OxOc201[0x63],OxOc201[0x64],OxOc201[0x65],OxOc201[0x66],OxOc201[0x67],OxOc201[0x68],OxOc201[0x69],OxOc201[0x6a],OxOc201[0x6b],OxOc201[0x6c],OxOc201[0x5a],OxOc201[0x6d],OxOc201[0x6e],OxOc201[0x6f],OxOc201[0x70],OxOc201[0x71],OxOc201[0x72],OxOc201[0x73],OxOc201[0x74],OxOc201[0x75],OxOc201[0x76],OxOc201[0x77],OxOc201[0x78]];for(var i=0x0;i<arr[OxOc201[0x79]];i+=tds){ document.write(OxOc201[0x7a]) ;for(var j=i;j<i+tds&&j<arr[OxOc201[0x79]];j++){var n=arr[j]; document.write(OxOc201[0x7d]+n+OxOc201[0x7e]+n.replace(OxOc201[0x7b],OxOc201[0x7c])+OxOc201[0x7f]) ; document.write(n) ; document.write(OxOc201[0x80]) ;} ; document.write(OxOc201[0x81]) ;} ;
								</SCRIPT>
							</TABLE>
							<br>	
						</fieldset>
						
						<div align="right" style="padding-top:4px;">
							<input class="inputbuttoninsert" type="button" value="[[Cancel]]" onclick="cancel()">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
