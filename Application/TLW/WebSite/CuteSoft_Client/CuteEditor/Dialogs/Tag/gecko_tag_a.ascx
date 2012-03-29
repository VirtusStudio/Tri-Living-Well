<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Hyperlink_Information]]</legend>
			<table class="normal">
		<tr>
			<td style="width:60px">[[Url]]:</td>
			<td colspan="3"><input type="text" id="inp_src" style="width:260px"></td>
			<td></td>
		</tr>
		<tr>
			<td style="width:60px">[[Type]]:</td>
			<td>
				<select id=sel_protocol onchange="sel_protocol_change()">
					<option value="http://">http://</option>
					<option value="https://">https://</option>
					<option value="ftp://">ftp://</option>
					<option value="news://">news://</option>
					<option value="mailto:">mailto:</option>
					<!-- last one : if move this to front , change the script too -->
					<option value="others">[[Other]]</option>
				</select>
			</td>
			<td>
				[[Target]]: 
			</td>
			<td>
				<SELECT id="inp_target" NAME="inp_target">
					<OPTION value="">[[NotSet]]</OPTION>
					<OPTION value="_blank">[[Newwindow]]</OPTION>
					<OPTION value="_self">[[Samewindow]]</OPTION>
					<OPTION value="_top">[[Topmostwindow]]</OPTION>
					<OPTION value="_parent">[[Parentwindow]]</OPTION>
				</SELECT>
			</td>
			<td>
			</td>
		</tr>		
		<tr>
			<td valign="middle" nowrap>[[ID]]:</td>
			<td>
				<input type="text" id="inp_id" size="14">
			</td>
			<td>[[CssClass]]:</td>
			<td>
				<input type="text" id="inp_class" size="14">
			</td>
			<td></td>
		</tr>
		<tr>
			<td valign="middle" nowrap>[[AccessKey]]:</td>
			<td colspan=4>
				<input type="text" id="inp_access" size="2" maxlength=1>
				&nbsp;
				[[TabIndex]]:&nbsp;
				<input type="text" id="inp_index" size="5" maxlength=5 onkeypress="return IsDigit(event);">
				&nbsp;
				[[Color]]:&nbsp;
				<input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px">	
				<img id="inp_color_Preview" src="../images/colorpicker.gif" onclick="SelectColor('inp_color',this);" align="absMiddle">
			</td>
		</tr>
		<tr>
			<td>[[Title]]:</td>
			<td colspan="3">
				<textarea id="inp_title" rows="2" style="width:260px"></textarea>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align=right></td>
			<td colspan=4>
				<input type="checkbox" id="inp_checked" unchecked onclick="ToggleAnchors();" />[[SelectAnchor]]
				<br>
				<select size="5" name="allanchors" style="width: 255" id="allanchors" onchange="selectAnchor(this.value);"></select>
			</td>
		</tr>
	</table>
