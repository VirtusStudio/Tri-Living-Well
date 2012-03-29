<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[TABLE]]</legend>
	<table class="normal">
		<tr>
			<td>[[Rows]]:</td>
			<td>
				<select id="sel_rows" style="WIDTH:80px" onChange="SyncToPreview()" NAME="rows">
					<option value="1" selected>1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
				</select>
			</td>
			<td>[[Columns]]:</td>
			<td>				
				<select id="sel_columns" style="WIDTH:80px" onChange="SyncToPreview()" NAME="rows">
					<option value="1" selected>1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>[[CellSpacing]]:</td>
			<td><input type="text" id="inp_cellspacing" onChange="SyncToPreview()" onkeypress="return IsDigit(event);"></td>
			<td>[[CellPadding]]:</td>
			<td><input type="text" id="inp_cellpadding" onChange="SyncToPreview()" onkeypress="return IsDigit(event);"></td>
		</tr>
		<tr>
			<td>[[Border]]:</td>
			<td><input type="text" id="inp_border" onChange="SyncToPreview()" onkeypress="return IsDigit(event);"></td>
			<td>[[Rules]]:</td>
			<td><select id="sel_rules">
					<option value="">[[NotSet]]</option>
					<option value="all">all</option>
					<option value="rows">rows</option>
					<option value="cols">cols</option>
					<option value="none">none</option>
				</select></td>
		</tr>
		<tr>
			<td colspan=2>
				[[Bordercolor]]:
				<input type="text" id="inp_borderColor" name="inp_borderColor" size="7" style="WIDTH:67px">
				<img id="inp_borderColor_Preview" src="../images/colorpicker.gif"   onclick="SelectColor('inp_borderColor','inp_borderColor_Preview');SyncToPreview();" >
			</td>
			<td colspan=2>[[Backgroundcolor]]:
				<input type="text" id="inp_shade" name="inp_shade" size="7" style="WIDTH:67px">
				<img id="inp_shade_Preview" src="../images/colorpicker.gif"  align="absMiddle" onclick="SelectColor('inp_shade','inp_shade_Preview');SyncToPreview();">
			</td>
		</tr>
		<tr>
			<td colspan=4><input type="checkbox" id="inp_collapse" onChange="SyncToPreview()" >
				<label for="inp_collapse">[[CollapseBorder]]</label>&nbsp;				
			</td>
		</tr>
		
	</table>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[Summary]] :</td>
			<td>
				<textarea id="inp_summary" rows="3" style="width:320px" onChange="SyncToPreview()" ></textarea>
			</td>
		</tr>
	</table>
</fieldset>
<fieldset><legend>[[Common]]</legend>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[CssClass]]:</td>
			<td><input type="text" id="inp_class" style="width:120px" onChange="SyncToPreview()" ></td>
			<td>[[Width]]:</td>
			<td><input type="text" id="inp_width" value="400" style="width:60px" onChange="SyncToPreview()" ></td>
			<td>[[Height]]:</td>
			<td><input type="text" id="inp_height" style="width:60px" onChange="SyncToPreview()" ></td>
		</tr>
	</table>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[Alignment]]:</td>
			<td><select id="sel_align" onChange="SyncToPreview()" >
					<option value="">[[NotSet]]</option>
					<option value="left">[[Left]]</option>
					<option value="center">[[Center]]</option>
					<option value="right">[[Right]]</option>
				</select></td>
			<td>
				[[Text-Align]] :</td>
			<td><select id="sel_textalign" onChange="SyncToPreview()" >
					<option value="">[[NotSet]]</option>
					<option value="left">[[Left]]</option>
					<option value="center">[[Center]]</option>
					<option value="right">[[Right]]</option>
					<option value="justify">[[Justify]]</option>
				</select></td>
			<td>[[Float]]:
			</td>
			<td><select id="sel_float" onChange="SyncToPreview()">
					<option value="">[[NotSet]]</option>
					<option value="left">[[Left]]</option>
					<option value="right">[[Right]]</option>
				</select></td>
		</tr>
	</table>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[Title]] :</td>
			<td>
				<textarea id="inp_tooltip" rows="2" style="width:320px" onChange="SyncToPreview()"></textarea>
			</td>
		</tr>
	</table>
	<div style="BORDER: 1.5pt inset; VERTICAL-ALIGN: top; OVERFLOW: auto; WIDTH: 300px; HEIGHT: 120px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
		<div id="table_Prev"></div>
	</div>
</fieldset>

<script>

