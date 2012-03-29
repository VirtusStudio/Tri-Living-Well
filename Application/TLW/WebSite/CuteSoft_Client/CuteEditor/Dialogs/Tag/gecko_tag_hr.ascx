<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table border="0" cellspacing="2" cellpadding="5" width="100%" align="center">
			<tr>
				<td nowrap>
					<div>
						<fieldset style="padding:2px" align="center"><legend>[[InsertHorizontalRule]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td style='vertical-align:middle' class="normal">[[Width]]:</td>
									<td style='vertical-align:middle'>
										<input type="text" id="inp_width" style="width:45px" onkeypress="return IsDigit(event);">
										<SELECT id="eenheid"> 
											<option selected value="%" >%</option>
											<option value="">px</option>
										</SELECT>
									</td>
									<td width="3">&nbsp;
									</td>
									<td style='vertical-align:middle' class="normal">[[Alignment]]:</td>
									<td style='vertical-align:middle'>
										<select style="WIDTH: 68px" id=alignment>
											<option value="left">Left</option>
											<option value="center">Center</option>
											<option value="right">Right</option>
										</select>
									</td>
								</tr>
								<tr>
									<td nowrap class="normal">[[Color]]:</td>
									<td nowrap>
										<input type="text" id="hrcolor" name="hrcolor" size="7" style="WIDTH:57px">
										<img src="../images/colorpicker.gif"  align="absMiddle" onclick="SelectColor('hrcolor',this);">
									</td>
									
									<td width="3">&nbsp;
									</td>
									<td style='vertical-align:middle' class="normal">[[Shade]]:</td>
									<td style='vertical-align:middle'>
										<SELECT id="shade"> 
											<option value=shade "selected">Shade</option>
											<option value=noshade "selected">No shade</option>
										</SELECT>   
									</td>
								</tr>
								</tr>
								<tr>
									<td style='vertical-align:middle' class="normal">[[Size]]:</td>
									<td style='vertical-align:middle' colspan=4>
										<SELECT id="sel_size" style="width:67px">
											<option selected value=1>1 px</option>
											<option value=2>2 px</option>
											<option value=3>3 px</option>
											<option value=4>4 px</option>
											<option value=5>5 px</option>
											<option value=6>6 px</option> 
											<option value=7>7 px</option>
											<option value=8>8 px</option>
											<option value=9>9 px</option>	
											<option value=10>10 px</option>
										</SELECT>
									</td>
								</tr>
								<tr>
							</table>
						</fieldset>
					</div>
				</td>
			</tr>
		</table>
<script>

var OxO87b9=["eenheid","inp_width","sel_size","alignment","hrcolor","shade","width","value","","%","size","align","color","backgroundColor","style","noShade","noshade","keyCode"];var eenheid=document.getElementById(OxO87b9[0x0]);var inp_width=document.getElementById(OxO87b9[0x1]);var sel_size=document.getElementById(OxO87b9[0x2]);var alignment=document.getElementById(OxO87b9[0x3]);var hrcolor=document.getElementById(OxO87b9[0x4]);var shade=document.getElementById(OxO87b9[0x5]);var hrcolor=document.getElementById(OxO87b9[0x4]); function UpdateState(){}  ; function SyncToView(){if(element[OxO87b9[0x6]]){if(value=element[OxO87b9[0x6]].search(/%/)<0x0){ eenheid[OxO87b9[0x7]]=OxO87b9[0x8] ; inp_width[OxO87b9[0x7]]=element[OxO87b9[0x6]] ;} else { eenheid[OxO87b9[0x7]]=OxO87b9[0x9] ; inp_width[OxO87b9[0x7]]=element[OxO87b9[0x6]].split(OxO87b9[0x9])[0x0] ;} ;} ; sel_size[OxO87b9[0x7]]=element[OxO87b9[0xa]] ; alignment[OxO87b9[0x7]]=element[OxO87b9[0xb]] ; hrcolor[OxO87b9[0x7]]=element[OxO87b9[0xc]] ;if(element[OxO87b9[0xc]]){ hrcolor[OxO87b9[0xe]][OxO87b9[0xd]]=element[OxO87b9[0xc]] ;} ;if(element[OxO87b9[0xf]]){ shade[OxO87b9[0x7]]=OxO87b9[0x10] ;} else { shade[OxO87b9[0x7]]=OxO87b9[0x8] ;} ;}  ; function SyncTo(){if(sel_size[OxO87b9[0x7]]){ element[OxO87b9[0xa]]=sel_size[OxO87b9[0x7]] ;} ;if(hrcolor[OxO87b9[0x7]]){ element[OxO87b9[0xc]]=hrcolor[OxO87b9[0x7]] ;} ;if(alignment[OxO87b9[0x7]]){ element[OxO87b9[0xb]]=alignment[OxO87b9[0x7]] ;} ;if(shade[OxO87b9[0x7]]==OxO87b9[0x10]){ element[OxO87b9[0xf]]=true ;} else { element[OxO87b9[0xf]]=false ;} ;if(inp_width[OxO87b9[0x7]]){ element[OxO87b9[0x6]]=inp_width[OxO87b9[0x7]]+eenheid[OxO87b9[0x7]] ;} ;}  ; function IsDigit(){return ((event[OxO87b9[0x11]]>=0x30)&&(event[OxO87b9[0x11]]<=0x39));}  ;
</script>
