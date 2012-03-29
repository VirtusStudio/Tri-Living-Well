<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[EditCell]]</legend>
	<table class="normal">
		<tr>
			<td colspan=2>
				<table class="normal" cellpadding=2 cellspacing=1>
					<tr>
						<td width="80" nowrap>[[Width]] :</td>
						<td><input type="text" id="inp_width" onkeypress="event.returnValue=IsDigit();" size="14"></td>
						<td>&nbsp;</td>
						<td width="80" nowrap>[[Height]] :</td>
						<td><input type="text" id="inp_height" onkeypress="event.returnValue=IsDigit();" size="14"></td>
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
						<td><input size="14" type="text" id="inp_bgColor" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])' oncolorchange='inp_bgColor.value=this.selectedColor; inp_bgColor.style.backgroundColor=this.selectedColor'>
						</td>
						<td></td>
						<td nowrap>[[BorderColor]]:</td>
						<td><input size="14" type="text" id="inp_borderColor" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'	oncolorchange='inp_borderColor.value=this.selectedColor; inp_borderColor.style.backgroundColor=this.selectedColor'>
						</td>
					</tr>
					<tr>
						<td nowrap>[[BorderColorLight]]:</td>
						<td><input size="14" type="text" id="inp_borderColorLight" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])' oncolorchange='inp_borderColorLight.value=this.selectedColor; inp_borderColorLight.style.backgroundColor=this.selectedColor'>
						</td>
						<td></td>
						<td nowrap>[[BorderColorDark]]:</td>
						<td><input size="14" type="text" id="inp_borderColorDark" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'	oncolorchange='inp_borderColorDark.value=this.selectedColor; inp_borderColorDark.style.backgroundColor=this.selectedColor'>
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
<!-- #include file="../../_sharedie.htm" -->
<script>

var OxOefc9=["specified","","nodeValue","bgColor","value","id","backgroundColor","style","borderColor","borderColorLight","borderColorDark","className","width","height","align","vAlign","title","[[ValidNumber]]","[[ValidID]]","inp_borderColorDark","valign"]; function SyncToView(){ function GetAttribute(Ox512){var attr=element.getAttributeNode(Ox512);if(attr==null||!attr[OxOefc9[0x0]]){return OxOefc9[0x1];} ;return attr[OxOefc9[0x2]];}  ; inp_bgColor[OxOefc9[0x4]]=GetAttribute(OxOefc9[0x3]) ; inp_id[OxOefc9[0x4]]=GetAttribute(OxOefc9[0x5]) ; inp_bgColor[OxOefc9[0x7]][OxOefc9[0x6]]=inp_bgColor[OxOefc9[0x4]] ; inp_borderColor[OxOefc9[0x4]]=GetAttribute(OxOefc9[0x8]) ; inp_borderColor[OxOefc9[0x7]][OxOefc9[0x6]]=inp_borderColor[OxOefc9[0x4]] ; inp_borderColorLight[OxOefc9[0x4]]=GetAttribute(OxOefc9[0x9]) ; inp_borderColorLight[OxOefc9[0x7]][OxOefc9[0x6]]=inp_borderColorLight[OxOefc9[0x4]] ; inp_borderColorDark[OxOefc9[0x4]]=GetAttribute(OxOefc9[0xa]) ; inp_borderColorDark[OxOefc9[0x7]][OxOefc9[0x6]]=inp_borderColorDark[OxOefc9[0x4]] ; inp_class[OxOefc9[0x4]]=element[OxOefc9[0xb]] ; inp_width[OxOefc9[0x4]]=GetAttribute(OxOefc9[0xc]) ; inp_height[OxOefc9[0x4]]=GetAttribute(OxOefc9[0xd]) ; sel_align[OxOefc9[0x4]]=GetAttribute(OxOefc9[0xe]) ; sel_valign[OxOefc9[0x4]]=GetAttribute(OxOefc9[0xf]) ; inp_tooltip[OxOefc9[0x4]]=GetAttribute(OxOefc9[0x10]) ;}  ; function SyncTo(element){ element[OxOefc9[0x3]]=inp_bgColor[OxOefc9[0x4]] ; element[OxOefc9[0x8]]=inp_borderColor[OxOefc9[0x4]] ; element[OxOefc9[0x9]]=inp_borderColorLight[OxOefc9[0x4]] ; element[OxOefc9[0xa]]=inp_borderColorDark[OxOefc9[0x4]] ; element[OxOefc9[0xb]]=inp_class[OxOefc9[0x4]] ;try{ element[OxOefc9[0xc]]=inp_width[OxOefc9[0x4]] ; element[OxOefc9[0xd]]=inp_height[OxOefc9[0x4]] ;} catch(er){ alert(OxOefc9[0x11]) ;} ;var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxOefc9[0x12]) ;return ;} ; element[OxOefc9[0xe]]=sel_align[OxOefc9[0x4]] ; element[OxOefc9[0x5]]=inp_id[OxOefc9[0x4]] ; element[OxOefc9[0xf]]=sel_valign[OxOefc9[0x4]] ; element[OxOefc9[0x10]]=inp_tooltip[OxOefc9[0x4]] ;if(element[OxOefc9[0x3]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0x3]) ;} ;if(element[OxOefc9[0x8]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0x8]) ;} ;if(element[OxOefc9[0x9]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0x9]) ;} ;if(element[OxOefc9[0x13]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0x13]) ;} ;if(element[OxOefc9[0xb]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0xb]) ;} ;if(element[OxOefc9[0xe]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0xe]) ;} ;if(element[OxOefc9[0xf]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0x14]) ;} ;if(element[OxOefc9[0x10]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0x10]) ;} ;if(element[OxOefc9[0xc]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0xc]) ;} ;if(element[OxOefc9[0xd]]==OxOefc9[0x1]){ element.removeAttribute(OxOefc9[0xd]) ;} ;}  ;
</script>
