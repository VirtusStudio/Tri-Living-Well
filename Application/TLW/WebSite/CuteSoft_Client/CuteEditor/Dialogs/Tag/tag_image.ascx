<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Insert]]</legend>
	<table class="normal">
		<tr>
			<td width=80>[[Url]]:</td>
			<td colspan="3"><input type="text" id="inp_src" size="45"></td>
			<td><button id="btnbrowse">[[Browse]]</button></td>
		</tr>
		<tr>
			<td valign="middle" nowrap>[[Alternate]]:</td>
			<td><input type="text" id="AlternateText" size="24" NAME="AlternateText"></td>
			<td valign="middle" nowrap>[[ID]]:</td>
			<td><input type="text" id="inp_id" size="12"></td>												
			<td></td>
		</tr>
		<tr>
			<td valign="middle" nowrap>[[longDesc]]:</td>
			<td colspan="3"><input type="text" id="longDesc" size="45" NAME="longDesc">
			</td>
			<td><img src="../images/Accessibility.gif"  align="absMiddle" hspace="5"></td>
		</tr>
	</table>
</fieldset>
<table class="normal" cellpadding="0" cellspacing="0" >
	<tr>
		<td valign="top">
		<fieldset>
			<legend>[[Layout]]</legend>
				<table border="0" cellpadding="4" cellspacing="0" class="normal">
					<tr>
						<td>
							<table border="0" cellpadding="2" cellspacing="0" class="normal">
								<tr>
									<td width="60">[[Alignment]]:</td>
									<td>
										<select NAME="ImgAlign" style="WIDTH : 80px" id="Align">
											<OPTION id="optNotSet" value="">[[Notset]]</OPTION>
											<OPTION id="optLeft" value="left">[[Left]]</OPTION>
											<OPTION id="optRight" value="right">[[Right]]</OPTION>
											<OPTION id="optTexttop" value="textTop">[[Texttop]]</OPTION>
											<OPTION id="optAbsMiddle" value="absMiddle">[[Absmiddle]]</OPTION>
											<OPTION id="optBaseline" value="baseline" selected>[[Baseline]]</OPTION>
											<OPTION id="optAbsBottom" value="absBottom">[[Absbottom]]</OPTION>
											<OPTION id="optBottom" value="bottom">[[Bottom]]</OPTION>
											<OPTION id="optMiddle" value="middle">[[Middle]]</OPTION>
											<OPTION id="optTop" value="top">[[Top]]</OPTION>
										</select>
									</td>
								</tr>
								<tr>
									<td nowrap>[[Bordersize]]:</td>
									<td>
										<INPUT TYPE="text" SIZE="2" NAME="Border" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px" id="Border">
									</td>
								</tr>
								<tr>
									<td nowrap>[[Bordercolor]]:</td>
									<td nowrap>
										<input type="text" id="bordercolor" name="bordercolor" size="7" style="WIDTH:57px" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
											oncolorchange="bordercolor.value=this.selectedColor; bordercolor.style.backgroundColor=this.selectedColor; bordercolor_Preview.style.backgroundColor=this.selectedColor">
											<img src="../images/colorpicker.gif" id="bordercolor_Preview" align="absMiddle" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
											oncolorchange="bordercolor.value=this.selectedColor; bordercolor.style.backgroundColor=this.selectedColor; bordercolor_Preview.style.backgroundColor=this.selectedColor">
									</td>
								</tr>
								<tr>
									<td nowrap width="60">[[Width]]:</td>
									<td>
										<INPUT TYPE="text" SIZE="2" id="inp_width" onkeyup="checkConstrains('width');" rem-skipAutoFireChanged="1" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px">
									</td>
									<td rowspan="2" align="right" valign="middle"><img src="../images/locked.gif" id="imgLock" width="25" height="32" alt="Constrained Proportions" /></td>
								</tr>
								<tr>
									<td nowrap>[[Height]]:</td>
									<td>
										<INPUT TYPE="text" SIZE="2" id="inp_height" onkeyup="checkConstrains('width');" rem-skipAutoFireChanged="1" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px">
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="checkbox" id="constrain_prop" checked onclick="javascript:toggleConstrains();" />
										Constrain Proportions</td>
								</tr>
							</table>
						</td>
					</tr>
			</table>
			
		</fieldset>		
		<fieldset>
			<legend>[[Spacing]]</legend>
				<table border="0" cellpadding="4" cellspacing="0" class="normal">
					<tr>
						<td>						
							<table border="0" cellpadding="2" cellspacing="0" class="normal">
								<tr>
									<td valign="middle" width="60">[[Horizontal]]:</td>
									<td><INPUT TYPE="text" SIZE="2" value="5" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH:80px" id="HSpace"></td>
								</tr>
								<tr>
									<td valign="middle">[[Vertical]]:</td>
									<td><INPUT TYPE="text" SIZE="2" NAME="VSpace" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH:80px" id="VSpace"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
		</fieldset>
		</td>
		<td width=5 nowrap></td>
		<td valign="top" width="100%">			
			<div id="outer" style="width:230px; height:235px"><img id="img_demo"></div>
		</td>
	</tr>
