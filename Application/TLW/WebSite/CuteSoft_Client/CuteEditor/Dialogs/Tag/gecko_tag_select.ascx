<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<style type=text/css>
	.codebutton
	{
		width:110px; 
	}
</style>

<fieldset><legend>[[Input]]</legend>
	<table class="normal">
		<tr>
			<td width="60">[[Name]]:</td>
			<td><input type="text" id="inp_name" style="width:100px"></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td nowrap>[[AccessKey]]:</td>
			<td>
				<input type="text" id="inp_access" size="1" maxlength=1>
			</td>
		</tr>
		<tr>
			<td>[[ID]]:</td>
			<td><input type="text" id="inp_id" style="width:100px"></td>
			<td>&nbsp;&nbsp;</td>			
			<td nowrap>
				[[TabIndex]]:
			</td>
			<td>
				<input type="text" id="inp_index" size="5" value="" maxlength=5 onkeypress="return IsDigit(event);">&nbsp;		
			</td>			
		</tr>
		<tr>
			<td>[[Size]]:</td>
			<td colspan=4><input type="text" id="inp_size" style="width:100px"></td>
		</td>
		<tr>
			<td>
			</td>
			<td colspan="4"><input type="checkbox" id="inp_Multiple"><label for="inp_Multiple">[[AllowMultipleSelections]]</label>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td colspan="4"><input type="checkbox" id="inp_Disabled"><label for="inp_Disabled">[[Disabled]]</label>
			</td>
		</tr>
	</table>
	
	[[Items]]: <br>
	
	<table class="normal">
		<tr>
			<td>[[Text]]:
				<br>
				<input type="text" id="inp_item_text" style="width:130px">
			</td>
			<td>[[Value]]:
				<br>
				<input type="text" id="inp_item_value" style="width:130px">
			</td>
			<td rowspan="3" valign=top>
				<table>
					<tr>
						<td colspan=2><button class="codebutton" onclick="Insert();" id="btnInsertItem">[[Insert]]</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><button class="codebutton" onclick="Update();" id="btnUpdateItem">[[Update]]</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><button class="codebutton" onclick="Delete();" id="btnDeleteItem">[[Delete]]</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><button class="codebutton" onclick="Move(1);" id="btnMoveUpItem">[[MoveUp]]</button>
						</td>
					</tr>
					<tr>
						<td colspan=2><button class="codebutton" onclick="Move(-1);" id="btnMoveDownItem">[[MoveDown]]</button>
						</td>
					</tr>				
				</table>						
			</td>
		</tr>
		<tr>
			<td><select size="6" id="list_options" style="width:130px" onchange="document.getElementById('list_options2').selectedIndex = this.selectedIndex;Select(this);FireUIChanged();"></select></td>
			<td><select size="6" id="list_options2" style="width:130px" onchange="document.getElementById('list_options').selectedIndex = this.selectedIndex;Select(this);FireUIChanged();"></select></td>
		</tr>
		<tr>
			<td>[[Color]]:&nbsp;<input size="7" type="text" id="inp_item_forecolor" onclick="SelectColor('inp_item_forecolor',this);"></td>
			<td>[[BackColor]]:&nbsp;<input size="7" type="text" id="inp_item_backcolor" onclick="SelectColor('inp_item_backcolor',this);"></td>
		</tr>
	</table>
</fieldset>

<script src=Gecko_dialog.js></script><script src=../_shared.js></script>

<script>

