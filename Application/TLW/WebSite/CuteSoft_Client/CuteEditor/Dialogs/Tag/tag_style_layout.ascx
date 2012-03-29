<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Layout]]</legend>
	<table border="0" cellspacing="0" cellpadding="2" class="normal">
		<tr>
			<td width="50">[[Position]]: </td>
			<td><select style="width:80" id=sel_position>
					<option value="">[[NotSet]]</option>
					<option value="absolute">[[Absolute]]</option>
					<option value="relative">[[Relative]]</option>
				</select></td>
			<td width="50">[[Display]]: </td>
			<td><select style="width:80" id=sel_display>
					<option value="">[[NotSet]]</option>
					<option value="block">block</option>
					<option value="inline">inline</option>
					<option value="inline-block">inline-block</option>
				</select></td>
		</tr>
		<tr>
			<td width="50">[[Float]]: </td>
			<td><select style="width:80" id=sel_float>
					<option value="">[[NotSet]]</option>
					<option value="left">[[FloatLeft]]</option>
					<option value="right">[[FloatRight]]</option>
					<option value="none">[[FloatNone]]</option>
				</select></td>
			<td width="50">[[Clear]]: </td>
			<td><select style="width:80" id=sel_clear>
					<option value="">[[NotSet]]</option>
					<option value="left">[[ClearLeft]]</option>
					<option value="right">[[ClearRight]]</option>
					<option value="both">[[ClearBoth]]</option>
					<option value="none">[[ClearNone]]</option>
				</select></td>
		</tr>
	</table>
</fieldset>
<fieldset><legend>[[Size]]</legend>
	<table border="0" cellspacing="0" cellpadding="2" class="normal">
		<tr>
			<td width="50">[[Top]]</td>
			<td><input type="text" id="tb_top" style="width:42">
				<select id="sel_top_unit">
					<option value="px">px</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
			<td width="50">[[Height]]</td>
			<td><input type="text" id="tb_height" style="width:42">
				<select id="sel_height_unit">
					<option value="px">px</option>
					<option value="%">%</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
		</tr>
		<tr>
			<td width="50">[[Left]]</td>
			<td><input type="text" id="tb_left" style="width:42">
				<select id="sel_left_unit">
					<option value="px">px</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
			<td width="50">[[Width]]</td>
			<td><input type="text" id="tb_width" style="width:42">
				<select id="sel_width_unit">
					<option value="px">px</option>
					<option value="%">%</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
		</tr>
	</table>
</fieldset>
<fieldset><legend>[[Clipping]]</legend>
	<table border="0" cellspacing="0" cellpadding="2" class="normal">
		<tr>
			<td width="50">[[Top]]</td>
			<td><input type="text" id="tb_cliptop" style="width:42">
				<select id="sel_cliptop_unit">
					<option value="px">px</option>
					<option value="%">%</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
			<td width="50">[[Bottom]]</td>
			<td><input type="text" id="tb_clipbottom" style="width:42">
				<select id="sel_clipbottom_unit">
					<option value="px">px</option>
					<option value="%">%</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
		</tr>
		<tr>
			<td width="50">[[Left]]</td>
			<td><input type="text" id="tb_clipleft" style="width:42">
				<select id="sel_clipleft_unit">
					<option value="px">px</option>
					<option value="%">%</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
			<td width="50">[[Right]]</td>
			<td><input type="text" id="tb_clipright" style="width:42">
				<select id="sel_clipright_unit">
					<option value="px">px</option>
					<option value="%">%</option>
					<option value="pt">pt</option>
					<option value="pc">pc</option>
					<option value="em">em</option>
					<option value="cm">cm</option>
					<option value="mm">mm</option>
					<option value="in">in</option>
				</select></td>
		</tr>
	</table>
</fieldset>
<fieldset><legend>[[Misc]]</legend>
	<div>[[Overflow]]:
		<select id="sel_overflow">
			<option value="">[[NotSet]]</option>
			<option value="auto">[[OverflowAuto]]</option>
			<option value="scroll">[[OverflowScroll]]</option>
			<option value="visible">[[OverflowVisible]]</option>
			<option value="hidden">[[OverflowHidden]]</option>
		</select>
		z-index: <input type="text" style="width:60" id="tb_zindex">
	</div>
	<table border="0" cellspacing="0" cellpadding="0" class="normal">
		<tr>
			<td width="120">[[PrintingBefore]]: </td>
			<td><select id="sel_pagebreakbefore"><option value="">[[NotSet]]</option>
					<option value="auto">[[Auto]]</option>
					<option value="always">[[Always]]</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>[[PrintingAfter]]: </td>
			<td><select id="sel_pagebreakafter"><option value="">[[NotSet]]</option>
					<option value="auto">[[Auto]]</option>
					<option value="always">[[Always]]</option>
				</select></td>
		</tr>
	</table>
</fieldset>
<div id="outer"><div id="div_demo">[[DemoText]]</div></div>
<script>

