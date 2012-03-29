<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Hyperlink_Information]]</legend>
			<table class="normal">
				<tr>
					<td style="width:60px">[[Url]]:</td>
					<td><input type="text" id="inp_src" style="width:260px"></td>
					<td></td>
				</tr>
				<tr>
					<td>[[Target]]</td>
					<td><SELECT id="sel_target" NAME="sel_target">
							<OPTION value="">[[NotSet]]</OPTION>
							<OPTION value="_blank">[[Newwindow]]</OPTION>
							<OPTION value="_self">[[Samewindow]]</OPTION>
							<OPTION value="_top">[[Topmostwindow]]</OPTION>
							<OPTION value="_parent">[[Parentwindow]]</OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td style="width:60px">[[Title]]:</td>
					<td><input type="text" id="inp_title" style="width:260px"></td>
				</tr>
				<tr>
					<td style="width:60px">[[CssClass]]:</td>
					<td><input type="text" id="inp_cssclass" style="width:260px"></td>
				</tr>
			</table>
		</fieldset>
<script>

	var OxO8feb=["dialogArguments","innerHTML","href","value","inp_src","target","sel_target","className","inp_cssclass","title","inp_title","length","childNodes","selectedIndex"];var element=top[OxO8feb[0x0]];var linkhtml; linkhtml=element[OxO8feb[0x1]] ; function SyncToView(){if(element){try{if(element.getAttribute(OxO8feb[0x2])){ document.getElementById(OxO8feb[0x4])[OxO8feb[0x3]]=element.getAttribute(OxO8feb[0x2]) ;} ;} catch(e){} ;if(element[OxO8feb[0x5]]){ document.getElementById(OxO8feb[0x6])[OxO8feb[0x3]]=element[OxO8feb[0x5]] ;} ;if(element[OxO8feb[0x7]]){ document.getElementById(OxO8feb[0x8])[OxO8feb[0x3]]=element[OxO8feb[0x7]] ;} ;if(element[OxO8feb[0x9]]){ document.getElementById(OxO8feb[0xa])[OxO8feb[0x3]]=element[OxO8feb[0x9]] ;} ;} ;}  ; function SyncTo(element){ element[OxO8feb[0x2]]=document.getElementById(OxO8feb[0x4])[OxO8feb[0x3]] ;if(element[OxO8feb[0xc]][OxO8feb[0xb]]==0x0||document.getElementById(OxO8feb[0xa])[OxO8feb[0x3]]){ element[OxO8feb[0x1]]=linkhtml ;} ;if(document.getElementById(OxO8feb[0xa])[OxO8feb[0x3]]){ element[OxO8feb[0x9]]=document.getElementById(OxO8feb[0xa])[OxO8feb[0x3]] ;} ;if(document.getElementById(OxO8feb[0x8])[OxO8feb[0x3]]){ element[OxO8feb[0x7]]=document.getElementById(OxO8feb[0x8])[OxO8feb[0x3]] ;} ;if(document.getElementById(OxO8feb[0x6])[OxO8feb[0xd]]!=-0x1){ element[OxO8feb[0x5]]=document.getElementById(OxO8feb[0x6])[OxO8feb[0x3]] ;} ;}  ;
</script>
