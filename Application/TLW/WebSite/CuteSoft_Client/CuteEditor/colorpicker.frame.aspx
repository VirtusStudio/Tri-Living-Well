<%@ Page Language=C# Inherits="CuteEditor.EditorCulturePage" %>
<%
//FEATURE:color picker
%>
<html>
	<head>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<style>
			body,input,textarea,button,select,fieldset,td
			{
				color: windowtext; font:normal 11px Tahoma;
			}
			body
			{
				background-color:menu;	
				overflow:hidden;
			}
		</style>
		<title>[[MoreColors]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<script>
		var OxOda0f=["0","FF","GetH","GetS","GetB","toString","valueOf","_h","r","g","b","_s","_b","#","","length","\x3Ctable bgColor=","\x3E","backgroundColor","style","bgColor","0x","\x3Ctd style=\x27width:","px;height:","px;\x27 onmouseup=\x27YSUp(this)\x27 onmousedown=\x27YSDown(this)\x27 onmousemove=\x27YSMove(this)\x27\x3E\x3C/td\x3E","\x3Ctr\x3E","\x3C/tr\x3E","\x3Ctr\x3E\x3Ctd style=\x27width:32px;height:","px;\x27 onmouseup=\x27ZUp(this)\x27 onmousedown=\x27ZDown(this)\x27 onmousemove=\x27ZMove(this)\x27\x3E\x3C/td\x3E\x3C/tr\x3E"];var yxExponent=parseInt('<%=Request.QueryString["Quality"]%>')||0x5;var zExponent=0x7;var yxcount=Math.pow(0x2,yxExponent);var zcount=Math.pow(0x2,zExponent);var updatedelay=yxcount*yxcount/0x40;var usesafe=true; function NeedSafe(Ox9){if(!usesafe){return Math.floor(Math.max(0x0,Math.min(0xff,Ox9)));} ;var r=0x33;return Math.floor(Math.max(0x0,Math.min(0xff,Math.round(Ox9/r)*r)));}  ;var rgbhexs=[]; InitRgbVars() ; function InitRgbVars(){for(var i=0x0;i<=0x100;i++){ rgbhexs[i]=Oxe(i) ;} ; function Oxe(n){if(n<0x10){return OxOda0f[0x0]+n.toString(0x10).toUpperCase();} ;if(n>=0x100){return OxOda0f[0x1];} ;return n.toString(0x10).toUpperCase();}  ;}  ; function RgbClass(r,g,b){var obj={r:r,g:g,b:b}; obj[OxOda0f[0x2]]=RgbClassGetH ; obj[OxOda0f[0x3]]=RgbClassGetS ; obj[OxOda0f[0x4]]=RgbClassGetB ; obj[OxOda0f[0x6]]=obj[OxOda0f[0x5]]=RgbClassToString ;return obj;}  ; function RgbClassGetH(){if(this[OxOda0f[0x7]]!=null){return this[OxOda0f[0x7]];} ;return this[OxOda0f[0x7]]=RgbClassGetH_Internal(this);}  ; function RgbClassGetH_Internal(Ox16){var Ox17=Math.max(Math.max(Ox16[OxOda0f[0x8]],Ox16.g),Ox16.b);if(Ox17==0x0){return 0x0;} ;var r=Ox16[OxOda0f[0x8]]*0x100/Ox17;var g=Ox16[OxOda0f[0x9]]*0x100/Ox17;var b=Ox16[OxOda0f[0xa]]*0x100/Ox17; Ox17=0x100 ;var Ox18=Math.min(Math.min(r,g),b);if(Ox17==Ox18){return 0x0;} ;if(r==Ox18){ r=0x0 ;} ;if(g==Ox18){ g=0x0 ;} ;if(b==Ox18){ b=0x0 ;} ;var Ox19=0x100;if(r!=0x0&&r!=0x100){ Ox19=r ;} ;if(g!=0x0&&g!=0x100){ Ox19=g ;} ;if(b!=0x0&&b!=0x100){ Ox19=b ;} ;var Ox1a=Ox17*(Ox19-Ox18)/(Ox17-Ox18);if(r!=0x0&&r!=0x100){ r=Ox1a ;} ;if(g!=0x0&&g!=0x100){ g=Ox1a ;} ;if(b!=0x0&&b!=0x100){ b=Ox1a ;} ;if(r==0x0){if(g==0x100){return 0x81-(0x100-b)/0x6;} else {return 0x80+(0x100-g)/0x6;} ;} ;if(g==0x0){if(b==0x100){return 0xd6-(0x100-r)/0x6;} else {return 0xd6+(0x100-b)/0x6;} ;} ;if(b==0x0){if(r==0x100){return 0x2b-(0x100-g)/0x6;} else {return 0x2b+(0x100-r)/0x6;} ;} ;}  ; function RgbClassGetS(){if(this[OxOda0f[0xb]]!=null){return this[OxOda0f[0xb]];} ;if(this[OxOda0f[0x8]]==0x0||this[OxOda0f[0x9]]==0x0||this[OxOda0f[0xa]]==0x0){if(this[OxOda0f[0x8]]==0x0&&this[OxOda0f[0x9]]==0x0&&this[OxOda0f[0xa]]==0x0){return this[OxOda0f[0xb]]=0x0;} ;return this[OxOda0f[0xb]]=0x64;} ;var Ox17=Math.max(Math.max(this[OxOda0f[0x8]],this.g),this.b);var Ox18=Math.min(Math.min(this[OxOda0f[0x8]],this.g),this.b);return this[OxOda0f[0xb]]=0x64*(Ox17-Ox18)/Ox17;}  ; function RgbClassGetB(){if(this[OxOda0f[0xc]]!=null){return this[OxOda0f[0xc]];} ;return this[OxOda0f[0xc]]=0x64*Math.max(Math.max(this[OxOda0f[0x8]],this.g),this.b)/0x100;}  ; function RgbClassToString(){return OxOda0f[0xd]+rgbhexs[NeedSafe(this.r)]+rgbhexs[NeedSafe(this.g)]+rgbhexs[NeedSafe(this.b)];}  ; function ParseRgb(Ox1f){if(!Ox1f){return null;} ; Ox1f=Ox1f+OxOda0f[0xe] ;if(Ox1f[OxOda0f[0xf]]==0x0){return null;} ;if(Ox1f.charAt(0x0)!=OxOda0f[0xd]||Ox1f[OxOda0f[0xf]]!=0x7){var Ox20=document.createElement(OxOda0f[0x10]+Ox1f+OxOda0f[0x11]);try{ Ox20[OxOda0f[0x13]][OxOda0f[0x12]]=Ox1f ;} catch(x){return null;} ; Ox1f=Ox20[OxOda0f[0x14]]+OxOda0f[0xe] ;if(Ox1f.charAt(0x0)!=OxOda0f[0xd]||Ox1f[OxOda0f[0xf]]!=0x7){return null;} ;} ;return  new RgbClass(parseInt(OxOda0f[0x15]+Ox1f.substr(0x1,0x2)),parseInt(OxOda0f[0x15]+Ox1f.substr(0x3,0x2)),parseInt(OxOda0f[0x15]+Ox1f.substr(0x5,0x2)));}  ; function GetRgbOfH_GetV(i){ i=i%0x100 ;if(i<0x80){ i=0x100-i ;} ; i=(i-0x80)*0x2 ;if(i>0x100*0x2/0x3){return 0x100;} ;if(i<0x100/0x3){return 0x0;} ; i=(i-0x100/0x3)*0x3 ;return i;}  ; function GetRgbOfH(i){return  new RgbClass(GetRgbOfH_GetV(i),GetRgbOfH_GetV(i+0xab),GetRgbOfH_GetV(i+0x55));}  ; function GetRgbOfHsb(h,Ox25,Ox26){var r=GetRgbOfH_GetV(h)*Ox26/0x100;var g=GetRgbOfH_GetV(h+0x100*0x2/0x3)*Ox26/0x100;var b=GetRgbOfH_GetV(h+0x100/0x3)*Ox26/0x100;var Ox17=Math.max(r,Math.max(g,b));if(Ox17==0x0){return  new RgbClass(0x0,0x0,0x0);} ;var Ox19=Ox17;if(r!=0x0&&r!=Ox17){ Ox19=r ;} ;if(g!=0x0&&g!=Ox17){ Ox19=g ;} ;if(b!=0x0&&b!=Ox17){ Ox19=b ;} ;var Ox27=Ox17*(0x1-Ox25/0x100);var Ox1a=Ox17-(Ox17-Ox19)*(Ox17-Ox27)/Ox17;if(r==Ox19){ r=Ox1a ;} ;if(g==Ox19){ g=Ox1a ;} ;if(b==Ox19){ b=Ox1a ;} ;if(r==0x0){ r=Ox27 ;} ;if(g==0x0){ g=Ox27 ;} ;if(b==0x0){ b=Ox27 ;} ;return  new RgbClass(r,g,b);}  ; function GetRgbByH(Ox29,Ox2a,Ox2b,Ox2c){var Ox2d=GetRgbOfH(0x100-Ox29);if(Ox2c){return Ox2d;} ;var Ox2e=(0x100-Ox2b)*(0x100-Ox2a)/0x100;var Ox2f=(0x100-Ox2a)*Ox2b/0x10000;return  new RgbClass(Ox2e+Ox2f*Ox2d[OxOda0f[0x8]],Ox2e+Ox2f*Ox2d[OxOda0f[0x9]],Ox2e+Ox2f*Ox2d.b);}  ; function GetXyzByH(Ox16){return {x:Ox16.GetS()*256/100,y:256-Ox16.GetB()*256/100,z:256-Ox16.GetH()};}  ; function GetRgbByS(Ox29,Ox2a,Ox2b,Ox2c){return GetRgbOfHsb(Ox2b,0x100-Ox29,0x100-Ox2a);}  ; function GetXyzByS(Ox16){return {x:Ox16.GetH(),y:256-Ox16.GetB()*256/100,z:256-Ox16.GetS()*256/100};}  ; function GetRgbByB(Ox29,Ox2a,Ox2b,Ox2c){return GetRgbOfHsb(Ox2b,0x100-Ox2a,0x100-Ox29);}  ; function GetXyzByB(Ox16){return {x:Ox16.GetH(),y:256-Ox16.GetS()*256/100,z:256-Ox16.GetB()*256/100};}  ; function GetRgbByRed(Ox29,Ox2a,Ox2b,Ox2c){return  new RgbClass(0x100-Ox29,0x100-Ox2a,Ox2b);}  ; function GetXyzByRed(Ox16){return {x:Ox16[OxOda0f[10]],y:256-Ox16[OxOda0f[9]],z:256-Ox16[OxOda0f[8]]};}  ; function GetRgbByGreen(Ox29,Ox2a,Ox2b,Ox2c){return  new RgbClass(0x100-Ox2a,0x100-Ox29,Ox2b);}  ; function GetXyzByGreen(Ox16){return {x:Ox16[OxOda0f[10]],y:256-Ox16[OxOda0f[8]],z:256-Ox16[OxOda0f[9]]};}  ; function GetRgbByBlue(Ox29,Ox2a,Ox2b,Ox2c){return  new RgbClass(Ox2b,0x100-Ox2a,0x100-Ox29);}  ; function GetXyzByBlue(Ox16){return {x:Ox16[OxOda0f[8]],y:256-Ox16[OxOda0f[9]],z:256-Ox16[OxOda0f[10]]};}  ; function WriteYSTable(){var Ox25=OxOda0f[0x16]+(0x100/yxcount)+OxOda0f[0x17]+(0xe6/yxcount)+OxOda0f[0x18];var Ox3c=Ox25;for(var i=0x0;i<yxExponent;i++){ Ox3c+=Ox3c ;} ; Ox25+=Ox3c ; Ox25=OxOda0f[0x19]+Ox25+OxOda0f[0x1a] ; Ox3c=Ox25 ;for(var i=0x0;i<yxExponent;i++){ Ox3c+=Ox3c ;} ; Ox25+=Ox3c ; document.write(Ox25) ;}  ; function WriteZTable(){var Ox25=OxOda0f[0x1b]+(0xff/zcount)+OxOda0f[0x1c];var Ox3e=Ox25;for(var i=0x0;i<zExponent;i++){ Ox3e+=Ox3e ;} ; Ox25+=Ox3e ; document.write(Ox25) ;}  ;
		</script>
	</head>
	<body style="margin:0px;padding:4px;overflow:hidden;">
		<table id="table1" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width:256px">
					<table id="yxtable" onselectstart="return false;" cellspacing="0" cellpadding="0" border="0"
						style='border:1.5pt inset;background-color:black;height:256px;'>
						<script>
							var OxO2aca=[]; WriteYSTable() ;
						</script>
					</table>
				</td>
				<td id="tdzl" valign="top" style="font-size:9px;font-family:webdings;padding-left:4px;padding-right:0px;text-align:right;">4</td>
				<td valign='top' style="padding-top:6px; width:32px;">
					<table id="ztable" onselectstart="return false;" cellspacing="0" cellpadding="0" border="0"
						style='border:1.5pt inset;background-color:black;height:252px;'>
						<script>
					var OxO83cc=[]; WriteZTable() ;
						</script>
					</table>
				</td>
				<td id="tdzr" valign="top" style="font-size:9px;font-family:webdings;padding-left:4px;padding-left:0px;text-align:left;">3</td>
				<td valign='top'>
					<table border="0" cellspacing="2" cellpadding="0">
						<tr>
							<td colspan=3 align="center">
								<fieldset id="fieldsetUpload">
									<legend>
										[[Color]]
									</legend>
									<div id="divpreview"  style="width:80%;height:60px;border:1.5pt inset; Padding: 0 0 0 0;">
									</div>										
								</fieldset>
							</td>
							<td>
								&nbsp;&nbsp;<button id="btnok" style='width:70px'>[[OK]]</button> &nbsp; <br><br>
								&nbsp;&nbsp;<button id="btncc" style='width:70px'>[[Cancel]]</button>										
							</td>
						</tr>
						<tr>
							<td style="height:6px;"></td>
						</tr>
						<tr>
							<td><input type="radio" onclick="HandleUIChanged()" name="rd_mode" id="rd_hsb_h" value="hsb_h"></td>
							<td>
								H:</td>
							<td><input type="text" id="hsb_h" readonly style="width:55px">
							</td>
						</tr>
						<tr>
							<td><input type="radio" onclick="HandleUIChanged()" name="rd_mode" id="rd_hsb_s" value="hsb_s"></td>
							<td>
								S:</td>
							<td><input type="text" id="hsb_s" readonly style="width:55px">
							</td>
						</tr>
						<tr>
							<td><input type="radio" checked onclick="HandleUIChanged()" name="rd_mode" id="rd_hsb_b"
									value="hsb_b"></td>
							<td>
								B:</td>
							<td><input type="text" id="hsb_b" readonly style="width:55px">
							</td>
						</tr>
						<tr>
							<td style="height:6px;"></td>
						</tr>
						<tr>
							<td><input type="radio" onclick="HandleUIChanged()" name="rd_mode" id="rd_rgb_r" value="rgb_r"></td>
							<td>
								R:</td>
							<td><input type="text" id="rgb_r" style="width:55px">
							</td>
							<td><div id="scroll_rgb_r" style='height:15px;width:90px;overflow-x:scroll;overflow-y:hidden;'><div style='width:180px'></div>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="radio" onclick="HandleUIChanged()" name="rd_mode" id="rd_rgb_g" value="rgb_g"></td>
							<td>
								G:</td>
							<td><input type="text" id="rgb_g" style="width:55px">
							</td>
							<td><div id="scroll_rgb_g" style='height:15px;width:90px;overflow-x:scroll;overflow-y:hidden;'><div style='width:180px'></div>
								</div>
							</td>
						</tr>
						<tr>
							<td><input type="radio" onclick="HandleUIChanged()" name="rd_mode" id="rd_rgb_b" value="rgb_b"></td>
							<td>
								B:</td>
							<td><input type="text" id="rgb_b" style="width:55px">
							</td>
							<td>
								<div id="scroll_rgb_b" style='height:15px;width:90px;overflow-x:scroll;overflow-y:hidden;'>
									<div style='width:180px'></div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="height:6px;"></td>
						</tr>
						<tr>
							<td colspan="2">
								[[HTML]]:</td>
							<td><input type="text" id="val_v" maxlength="7" style="width:55px">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<table width="98%" cellpadding=0 cellspacing=0>
						<tr>
							<td>
								<input type='checkbox' id='cb_safe' onpropertychange='Update()' onclick='Update()'><label for='cb_safe'>[[OnlyWebColor]]</label>
							</td>
							<td>							
								[[Quality]]: <input type='radio' name="radio_qlt" id='radio_qlt_low' onpropertychange='ChangeQuanlity()' onclick='ChangeQuanlity()'><label for='radio_qlt_low'>[[Low]]</label>
								<input type='radio' name="radio_qlt" id='radio_qlt_medium' onpropertychange='ChangeQuanlity()'
									onclick='ChangeQuanlity()'><label for='radio_qlt_medium'>[[Medium]]</label> <input type='radio' name="radio_qlt" id='radio_qlt_high' onpropertychange='ChangeQuanlity()' onclick='ChangeQuanlity()'><label for='radio_qlt_high'>[[High]]</label>
								<span style='display:none'><input type='radio' name="radio_qlt" id='radio_qlt_veryhigh' onpropertychange='ChangeQuanlity()'
										onclick='ChangeQuanlity()'><label for='radio_qlt_veryhigh'>[[VeryHigh]]</label>
								</span>
							</td>
							<td align="right" style="padding-right:16px">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>

<script>
var OxO2d5d=["addEventListener","TABLE","INPUT","DIV","BUTTON","TD","length","id","var ","=document.getElementById(\x27","\x27)"];if(document[OxO2d5d[0x0]]){var tagnamearr=[OxO2d5d[0x1],OxO2d5d[0x2],OxO2d5d[0x3],OxO2d5d[0x4],OxO2d5d[0x5]];for(var tni=0x0;tni<tagnamearr[OxO2d5d[0x6]];tni++){var tagname=tagnamearr[tni];var coll=document.getElementsByTagName(tagname);for(var i=0x0;i<coll[OxO2d5d[0x6]];i++){var element=coll[i];if(element[OxO2d5d[0x7]]){ eval(OxO2d5d[0x8]+element[OxO2d5d[0x7]]+OxO2d5d[0x9]+element[OxO2d5d[0x7]]+OxO2d5d[0xa]) ;} ;} ;} ;} ;
</script>

<script>

var OxOfad1=["checked","border","style","","x","y","z","paddingTop","value","backgroundColor","r","g","b","1px solid white","cells","rows","onmouseup","scrollLeft","clientWidth","scrollWidth","onchange","onscroll"];var GetRgbBy=GetRgbByH;var GetXyzBy=GetXyzByH;var selz=0x0;var sely=0x0;var selx=yxcount; currentrgb=GetRgbBy(selz*0x100/zcount,sely*0x100/yxcount,selx*0x100/yxcount) ;var yxs=[];var zs=[];var isupdating=false;var downz=false;var downyx=false;var update_timer=0x0;var needupdateyx=true;var needupdatez=true;var firebyscroll=false; function HandleUIChanged(Ox16){if(Ox16==null){ Ox16=currentrgb ;} ;if(rd_hsb_h[OxOfad1[0x0]]){ GetXyzBy=GetXyzByH ;} ;if(rd_hsb_s[OxOfad1[0x0]]){ GetXyzBy=GetXyzByS ;} ;if(rd_hsb_b[OxOfad1[0x0]]){ GetXyzBy=GetXyzByB ;} ;if(rd_rgb_r[OxOfad1[0x0]]){ GetXyzBy=GetXyzByRed ;} ;if(rd_rgb_g[OxOfad1[0x0]]){ GetXyzBy=GetXyzByGreen ;} ;if(rd_rgb_b[OxOfad1[0x0]]){ GetXyzBy=GetXyzByBlue ;} ; yxs[sely][selx][OxOfad1[0x2]][OxOfad1[0x1]]=OxOfad1[0x3] ;var Ox57=GetXyzBy(Ox16); selx=Math.round(Ox57[OxOfad1[0x4]]*yxcount/0x100) ; sely=Math.round(Ox57[OxOfad1[0x5]]*yxcount/0x100) ; selz=Math.round(Ox57[OxOfad1[0x6]]*zcount/0x100) ; Update(true) ;}  ; function OnUpdate(Ox16){}  ; function Update(Ox5a){ isupdating=true ;try{if(rd_hsb_h[OxOfad1[0x0]]){ GetRgbBy=GetRgbByH ;} ;if(rd_hsb_s[OxOfad1[0x0]]){ GetRgbBy=GetRgbByS ;} ;if(rd_hsb_b[OxOfad1[0x0]]){ GetRgbBy=GetRgbByB ;} ;if(rd_rgb_r[OxOfad1[0x0]]){ GetRgbBy=GetRgbByRed ;} ;if(rd_rgb_g[OxOfad1[0x0]]){ GetRgbBy=GetRgbByGreen ;} ;if(rd_rgb_b[OxOfad1[0x0]]){ GetRgbBy=GetRgbByBlue ;} ;var Ox2d=GetRgbBy(selz*0x100/zcount,sely*0x100/yxcount,selx*0x100/yxcount); currentrgb=Ox2d ;var Ox5b=Ox2d.toString(); tdzl[OxOfad1[0x2]][OxOfad1[0x7]]=tdzr[OxOfad1[0x2]][OxOfad1[0x7]]=selz*0x100/zcount ; hsb_h[OxOfad1[0x8]]=Math.floor(Ox2d.GetH()) ; hsb_s[OxOfad1[0x8]]=Math.round(Ox2d.GetS()) ; hsb_b[OxOfad1[0x8]]=Math.round(Ox2d.GetB()) ; val_v[OxOfad1[0x8]]=Ox5b ; divpreview[OxOfad1[0x2]][OxOfad1[0x9]]=Ox5b ; rgb_r[OxOfad1[0x8]]=Math.floor(Ox2d.r) ; rgb_g[OxOfad1[0x8]]=Math.floor(Ox2d.g) ; rgb_b[OxOfad1[0x8]]=Math.floor(Ox2d.b) ;if(!firebyscroll){if(Math.abs(GetScrollValue(scroll_rgb_r)*0x100-Ox2d.r)>0x34){ SetScrollValue(scroll_rgb_r,Ox2d[OxOfad1[0xa]]/0x100) ;} ;if(Math.abs(GetScrollValue(scroll_rgb_g)*0x100-Ox2d.g)>0x34){ SetScrollValue(scroll_rgb_g,Ox2d[OxOfad1[0xb]]/0x100) ;} ;if(Math.abs(GetScrollValue(scroll_rgb_b)*0x100-Ox2d.b)>0x34){ SetScrollValue(scroll_rgb_b,Ox2d[OxOfad1[0xc]]/0x100) ;} ;} ; OnUpdate(Ox2d) ; clearTimeout(update_timer) ; update_timer=setTimeout(UpdateInternal,Ox5a?0x1:updatedelay) ;} finally{ isupdating=false ;} ;}  ; function UpdateInternal(){ usesafe=cb_safe[OxOfad1[0x0]] ; yxs[sely][selx][OxOfad1[0x2]][OxOfad1[0x1]]=OxOfad1[0xd] ;if(needupdatez){for(var Ox29=0x0;Ox29<=zcount;Ox29++){ zs[Ox29][OxOfad1[0x2]][OxOfad1[0x9]]=GetRgbBy(Ox29*0x100/zcount,sely*0x100/yxcount,selx*0x100/yxcount,true).toString() ;} ;} ;if(needupdateyx){for(var Ox2a=0x0;Ox2a<=yxcount;Ox2a++){for(var Ox2b=0x0;Ox2b<=yxcount;Ox2b++){ yxs[Ox2a][Ox2b][OxOfad1[0x2]][OxOfad1[0x9]]=GetRgbBy(selz*0x100/zcount,Ox2a*0x100/yxcount,Ox2b*0x100/yxcount,false).toString() ;} ;} ;} ; needupdateyx=true ; needupdatez=true ;}  ; function Initialize(){for(var Ox2a=0x0;Ox2a<=yxcount;Ox2a++){var Ox5e=[];for(var Ox2b=0x0;Ox2b<=yxcount;Ox2b++){var Ox5f=yxtable[OxOfad1[0xf]][Ox2a][OxOfad1[0xe]][Ox2b]; Ox5f[OxOfad1[0x4]]=Ox2b ; Ox5f[OxOfad1[0x5]]=Ox2a ; Ox5e[Ox2b]=Ox5f ;} ; yxs[Ox2a]=Ox5e ;} ;for(var Ox29=0x0;Ox29<=zcount;Ox29++){var Ox5f=ztable[OxOfad1[0xf]][Ox29][OxOfad1[0xe]][0x0]; Ox5f[OxOfad1[0x6]]=Ox29 ; zs[Ox29]=Ox5f ;} ; Update(true) ;}  ; document[OxOfad1[0x10]]=function (){ downyx=false ; downz=false ;}  ; function YSDown(Ox5f){ downyx=true ; Update() ;}  ; function YSMove(Ox5f){if(downyx&&yxs[sely][selx]!=Ox5f){ yxs[sely][selx][OxOfad1[0x2]][OxOfad1[0x1]]=OxOfad1[0x3] ; needupdateyx=false ; sely=Ox5f[OxOfad1[0x5]] ; selx=Ox5f[OxOfad1[0x4]] ; Update() ;} ;}  ; function YSUp(Ox5f){ yxs[sely][selx][OxOfad1[0x2]][OxOfad1[0x1]]=OxOfad1[0x3] ; needupdateyx=false ; sely=Ox5f[OxOfad1[0x5]] ; selx=Ox5f[OxOfad1[0x4]] ; Update() ;}  ; function ZDown(Ox5f){ downz=true ;}  ; function ZMove(Ox5f){if(downz){ needupdatez=false ; selz=Ox5f[OxOfad1[0x6]] ; Update() ;} ;}  ; function ZUp(Ox5f){ downz=false ; needupdatez=false ; selz=Ox5f[OxOfad1[0x6]] ; Update() ;}  ; function GetScrollValue(Ox67){return Ox67[OxOfad1[0x11]]/(Ox67[OxOfad1[0x13]]-Ox67[OxOfad1[0x12]]);}  ; function SetScrollValue(Ox67,Ox5b){ Ox67[OxOfad1[0x11]]=Ox5b*(Ox67[OxOfad1[0x13]]-Ox67[OxOfad1[0x12]]) ;}  ; rgb_r[OxOfad1[0x14]]=function (){if(isupdating){return ;} ; HandleUIChanged( new RgbClass(parseInt(rgb_r.value),parseInt(rgb_g.value),parseInt(rgb_b.value))) ;}  ; scroll_rgb_r[OxOfad1[0x15]]=function (){if(isupdating){return ;} ;var Ox9=GetScrollValue(scroll_rgb_r); rgb_r[OxOfad1[0x8]]=0x100*Ox9 ; firebyscroll=true ;try{ HandleUIChanged( new RgbClass(parseInt(rgb_r.value),parseInt(rgb_g.value),parseInt(rgb_b.value))) ;} finally{ firebyscroll=false ;} ;}  ; rgb_g[OxOfad1[0x14]]=function (){if(isupdating){return ;} ; HandleUIChanged( new RgbClass(parseInt(rgb_r.value),parseInt(rgb_g.value),parseInt(rgb_b.value))) ;}  ; scroll_rgb_g[OxOfad1[0x15]]=function (){if(isupdating){return ;} ;var Ox9=GetScrollValue(scroll_rgb_g); rgb_g[OxOfad1[0x8]]=0x100*Ox9 ; firebyscroll=true ;try{ HandleUIChanged( new RgbClass(parseInt(rgb_r.value),parseInt(rgb_g.value),parseInt(rgb_b.value))) ;} finally{ firebyscroll=false ;} ;}  ; rgb_b[OxOfad1[0x14]]=function (){if(isupdating){return ;} ; HandleUIChanged( new RgbClass(parseInt(rgb_r.value),parseInt(rgb_g.value),parseInt(rgb_b.value))) ;}  ; scroll_rgb_b[OxOfad1[0x15]]=function (){if(isupdating){return ;} ;var Ox9=GetScrollValue(scroll_rgb_b); rgb_b[OxOfad1[0x8]]=0x100*Ox9 ; firebyscroll=true ;try{ HandleUIChanged( new RgbClass(parseInt(rgb_r.value),parseInt(rgb_g.value),parseInt(rgb_b.value))) ;} finally{ firebyscroll=false ;} ;}  ;


</script>
<script>
var OxO4949=["onload","dialogArguments","string","object","onchange","onkeydown","event","keyCode","returnValue","checked","href","ColorPicker.Frame.Aspx?settinghash=[[_setting_]]\x26Quality=","\x26[[DNN_Arg]]","onclick","value","backgroundColor","style","[[ValidColor]]",""]; function OnUpdate1(Ox6b){}  ; function OnUpdate2(Ox16){ OnUpdate1(Ox16.toString()) ;}  ; window[OxO4949[0x0]]=function (){ Initialize() ;if(top[OxO4949[0x1]]){if( typeof (top[OxO4949[0x1]])==OxO4949[0x2]){ HandleUIChanged(ParseRgb(top.dialogArguments)) ;} else {if( typeof (top[OxO4949[0x1]])==OxO4949[0x3]){if(top[OxO4949[0x1]][OxO4949[0x4]]){ OnUpdate1=top[OxO4949[0x1]][OxO4949[0x4]] ; OnUpdate=OnUpdate2 ;} ; HandleUIChanged(ParseRgb(top[OxO4949[0x1]].color)) ;} ;} ;} ;}  ; document[OxO4949[0x5]]=function (Ox6d){ Ox6d=Ox6d||window[OxO4949[0x6]] ;if(Ox6d[OxO4949[0x7]]==0x1b){ top[OxO4949[0x8]]=false ; top.close() ;} ;}  ;switch(yxExponent){case 0x3: radio_qlt_low[OxO4949[0x9]]=true ;break ;case 0x4: radio_qlt_medium[OxO4949[0x9]]=true ;break ;case 0x5: radio_qlt_high[OxO4949[0x9]]=true ;break ;case 0x6: radio_qlt_veryhigh[OxO4949[0x9]]=true ;break ;;;;;} ; ChangeQuanlity=ChangeQuanlity2 ; function ChangeQuanlity(){}  ; function ChangeQuanlity2(){var Ox70=0x4;if(radio_qlt_low[OxO4949[0x9]]){ Ox70=0x3 ;} ;if(radio_qlt_medium[OxO4949[0x9]]){ Ox70=0x4 ;} ;if(radio_qlt_high[OxO4949[0x9]]){ Ox70=0x5 ;} ;if(radio_qlt_veryhigh[OxO4949[0x9]]){ Ox70=0x6 ;} ;if(Ox70!=yxExponent){ location[OxO4949[0xa]]=OxO4949[0xb]+Ox70+OxO4949[0xc] ;} ;}  ; btnok[OxO4949[0xd]]=function (){try{ divpreview[OxO4949[0x10]][OxO4949[0xf]]=val_v[OxO4949[0xe]] ;} catch(er){ alert(OxO4949[0x11]) ; val_v[OxO4949[0xe]]=OxO4949[0x12] ;return false;} ; top[OxO4949[0x8]]=val_v[OxO4949[0xe]] ; top.close() ;}  ; btncc[OxO4949[0xd]]=function (){ top[OxO4949[0x8]]=false ; top.close() ;}  ;
</script>
