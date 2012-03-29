<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<style>
#div_selector_event
{
	width:45;height:45;padding:5px;border:1px solid white;
}
#div_selector
{
	width:40;height:40;border:4px solid white;
}
</style>
<fieldset>
	<legend>
		[[Borders]]</legend>
	<table border="0" cellspacing="0" cellpadding="2" class="normal">
		<tr>
			<td width="48">
				<div id="div_selector_event">
					<div id="div_selector">
					</div>
				</div>
			</td>
			<td>
				<select id="sel_part" isnotinput="1">
					<option value="">[[All]]</option>
					<option value="Top">[[Top]]</option>
					<option value="Left">[[Left]]</option>
					<option value="Right">[[Right]]</option>
					<option value="Bottom">[[Bottom]]</option>
				</select>
			</td>
		</tr>
	</table>
</fieldset>
<fieldset>
	<legend>
		[[Border]]</legend>
	<table border="0" cellspacing="0" cellpadding="2" class="normal">
		<tr>
			<td width="48">[[Margin]]</td>
			<td>
				<input type="text" id="tb_margin" style="width:80">
				<select id="sel_margin_unit">
					<option value="px">px</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
		</tr>
		<tr>
			<td>[[Padding]]</td>
			<td><input type="text" id="tb_padding" style="width:80">
				<select id="sel_padding_unit">
					<option value="px">px</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
		</tr>
		<tr>
			<td>[[Border]]</td>
			<td><input type="text" id="tb_border" style="width:80">
				<select id="sel_border_unit">
					<option value="px">px</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select>
				[[Or]]
				<select id="sel_border">
					<option value="">[[NotSet]]</option>
					<option value="medium">[[Medium]]</option>
					<option value="thin">[[Thin]]</option>
					<option value="thick">[[Thick]]</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>[[Style]]</td>
			<td><select id="sel_style">
					<option value="">[[NotSet]]</option>
					<option value="none">[[None]]</option>
					<option value="solid">solid</option>
					<option value="inset">inset</option>
					<option value="outset">outset</option>
					<option value="ridge">ridge</option>
					<option value="dotted">dotted</option>
					<option value="dashed">dashed</option>
					<option value="groove">groove</option>
					<option value="double">double</option>
				</select></td>
		</tr>
		<tr>
			<td>[[Color]]</td>
			<td>
				<input type=text id=inp_color style='behavior:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])' oncolorpopup="this.selectedColor=value" oncolorchange="this.value=this.selectedColor;FireUIChanged()">
			</td>
		</tr>
	</table>
</fieldset>
<div id="outer"><div id="div_demo">[[DemoText]]</div></div>
<script>

