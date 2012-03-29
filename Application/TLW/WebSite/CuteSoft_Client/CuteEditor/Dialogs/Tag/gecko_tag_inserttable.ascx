<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[TABLE]]</legend>
	<table class="normal">
		<tr>
			<td>[[CellSpacing]]:</td>
			<td><input type="text" id="inp_cellspacing"  size="14" onkeypress="return IsDigit(event);"></td>
			<td>[[CellPadding]]:</td>
			<td><input type="text" id="inp_cellpadding"  size="14" onkeypress="return IsDigit(event);"></td>
		</tr>
		<tr>
			<td>[[ID]]:</td>
			<td><input type="text" id="inp_id" size="14">&nbsp;&nbsp;</td>
			<td>[[Border]]:</td>
			<td><input type="text" id="inp_border"  size="14" onkeypress="event.returnValue=IsDigit();"></td>
		</tr>
		<tr>
			<td>[[Backgroundcolor]]:
			</td>
			<td>
				<input type="text" id="inp_bgcolor" name="inp_bgcolor"  size="9">
				<img id="inp_bgcolor_Preview" src="../images/colorpicker.gif"  align="absMiddle" onclick="SelectColor('inp_bgcolor',this);">
			</td>
			<td>[[BorderColor]]:
			</td>
			<td>
				<input type="text" id="inp_bordercolor" name="inp_bordercolor" size="9">
				<img id="inp_bordercolor_Preview" src="../images/colorpicker.gif"  align="absMiddle" onclick="SelectColor('inp_bordercolor',this);" >
			</td>
		</tr>
		<tr>
			<td valign="middle" nowrap>[[Rules]]:</td>
			<td><select id="sel_rules">
					<option value="">[[NotSet]]</option>
					<option value="all">all</option>
					<option value="rows">rows</option>
					<option value="cols">cols</option>
					<option value="none">none</option>
				</select>
			<td colspan=2>
				<input type="checkbox" id="inp_collapse">
				<label for="inp_collapse">[[CollapseBorder]]</label>&nbsp;				
			</td>
		</tr>
	</table>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[Summary]] :</td>
			<td>
				<textarea id="inp_summary" rows="3" style="width:320px"></textarea>
			</td>
		</tr>
	</table>
</fieldset>
<fieldset><legend>[[Common]]</legend>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[CssClass]]:</td>
			<td><input type="text" id="inp_class" style="width:120px"></td>
			<td>[[Width]]:</td>
			<td><input type="text" id="inp_width" style="width:60px"></td>
			<td>[[Height]]:</td>
			<td><input type="text" id="inp_height" style="width:60px"></td>
		</tr>
	</table>
	<table class="normal">
		<tr>
			<td style='width:60px'>[[Alignment]]:</td>
			<td><select id="sel_align">
					<option value="">[[NotSet]]</option>
					<option value="left">[[Left]]</option>
					<option value="center">[[Center]]</option>
					<option value="right">[[Right]]</option>
				</select></td>
			<td>
				[[Text-Align]] :</td>
			<td><select id="sel_textalign">
					<option value="">[[NotSet]]</option>
					<option value="left">[[Left]]</option>
					<option value="center">[[Center]]</option>
					<option value="right">[[Right]]</option>
					<option value="justify">[[Justify]]</option>
				</select></td>
			<td>[[Float]]:
			</td>
			<td><select id="sel_float">
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
				<textarea id="inp_tooltip" rows="3" style="width:320px"></textarea>
			</td>
		</tr>
	</table>
</fieldset>
<script>


var inp_cellspacing = document.getElementById("inp_cellspacing");
var inp_cellpadding = document.getElementById("inp_cellpadding");
var inp_id = document.getElementById("inp_id");
var inp_border = document.getElementById("inp_border");
var inp_bgcolor = document.getElementById("inp_bgcolor");
var inp_bordercolor = document.getElementById("inp_bordercolor");
var inp_bgcolor_Preview = document.getElementById("inp_bgcolor_Preview");
var inp_bordercolor_Preview = document.getElementById("inp_bordercolor_Preview");
var sel_rules = document.getElementById("sel_rules");
var inp_collapse = document.getElementById("inp_collapse");
var inp_summary = document.getElementById("inp_summary");
var inp_class = document.getElementById("inp_class");
var inp_width = document.getElementById("inp_width");
var inp_height = document.getElementById("inp_height");
var sel_width_unit = document.getElementById("sel_width_unit");
var sel_height_unit = document.getElementById("sel_height_unit");
var sel_align = document.getElementById("sel_align");
var sel_textalign = document.getElementById("sel_textalign");
var sel_float = document.getElementById("sel_float");
var inp_tooltip = document.getElementById("inp_tooltip");



