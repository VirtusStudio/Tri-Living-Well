<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[EditRow]]</legend>
	<table class="normal">
		<tr>
			<td colspan=2>
				<table class="normal" width="100%">
					<tr>
						<td width="20%">[[Width]] :</td>
						<td width="28%"><input type="text" id="inp_width" onkeypress="event.returnValue=IsDigit();" style="width:70px"></td>
						<td width=4%></td>
						<td width="20%">[[Height]] :</td>
						<td width="28%"><input type="text" id="inp_height" onkeypress="event.returnValue=IsDigit();" style="width:70px"></td>
					</tr>
					<tr>
						<td nowrap>[[Alignment]]:</td>
						<td>
							<select id="sel_align" style="width:70px">
								<option value="">[[NotSet]]</option>
								<option value="left">[[Left]]</option>
								<option value="center">[[Center]]</option>
								<option value="right">[[Right]]</option>
							</select>
						</td>
						<td>
						</td>
						<td nowrap>[[vertical]] [[Alignment]]:</td>
						<td><select id="sel_valign" style="width:70px">
								<option value="">[[NotSet]]</option>
								<option value="top">[[Top]]</option>
								<option value="middle">[[Middle]]</option>
								<option value="baseline">[[Baseline]]</option>
								<option value="bottom">[[Bottom]]</option>
							</select>
						</td>
					</tr>
				</table>
			</td>			
		</tr>
		<tr>
			<td nowrap>[[BackgroundColor]]:</td>
			<td><input type="text" id="inp_bgColor" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])' oncolorchange='inp_bgColor.value=this.selectedColor; inp_bgColor.style.backgroundColor=this.selectedColor'>
			</td>
		</tr>
		<tr>
			<td nowrap>[[BorderColor]]:</td>
			<td><input type="text" id="inp_borderColor" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'	oncolorchange='inp_borderColor.value=this.selectedColor; inp_borderColor.style.backgroundColor=this.selectedColor'>
			</td>
		</tr>
		<tr>
			<td nowrap>[[BorderColorLight]]:</td>
			<td><input type="text" id="inp_borderColorlight" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])' oncolorchange='inp_borderColorlight.value=this.selectedColor; inp_borderColorlight.style.backgroundColor=this.selectedColor'>
			</td>
		</tr>
		<tr>
			<td nowrap>[[BorderColorDark]]:</td>
			<td><input type="text" id="inp_borderColordark" oncolorpopup="this.selectedColor=value" style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'	oncolorchange='inp_borderColordark.value=this.selectedColor; inp_borderColordark.style.backgroundColor=this.selectedColor'>
			</td>
		</tr>
		<tr>	
			<td nowrap>[[Title]]:</td>
			<td>
				<textarea id="inp_tooltip" rows="3" style="width:320px"></textarea>
			</td>
		</tr>
		<tr>
			<td nowrap>[[CssClass]]:</td>
			<td><input type="text" id="inp_class" style="width:120px"></td>
		</tr>
	</table>
</fieldset>
<script>


