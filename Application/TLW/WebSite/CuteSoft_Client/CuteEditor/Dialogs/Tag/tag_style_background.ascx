<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Color]]</legend>
	<input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px">
	<img src="../images/colorpicker.gif"  align="absMiddle" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
			oncolorchange="inp_color.value=this.selectedColor; inp_color.style.backgroundColor=this.selectedColor; FireUIChanged()">
	
</fieldset>
<fieldset><legend>[[Backgroundimage]]</legend>
	<div>
		[[Url]]: <input id="tb_image" type="text" style="width:220"><button id="btnbrowse">&nbsp;...&nbsp;</button>
	</div>
	<div style="padding-left: 32px;">
		<table border="0" cellpadding="2" cellspacing="0" class="normal">
			<tr>
				<td width="80">[[Tiling]]: </td>
				<td><select id="sel_bgrepeat" style="width:140">
						<option value="">[[NotSet]]</option>
						<option value="repeat">[[Tilingboth]]</option>
						<option value="repeat-x">[[Tilingorizontal]]</option>
						<option value="repeat-y">[[Tilingvertical]]</option>
						<option value="no-repeat">[[NoTiling]]</option>
					</select></td>
			</tr>
			<tr>
				<td>[[Scrolling]]: </td>
				<td><select id="sel_bgattach" style="width:140">
						<option value="">[[NotSet]]</option>
						<option value="scroll">[[Scrollingbackground]]</option>
						<option value="fixed">[[ScrollingFixed]]</option>
					</select></td>
			</tr>
		</table>
	</div>
	<fieldset><legend>[[Position]]</legend>
		<table border="0" cellpadding="2" cellspacing="0" class="normal">
			<tr>
				<td>[[Horizontal]]</td>
				<td><select style="width:64" id="sel_hor">
						<option value="">[[NotSet]]</option>
						<option value="left">[[Left]]</option>
						<option value="center">[[Center]]</option>
						<option value="right">[[Right]]</option>
					</select>
					[[OR]] <input type="text" id="tb_hor" style="width:42">
					<select id="sel_hor_unit">
						<option value="px">px</option>
						<option value="pt">pt</option>
						<option value="pc">pc</option>
						<option value="em">em</option>
						<option value="cm">cm</option>
						<option value="mm">mm</option>
						<option value="in">in</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>[[Vertical]]</td>
				<td><select style="width:64" id="sel_ver">
						<option value="">[[NotSet]]</option>
						<option value="top">[[top]]</option>
						<option value="center">[[Center]]</option>
						<option value="bottom">[[Bottom]]</option>
					</select>
					[[OR]] <input type="text" id="tb_ver" style="width:42">
					<select id="sel_ver_unit">
						<option value="px">px</option>
						<option value="pt">pt</option>
						<option value="pc">pc</option>
						<option value="em">em</option>
						<option value="cm">cm</option>
						<option value="mm">mm</option>
						<option value="in">in</option>
					</select>
				</td>
			</tr>
		</table>
	</fieldset>
</fieldset>
<div id="outer"><div id="div_demo">[[DemoText]]</div></div>
<script>