var OxOef17=["inp_name","inp_id","inp_size","inp_Multiple","inp_Disabled","list_options","list_options2","inp_item_text","inp_item_value","inp_item_forecolor","inp_item_backcolor","inp_access","inp_index","value","text","color","style","backgroundColor","selectedIndex","options","Please select an item first","length","OPTION","id","cssText","Name","name","size","disabled","checked","multiple","","tabIndex","accessKey"];var inp_name=document.getElementById(OxOef17[0x0]);var inp_id=document.getElementById(OxOef17[0x1]);var inp_size=document.getElementById(OxOef17[0x2]);var inp_Multiple=document.getElementById(OxOef17[0x3]);var inp_Disabled=document.getElementById(OxOef17[0x4]);var list_options=document.getElementById(OxOef17[0x5]);var list_options2=document.getElementById(OxOef17[0x6]);var inp_item_text=document.getElementById(OxOef17[0x7]);var inp_item_value=document.getElementById(OxOef17[0x8]);var inp_item_forecolor=document.getElementById(OxOef17[0x9]);var inp_item_backcolor=document.getElementById(OxOef17[0xa]);var inp_access=document.getElementById(OxOef17[0xb]);var inp_index=document.getElementById(OxOef17[0xc]); function SetOption(Ox73){ Ox73[OxOef17[0xe]]=inp_item_text[OxOef17[0xd]] ; Ox73[OxOef17[0xd]]=inp_item_value[OxOef17[0xd]] ; Ox73[OxOef17[0x10]][OxOef17[0xf]]=inp_item_forecolor[OxOef17[0xd]] ; Ox73[OxOef17[0x10]][OxOef17[0x11]]=inp_item_backcolor[OxOef17[0xd]] ;}  ; function SetOption2(Ox73){ Ox73[OxOef17[0xe]]=inp_item_value[OxOef17[0xd]] ; Ox73[OxOef17[0xd]]=inp_item_text[OxOef17[0xd]] ; Ox73[OxOef17[0x10]][OxOef17[0xf]]=inp_item_forecolor[OxOef17[0xd]] ; Ox73[OxOef17[0x10]][OxOef17[0x11]]=inp_item_backcolor[OxOef17[0xd]] ;}  ; function Select(Ox73){var Ox379=Ox73[OxOef17[0x12]]; list_options[OxOef17[0x12]]=Ox379 ; list_options2[OxOef17[0x12]]=Ox379 ; inp_item_text[OxOef17[0xd]]=list_options2[OxOef17[0xd]] ; inp_item_value[OxOef17[0xd]]=list_options[OxOef17[0xd]] ;}  ; function Insert(){var Ox73= new Option(); SetOption(Ox73) ; list_options[OxOef17[0x13]].add(Ox73) ;var Ox733= new Option(); SetOption2(Ox733) ; list_options2[OxOef17[0x13]].add(Ox733) ; FireUIChanged() ;}  ; function Update(){if(list_options[OxOef17[0x12]]==-0x1){ alert(OxOef17[0x14]) ;return ;} ;var Ox73=list_options[OxOef17[0x13]][list_options[OxOef17[0x12]]]; SetOption(Ox73) ;var Ox733=list_options2[OxOef17[0x13]][list_options2[OxOef17[0x12]]]; SetOption2(Ox733) ; FireUIChanged() ;}  ; function Move(Ox5b){var Ox379=list_options[OxOef17[0x12]];if(Ox379<0x0){return ;} ;var Ox735=Ox379-Ox5b;if(Ox735<0x0){ Ox735=0x0 ;} ;if(Ox735>(list_options[OxOef17[0x13]][OxOef17[0x15]]-0x1)){ Ox735=list_options[OxOef17[0x13]][OxOef17[0x15]]-0x1 ;} ;if(Ox379==Ox735){return ;} ;var Ox73=list_options[OxOef17[0x13]][list_options[OxOef17[0x12]]];var Ox20=list_options2[OxOef17[0xd]];var Ox9=list_options[OxOef17[0xd]]; Delete() ; inp_item_text[OxOef17[0xd]]=Ox20 ; inp_item_value[OxOef17[0xd]]=Ox9 ;var Ox73= new Option(); SetOption(Ox73) ; list_options[OxOef17[0x13]].add(Ox73,Ox735) ;var Ox733= new Option(); SetOption2(Ox733) ; list_options2[OxOef17[0x13]].add(Ox733,Ox735) ; list_options[OxOef17[0x12]]=Ox735 ; list_options2[OxOef17[0x12]]=Ox735 ; FireUIChanged() ;}  ; function Delete(){if(list_options[OxOef17[0x12]]==-0x1||list_options[OxOef17[0x12]]==-0x1){ alert(OxOef17[0x14]) ;return ;} ;var Ox737=list_options[OxOef17[0x12]];var Ox73=list_options[OxOef17[0x13]][list_options[OxOef17[0x12]]]; list_options.remove(Ox737) ; Ox73=list_options2[OxOef17[0x13]][list_options2[OxOef17[0x12]]] ; list_options2.remove(Ox737) ;if(list_options[OxOef17[0x13]][OxOef17[0x15]]>Ox737){ list_options[OxOef17[0x12]]=Ox737 ;} else {if(list_options[OxOef17[0x13]][OxOef17[0x15]]){ list_options[OxOef17[0x12]]=list_options[OxOef17[0x13]][OxOef17[0x15]]-0x1 ;} ;} ; UpdateSelect() ;if(list_options2[OxOef17[0x13]][OxOef17[0x15]]>Ox737){ list_options2[OxOef17[0x12]]=Ox737 ;} else {if(list_options2[OxOef17[0x13]][OxOef17[0x15]]){ list_options2[OxOef17[0x12]]=list_options2[OxOef17[0x13]][OxOef17[0x15]]-0x1 ;} ;} ; FireUIChanged() ;}  ; function UpdateSelect(){if(list_options[OxOef17[0x12]]==-0x1){return ;} ;var Ox73=list_options[OxOef17[0x13]][list_options[OxOef17[0x12]]]; inp_item_text[OxOef17[0xd]]=Ox73[OxOef17[0xe]] ; inp_item_value[OxOef17[0xd]]=Ox73[OxOef17[0xd]] ; inp_item_forecolor[OxOef17[0xd]]=inp_item_forecolor[OxOef17[0x10]][OxOef17[0x11]]=Ox73[OxOef17[0x10]][OxOef17[0xf]] ; inp_item_backcolor[OxOef17[0xd]]=inp_item_backcolor[OxOef17[0x10]][OxOef17[0x11]]=Ox73[OxOef17[0x10]][OxOef17[0x11]] ;}  ; function CopySelect(Ox73a,Ox73b){ Ox73b[OxOef17[0x13]][OxOef17[0x15]]=0x0 ;for(var i=0x0;i<Ox73a[OxOef17[0x13]][OxOef17[0x15]];i++){var Ox73c=Ox73a[OxOef17[0x13]][i];var Ox733=document.createElement(OxOef17[0x16]);if(Ox73b[OxOef17[0x17]]!=OxOef17[0x6]){ Ox733[OxOef17[0xd]]=Ox73c[OxOef17[0xd]] ; Ox733[OxOef17[0xe]]=Ox73c[OxOef17[0xe]] ;} else { Ox733[OxOef17[0xd]]=Ox73c[OxOef17[0xe]] ; Ox733[OxOef17[0xe]]=Ox73c[OxOef17[0xd]] ;} ; Ox733[OxOef17[0x10]][OxOef17[0x18]]=Ox73c[OxOef17[0x10]][OxOef17[0x18]] ; Ox73b[OxOef17[0x13]].add(Ox733) ;} ; Ox73b[OxOef17[0x12]]=Ox73a[OxOef17[0x12]] ;}  ; function UpdateState(){}  ; function SyncToView(){if(element[OxOef17[0x19]]){ inp_name[OxOef17[0xd]]=element[OxOef17[0x19]] ;} ;if(element[OxOef17[0x1a]]){ inp_name[OxOef17[0xd]]=element[OxOef17[0x1a]] ;} ; inp_id[OxOef17[0xd]]=element[OxOef17[0x17]] ; inp_size[OxOef17[0xd]]=element[OxOef17[0x1b]] ; CopySelect(element,list_options) ; CopySelect(element,list_options2) ; inp_Disabled[OxOef17[0x1d]]=element[OxOef17[0x1c]] ; inp_Multiple[OxOef17[0x1d]]=element[OxOef17[0x1e]] ;if(element[OxOef17[0x1b]]<=0x0){ inp_size[OxOef17[0xd]]=OxOef17[0x1f] ;} else { inp_size[OxOef17[0xd]]=element[OxOef17[0x1b]] ;} ;if(element[OxOef17[0x20]]<=0x0){ inp_index[OxOef17[0xd]]=OxOef17[0x1f] ;} else { inp_index[OxOef17[0xd]]=element[OxOef17[0x20]] ;} ;if(element[OxOef17[0x21]]){ inp_access[OxOef17[0xd]]=element[OxOef17[0x21]] ;} ;}  ; function SyncTo(){ element[OxOef17[0x1a]]=inp_name[OxOef17[0xd]] ; element[OxOef17[0x17]]=inp_id[OxOef17[0xd]] ; element[OxOef17[0x1b]]=inp_size[OxOef17[0xd]] ; element[OxOef17[0x1c]]=inp_Disabled[OxOef17[0x1d]] ; element[OxOef17[0x1e]]=inp_Multiple[OxOef17[0x1d]] ; element[OxOef17[0x21]]=inp_access[OxOef17[0xd]] ; element[OxOef17[0x20]]=inp_index[OxOef17[0xd]] ;if(element[OxOef17[0x20]]==OxOef17[0x1f]){ element.removeAttribute(OxOef17[0x20]) ;} ;if(element[OxOef17[0x21]]==OxOef17[0x1f]){ element.removeAttribute(OxOef17[0x21]) ;} ;if(element[OxOef17[0x17]]==OxOef17[0x1f]){ element.removeAttribute(OxOef17[0x17]) ;} ;if(element[OxOef17[0x1a]]==OxOef17[0x1f]){ element.removeAttribute(OxOef17[0x1a]) ;} ;if(element[OxOef17[0x1b]]==0x0){ element.removeAttribute(OxOef17[0x1b]) ;} ; CopySelect(list_options,element) ;}  ;

</script>