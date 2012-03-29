<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset>
	<legend>[[InsertForm]]</legend>
	<table class="normal" width="98%" cellpadding=4 cellspacing=2>
		<tr>
			<td style='width:60px'>[[Name]]:</td>
			<td><input type="text" id="inp_name" style="width:200px"></td>
		</tr>
		<tr>
			<td style='width:60px'>[[ID]]:</td>
			<td><input type="text" id="inp_id" style="width:200px"></td>
		</tr>
		<tr>
			<td style='width:60px'>[[Action]]:</td>
			<td><input type="text" id="inp_action" style="width:200px"></td>
		</tr>
		<tr>
			<td>[[Method]]:</td>
			<td>
				<select id="sel_Method" style="width:200px">
					<option value="post">post</option>
					<option value="get">get</option>
				</select>
			</td>
		</tr>
	</table>
</fieldset>
<script>

var OxOc4eb=["inp_name","inp_id","inp_action","sel_Method","name","value","id","action","method"];var inp_name=document.getElementById(OxOc4eb[0x0]);var inp_id=document.getElementById(OxOc4eb[0x1]);var inp_action=document.getElementById(OxOc4eb[0x2]);var sel_Method=document.getElementById(OxOc4eb[0x3]); function SyncToView(){ inp_name[OxOc4eb[0x5]]=element[OxOc4eb[0x4]] ; inp_id[OxOc4eb[0x5]]=element[OxOc4eb[0x6]] ; inp_action[OxOc4eb[0x5]]=element[OxOc4eb[0x7]] ; sel_Method[OxOc4eb[0x5]]=element[OxOc4eb[0x8]] ;}  ; function SyncTo(){if(inp_name[OxOc4eb[0x5]]){ element[OxOc4eb[0x4]]=inp_name[OxOc4eb[0x5]] ;} ;if(inp_id[OxOc4eb[0x5]]){ element[OxOc4eb[0x6]]=inp_id[OxOc4eb[0x5]] ;} ;if(inp_action[OxOc4eb[0x5]]){ element[OxOc4eb[0x7]]=inp_action[OxOc4eb[0x5]] ;} ;if(sel_Method[OxOc4eb[0x5]]){ element[OxOc4eb[0x8]]=sel_Method[OxOc4eb[0x5]] ;} ;}  ;

</script>