</table>
<script>

var OxOd066=["img_demo","inp_width","inp_height","SelectImage.Aspx?settinghash=[[_setting_]]\x26type=gif,jpg,jpeg,png,bmp\x26file=","\x26[[DNN_Arg]]","[[SelectFileDialogOption]]","value","cssText","style","src","","src_cetemp","width","height","id","vspace","hspace","border","borderColor","backgroundColor","align","alt","longDesc","[[ValidNumber]]","[[ValidID]]","$1","inp_src","Width","Height","imgLock","constrain_prop","checked","../images/locked.gif","../images/1x1.gif","length"];var img_demo=document.getElementById(OxOd066[0x0]);var inp_width=document.getElementById(OxOd066[0x1]);var inp_height=document.getElementById(OxOd066[0x2]); function btnbrowse.onclick(){var Ox74=showModalDialog(OxOd066[0x3]+escape(inp_src.value)+OxOd066[0x4],null,OxOd066[0x5]);if(Ox74){ inp_src[OxOd066[0x6]]=Ox74 ; Actualsize() ;} ;}  ; function UpdateState(){ img_demo[OxOd066[0x8]][OxOd066[0x7]]=element[OxOd066[0x8]][OxOd066[0x7]] ; img_demo.mergeAttributes(element) ;if(element[OxOd066[0x9]]){ img_demo[OxOd066[0x9]]=element[OxOd066[0x9]] ;} else { img_demo.removeAttribute(OxOd066[0x9]) ;} ;}  ; function SyncToView(){var src; src=element.getAttribute(OxOd066[0x9])+OxOd066[0xa] ;if(element.getAttribute(OxOd066[0xb])){ src=element.getAttribute(OxOd066[0xb])+OxOd066[0xa] ;} ; inp_src[OxOd066[0x6]]=src ; inp_width[OxOd066[0x6]]=element[OxOd066[0xc]] ; inp_height[OxOd066[0x6]]=element[OxOd066[0xd]] ; inp_id[OxOd066[0x6]]=element[OxOd066[0xe]] ; VSpace[OxOd066[0x6]]=element[OxOd066[0xf]] ; HSpace[OxOd066[0x6]]=element[OxOd066[0x10]] ; Border[OxOd066[0x6]]=element[OxOd066[0x11]] ; bordercolor[OxOd066[0x6]]=element[OxOd066[0x8]][OxOd066[0x12]] ; bordercolor[OxOd066[0x8]][OxOd066[0x13]]=element[OxOd066[0x8]][OxOd066[0x12]] ; bordercolor_Preview[OxOd066[0x8]][OxOd066[0x13]]=element[OxOd066[0x8]][OxOd066[0x12]] ; Align[OxOd066[0x6]]=element[OxOd066[0x14]] ; AlternateText[OxOd066[0x6]]=element[OxOd066[0x15]] ; longDesc[OxOd066[0x6]]=element[OxOd066[0x16]] ;}  ; function SyncTo(element){ element[OxOd066[0x9]]=inp_src[OxOd066[0x6]] ; element.setAttribute(OxOd066[0xb],inp_src.value) ; element[OxOd066[0x11]]=Border[OxOd066[0x6]] ; element[OxOd066[0x10]]=HSpace[OxOd066[0x6]] ; element[OxOd066[0xf]]=VSpace[OxOd066[0x6]] ;try{ element[OxOd066[0xc]]=inp_width[OxOd066[0x6]] ; element[OxOd066[0xd]]=inp_height[OxOd066[0x6]] ;} catch(er){ alert(OxOd066[0x17]) ;return false;} ;if(element[OxOd066[0x8]][OxOd066[0xc]]||element[OxOd066[0x8]][OxOd066[0xd]]){try{ element[OxOd066[0x8]][OxOd066[0xc]]=inp_width[OxOd066[0x6]] ; element[OxOd066[0x8]][OxOd066[0xd]]=inp_height[OxOd066[0x6]] ;} catch(er){ alert(OxOd066[0x17]) ;return false;} ;} ;var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxOd066[0x18]) ;return ;} ; element[OxOd066[0xe]]=inp_id[OxOd066[0x6]] ; element[OxOd066[0x14]]=Align[OxOd066[0x6]] ; element[OxOd066[0x15]]=AlternateText[OxOd066[0x6]] ; element[OxOd066[0x16]]=longDesc[OxOd066[0x6]] ; element[OxOd066[0x8]][OxOd066[0x12]]=bordercolor[OxOd066[0x6]] ;if(element[OxOd066[0x16]]==OxOd066[0xa]){ element.removeAttribute(OxOd066[0x16]) ;} ;if(element[OxOd066[0xc]]==0x0){ element.removeAttribute(OxOd066[0xc]) ;} ;if(element[OxOd066[0xd]]==0x0){ element.removeAttribute(OxOd066[0xd]) ;} ;if(element[OxOd066[0x10]]==OxOd066[0xa]){ element.removeAttribute(OxOd066[0x10]) ;} ;if(element[OxOd066[0xf]]==OxOd066[0xa]){ element.removeAttribute(OxOd066[0xf]) ;} ;if(element[OxOd066[0xe]]==OxOd066[0xa]){ element.removeAttribute(OxOd066[0xe]) ;} ;}  ; function RemoveServerNamesFromUrl(Ox4f4,BaseHref){var Ox629=BaseHref; Ox629=Ox629.replace(/^(https?:\/\/[^\/]+)(.*)$/,OxOd066[0x19]) ; serverre= new RegExp(Ox629) ;return Ox4f4.replace(serverre,OxOd066[0xa]);}  ; function Actualsize(){try{var Oxb9= new Image(); Oxb9[OxOd066[0x9]]=document.getElementById(OxOd066[0x1a])[OxOd066[0x6]] ;if(Oxb9[OxOd066[0xc]]){ document.getElementById(OxOd066[0x1b])[OxOd066[0x6]]=Oxb9[OxOd066[0xc]] ;} ;if(Oxb9[OxOd066[0xd]]){ document.getElementById(OxOd066[0x1c])[OxOd066[0x6]]=Oxb9[OxOd066[0xd]] ;} ;} catch(er){} ;}  ; function toggleConstrains(){var Ox5b2=document.getElementById(OxOd066[0x1d]);var Ox5b3=document.getElementById(OxOd066[0x1e]);if(Ox5b3[OxOd066[0x1f]]){ Ox5b2[OxOd066[0x9]]=OxOd066[0x20] ; checkConstrains(OxOd066[0xc]) ;} else { Ox5b2[OxOd066[0x9]]=OxOd066[0x21] ;} ;}  ;var checkingConstrains=false; function checkConstrains(Ox197){if(checkingConstrains){return ;} ; checkingConstrains=true ;try{var Ox5b3=document.getElementById(OxOd066[0x1e]);var Ox9h;if(Ox5b3[OxOd066[0x1f]]){var Ox5b6= new Image(); Ox5b6[OxOd066[0x9]]=document.getElementById(OxOd066[0x1a])[OxOd066[0x6]] ; original_width=Ox5b6[OxOd066[0xc]] ; original_height=Ox5b6[OxOd066[0xd]] ;if((original_width>0x0)&&(original_height>0x0)){ width=inp_width[OxOd066[0x6]] ; height=inp_height[OxOd066[0x6]] ;if(Ox197==OxOd066[0xc]){if(width[OxOd066[0x22]]==0x0||isNaN(width)){ inp_width[OxOd066[0x6]]=OxOd066[0xa] ; inp_height[OxOd066[0x6]]=OxOd066[0xa] ;} else { height=parseInt(width*original_height/original_width) ; inp_height[OxOd066[0x6]]=height ;} ;} ;if(Ox197==OxOd066[0xd]){if(height[OxOd066[0x22]]==0x0||isNaN(height)){ inp_width[OxOd066[0x6]]=OxOd066[0xa] ; inp_height[OxOd066[0x6]]=OxOd066[0xa] ;} else { width=parseInt(height*original_width/original_height) ; inp_width[OxOd066[0x6]]=width ;} ;} ;} ;} ;} finally{ checkingConstrains=false ;} ;}  ;

</script>
