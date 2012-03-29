<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[EditCell]]</legend>
	<table class="normal">
		<tr>
			<td colspan=2>
				<table class="normal" cellpadding=2 cellspacing=1>
					<tr>
						<td width="80" nowrap>[[Width]] :</td>
						<td><input type="text" id="inp_width" onkeypress="return IsDigit(event);" size="14"></td>
						<td>&nbsp;</td>
						<td width="80" nowrap>[[Height]] :</td>
						<td><input type="text" id="inp_height" onkeypress="return IsDigit(event);" size="14"></td>
					</tr>
					<tr>
						<td nowrap>[[Alignment]]:</td>
						<td>
							<select id="sel_align" style="width:90px">
								<option value="">[[NotSet]]</option>
								<option value="left">[[Left]]</option>
								<option value="center">[[Center]]</option>
								<option value="right">[[Right]]</option>
							</select>
						</td>
						<td></td>
						<td nowrap>[[vertical]] [[Alignment]]:</td>
						<td><select id="sel_valign" style="width:90px">
								<option value="">[[NotSet]]</option>
								<option value="top">[[Top]]</option>
								<option value="middle">[[Middle]]</option>
								<option value="baseline">[[Baseline]]</option>
								<option value="bottom">[[Bottom]]</option>
							</select>
						</td>
					</tr>
					<tr>
						<td nowrap>[[BackgroundColor]]:</td>
						<td><input size="14" type="text" id="inp_bgColor" onclick="SelectColor('inp_bgColor',this);">
						</td>
						<td></td>
						<td nowrap>[[BorderColor]]:</td>
						<td><input size="14" type="text" id="inp_borderColor" onclick="SelectColor('inp_borderColor',this);">
						</td>
					</tr>
					<tr>
						<td nowrap>[[BorderColorLight]]:</td>
						<td><input size="14" type="text" id="inp_borderColorLight" onclick="SelectColor('inp_borderColorLight',this);">
						</td>
						<td></td>
						<td nowrap>[[BorderColorDark]]:</td>
						<td><input size="14" type="text" id="inp_borderColorDark"  onclick="SelectColor('inp_borderColorDark',this);">
						</td>
					</tr>
					<tr>
						<td nowrap>[[CssClass]]:</td>
						<td><input size="14" type="text" id="inp_class"></td>
						<td></td>
						<td valign="middle" nowrap>[[ID]]:</td>
						<td><input type="text" id="inp_id" size="14"></td>
					</tr>
					<tr>
						<td nowrap>[[Title]]:</td>
						<td colspan="4"><textarea id="inp_tooltip" rows="6" cols="53"></textarea></td>
					</tr>
				</table>
			</td>			
		</tr>
	</table>
</fieldset>
<script>