var OxO8450=["inp_bgColor","inp_borderColor","inp_borderColorlight","inp_borderColordark","inp_class","inp_width","inp_height","sel_align","sel_valign","inp_tooltip","bgColor","value","backgroundColor","style","borderColor","borderColorLight","borderColorDark","className","width","height","align","vAlign","title","borderColorlight","borderColordark","[[ValidNumber]]","keyCode"];var inp_bgColor=document.getElementById(OxO8450[0x0]);var inp_borderColor=document.getElementById(OxO8450[0x1]);var inp_borderColorlight=document.getElementById(OxO8450[0x2]);var inp_borderColordark=document.getElementById(OxO8450[0x3]);var inp_class=document.getElementById(OxO8450[0x4]);var inp_width=document.getElementById(OxO8450[0x5]);var inp_height=document.getElementById(OxO8450[0x6]);var sel_align=document.getElementById(OxO8450[0x7]);var sel_valign=document.getElementById(OxO8450[0x8]);var inp_tooltip=document.getElementById(OxO8450[0x9]); function SyncToView(){if(element[OxO8450[0xa]]){ inp_bgColor[OxO8450[0xb]]=element[OxO8450[0xa]] ;} ; inp_bgColor[OxO8450[0xd]][OxO8450[0xc]]=inp_bgColor[OxO8450[0xb]] ;if(element[OxO8450[0xe]]){ inp_borderColor[OxO8450[0xb]]=element[OxO8450[0xe]] ;} ; inp_borderColor[OxO8450[0xd]][OxO8450[0xc]]=inp_borderColor[OxO8450[0xb]] ;if(element[OxO8450[0xf]]){ inp_borderColorlight[OxO8450[0xb]]=element[OxO8450[0xf]] ;} ; inp_borderColorlight[OxO8450[0xb]]=inp_borderColorlight[OxO8450[0xb]] ;if(element[OxO8450[0x10]]){ inp_borderColordark[OxO8450[0xb]]=element[OxO8450[0x10]] ;} ; inp_borderColorlight[OxO8450[0xb]]=inp_borderColordark[OxO8450[0xb]] ;if(element[OxO8450[0x11]]){ inp_class[OxO8450[0xb]]=element[OxO8450[0x11]] ;} ;if(element[OxO8450[0x12]]){ inp_width[OxO8450[0xb]]=element[OxO8450[0x12]] ;} ;if(element[OxO8450[0x13]]){ inp_height[OxO8450[0xb]]=element[OxO8450[0x13]] ;} ;if(element[OxO8450[0x14]]){ sel_align[OxO8450[0xb]]=element[OxO8450[0x14]] ;} ;if(element[OxO8450[0x15]]){ sel_valign[OxO8450[0xb]]=element[OxO8450[0x15]] ;} ;if(element[OxO8450[0x16]]){ inp_tooltip[OxO8450[0xb]]=element[OxO8450[0x16]] ;} ;}  ; function SyncTo(){if(inp_bgColor[OxO8450[0xb]]){ element[OxO8450[0xa]]=inp_bgColor[OxO8450[0xb]] ;} ;if(inp_borderColor[OxO8450[0xb]]){ element[OxO8450[0xe]]=inp_borderColor[OxO8450[0xb]] ;} ;if(inp_borderColorlight[OxO8450[0xb]]){ element[OxO8450[0x17]]=inp_borderColorlight[OxO8450[0xb]] ;} ;if(inp_borderColordark[OxO8450[0xb]]){ element[OxO8450[0x18]]=inp_borderColordark[OxO8450[0xb]] ;} ;if(inp_class[OxO8450[0xb]]){ element[OxO8450[0x11]]=inp_class[OxO8450[0xb]] ;} ;if(isNaN(inp_width.value)||isNaN(inp_height.value)){ alert(OxO8450[0x19]) ;return ;} ;try{if(inp_width[OxO8450[0xb]]){ element[OxO8450[0x12]]=inp_width[OxO8450[0xb]] ;} ;if(inp_height[OxO8450[0xb]]){ element[OxO8450[0x13]]=inp_height[OxO8450[0xb]] ;} ;} catch(er){ alert(OxO8450[0x19]) ;} ;if(sel_align[OxO8450[0xb]]){ element[OxO8450[0x14]]=sel_align[OxO8450[0xb]] ;} ;if(sel_valign[OxO8450[0xb]]){ element[OxO8450[0x15]]=sel_valign[OxO8450[0xb]] ;} ;if(inp_tooltip[OxO8450[0xb]]){ element[OxO8450[0x16]]=inp_tooltip[OxO8450[0xb]] ;} ;}  ; function IsDigit(){return ((event[OxO8450[0x1a]]>=0x30)&&(event[OxO8450[0x1a]]<=0x39));}  ;
</script>