</fieldset>
<script>
	var OxOcacc=["innerHTML","inp_src","inp_target","sel_protocol","inp_class","inp_title","inp_color","inp_id","inp_color_Preview","inp_access","inp_index","allanchors","visibility","style","hidden","","href","href_cetemp","\x26#","value","id","target","className","tabIndex","accessKey","title","color","backgroundColor","mailto:","selectedIndex","[[ValidID]]","class","\x3Cp\x3E\x26nbsp;\x3C/p\x3E","\x3Cp\x3E\x26#160;\x3C/p\x3E","\x3Cp\x3E\x3C/p\x3E","\x3Cdiv\x3E\x26#160;\x3C/div\x3E","\x3Cdiv\x3E\x26nbsp;\x3C/div\x3E","\x3Cdiv\x3E\x3C/div\x3E","name","link","length",";","visible","options","anchors","OPTION","text","#"];var linkhtml; linkhtml=element[OxOcacc[0x0]] ;var inp_src=document.getElementById(OxOcacc[0x1]);var inp_target=document.getElementById(OxOcacc[0x2]);var sel_protocol=document.getElementById(OxOcacc[0x3]);var inp_class=document.getElementById(OxOcacc[0x4]);var inp_title=document.getElementById(OxOcacc[0x5]);var inp_color=document.getElementById(OxOcacc[0x6]);var inp_id=document.getElementById(OxOcacc[0x7]);var inp_color_Preview=document.getElementById(OxOcacc[0x8]);var inp_access=document.getElementById(OxOcacc[0x9]);var inp_index=document.getElementById(OxOcacc[0xa]);var allanchors=document.getElementById(OxOcacc[0xb]); allanchors[OxOcacc[0xd]][OxOcacc[0xc]]=OxOcacc[0xe] ; updateList() ; function SyncToView(){if(element){var src=OxOcacc[0xf];if(element.getAttribute(OxOcacc[0x10])){ src=element.getAttribute(OxOcacc[0x10]) ;} ;if(element.getAttribute(OxOcacc[0x11])){ src=element.getAttribute(OxOcacc[0x11]) ;} ;if(EnableAntiSpamEmailEncoder&&(src).indexOf(OxOcacc[0x12])!=-0x1){ src=decode(src) ;} ; inp_src[OxOcacc[0x13]]=src ; inp_id[OxOcacc[0x13]]=element[OxOcacc[0x14]] ;if(element[OxOcacc[0x15]]){ inp_target[OxOcacc[0x13]]=element[OxOcacc[0x15]] ;} ;if(element[OxOcacc[0x16]]){ inp_class[OxOcacc[0x13]]=element[OxOcacc[0x16]] ;} ;if(element[OxOcacc[0x17]]<=0x0){ inp_index[OxOcacc[0x13]]=OxOcacc[0xf] ;} else { inp_index[OxOcacc[0x13]]=element[OxOcacc[0x17]] ;} ;if(element[OxOcacc[0x18]]){ inp_access[OxOcacc[0x13]]=element[OxOcacc[0x18]] ;} ;if(element[OxOcacc[0x19]]){ inp_title[OxOcacc[0x13]]=element[OxOcacc[0x19]] ;} ;if(element[OxOcacc[0xd]][OxOcacc[0x1a]]){ inp_color[OxOcacc[0x13]]=revertColor(element[OxOcacc[0xd]].color) ; inp_color[OxOcacc[0xd]][OxOcacc[0x1b]]=inp_color[OxOcacc[0x13]] ; inp_color_Preview[OxOcacc[0xd]][OxOcacc[0x1b]]=inp_color[OxOcacc[0x13]] ;} ;} ;}  ; function SyncTo(){if(sel_protocol[OxOcacc[0x13]]==OxOcacc[0x1c]&&EnableAntiSpamEmailEncoder){ element[OxOcacc[0x10]]=obfuscate(inp_src.value) ; element.setAttribute(OxOcacc[0x11],inp_src.value) ;} else { element[OxOcacc[0x10]]=inp_src[OxOcacc[0x13]] ; element.setAttribute(OxOcacc[0x11],inp_src.value) ;} ;if(element[OxOcacc[0x0]]==OxOcacc[0xf]&&inp_title[OxOcacc[0x13]]){ element[OxOcacc[0x0]]=inp_title[OxOcacc[0x13]] ;} ; element[OxOcacc[0x19]]=inp_title[OxOcacc[0x13]] ; element[OxOcacc[0x16]]=inp_class[OxOcacc[0x13]] ; element[OxOcacc[0x17]]=inp_index[OxOcacc[0x13]] ; element[OxOcacc[0x18]]=inp_access[OxOcacc[0x13]] ; element[OxOcacc[0x14]]=inp_id[OxOcacc[0x13]] ;if(inp_target[OxOcacc[0x1d]]!=-0x1){ element[OxOcacc[0x15]]=inp_target[OxOcacc[0x13]] ;} ;try{ element[OxOcacc[0xd]][OxOcacc[0x1a]]=inp_color[OxOcacc[0x13]]||OxOcacc[0xf] ;} catch(x){ element[OxOcacc[0xd]][OxOcacc[0x1a]]=OxOcacc[0xf] ;} ;var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxOcacc[0x1e]) ;return ;} ;if(element[OxOcacc[0x19]]==OxOcacc[0xf]){ element.removeAttribute(OxOcacc[0x19]) ;} ;if(element[OxOcacc[0x15]]==OxOcacc[0xf]){ element.removeAttribute(OxOcacc[0x15]) ;} ;if(element[OxOcacc[0x16]]==OxOcacc[0xf]){ element.removeAttribute(OxOcacc[0x1f]) ;} ;if(element[OxOcacc[0x17]]==OxOcacc[0xf]){ element.removeAttribute(OxOcacc[0x17]) ;} ;if(element[OxOcacc[0x18]]==OxOcacc[0xf]){ element.removeAttribute(OxOcacc[0x18]) ;} ;if(element[OxOcacc[0x14]]==OxOcacc[0xf]){ element.removeAttribute(OxOcacc[0x14]) ;} ;try{ element[OxOcacc[0xd]][OxOcacc[0x1a]]=inp_color[OxOcacc[0x13]] ;} catch(er){ element[OxOcacc[0xd]][OxOcacc[0x1a]]=OxOcacc[0xf] ;} ;var Oxaf=element[OxOcacc[0x0]];switch(Oxaf.toLowerCase()){case OxOcacc[0x25]:case OxOcacc[0x24]:case OxOcacc[0x23]:case OxOcacc[0x22]:case OxOcacc[0x21]:case OxOcacc[0x20]: element[OxOcacc[0x0]]=OxOcacc[0xf] ;break ;default:break ;;;;;;;;} ;if(element[OxOcacc[0x0]]==OxOcacc[0xf]){ element[OxOcacc[0x0]]=element[OxOcacc[0x19]]||inp_src[OxOcacc[0x13]]||element[OxOcacc[0x26]]||OxOcacc[0x27] ;} ;}  ; function sel_protocol_change(){ inp_src[OxOcacc[0x13]]=sel_protocol[OxOcacc[0x13]] ;}  ; function obfuscate(Ox3ce){var Ox3cf=OxOcacc[0xf];if(Ox3ce[OxOcacc[0x28]]>0x0){for(var i=0x0;i<Ox3ce[OxOcacc[0x28]];i++){ Ox3cf+=OxOcacc[0x12]+Ox3ce.charCodeAt(i)+OxOcacc[0x29] ;} ;} ;return (Ox3cf);}  ; function decode(Ox6e4){var Ox6e5=OxOcacc[0xf];var arr=Ox6e4.split(OxOcacc[0x29]);for(var i=0x0;i<arr[OxOcacc[0x28]];i++){var Ox20=arr[i].substr(0x2,arr[i][OxOcacc[0x28]]-0x2); Ox20=String.fromCharCode(Ox20) ; Ox6e5+=Ox20 ;} ;return (Ox6e5);}  ; function ToggleAnchors(){if(allanchors[OxOcacc[0xd]][OxOcacc[0xc]]==OxOcacc[0xe]){ allanchors[OxOcacc[0xd]][OxOcacc[0xc]]=OxOcacc[0x2a] ;} else { allanchors[OxOcacc[0xd]][OxOcacc[0xc]]=OxOcacc[0xe] ;} ;}  ; function updateList(){while(allanchors[OxOcacc[0x2b]][OxOcacc[0x28]]!=0x0){ allanchors[OxOcacc[0x2b]].remove(allanchors.options(0x0)) ;} ;for(var i=0x0;i<editdoc[OxOcacc[0x2c]][OxOcacc[0x28]];i++){var Ox539=document.createElement(OxOcacc[0x2d]); Ox539[OxOcacc[0x2e]]=OxOcacc[0x2f]+editdoc[OxOcacc[0x2c]][i][OxOcacc[0x26]] ; Ox539[OxOcacc[0x13]]=editdoc[OxOcacc[0x2c]][i][OxOcacc[0x26]] ; allanchors[OxOcacc[0x2b]].add(Ox539) ;} ;}  ; function selectAnchor(Ox53b){ inp_src[OxOcacc[0x13]]=OxOcacc[0x2f]+Ox53b ;}  ;
</script>