var OxOd559=["inp_cellspacing","inp_cellpadding","inp_border","sel_rules","inp_collapse","inp_borderColor","inp_borderColor_Preview","inp_shade","inp_shade_Preview","inp_summary","inp_class","inp_width","inp_height","sel_align","sel_textalign","sel_float","inp_tooltip","sel_rows","sel_columns","table_Prev","specified","","nodeValue","cellSpacing","value","cellPadding","border","borderCollapse","style","checked","collapse","className","width","borderColor","backgroundColor","bgColor","height","align","styleFloat","textAlign","title","innerHTML","TABLE","TBODY","TR","TD","Cell","_","rules","summary","0","[[ValidNumber]]","class","vAlign","valign","cellpadding","cellspacing","\x3Ctable\x3E\x3Ctr\x3E\x3Ctd\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E"];var inp_cellspacing=document.getElementById(OxOd559[0x0]);var inp_cellpadding=document.getElementById(OxOd559[0x1]);var inp_border=document.getElementById(OxOd559[0x2]);var sel_rules=document.getElementById(OxOd559[0x3]);var inp_collapse=document.getElementById(OxOd559[0x4]);var borderColor=document.getElementById(OxOd559[0x5]);var borderColor_Preview=document.getElementById(OxOd559[0x6]);var inp_shade=document.getElementById(OxOd559[0x7]);var inp_shade_Preview=document.getElementById(OxOd559[0x8]);var inp_summary=document.getElementById(OxOd559[0x9]);var inp_class=document.getElementById(OxOd559[0xa]);var inp_width=document.getElementById(OxOd559[0xb]);var inp_height=document.getElementById(OxOd559[0xc]);var sel_align=document.getElementById(OxOd559[0xd]);var sel_textalign=document.getElementById(OxOd559[0xe]);var sel_float=document.getElementById(OxOd559[0xf]);var inp_tooltip=document.getElementById(OxOd559[0x10]);var inp_cellspacing=document.getElementById(OxOd559[0x0]);var sel_rows=document.getElementById(OxOd559[0x11]);var sel_columns=document.getElementById(OxOd559[0x12]);var table_Prev=document.getElementById(OxOd559[0x13]); function SyncToView(){}  ; function SyncToView2(){ function GetAttribute(Ox512){var attr=element.getAttributeNode(Ox512);if(attr==null||!attr[OxOd559[0x14]]){return OxOd559[0x15];} ;return attr[OxOd559[0x16]];}  ; inp_cellspacing[OxOd559[0x18]]=GetAttribute(OxOd559[0x17]) ; inp_cellpadding[OxOd559[0x18]]=GetAttribute(OxOd559[0x19]) ; inp_border[OxOd559[0x18]]=GetAttribute(OxOd559[0x1a]) ; inp_collapse[OxOd559[0x1d]]=element[OxOd559[0x1c]][OxOd559[0x1b]]==OxOd559[0x1e] ; inp_class[OxOd559[0x18]]=element[OxOd559[0x1f]] ;if(GetAttribute(OxOd559[0x20])){ inp_width[OxOd559[0x18]]=GetAttribute(OxOd559[0x20]) ;} else {if(element[OxOd559[0x1c]][OxOd559[0x20]]){ inp_width[OxOd559[0x18]]=element[OxOd559[0x1c]][OxOd559[0x20]] ;} ;} ;if(GetAttribute(OxOd559[0x21])){ borderColor[OxOd559[0x18]]=GetAttribute(OxOd559[0x21]) ; borderColor[OxOd559[0x1c]][OxOd559[0x22]]=GetAttribute(OxOd559[0x21]) ; borderColor_Preview[OxOd559[0x1c]][OxOd559[0x22]]=GetAttribute(OxOd559[0x21]) ;} else {if(element[OxOd559[0x1c]][OxOd559[0x21]]){ borderColor[OxOd559[0x18]]=element[OxOd559[0x1c]][OxOd559[0x21]] ; borderColor[OxOd559[0x1c]][OxOd559[0x22]]=element[OxOd559[0x1c]][OxOd559[0x21]] ; borderColor_Preview[OxOd559[0x1c]][OxOd559[0x22]]=element[OxOd559[0x1c]][OxOd559[0x21]] ;} ;} ;if(GetAttribute(OxOd559[0x23])){ inp_shade[OxOd559[0x18]]=GetAttribute(OxOd559[0x23]) ; inp_shade[OxOd559[0x1c]][OxOd559[0x22]]=GetAttribute(OxOd559[0x23]) ; inp_shade_Preview[OxOd559[0x1c]][OxOd559[0x22]]=GetAttribute(OxOd559[0x23]) ;} else {if(element[OxOd559[0x1c]][OxOd559[0x22]]){ inp_shade[OxOd559[0x18]]=element[OxOd559[0x1c]][OxOd559[0x22]] ; inp_shade[OxOd559[0x1c]][OxOd559[0x22]]=element[OxOd559[0x1c]][OxOd559[0x22]] ; inp_shade_Preview[OxOd559[0x1c]][OxOd559[0x22]]=element[OxOd559[0x1c]][OxOd559[0x22]] ;} ;} ;if(GetAttribute(OxOd559[0x24])){ inp_height[OxOd559[0x18]]=GetAttribute(OxOd559[0x24]) ;} else {if(element[OxOd559[0x1c]][OxOd559[0x24]]){ inp_height[OxOd559[0x18]]=element[OxOd559[0x1c]][OxOd559[0x24]] ;} ;} ; sel_align[OxOd559[0x18]]=element[OxOd559[0x25]] ; sel_float[OxOd559[0x18]]=element[OxOd559[0x1c]][OxOd559[0x26]] ; sel_textalign[OxOd559[0x18]]=element[OxOd559[0x1c]][OxOd559[0x27]] ; inp_tooltip[OxOd559[0x18]]=element[OxOd559[0x28]] ;}  ; function SyncToPreview(){ table_Prev[OxOd559[0x29]]=OxOd559[0x15] ;var Ox3b7=document.createElement(OxOd559[0x2a]);var Ox75f=sel_rows[OxOd559[0x18]];var Ox760=sel_columns[OxOd559[0x18]];var Ox761=document.createElement(OxOd559[0x2b]);for( i=0x0 ;i<Ox75f;i++){ row=document.createElement(OxOd559[0x2c]) ;for( j=0x0 ;j<Ox760;j++){ cell=document.createElement(OxOd559[0x2d]) ;var Ox762=OxOd559[0x2e]+i+OxOd559[0x2f]+j;var Ox763=document.createTextNode(Ox762); cell.appendChild(Ox763) ; row.appendChild(cell) ;} ; Ox761.appendChild(row) ;} ; Ox3b7.appendChild(Ox761) ; Ox3b7[OxOd559[0x20]]=0x1a3 ; Ox3b7[OxOd559[0x1a]]=0x1 ; Ox3b7[OxOd559[0x1c]][OxOd559[0x1b]]=inp_collapse[OxOd559[0x1d]]?OxOd559[0x1e]:OxOd559[0x15] ; Ox3b7[OxOd559[0x30]]=sel_rules[OxOd559[0x18]]||OxOd559[0x15] ; Ox3b7[OxOd559[0x31]]=inp_summary[OxOd559[0x18]] ; Ox3b7[OxOd559[0x1f]]=inp_class[OxOd559[0x18]] ; Ox3b7[OxOd559[0x17]]=inp_cellspacing[OxOd559[0x18]] ; Ox3b7[OxOd559[0x19]]=inp_cellpadding[OxOd559[0x18]] ;if(inp_border[OxOd559[0x18]]==OxOd559[0x15]){ Ox3b7[OxOd559[0x1a]]=OxOd559[0x32] ;} else { Ox3b7[OxOd559[0x1a]]=inp_border[OxOd559[0x18]] ;} ;if(inp_width[OxOd559[0x18]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x20]) ; Ox3b7[OxOd559[0x1c]][OxOd559[0x20]]=OxOd559[0x15] ;} ;if(inp_height[OxOd559[0x18]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x24]) ; Ox3b7[OxOd559[0x1c]][OxOd559[0x24]]=OxOd559[0x15] ;} ;try{if(element[OxOd559[0x1c]][OxOd559[0x20]]){ Ox3b7[OxOd559[0x1c]][OxOd559[0x20]]=inp_width[OxOd559[0x18]] ;} else { Ox3b7[OxOd559[0x20]]=inp_width[OxOd559[0x18]] ;} ;} catch(e){ alert(OxOd559[0x33]) ;} ;try{if(element[OxOd559[0x1c]][OxOd559[0x24]]){ Ox3b7[OxOd559[0x1c]][OxOd559[0x24]]=inp_height[OxOd559[0x18]] ;} else { Ox3b7[OxOd559[0x24]]=inp_height[OxOd559[0x18]] ;} ;} catch(e){ alert(OxOd559[0x33]) ;} ;try{ Ox3b7[OxOd559[0x1c]][OxOd559[0x21]]=borderColor[OxOd559[0x18]] ;} catch(e){} ;try{ Ox3b7[OxOd559[0x1c]][OxOd559[0x22]]=inp_shade[OxOd559[0x18]] ;} catch(e){} ; Ox3b7[OxOd559[0x25]]=sel_align[OxOd559[0x18]] ; Ox3b7[OxOd559[0x1c]][OxOd559[0x26]]=sel_float[OxOd559[0x18]] ; Ox3b7[OxOd559[0x1c]][OxOd559[0x27]]=sel_textalign[OxOd559[0x18]] ; Ox3b7[OxOd559[0x28]]=inp_tooltip[OxOd559[0x18]] ;if(Ox3b7[OxOd559[0x28]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x28]) ;} ;if(Ox3b7[OxOd559[0x31]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x31]) ;} ;if(Ox3b7[OxOd559[0x1f]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x34]) ;} ;if(Ox3b7[OxOd559[0x25]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x25]) ;} ;if(Ox3b7[OxOd559[0x35]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x36]) ;} ;if(Ox3b7[OxOd559[0x20]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x20]) ;} ;if(Ox3b7[OxOd559[0x24]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x24]) ;} ;if(Ox3b7[OxOd559[0x30]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x30]) ;} ;if(Ox3b7[OxOd559[0x19]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x37]) ;} ;if(Ox3b7[OxOd559[0x17]]==OxOd559[0x15]){ Ox3b7.removeAttribute(OxOd559[0x38]) ;} ; table_Prev.appendChild(Ox3b7) ;}  ; function SyncTo(){try{var h=table_Prev[OxOd559[0x29]];if(h==OxOd559[0x15]){ h=OxOd559[0x39] ;} ; editor.PasteHTML(h) ;} catch(e){} ; top.close() ;}  ;



</script>

