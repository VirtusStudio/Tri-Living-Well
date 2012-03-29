<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>Textarea</legend>
	<table class="normal">
		<tr>
			<td width="60">[[Name]]:</td>
			<td><input type="text" id="inp_name" style="width:100px"></td>
		</tr>
		<tr>
			<td>[[Columns]]:</td>
			<td><input type="text" id="inp_cols" style="width:100px" onkeypress="event.returnValue=IsDigit();"></td>
		</tr>
		<tr>
			<td>[[Rows]]:</td>
			<td><input type="text" id="inp_rows" style="width:100px" onkeypress="event.returnValue=IsDigit();"></td>
		</tr>
		<tr>
			<td>[[Value]]:</td>
			<td><textarea rows="2" style="width:258px" id="inp_value"></textarea></td>
		</tr>
		<tr>
			<td>[[Wrap]]:</td>
			<td>
				<SELECT id="sel_Wrap" NAME="sel_Wrap">
					<OPTION value="">Default</OPTION>
					<OPTION value="off">off</OPTION>
					<OPTION value="virtual">virtual</OPTION>
					<OPTION value="physical">physical</OPTION>
				</SELECT>
			</td>		
		</tr>
		<tr>
			<td width="60">[[ID]]:</td>
			<td><input type="text" id="inp_id" style="width:100px"></td>
		</tr>
		<tr>
			
			<td nowrap>[[AccessKey]]:</td>
			<td>
				<input type="text" id="inp_access" size="1" maxlength=1>
		</tr>
		<tr>
			<td>[[TabIndex]]:</td>
			<td><input type="text" id="inp_index" size="5" value="" maxlength=5 onkeypress="event.returnValue=IsDigit();">		
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td><input type="checkbox" id="inp_Disabled"><label for="inp_Disabled">[[Disabled]]</label>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td><input type="checkbox" id="inp_Readonly"><label for="inp_Readonly">[[Readonly]]</label>
			</td>
		</tr>
	</table>
</fieldset>
<script>


var OxO32ce=["inp_name","inp_id","inp_cols","inp_rows","inp_Disabled","inp_Readonly","sel_Wrap","inp_index","inp_value","inp_access","Name","value","name","id","cols","","rows","disabled","checked","readOnly","wrap","tabIndex","accessKey"];var inp_name=document.getElementById(OxO32ce[0x0]);var inp_id=document.getElementById(OxO32ce[0x1]);var inp_cols=document.getElementById(OxO32ce[0x2]);var inp_rows=document.getElementById(OxO32ce[0x3]);var inp_Disabled=document.getElementById(OxO32ce[0x4]);var inp_Readonly=document.getElementById(OxO32ce[0x5]);var sel_Wrap=document.getElementById(OxO32ce[0x6]);var inp_index=document.getElementById(OxO32ce[0x7]);var inp_value=document.getElementById(OxO32ce[0x8]);var inp_access=document.getElementById(OxO32ce[0x9]); function UpdateState(){}  ; function SyncToView(){if(element[OxO32ce[0xa]]){ inp_name[OxO32ce[0xb]]=element[OxO32ce[0xa]] ;} ;if(element[OxO32ce[0xc]]){ inp_name[OxO32ce[0xb]]=element[OxO32ce[0xc]] ;} ; inp_id[OxO32ce[0xb]]=element[OxO32ce[0xd]] ; inp_value[OxO32ce[0xb]]=element[OxO32ce[0xb]] ;if(element[OxO32ce[0xe]]){if(element[OxO32ce[0xe]]==0x14){ inp_cols[OxO32ce[0xb]]=OxO32ce[0xf] ;} else { inp_cols[OxO32ce[0xb]]=element[OxO32ce[0xe]] ;} ;} ;if(element[OxO32ce[0x10]]){if(element[OxO32ce[0x10]]==0x2){ inp_rows[OxO32ce[0xb]]=OxO32ce[0xf] ;} else { inp_rows[OxO32ce[0xb]]=element[OxO32ce[0x10]] ;} ;} ; inp_Disabled[OxO32ce[0x12]]=element[OxO32ce[0x11]] ; inp_Readonly[OxO32ce[0x12]]=element[OxO32ce[0x13]] ; sel_Wrap[OxO32ce[0xb]]=element[OxO32ce[0x14]] ;if(element[OxO32ce[0x15]]==0x0){ inp_index[OxO32ce[0xb]]=OxO32ce[0xf] ;} else { inp_index[OxO32ce[0xb]]=element[OxO32ce[0x15]] ;} ;if(element[OxO32ce[0x16]]){ inp_access[OxO32ce[0xb]]=element[OxO32ce[0x16]] ;} ;}  ; function SyncTo(element){ element[OxO32ce[0xc]]=inp_name[OxO32ce[0xb]] ;if(element[OxO32ce[0xa]]){ element[OxO32ce[0xa]]=inp_name[OxO32ce[0xb]] ;} else {if(element[OxO32ce[0xc]]){ element.removeAttribute(OxO32ce[0xc],0x0) ; element[OxO32ce[0xa]]=inp_name[OxO32ce[0xb]] ;} else { element[OxO32ce[0xa]]=inp_name[OxO32ce[0xb]] ;} ;} ; element[OxO32ce[0xd]]=inp_id[OxO32ce[0xb]] ; element[OxO32ce[0xb]]=inp_value[OxO32ce[0xb]] ; element[OxO32ce[0x15]]=inp_index[OxO32ce[0xb]] ; element[OxO32ce[0x11]]=inp_Disabled[OxO32ce[0x12]] ; element[OxO32ce[0x13]]=inp_Readonly[OxO32ce[0x12]] ; element[OxO32ce[0x16]]=inp_access[OxO32ce[0xb]] ;if(inp_cols[OxO32ce[0xb]]==OxO32ce[0xf]){ element[OxO32ce[0xe]]=0x14 ;} else { element[OxO32ce[0xe]]=inp_cols[OxO32ce[0xb]] ;} ;if(inp_rows[OxO32ce[0xb]]==OxO32ce[0xf]){ element[OxO32ce[0x10]]=0x2 ;} else { element[OxO32ce[0x10]]=inp_rows[OxO32ce[0xb]] ;} ;try{ element[OxO32ce[0x14]]=sel_Wrap[OxO32ce[0xb]] ;} catch(e){ element.removeAttribute(OxO32ce[0x14]) ;} ; element[OxO32ce[0x15]]=inp_index[OxO32ce[0xb]] ;if(element[OxO32ce[0x15]]==OxO32ce[0xf]){ element.removeAttribute(OxO32ce[0x15]) ;} ;if(element[OxO32ce[0x16]]==OxO32ce[0xf]){ element.removeAttribute(OxO32ce[0x16]) ;} ;}  ;

</script>
