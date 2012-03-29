<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
	<table width=100% align=center cellpadding=0 cellspacing=0>
		<tr>
			<td valign=top style="padding:5;padding-bottom:0;height:100%">
				<table>
					<tr>
						<td valign=top style="padding:3">
							<div style="overflow:auto;border:gray 1 solid;width:115;height:127;">
								<table id=tblBorderStyle cellpadding=5 cellspacing=0 width=100% style="table-layout:fixed;background:white">
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border:none;height:10;width:85">[[NotSet]]</div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)"  onclick="doBorderStyle('solid')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-bottom:black solid;height:10;width:85" title="dotted"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)"  onclick="doBorderStyle('dotted')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-bottom:black dotted;height:10;width:85" title="dotted"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('dashed')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-bottom:black dashed;height:10;width:85" title="dashed"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('double')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-bottom:black dotted;height:10;width:85" title="double"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('groove')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-style:groove;height:10;width:85" title="groove"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('ridge')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-style:ridge;height:10;width:85" title="ridge"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('inset')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-style:inset;height:10;width:85" title="inset"></div>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doBorderStyle('outset')" style="cursor:default;height:25;padding:4;border:white 1 solid;">
											<div style="border-style:outset;height:10;width:85" title="outset"></div>
										</td>
									</tr>
								</table>
							</div>
							<input type=hidden id="sel_style">
						</td>
						<td valign=top style="padding:3">
							<div style='overflow:auto;border:gray 1 solid;width:115;height:127'>
								<table id=tblBorderApplyTo cellpadding=5 cellspacing=0 width=100% style='table-layout:fixed;background:white'>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('1px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >1px</td><td valign=top width=100%> <table style='border-bottom:black 1px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('2px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >2px</td><td valign=top width=100%> <table style='border-bottom:black 2px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('3px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >3px</td><td valign=top width=100%> <table style='border-bottom:black 2px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('4px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >4px</td><td valign=top width=100%> <table style='border-bottom:black 4px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('5px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >5px</td><td valign=top width=100%> <table style='border-bottom:black 5px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('6px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >6px</td><td valign=top width=100%> <table style='border-bottom:black 6px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doWidth('7px')" style="height:25;padding:1;border:white 1 solid;" >
											<table width=100%><tr><td style="height:25" >7px</td><td valign=top width=100%> <table style='border-bottom:black 7px solid;height:16;' width=100%><tr><td></td></tr></table> </td></tr></table>
										</td>
									</tr>
								</table>
								<input type=hidden name=sel_border id=sel_border>
							</div>		
						</td>
						<td valign=top style="padding:3" nowrap>													
							<div style='overflow:auto;border:gray 1 solid;width:55;height:127'>
								<table id=tblBorderApplyTo cellpadding=5 cellspacing=0 width=100% style='table-layout:fixed;background:white'>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doPart('none')" style="height:30;padding:4;border:white 1 solid;" >
											<img src='../images/border_none.gif' alt='No Border'>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doPart('')" style="height:30;padding:4;border:white 1 solid;" >
											<img src='../images/border_outside.gif' alt='All'>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doPart('left')" style="height:30;padding:4;border:white 1 solid;" >
											<img src='../images/border_left.gif' alt='[[Left]]'>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doPart('top')" style="height:30;padding:4;border:white 1 solid;" >
											<img src='../images/border_top.gif' alt='[[Top]]'>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doPart('right')" style="height:30;padding:4;border:white 1 solid;" >
											<img src='../images/border_right.gif' alt='[[Right]]'>
										</td>
									</tr>
									<tr>
										<td valign=top onMouseOver="m_Check(this,1)" onMouseOut="m_Check(this,0)" onclick="doPart('bottom')" style="height:30;padding:4;border:white 1 solid;" >
											<img src='../images/border_bottom.gif' alt='[[Bottom]]'>
										</td>
									</tr>
								</table>
								<input type=hidden name=sel_part id=sel_part>
							</div>
						</td>
						<td valign=top style="padding:0 5px 3px 8px" nowrap>
							<table cellpadding=0 cellspacing=0 style="padding-bottom:10">								
								<tr>						
									<td nowrap>[[Bordercolor]]:<br>
										<input type="text" id="bordercolor" name="bordercolor" size="7" style="WIDTH:57px">
										<img id="bordercolor_Preview" src="../images/colorpicker.gif"  align="absMiddle" onclick="SelectColor('bordercolor',this);" >
									</td>
								</tr>
								<tr>
									<td nowrap>[[ForeColor]]:<br>
										<input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px">
										<img id="inp_color_Preview" src="../images/colorpicker.gif"  align="absMiddle"  onclick="SelectColor('inp_color',this);">
									</td>
								</tr>
								<tr>						
									<td nowrap>[[Shade]]:<br>
										<input type="text" id="inp_shade" name="inp_shade" size="7" style="WIDTH:57px">
										<img id="inp_shade_Preview" src="../images/colorpicker.gif"  align="absMiddle" onclick="SelectColor('inp_shade',this);">
									</td>
								</tr>				
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td nowrap style="padding-left:8; padding-top:10">
				
				<table cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<table cellpadding=2 cellspacing=0>
								<tr><td colspan=7>[[Margin]]:</td></tr>
								<tr>
								<td><span>[[Left]]</span>:</td>
								<td><input type="text" id="inp_MarginLeft" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								<td>&nbsp;&nbsp;</td>
								<td align=right><span>[[Right]]</span>:</td>
								<td><input type="text" id="inp_MarginRight" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								</tr>
								<tr>
								<td><span>[[Top]]</span>:</td>
								<td><input type="text" id="inp_MarginTop" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								<td>&nbsp;&nbsp;</td>
								<td align=right><span>[[Bottom]]</span>:</td>
								<td><input type="text" id="inp_MarginBottom" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								</tr>
							</table>
						</td>
						<td>
							<div style="margin:5;height:55;border-left:lightgrey 1 solid"></div>
						</td>
						<td style="padding-bottom:5">				
							<table cellpadding=2 cellspacing=0>
								<tr><td colspan=7>[[Padding]]:</td></tr>
								<tr>
								<td><span>[[Left]]</span>:</td>
								<td><input type="text" id="inp_PaddingLeft" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								<td>&nbsp;&nbsp;</td>
								<td align=right><span>[[Right]]</span>:</td>
								<td><input type="text" id="inp_PaddingRight" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								</tr>
								<tr>
								<td><span>[[Top]]</span>:</td>
								<td><input type="text" id="inp_PaddingTop" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								<td>&nbsp;&nbsp;</td>
								<td align=right><span>[[Bottom]]</span>:</td>
								<td><input type="text" id="inp_PaddingBottom" size=1 onkeypress="return IsDigit(event);"></td>
								<td> px</td>
								</tr>
							</table>					
						</td>
					</tr>
					<tr>
						<td colspan=3 style="padding-top:3;padding-bottom:5;border-top:lightgrey 1 solid">						
							<fieldset><legend>[[Common]]</legend>
								<table class="normal">
									<tr>
										<td width="80" nowrap>[[Width]]:</td>
										<td><nobr>
											<input type="text" id="inp_width" size="8" onkeypress="return IsDigit(event);">
											<select id="sel_width_unit">
												<option value="px">px</option>
												<option value="%">%</option>
											</select></nobr>
										</td>
										<td></td>
										<td>[[Height]]:</td>
										<td><nobr>
											<input type="text" id="inp_height" size="8" onkeypress="return IsDigit(event);">
											<select id="sel_height_unit">
												<option value="px">px</option>
												<option value="%">%</option>
											</select></nobr>
										</td>
									</tr>
									<tr>
										<td valign="middle" nowrap>[[ID]]:</td>
										<td><input type="text" id="inp_id" size="16"></td>	
										<td></td>									
										<td style='width:60px'>[[CssClass]]:</td>
										<td><input type="text" id="inp_class" size="16"></td>
									</tr>
									<tr>
										<td>[[Alignment]]:</td>
										<td colspan=4>
											<select id="sel_align">
												<option value="">[[NotSet]]</option>
												<option value="left">[[Left]]</option>
												<option value="center">[[Center]]</option>
												<option value="right">[[Right]]</option>
											</select>
											&nbsp;
											[[Text-Align]] :
											<select id="sel_textalign">
												<option value="">[[NotSet]]</option>
												<option value="left">[[Left]]</option>
												<option value="center">[[Center]]</option>
												<option value="right">[[Right]]</option>
												<option value="justify">[[Justify]]</option>
											</select>
											&nbsp;
											[[Float]]:
											<select id="sel_float">
												<option value="">[[NotSet]]</option>
												<option value="left">[[Left]]</option>
												<option value="right">[[Right]]</option>
											</select>
										</td>
									</tr>
									<tr>
										<td style='width:60px'>[[Title]] :</td>
										<td colspan="4">
											<textarea id="inp_tooltip" rows="2" style="width:320px"></textarea>
										</td>
									</tr>
								</table>
							</fieldset>
						</td>
					</tr>		
				</table>
			</td>
		</tr>
	</table>

<script>

var OxO4bb4=["sel_style","sel_part","sel_border","inp_color","inp_shade","inp_id","inp_MarginLeft","inp_MarginRight","inp_MarginTop","inp_MarginBottom","inp_PaddingLeft","inp_PaddingRight","inp_PaddingTop","inp_PaddingBottom","inp_class","inp_width","inp_height","sel_align","sel_textalign","sel_float","inp_tooltip","sel_width_unit","sel_height_unit","bordercolor","bordercolor_Preview","inp_color_Preview","inp_shade_Preview","value","borderColor","style"," ","backgroundColor","color","id","className","width","height","length","inp_","sel_","_unit","selectedIndex","align","styleFloat","textAlign","title","border","borderBottomWidth","borderLeftWidth","borderRightWidth","borderTopWidth","borderBottomStyle","borderLeftStyle","borderRightStyle","borderTopStyle","[[ValidID]]","none","-","red","","paddingLeft","paddingRight","paddingTop","paddingBottom","marginLeft","marginRight","marginTop","marginBottom","class","1px solid #00107B","background","#F1EEE7","which","keyCode","preventDefault","../colorpicker.aspx","width=600,height=400,resizable=1,toolbars=0,menubar=0,status=0","returnValue"];var sel_style=document.getElementById(OxO4bb4[0x0]);var sel_part=document.getElementById(OxO4bb4[0x1]);var sel_border=document.getElementById(OxO4bb4[0x2]);var inp_color=document.getElementById(OxO4bb4[0x3]);var inp_shade=document.getElementById(OxO4bb4[0x4]);var inp_id=document.getElementById(OxO4bb4[0x5]);var inp_MarginLeft=document.getElementById(OxO4bb4[0x6]);var inp_MarginRight=document.getElementById(OxO4bb4[0x7]);var inp_MarginTop=document.getElementById(OxO4bb4[0x8]);var inp_MarginBottom=document.getElementById(OxO4bb4[0x9]);var inp_PaddingLeft=document.getElementById(OxO4bb4[0xa]);var inp_PaddingRight=document.getElementById(OxO4bb4[0xb]);var inp_PaddingTop=document.getElementById(OxO4bb4[0xc]);var inp_PaddingBottom=document.getElementById(OxO4bb4[0xd]);var inp_class=document.getElementById(OxO4bb4[0xe]);var inp_width=document.getElementById(OxO4bb4[0xf]);var inp_height=document.getElementById(OxO4bb4[0x10]);var sel_align=document.getElementById(OxO4bb4[0x11]);var sel_textalign=document.getElementById(OxO4bb4[0x12]);var sel_float=document.getElementById(OxO4bb4[0x13]);var inp_tooltip=document.getElementById(OxO4bb4[0x14]);var inp_width=document.getElementById(OxO4bb4[0xf]);var sel_width_unit=document.getElementById(OxO4bb4[0x15]);var inp_height=document.getElementById(OxO4bb4[0x10]);var sel_height_unit=document.getElementById(OxO4bb4[0x16]);var bordercolor=document.getElementById(OxO4bb4[0x17]);var bordercolor_Preview=document.getElementById(OxO4bb4[0x18]);var inp_color=document.getElementById(OxO4bb4[0x3]);var inp_color_Preview=document.getElementById(OxO4bb4[0x19]);var inp_shade=document.getElementById(OxO4bb4[0x4]);var inp_shade_Preview=document.getElementById(OxO4bb4[0x1a]); function UpdateState(){}  ; function doBorderStyle(Ox25){ sel_style[OxO4bb4[0x1b]]=Ox25 ;}  ; function doPart(Ox25){ sel_part[OxO4bb4[0x1b]]=Ox25 ;}  ; function doWidth(Ox25){if(Ox25){ sel_border[OxO4bb4[0x1b]]=Ox25 ;} ;}  ; function SyncToView(){if(element[OxO4bb4[0x1d]][OxO4bb4[0x1c]]){var arr=revertColor(element[OxO4bb4[0x1d]].borderColor).split(OxO4bb4[0x1e]); bordercolor[OxO4bb4[0x1b]]=arr[0x0] ;} ; bordercolor[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=bordercolor[OxO4bb4[0x1b]] ; bordercolor_Preview[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=bordercolor[OxO4bb4[0x1b]] ; inp_color[OxO4bb4[0x1b]]=revertColor(element[OxO4bb4[0x1d]].color) ; inp_color[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=element[OxO4bb4[0x1d]][OxO4bb4[0x20]] ; inp_color_Preview[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=element[OxO4bb4[0x1d]][OxO4bb4[0x20]] ; inp_shade[OxO4bb4[0x1b]]=revertColor(element[OxO4bb4[0x1d]].backgroundColor) ; inp_shade[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=element[OxO4bb4[0x1d]][OxO4bb4[0x1f]] ; inp_shade_Preview[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=element[OxO4bb4[0x1d]][OxO4bb4[0x1f]] ; inp_id[OxO4bb4[0x1b]]=element[OxO4bb4[0x21]] ;if(ParseToString(element[OxO4bb4[0x1d]].marginLeft)){ inp_MarginLeft[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].marginLeft) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].marginRight)){ inp_MarginRight[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].marginRight) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].marginTop)){ inp_MarginTop[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].marginTop) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].marginBottom)){ inp_MarginBottom[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].marginBottom) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].paddingLeft)){ inp_PaddingLeft[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].paddingLeft) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].paddingRight)){ inp_PaddingRight[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].paddingRight) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].paddingTop)){ inp_PaddingTop[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].paddingTop) ;} ;if(ParseToString(element[OxO4bb4[0x1d]].paddingBottom)){ inp_PaddingBottom[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]].paddingBottom) ;} ; inp_class[OxO4bb4[0x1b]]=element[OxO4bb4[0x22]] ;var arr=[OxO4bb4[0x23],OxO4bb4[0x24]];for(var Oxd7=0x0;Oxd7<arr[OxO4bb4[0x25]];Oxd7++){var n=arr[Oxd7];var e=document.getElementById(OxO4bb4[0x26]+n);var Ox25=document.getElementById(OxO4bb4[0x27]+n+OxO4bb4[0x28]); Ox25[OxO4bb4[0x29]]=0x0 ;if(ParseToString(element[OxO4bb4[0x1d]][n])){ e[OxO4bb4[0x1b]]=ParseToString(element[OxO4bb4[0x1d]][n]) ;} ;} ; sel_align[OxO4bb4[0x1b]]=element[OxO4bb4[0x2a]] ; sel_float[OxO4bb4[0x1b]]=element[OxO4bb4[0x1d]][OxO4bb4[0x2b]] ; sel_textalign[OxO4bb4[0x1b]]=element[OxO4bb4[0x1d]][OxO4bb4[0x2c]] ; inp_tooltip[OxO4bb4[0x1b]]=element[OxO4bb4[0x2d]] ;if(element[OxO4bb4[0x1d]][OxO4bb4[0x2e]]){ sel_border[OxO4bb4[0x1b]]=element[OxO4bb4[0x1d]][OxO4bb4[0x2e]] ;} ;if(element[OxO4bb4[0x1d]][OxO4bb4[0x30]]==element[OxO4bb4[0x1d]][OxO4bb4[0x32]]&&element[OxO4bb4[0x1d]][OxO4bb4[0x30]]==element[OxO4bb4[0x1d]][OxO4bb4[0x31]]&&element[OxO4bb4[0x1d]][OxO4bb4[0x30]]==element[OxO4bb4[0x1d]][OxO4bb4[0x2f]]){ sel_border[OxO4bb4[0x1b]]=element[OxO4bb4[0x1d]][OxO4bb4[0x30]] ;} ;if(element[OxO4bb4[0x1d]][OxO4bb4[0x34]]==element[OxO4bb4[0x1d]][OxO4bb4[0x36]]&&element[OxO4bb4[0x1d]][OxO4bb4[0x34]]==element[OxO4bb4[0x1d]][OxO4bb4[0x35]]&&element[OxO4bb4[0x1d]][OxO4bb4[0x34]]==element[OxO4bb4[0x1d]][OxO4bb4[0x33]]){ sel_style[OxO4bb4[0x1b]]=element[OxO4bb4[0x1d]][OxO4bb4[0x34]] ;} ;}  ; function SyncTo(){var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxO4bb4[0x37]) ;return ;} ; element[OxO4bb4[0x21]]=inp_id[OxO4bb4[0x1b]] ;var Ox6fe=sel_part[OxO4bb4[0x1b]];if(Ox6fe==OxO4bb4[0x38]){ element[OxO4bb4[0x1d]][OxO4bb4[0x2e]]=OxO4bb4[0x38] ;} else {var Ox6ff=Ox6fe?OxO4bb4[0x39]+Ox6fe:Ox6fe;var Ox6b=OxO4bb4[0x3a];var Ox83=sel_style[OxO4bb4[0x1b]]||OxO4bb4[0x3b];var Ox700=sel_border[OxO4bb4[0x1b]]; element[OxO4bb4[0x1d]][OxO4bb4[0x2e]]=OxO4bb4[0x38] ;if(Ox700||Ox83){ SetStyle(element[OxO4bb4[0x1d]],OxO4bb4[0x2e]+Ox6ff,Ox700+OxO4bb4[0x1e]+Ox83+OxO4bb4[0x1e]+Ox6b) ;} else { SetStyle(element[OxO4bb4[0x1d]],OxO4bb4[0x2e]+Ox6ff,OxO4bb4[0x3b]) ;} ; SetStyle(element[OxO4bb4[0x1d]],OxO4bb4[0x2e]+Ox6ff,Ox700+OxO4bb4[0x1e]+Ox83+OxO4bb4[0x1e]+Ox6b) ;} ;try{ element[OxO4bb4[0x1d]][OxO4bb4[0x20]]=inp_color[OxO4bb4[0x1b]]||OxO4bb4[0x3b] ;} catch(x){ element[OxO4bb4[0x1d]][OxO4bb4[0x20]]=OxO4bb4[0x3b] ;} ;try{ element[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=inp_shade[OxO4bb4[0x1b]]||OxO4bb4[0x3b] ;} catch(x){ element[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=OxO4bb4[0x3b] ;} ;try{ element[OxO4bb4[0x1d]][OxO4bb4[0x1c]]=bordercolor[OxO4bb4[0x1b]]||OxO4bb4[0x3b] ;} catch(x){ element[OxO4bb4[0x1d]][OxO4bb4[0x1c]]=OxO4bb4[0x3b] ;} ; element[OxO4bb4[0x1d]][OxO4bb4[0x3c]]=inp_PaddingLeft[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x3d]]=inp_PaddingRight[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x3e]]=inp_PaddingTop[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x3f]]=inp_PaddingBottom[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x40]]=inp_MarginLeft[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x41]]=inp_MarginRight[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x42]]=inp_MarginTop[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x43]]=inp_MarginBottom[OxO4bb4[0x1b]] ; element[OxO4bb4[0x22]]=inp_class[OxO4bb4[0x1b]] ;var arr=[OxO4bb4[0x23],OxO4bb4[0x24]];for(var Oxd7=0x0;Oxd7<arr[OxO4bb4[0x25]];Oxd7++){var n=arr[Oxd7];var e=document.getElementById(OxO4bb4[0x26]+n);var Ox701=document.getElementById(OxO4bb4[0x27]+n+OxO4bb4[0x28]);if(ParseToString(e.value)){ element[OxO4bb4[0x1d]][n]=ParseToString(e.value)+Ox701[OxO4bb4[0x1b]] ;} else { element[OxO4bb4[0x1d]][n]=OxO4bb4[0x3b] ;} ;} ; element[OxO4bb4[0x2a]]=sel_align[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x2b]]=sel_float[OxO4bb4[0x1b]] ; element[OxO4bb4[0x1d]][OxO4bb4[0x2c]]=sel_textalign[OxO4bb4[0x1b]] ; element[OxO4bb4[0x2d]]=inp_tooltip[OxO4bb4[0x1b]] ;if(element[OxO4bb4[0x2d]]==OxO4bb4[0x3b]){ element.removeAttribute(OxO4bb4[0x2d]) ;} ;if(element[OxO4bb4[0x22]]==OxO4bb4[0x3b]){ element.removeAttribute(OxO4bb4[0x22]) ;} ;if(element[OxO4bb4[0x2a]]==OxO4bb4[0x3b]){ element.removeAttribute(OxO4bb4[0x2a]) ;} ;if(element.getAttribute(OxO4bb4[0x44])==OxO4bb4[0x3b]){ element.removeAttribute(OxO4bb4[0x44]) ;} ;}  ; function m_Check(Ox20,n){if(n==0x1){ Ox20[OxO4bb4[0x1d]][OxO4bb4[0x2e]]=OxO4bb4[0x45] ; Ox20[OxO4bb4[0x1d]][OxO4bb4[0x46]]=OxO4bb4[0x47] ;} else { Ox20[OxO4bb4[0x1d]][OxO4bb4[0x2e]]=OxO4bb4[0x3b] ; Ox20[OxO4bb4[0x1d]][OxO4bb4[0x46]]=OxO4bb4[0x3b] ;} ;}  ; function IsDigit(e){var Ox17b=e[OxO4bb4[0x49]]||e[OxO4bb4[0x48]];if((Ox17b<0x30||Ox17b>0x39)&&Ox17b!=0x8&&(Ox17b<0x23||Ox17b>0x25)&&Ox17b!=0x27&&Ox17b!=0x2e){if(e[OxO4bb4[0x4a]]){ e.preventDefault() ;} ;return false; e[OxO4bb4[0x49]]=0x0 ;} ;}  ; function SelectColor(Ox19a,Ox566){var Ox567=OxO4bb4[0x4b]; showModalDialog(Ox567,null,OxO4bb4[0x4c],function (Ox2dc,Ox18d){if(Ox18d[OxO4bb4[0x4d]]){ document.getElementById(Ox19a)[OxO4bb4[0x1b]]=Ox18d[OxO4bb4[0x4d]].toUpperCase() ; document.getElementById(Ox19a)[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=Ox18d[OxO4bb4[0x4d]] ; Ox566[OxO4bb4[0x1d]][OxO4bb4[0x1f]]=Ox18d[OxO4bb4[0x4d]] ;} ;} ) ;}  ;

</script>