function SyncToView()
{
	function GetAttribute(attrname)
	{
		var attr=element.getAttributeNode(attrname);
		if(attr==null||!attr.specified)return "";
		return attr.nodeValue;
	}
	
	inp_cellspacing.value=GetAttribute("cellSpacing");
	inp_cellpadding.value=GetAttribute("cellPadding");
	inp_border.value=GetAttribute("border");
	inp_collapse.checked=element.style.borderCollapse=='collapse';	
	inp_class.value=element.className;	
	inp_id.value=element.id;
	inp_summary.value=element.summary;
	
	if(element.width)
		inp_width.value=element.width;
	else if(element.style.width)
		inp_width.value=element.style.width;			
	
	if(element.borderColor)
	{
		inp_bordercolor.value=revertColor(element.borderColor);
		inp_bordercolor.style.backgroundColor=inp_bordercolor.value; 
		inp_bordercolor_Preview.style.backgroundColor=inp_bordercolor.value;		
	}
//	else if(element.style.borderColor)
//	{	
//		borderColor.value=revertColor(element.style.borderColor).substring(0,7);
//		borderColor.style.backgroundColor=borderColor.value; 
//		borderColor_Preview.style.backgroundColor=borderColor.value;			
//	}		
	
	if(element.bgColor)
	{
		inp_bgcolor.value=revertColor(element.bgColor);
		inp_bgcolor.style.backgroundColor=inp_bgcolor.value; 
		inp_bgcolor_Preview.style.backgroundColor=inp_bgcolor.value;		
	}
	else if(element.style.backgroundColor)
	{	
		inp_bgcolor.value=revertColor(element.style.backgroundColor);
		inp_bgcolor.style.backgroundColor=element.style.backgroundColor; 
		inp_bgcolor_Preview.style.backgroundColor=element.style.backgroundColor;			
	}	
		
	if(element.height)
		inp_height.value=element.height;
	else if(element.style.height)
		inp_height.value=element.style.height;		 
	
	sel_align.value=element.align;
	sel_float.value=element.style.styleFloat;
	sel_textalign.value=element.style.textAlign;
	inp_tooltip.value=element.title;
}

function extractDecCode(entry) {	//alert("extractDecCode(" + entry + ")");	var found = new Array();	found = entry.match(dec_pattern);	found[1] = parseInt(found[1]);	found[2] = parseInt(found[2]);	found[3] = parseInt(found[3]);		if ((found[1] > 255) || (found[2] > 255) || (found[3] > 255))		found[0] = "!" + found[0];			return found[0];}

function SyncTo()
{
	var invalidCharactersRegExp = /[^a-z\d]/i;				
	if(invalidCharactersRegExp.test(inp_id.value))
	{
		alert("[[ValidID]]");
		return;
	}	
	element.id=inp_id.value;	
	
	element.style.borderCollapse=inp_collapse.checked?'collapse':'';
	element.rules=sel_rules.value||''
	element.summary=inp_summary.value;
	
	element.className=inp_class.value;
	element.cellSpacing=inp_cellspacing.value;		
	element.cellPadding=inp_cellpadding.value;	
	if(inp_border.value=="")
		element.border="0";
	else
		element.border=inp_border.value;
	
	if(inp_width.value=="")
	{
		element.removeAttribute("width");
		element.style.width='';
	}
	
	if(inp_height.value=="")
	{
		element.removeAttribute("height");
		element.style.height='';
	}
	
	try{	
		if(element.style.width)	
			element.style.width=inp_width.value;
		else
			element.width=inp_width.value;	
	}	
	catch(e)
	{
		alert("[[ValidNumber]]");
	}
	
	try{	
		if(element.style.height)	
			element.style.height=inp_height.value;
		else
			element.height=inp_height.value;
	}	
	catch(e)
	{
		alert("[[ValidNumber]]");
	}
	
	try{	
		element.borderColor=inp_bordercolor.value;
		//  bug: for some reasons, borderColor is removed in the editor
	}	
	catch(e)
	{
	}
	
	try{	
		if(element.style.backgroundColor)	
			element.style.backgroundColor=inp_bgcolor.value;
		else
			element.bgColor=inp_bgcolor.value;
	}	
	catch(e)
	{
	}
		
	element.align=sel_align.value;
	element.style.styleFloat=sel_float.value;
	element.style.textAlign=sel_textalign.value;
	element.title=inp_tooltip.value;
	
	if(element.title=="")
		element.removeAttribute("title");
	if(element.summary=="")
		element.removeAttribute("summary");
	if(element.className=="")
		element.removeAttribute("class");
	if(element.align=="")
		element.removeAttribute("align");	
	if(element.vAlign=="")
		element.removeAttribute("valign");
	if(element.width=="")
		element.removeAttribute("width");
	if(element.height=="")
		element.removeAttribute("height");
	if(element.rules=="")
		element.removeAttribute("rules");
	if(element.cellPadding=="")
		element.removeAttribute("cellpadding");
	if(element.cellSpacing=="")
		element.removeAttribute("cellspacing");
	if(element.id=="")
		element.removeAttribute("id");
	if(element.bgColor=="")
		element.removeAttribute("bgColor");
	
}

</script>