var OxOaf10=["cssText","style","position","value","display","styleFloat","clear","left","top","width","height","length","tb_","sel_","_unit","selectedIndex","options","right","bottom","clip","tb_clip","sel_clip","currentStyle","overflow","zIndex","pageBreakBefore","pageBreakAfter",""]; function UpdateState(){ div_demo[OxOaf10[0x1]][OxOaf10[0x0]]=element[OxOaf10[0x1]][OxOaf10[0x0]] ;}  ; function SyncToView(){ sel_position[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x2]] ; sel_display[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x4]] ; sel_float[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x5]] ; sel_clear[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x6]] ;var arr=[OxOaf10[0x7],OxOaf10[0x8],OxOaf10[0x9],OxOaf10[0xa]];for(var Oxd7=0x0;Oxd7<arr[OxOaf10[0xb]];Oxd7++){var n=arr[Oxd7];var e=document.getElementById(OxOaf10[0xc]+n);var Ox25=document.getElementById(OxOaf10[0xd]+n+OxOaf10[0xe]); Ox25[OxOaf10[0xf]]=0x0 ;if(ParseToString(element[OxOaf10[0x1]][n])){ e[OxOaf10[0x3]]=ParseToString(element[OxOaf10[0x1]][n]) ;for(var i=0x0;i<Ox25[OxOaf10[0x10]][OxOaf10[0xb]];i++){var Ox5b=Ox25.options(i)[OxOaf10[0x3]];if(Ox5b&&element[OxOaf10[0x1]][n].indexOf(Ox5b)!=-0x1){ Ox25[OxOaf10[0xf]]=i ;break ;} ;} ;} ;} ;var arr=[OxOaf10[0x7],OxOaf10[0x8],OxOaf10[0x11],OxOaf10[0x12]];for(var Oxd7=0x0;Oxd7<arr[OxOaf10[0xb]];Oxd7++){var n=arr[Oxd7];var Ox7a1=OxOaf10[0x13]+n.charAt(0x0).toUpperCase()+n.substring(0x1);var e=document.getElementById(OxOaf10[0x14]+n);var Ox25=document.getElementById(OxOaf10[0x15]+n+OxOaf10[0xe]); Ox25[OxOaf10[0xf]]=0x0 ;if(ParseToString(element[OxOaf10[0x16]][Ox7a1])){ e[OxOaf10[0x3]]=ParseToString(element[OxOaf10[0x16]][Ox7a1]) ;for(var i=0x0;i<Ox25[OxOaf10[0x10]][OxOaf10[0xb]];i++){var Ox5b=Ox25.options(i)[OxOaf10[0x3]];if(Ox5b&&element[OxOaf10[0x16]][Ox7a1].indexOf(Ox5b)!=-0x1){ Ox25[OxOaf10[0xf]]=i ;break ;} ;} ;} ;} ; sel_overflow[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x17]] ; tb_zindex[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x18]] ; sel_pagebreakbefore[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x19]] ; sel_pagebreakafter[OxOaf10[0x3]]=element[OxOaf10[0x1]][OxOaf10[0x1a]] ;}  ; function SyncTo(element){ element[OxOaf10[0x1]][OxOaf10[0x2]]=sel_position[OxOaf10[0x3]] ; element[OxOaf10[0x1]][OxOaf10[0x4]]=sel_display[OxOaf10[0x3]] ; element[OxOaf10[0x1]][OxOaf10[0x5]]=sel_float[OxOaf10[0x3]] ; element[OxOaf10[0x1]][OxOaf10[0x6]]=sel_clear[OxOaf10[0x3]] ;var arr=[OxOaf10[0x7],OxOaf10[0x8],OxOaf10[0x9],OxOaf10[0xa]];for(var Oxd7=0x0;Oxd7<arr[OxOaf10[0xb]];Oxd7++){var n=arr[Oxd7];var e=document.getElementById(OxOaf10[0xc]+n);if(ParseToString(e.value)){ element[OxOaf10[0x1]][n]=ParseToString(e.value)+document.all(OxOaf10[0xd]+n+OxOaf10[0xe])[OxOaf10[0x3]] ;} else { element[OxOaf10[0x1]][n]=OxOaf10[0x1b] ;} ;} ;var arr=[OxOaf10[0x7],OxOaf10[0x8],OxOaf10[0x11],OxOaf10[0x12]];for(var Oxd7=0x0;Oxd7<arr[OxOaf10[0xb]];Oxd7++){var n=arr[Oxd7];var Ox7a1=OxOaf10[0x13]+n.charAt(0x0).toUpperCase()+n.substring(0x1);var e=document.getElementById(OxOaf10[0x14]+n);if(ParseToString(e.value)){ element[OxOaf10[0x1]][Ox7a1]=ParseToString(e.value)+document.all(OxOaf10[0x15]+n+OxOaf10[0xe])[OxOaf10[0x3]] ;} else { element[OxOaf10[0x1]][Ox7a1]=OxOaf10[0x1b] ;} ;} ; element[OxOaf10[0x1]][OxOaf10[0x17]]=sel_overflow[OxOaf10[0x3]] ; element[OxOaf10[0x1]][OxOaf10[0x18]]=ParseToString(tb_zindex.value) ; element[OxOaf10[0x1]][OxOaf10[0x19]]=sel_pagebreakbefore[OxOaf10[0x3]] ; element[OxOaf10[0x1]][OxOaf10[0x1a]]=sel_pagebreakafter[OxOaf10[0x3]] ;}  ;

</script>
