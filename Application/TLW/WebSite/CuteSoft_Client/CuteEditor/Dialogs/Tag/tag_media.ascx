<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Src]]</legend>
	<input type=text id=inp_src style="width:320px"><button id=btnbrowse>[[Browse]]</button>
</fieldset>
<fieldset style="height:180px;width:270px;overflow:hidden;"><legend>[[Demo]]</legend>
	<img id="img_demo">
</fieldset>
<script>

var OxOd6f3=["SelectFile.Aspx?settinghash=[[_setting_]]\x26type=gif,jpg,jpeg,png,bmp\x26file=","\x26[[DNN_Arg]]","[[SelectFileDialogOption]]","value","cssText","style","src","FileName"]; function btnbrowse.onclick(){var Ox74=showModalDialog(OxOd6f3[0x0]+escape(inp_src.value)+OxOd6f3[0x1],null,OxOd6f3[0x2]);if(Ox74){ inp_src[OxOd6f3[0x3]]=Ox74 ;} ;}  ; function UpdateState(){ img_demo[OxOd6f3[0x5]][OxOd6f3[0x4]]=element[OxOd6f3[0x5]][OxOd6f3[0x4]] ; img_demo.mergeAttributes(element) ;if(element[OxOd6f3[0x6]]){ img_demo[OxOd6f3[0x7]]=element[OxOd6f3[0x7]] ;} else { img_demo.removeAttribute(OxOd6f3[0x7]) ;} ;}  ; function SyncToView(){ inp_src[OxOd6f3[0x3]]=element[OxOd6f3[0x7]] ;}  ; function SyncTo(element){ element[OxOd6f3[0x7]]=inp_src[OxOd6f3[0x3]] ;}  ;

</script>