var OxO5dd1=["inp_width","inp_height","sel_align","sel_valign","inp_bgColor","inp_borderColor","inp_borderColorLight","inp_borderColorDark","inp_bgColor_Preview","inp_borderColordark_Preview","inp_class","inp_tooltip","inp_id","bgColor","value","backgroundColor","style","borderColor","borderColorLight","borderColorDark","className","width","height","align","vAlign","title","id","[[ValidNumber]]","[[ValidID]]","","valign"];var inp_width=document.getElementById(OxO5dd1[0x0]);var inp_height=document.getElementById(OxO5dd1[0x1]);var sel_align=document.getElementById(OxO5dd1[0x2]);var sel_valign=document.getElementById(OxO5dd1[0x3]);var inp_bgColor=document.getElementById(OxO5dd1[0x4]);var inp_borderColor=document.getElementById(OxO5dd1[0x5]);var inp_borderColorLight=document.getElementById(OxO5dd1[0x6]);var inp_borderColorDark=document.getElementById(OxO5dd1[0x7]);var inp_bgColor_Preview=document.getElementById(OxO5dd1[0x8]);var inp_borderColordark_Preview=document.getElementById(OxO5dd1[0x9]);var inp_class=document.getElementById(OxO5dd1[0xa]);var inp_tooltip=document.getElementById(OxO5dd1[0xb]);var inp_id=document.getElementById(OxO5dd1[0xc]); function SyncToView(){if(element[OxO5dd1[0xd]]){ inp_bgColor[OxO5dd1[0xe]]=element[OxO5dd1[0xd]] ; inp_bgColor[OxO5dd1[0x10]][OxO5dd1[0xf]]=inp_bgColor[OxO5dd1[0xe]] ;} ;if(element[OxO5dd1[0x11]]){ inp_borderColor[OxO5dd1[0xe]]=element[OxO5dd1[0x11]] ; inp_borderColor[OxO5dd1[0x10]][OxO5dd1[0xf]]=inp_borderColor[OxO5dd1[0xe]] ;} ;if(element[OxO5dd1[0x12]]){ inp_borderColorLight[OxO5dd1[0xe]]=element[OxO5dd1[0x12]] ; inp_borderColorLight[OxO5dd1[0x10]][OxO5dd1[0xf]]=element[OxO5dd1[0x12]] ; inp_borderColorlight_Preview[OxO5dd1[0x10]][OxO5dd1[0xf]]=element[OxO5dd1[0x12]] ;} ;if(element[OxO5dd1[0x13]]){ inp_borderColorDark[OxO5dd1[0xe]]=element[OxO5dd1[0x13]] ; inp_borderColorDark[OxO5dd1[0x10]][OxO5dd1[0xf]]=element[OxO5dd1[0x7]] ; inp_borderColordark_Preview[OxO5dd1[0x10]][OxO5dd1[0xf]]=element[OxO5dd1[0x7]] ;} ;if(element[OxO5dd1[0x14]]){ inp_class[OxO5dd1[0xe]]=element[OxO5dd1[0x14]] ;} ;if(element[OxO5dd1[0x15]]){ inp_width[OxO5dd1[0xe]]=element[OxO5dd1[0x15]] ;} ;if(element[OxO5dd1[0x16]]){ inp_height[OxO5dd1[0xe]]=element[OxO5dd1[0x16]] ;} ;if(element[OxO5dd1[0x17]]){ sel_align[OxO5dd1[0xe]]=element[OxO5dd1[0x17]] ;} ;if(element[OxO5dd1[0x18]]){ sel_valign[OxO5dd1[0xe]]=element[OxO5dd1[0x18]] ;} ;if(element[OxO5dd1[0x19]]){ inp_tooltip[OxO5dd1[0xe]]=element[OxO5dd1[0x19]] ;} ; inp_id[OxO5dd1[0xe]]=element[OxO5dd1[0x1a]] ;}  ; function SyncTo(){ element[OxO5dd1[0xd]]=inp_bgColor[OxO5dd1[0xe]] ; element[OxO5dd1[0x11]]=inp_borderColor[OxO5dd1[0xe]] ; element[OxO5dd1[0x12]]=inp_borderColorLight[OxO5dd1[0xe]] ; element[OxO5dd1[0x13]]=inp_borderColorDark[OxO5dd1[0xe]] ; element[OxO5dd1[0x14]]=inp_class[OxO5dd1[0xe]] ;try{ element[OxO5dd1[0x15]]=inp_width[OxO5dd1[0xe]] ; element[OxO5dd1[0x16]]=inp_height[OxO5dd1[0xe]] ;} catch(er){ alert(OxO5dd1[0x1b]) ;} ;var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxO5dd1[0x1c]) ;return ;} ; element[OxO5dd1[0x17]]=sel_align[OxO5dd1[0xe]] ; element[OxO5dd1[0x1a]]=inp_id[OxO5dd1[0xe]] ; element[OxO5dd1[0x18]]=sel_valign[OxO5dd1[0xe]] ; element[OxO5dd1[0x19]]=inp_tooltip[OxO5dd1[0xe]] ;if(element[OxO5dd1[0xd]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0xd]) ;} ;if(element[OxO5dd1[0x11]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x11]) ;} ;if(element[OxO5dd1[0x12]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x12]) ;} ;if(element[OxO5dd1[0x7]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x7]) ;} ;if(element[OxO5dd1[0x14]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x14]) ;} ;if(element[OxO5dd1[0x17]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x17]) ;} ;if(element[OxO5dd1[0x18]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x1e]) ;} ;if(element[OxO5dd1[0x19]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x19]) ;} ;if(element[OxO5dd1[0x15]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x15]) ;} ;if(element[OxO5dd1[0x16]]==OxO5dd1[0x1d]){ element.removeAttribute(OxO5dd1[0x16]) ;} ;}  ;
</script>