var OxO3470=["offsetX","offsetY","srcElement","offsetWidth","offsetHeight","Top","Left","Bottom","Right","","cssText","runtimeStyle","border","4px solid red","value","disabled","selectedIndex","style","4px solid blue","-","Color","Style","Width","length","options","margin","padding"," "]; function GetPartFromEvent(){var Ox2b=event[OxO3470[0x0]];var Ox2a=event[OxO3470[0x1]];if(event[OxO3470[0x2]]==div_selector){ Ox2b+=0xa ; Ox2a+=0xa ;} ;var Ox26=0xf-Ox2b;var r=Ox2b-(div_selector_event[OxO3470[0x3]]-0xf);var Ox20=0xf-Ox2a;var b=Ox2a-(div_selector_event[OxO3470[0x4]]-0xf);if(Ox26>0x0){if(Ox20>0x0){return Ox26>Ox20?OxO3470[0x5]:OxO3470[0x6];} ;if(b>0x0){return Ox26>b?OxO3470[0x7]:OxO3470[0x6];} ;return OxO3470[0x6];} ;if(r>0x0){if(Ox20>0x0){return r>Ox20?OxO3470[0x5]:OxO3470[0x8];} ;if(b>0x0){return r>b?OxO3470[0x7]:OxO3470[0x8];} ;return OxO3470[0x8];} ;if(Ox20>0x0){return OxO3470[0x5];} ;if(b>0x0){return OxO3470[0x7];} ;return OxO3470[0x9];}  ; function div_selector_event.onmousemove(){var Ox6fe=GetPartFromEvent(); div_selector[OxO3470[0xb]][OxO3470[0xa]]=OxO3470[0x9] ; div_selector[OxO3470[0xb]][OxO3470[0xc]+Ox6fe]=OxO3470[0xd] ;}  ; function div_selector_event.onmouseout(){ div_selector[OxO3470[0xb]][OxO3470[0xa]]=OxO3470[0x9] ;}  ; function div_selector_event.onclick(){ sel_part[OxO3470[0xe]]=GetPartFromEvent() ; SyncToViewInternal() ; UpdateState() ;}  ; function sel_part.onchange(){ SyncToViewInternal() ; UpdateState() ;}  ; function UpdateState(){ tb_border[OxO3470[0xf]]=sel_border_unit[OxO3470[0xf]]=(sel_border[OxO3470[0x10]]>0x0) ; div_demo[OxO3470[0x11]][OxO3470[0xa]]=element[OxO3470[0x11]][OxO3470[0xa]] ; div_selector[OxO3470[0x11]][OxO3470[0xa]]=OxO3470[0x9] ; div_selector[OxO3470[0x11]][OxO3470[0xc]+(sel_part[OxO3470[0xe]]||OxO3470[0x9])]=OxO3470[0x12] ;}  ; function SyncToView(){var Ox6fe=sel_part[OxO3470[0xe]];var Ox6ff=Ox6fe?OxO3470[0x13]+Ox6fe:Ox6fe; inp_color[OxO3470[0xe]]=element[OxO3470[0x11]][OxO3470[0xc]+Ox6fe+OxO3470[0x14]] ; sel_style[OxO3470[0xe]]=element[OxO3470[0x11]][OxO3470[0xc]+Ox6fe+OxO3470[0x15]] ; sel_border[OxO3470[0xe]]=element[OxO3470[0x11]][OxO3470[0xc]+Ox6fe+OxO3470[0x16]] ;var Ox799=element[OxO3470[0x11]][OxO3470[0xc]+Ox6fe+OxO3470[0x16]]; tb_border[OxO3470[0xe]]=ParseToString(Ox799) ;if(tb_border[OxO3470[0xe]]){for(var i=0x0;i<sel_border_unit[OxO3470[0x18]][OxO3470[0x17]];i++){var Ox5b=sel_border_unit.options(i)[OxO3470[0xe]];if(Ox5b&&Ox799.indexOf(Ox5b)!=-0x1){ sel_border_unit[OxO3470[0x10]]=i ;break ;} ;} ;} ;var Ox79a=element[OxO3470[0x11]][OxO3470[0x19]+Ox6fe]; tb_margin[OxO3470[0xe]]=ParseToString(Ox79a) ;if(tb_margin[OxO3470[0xe]]){for(var i=0x0;i<sel_margin_unit[OxO3470[0x18]][OxO3470[0x17]];i++){var Ox5b=sel_margin_unit.options(i)[OxO3470[0xe]];if(Ox5b&&Ox79a.indexOf(Ox5b)!=-0x1){ sel_margin_unit[OxO3470[0x10]]=i ;break ;} ;} ;} ;var Ox79b=element[OxO3470[0x11]][OxO3470[0x1a]+Ox6fe]; tb_padding[OxO3470[0xe]]=ParseToString(Ox79b) ;if(tb_padding[OxO3470[0xe]]){for(var i=0x0;i<sel_padding_unit[OxO3470[0x18]][OxO3470[0x17]];i++){var Ox5b=sel_padding_unit.options(i)[OxO3470[0xe]];if(Ox5b&&Ox79b.indexOf(Ox5b)!=-0x1){ sel_padding_unit[OxO3470[0x10]]=i ;break ;} ;} ;} ;}  ; function SyncTo(element){var Ox6fe=sel_part[OxO3470[0xe]];var Ox6ff=Ox6fe?OxO3470[0x13]+Ox6fe:Ox6fe;var Ox700=OxO3470[0x9];if(sel_border[OxO3470[0x10]]>0x0){ Ox700=sel_border[OxO3470[0xe]] ;} else {if(ParseToString(tb_border.value)){ Ox700=ParseToString(tb_border.value)+sel_border_unit[OxO3470[0xe]] ;} else { Ox700=OxO3470[0x9] ;} ;} ;var Ox6b=inp_color[OxO3470[0xe]]||OxO3470[0x9];var Ox83=sel_style[OxO3470[0xe]]||OxO3470[0x9];if(Ox700||Ox83){ SetStyle(element[OxO3470[0x11]],OxO3470[0xc]+Ox6ff,Ox700+OxO3470[0x1b]+Ox83+OxO3470[0x1b]+Ox6b) ;} else { SetStyle(element[OxO3470[0x11]],OxO3470[0xc]+Ox6ff,OxO3470[0x9]) ;} ; SetStyle(element[OxO3470[0x11]],OxO3470[0x19]+Ox6ff,ParseToString(tb_margin.value),sel_margin_unit.value) ; SetStyle(element[OxO3470[0x11]],OxO3470[0x1a]+Ox6ff,ParseToString(tb_padding.value),sel_padding_unit.value) ;}  ;

</script>