var OxOae63=["SelectImage.Aspx?settinghash=[[_setting_]]\x26type=gif,jpg,jpeg,png,bmp\x26file=","\x26[[DNN_Arg]]","[[SelectFileDialogOption]]","value","disabled","selectedIndex","cssText","style","backgroundImage","backgroundColor","backgroundRepeat","backgroundAttachment","backgroundPositionX","length","options","backgroundPositionY","url(",")","background-image","","backgroundPosition","none"]; function btnbrowse.onclick(){var Ox74=showModalDialog(OxOae63[0x0]+escape(tb_image.value)+OxOae63[0x1],null,OxOae63[0x2]);if(Ox74){ tb_image[OxOae63[0x3]]=Ox74 ;} ;}  ; function UpdateState(){ tb_hor[OxOae63[0x4]]=sel_hor_unit[OxOae63[0x4]]=(sel_hor[OxOae63[0x5]]>0x0) ; tb_ver[OxOae63[0x4]]=sel_ver_unit[OxOae63[0x4]]=(sel_ver[OxOae63[0x5]]>0x0) ; div_demo[OxOae63[0x7]][OxOae63[0x6]]=element[OxOae63[0x7]][OxOae63[0x6]] ;}  ; function SyncToView(){ tb_image[OxOae63[0x3]]=element[OxOae63[0x7]][OxOae63[0x8]] ; FixTbImage() ; inp_color[OxOae63[0x3]]=element[OxOae63[0x7]][OxOae63[0x9]] ; inp_color[OxOae63[0x7]][OxOae63[0x9]]=element[OxOae63[0x7]][OxOae63[0x9]] ; sel_bgrepeat[OxOae63[0x3]]=element[OxOae63[0x7]][OxOae63[0xa]] ; sel_bgattach[OxOae63[0x3]]=element[OxOae63[0x7]][OxOae63[0xb]] ; sel_hor[OxOae63[0x3]]=element[OxOae63[0x7]][OxOae63[0xc]] ; sel_hor_unit[OxOae63[0x5]]=0x0 ;if(sel_hor[OxOae63[0x5]]==-0x1){if(ParseToString(element[OxOae63[0x7]].backgroundPositionX)){ tb_hor[OxOae63[0x3]]=ParseToString(element[OxOae63[0x7]].backgroundPositionX) ;for(var i=0x0;i<sel_hor_unit[OxOae63[0xe]][OxOae63[0xd]];i++){var Ox5b=sel_hor_unit.options(i)[OxOae63[0x3]];if(Ox5b&&element[OxOae63[0x7]][OxOae63[0xc]].indexOf(Ox5b)!=-0x1){ sel_hor_unit[OxOae63[0x5]]=i ;break ;} ;} ;} ;} ; sel_ver[OxOae63[0x3]]=element[OxOae63[0x7]][OxOae63[0xf]] ; sel_ver_unit[OxOae63[0x5]]=0x0 ;if(sel_ver[OxOae63[0x5]]==-0x1){if(ParseToString(element[OxOae63[0x7]].backgroundPositionY)){ tb_ver[OxOae63[0x3]]=ParseToString(element[OxOae63[0x7]].backgroundPositionY) ;for(var i=0x0;i<sel_ver_unit[OxOae63[0xe]][OxOae63[0xd]];i++){var Ox5b=sel_ver_unit.options(i)[OxOae63[0x3]];if(Ox5b&&element[OxOae63[0x7]][OxOae63[0xf]].indexOf(Ox5b)!=-0x1){ sel_ver_unit[OxOae63[0x5]]=i ;break ;} ;} ;} ;} ;}  ; function SyncTo(element){if(tb_image[OxOae63[0x3]]){ element[OxOae63[0x7]][OxOae63[0x8]]=OxOae63[0x10]+tb_image[OxOae63[0x3]]+OxOae63[0x11] ;} else { SetStyle(element.style,OxOae63[0x12],OxOae63[0x13]) ;} ;try{ element[OxOae63[0x7]][OxOae63[0x9]]=inp_color[OxOae63[0x3]]||OxOae63[0x13] ;} catch(x){ element[OxOae63[0x7]][OxOae63[0x9]]=OxOae63[0x13] ;} ; element[OxOae63[0x7]][OxOae63[0xa]]=sel_bgrepeat[OxOae63[0x3]]||OxOae63[0x13] ; element[OxOae63[0x7]][OxOae63[0xb]]=sel_bgattach[OxOae63[0x3]]||OxOae63[0x13] ; element[OxOae63[0x7]][OxOae63[0x14]]=OxOae63[0x13] ;if(sel_hor[OxOae63[0x5]]>0x0){ element[OxOae63[0x7]][OxOae63[0xc]]=sel_hor[OxOae63[0x3]] ;} else {if(ParseToString(tb_hor.value)){ element[OxOae63[0x7]][OxOae63[0xc]]=ParseToString(tb_hor.value)+sel_hor_unit[OxOae63[0x3]] ;} else { element[OxOae63[0x7]][OxOae63[0xc]]=OxOae63[0x13] ;} ;} ;if(sel_ver[OxOae63[0x5]]>0x0){ element[OxOae63[0x7]][OxOae63[0xf]]=sel_ver[OxOae63[0x3]] ;} else {if(ParseToString(tb_ver.value)){ element[OxOae63[0x7]][OxOae63[0xf]]=ParseToString(tb_ver.value)+sel_ver_unit[OxOae63[0x3]] ;} else { element[OxOae63[0x7]][OxOae63[0xf]]=OxOae63[0x13] ;} ;} ;}  ; function FixTbImage(){var Ox5b=tb_image[OxOae63[0x3]].replace(/^(\s+)/g,OxOae63[0x13]).replace(/(\s+)$/g,OxOae63[0x13]);if(Ox5b.substr(0x0,0x4).toLowerCase()==OxOae63[0x10]){ Ox5b=Ox5b.substr(0x4,Ox5b[OxOae63[0xd]]-0x4) ;} ;if(Ox5b.substr(Ox5b[OxOae63[0xd]]-0x1,0x1)==OxOae63[0x11]){ Ox5b=Ox5b.substr(0x0,Ox5b[OxOae63[0xd]]-0x1) ;} ;if(Ox5b==OxOae63[0x15]){ Ox5b=OxOae63[0x13] ;} ; tb_image[OxOae63[0x3]]=Ox5b ;}  ;

</script>
