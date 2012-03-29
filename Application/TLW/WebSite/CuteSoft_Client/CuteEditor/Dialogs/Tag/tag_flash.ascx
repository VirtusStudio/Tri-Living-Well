<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Src]]</legend>
	<input type="text" id="inp_src" style="width:320px"><button id="btnbrowse">[[Browse]]</button>
</fieldset>
<fieldset style="height:180px;width:270px;overflow:hidden;"><legend>[[Demo]]</legend>
	<object id=flash_preview classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,42,0"
		VIEWASTEXT>
		<embed type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
	</object>
</fieldset>
<script>

var OxO68b4=["SelectFile.Aspx?settinghash=[[_setting_]]\x26type=gif,jpg,jpeg,png,bmp\x26file=","\x26[[DNN_Arg]]","[[SelectFileDialogOption]]","value","cssText","style","Movie"]; function btnbrowse.onclick(){var Ox74=showModalDialog(OxO68b4[0x0]+escape(inp_src.value)+OxO68b4[0x1],null,OxO68b4[0x2]);if(Ox74){ inp_src[OxO68b4[0x3]]=Ox74 ;} ;}  ; function UpdateState(){ flash_preview[OxO68b4[0x5]][OxO68b4[0x4]]=element[OxO68b4[0x5]][OxO68b4[0x4]] ; flash_preview.mergeAttributes(element) ;}  ; function SyncToView(){ inp_src[OxO68b4[0x3]]=element[OxO68b4[0x6]] ;}  ; function SyncTo(element){ element[OxO68b4[0x6]]=inp_src[OxO68b4[0x3]] ;}  ;

</script>
