<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<fieldset><legend>[[Input]]</legend>
	<table class="normal">
		<tr>
			<td>[[Type]]:</td>
			<td colspan="3"><input type="text" id="inp_type" readonly="true" disabled="true" style="width:100px"></td>
		</tr>
		<tr>
			<td width="60">[[Name]]:</td>
			<td colspan="3"><input type="text" id="inp_name" style="width:100px"></td>
		</td>
		<tr>
			<td>[[Value]]:</td>
			<td colspan="3"><input type="text" id="inp_value" style="width:250px"></td>
		</tr>
		<tr id="row_txt1">
			<td>[[Size]]:</td>
			<td colspan="3"><input type="text" id="inp_Size" style="width:100px" onkeypress="event.returnValue=IsDigit();"></td>
		</tr>
		<tr id="row_txt2">
			<td>[[MaxLength]]:</td>
			<td colspan="3"><input type="text" id="inp_MaxLength" style="width:100px" maxlength="9" onkeypress="event.returnValue=IsDigit();"></td>
		</tr>
		<tr id="row_img">
			<td>[[Src]]:</td>
			<td colspan="3"><input type="text" id="inp_src" style="width:250px">&nbsp;
			<button id="btnbrowse">[[Browse]]</button></td>
		</tr>
		<tr id="row_img2">
			<td>[[Alignment]]:</td>
			<td>
				<select NAME="inp_Align" style="WIDTH : 80px" id="sel_Align">
					<OPTION id="optNotSet" value="">[[Notset]]</OPTION>
					<OPTION id="optLeft" value="left">[[Left]]</OPTION>
					<OPTION id="optRight" value="right">[[Right]]</OPTION>
					<OPTION id="optTexttop" value="textTop">[[Texttop]]</OPTION>
					<OPTION id="optAbsMiddle" value="absMiddle">[[Absmiddle]]</OPTION>
					<OPTION id="optBaseline" value="baseline" selected>[[Baseline]]</OPTION>
					<OPTION id="optAbsBottom" value="absBottom">[[Absbottom]]</OPTION>
					<OPTION id="optBottom" value="bottom">[[Bottom]]</OPTION>
					<OPTION id="optMiddle" value="middle">[[Middle]]</OPTION>
					<OPTION id="optTop" value="top">[[Top]]</OPTION>
				</select>
			</td>
			<td nowrap>[[Bordersize]]:</td>
			<td>
				<INPUT TYPE="text" SIZE="2" NAME="inp_Border" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px" id="inp_Border">
			</td>
		</tr>
		<tr id="row_img3">
			<td>[[Width]]:</td>
			<td>
				<INPUT TYPE="text" ONKEYPRESS="event.returnValue=IsDigit();" style="width:80px"SIZE="2" id="inp_width">
			</td>
			<td>[[Height]]:</td>
			<td>
				<INPUT TYPE="text" ONKEYPRESS="event.returnValue=IsDigit();" style="width:80px" SIZE="2" id="inp_height">
			</td>									
		</tr>
		<tr id="row_img4">
			<td>[[Horizontal]]:</td>
			<td>
				<INPUT TYPE="text" ONKEYPRESS="event.returnValue=IsDigit();" style="width:80px" SIZE="2" id="inp_HSpace">
			</td>
			<td>[[Vertical]]:</td>
			<td>
				<INPUT TYPE="text" ONKEYPRESS="event.returnValue=IsDigit();" style="width:80px" SIZE="2" id="inp_VSpace">
			</td>									
		</tr>
		<tr id="row_img5">
			<td valign="middle" nowrap>[[Alternate]]:</td>
			<td colspan="3"><input type="text" id="AlternateText" size="24" NAME="AlternateText" style="width:250px"></td>			
		</tr>
		<tr>
			<td>[[ID]]:</td>
			<td colspan="3"><input type="text" id="inp_id" style="width:100px"></td>
		</tr>
		<tr id="row_txt3">		
			<td nowrap>[[AccessKey]]:</td>
			<td>
				<input type="text" id="inp_access" size="1" maxlength=1>
			</td colspan="3">
		</tr>
		<tr id="row_txt4">		
			<td nowrap>
				[[TabIndex]]:
			</td>
			<td colspan="3">
				<input type="text" id="inp_index" size="5" value="" maxlength=5 onkeypress="event.returnValue=IsDigit();">&nbsp;		
			</td>		
		</tr>
		<tr id="row_chk">
			<td></td>
			<td><input type="checkbox" id="inp_checked"><label for="inp_checked">[[Checked]]</label></td>
		</td>
		<tr id="row_txt5">
			<td>
			</td>
			<td colspan="3"><input type="checkbox" id="inp_Disabled"><label for="inp_Disabled">[[Disabled]]</label>
			</td>
		</tr>
		<tr id="row_txt6">
			<td>
			</td>
			<td colspan="3"><input type="checkbox" id="inp_Readonly"><label for="inp_Readonly">[[Readonly]]</label>
			</td>
		</tr>
	</table>
</fieldset>
<script>
var OxO9755=["inp_name","inp_id","inp_type","inp_checked","inp_value","inp_src","inp_Disabled","inp_Readonly","inp_index","inp_access","inp_Size","inp_MaxLength","row_chk","row_txt1","row_txt2","row_txt3","row_txt4","row_txt5","row_txt6","row_img","row_img2","row_img3","row_img4","row_img5","sel_Align","inp_Border","inp_width","inp_height","inp_HSpace","inp_VSpace","AlternateText","SelectImage.Aspx?settinghash=[[_setting_]]\x26type=gif,jpg,jpeg,png,bmp\x26file=","\x26[[DNN_Arg]]","[[SelectFileDialogOption]]","value","Name","name","id","src","type","checked","disabled","readOnly","tabIndex","","accessKey","size","maxLength","width","height","vspace","hspace","border","align","alt","display","style","none","image","button","reset","submit","checkbox","radio","hidden","password","text"," ","trim","prototype"];var inp_name=document.getElementById(OxO9755[0x0]);var inp_id=document.getElementById(OxO9755[0x1]);var inp_type=document.getElementById(OxO9755[0x2]);var inp_checked=document.getElementById(OxO9755[0x3]);var inp_value=document.getElementById(OxO9755[0x4]);var inp_src=document.getElementById(OxO9755[0x5]);var inp_Disabled=document.getElementById(OxO9755[0x6]);var inp_Readonly=document.getElementById(OxO9755[0x7]);var inp_index=document.getElementById(OxO9755[0x8]);var inp_access=document.getElementById(OxO9755[0x9]);var inp_Size=document.getElementById(OxO9755[0xa]);var inp_MaxLength=document.getElementById(OxO9755[0xb]);var row_chk=document.getElementById(OxO9755[0xc]);var row_txt1=document.getElementById(OxO9755[0xd]);var row_txt2=document.getElementById(OxO9755[0xe]);var row_txt3=document.getElementById(OxO9755[0xf]);var row_txt4=document.getElementById(OxO9755[0x10]);var row_txt5=document.getElementById(OxO9755[0x11]);var row_txt6=document.getElementById(OxO9755[0x12]);var row_img=document.getElementById(OxO9755[0x13]);var row_img2=document.getElementById(OxO9755[0x14]);var row_img3=document.getElementById(OxO9755[0x15]);var row_img4=document.getElementById(OxO9755[0x16]);var row_img5=document.getElementById(OxO9755[0x17]);var sel_Align=document.getElementById(OxO9755[0x18]);var inp_Border=document.getElementById(OxO9755[0x19]);var inp_width=document.getElementById(OxO9755[0x1a]);var inp_height=document.getElementById(OxO9755[0x1b]);var inp_HSpace=document.getElementById(OxO9755[0x1c]);var inp_VSpace=document.getElementById(OxO9755[0x1d]);var AlternateText=document.getElementById(OxO9755[0x1e]); function btnbrowse.onclick(){var Ox74=showModalDialog(OxO9755[0x1f]+escape(inp_src.value)+OxO9755[0x20],null,OxO9755[0x21]);if(Ox74){ inp_src[OxO9755[0x22]]=Ox74 ;} ;}  ; function UpdateState(){}  ; function SyncToView(){if(element[OxO9755[0x23]]){ inp_name[OxO9755[0x22]]=element[OxO9755[0x23]] ;} ;if(element[OxO9755[0x24]]){ inp_name[OxO9755[0x22]]=element[OxO9755[0x24]] ;} ; inp_id[OxO9755[0x22]]=element[OxO9755[0x25]] ; inp_value[OxO9755[0x22]]=(element[OxO9755[0x22]]).trim() ; inp_src[OxO9755[0x22]]=element[OxO9755[0x26]] ; inp_type[OxO9755[0x22]]=element[OxO9755[0x27]] ; inp_checked[OxO9755[0x28]]=element[OxO9755[0x28]] ; inp_Disabled[OxO9755[0x28]]=element[OxO9755[0x29]] ; inp_Readonly[OxO9755[0x28]]=element[OxO9755[0x2a]] ;if(element[OxO9755[0x2b]]==0x0){ inp_index[OxO9755[0x22]]=OxO9755[0x2c] ;} else { inp_index[OxO9755[0x22]]=element[OxO9755[0x2b]] ;} ;if(element[OxO9755[0x2d]]){ inp_access[OxO9755[0x22]]=element[OxO9755[0x2d]] ;} ;if(element[OxO9755[0x2e]]){if(element[OxO9755[0x2e]]==0x14){ inp_Size[OxO9755[0x22]]=OxO9755[0x2c] ;} else { inp_Size[OxO9755[0x22]]=element[OxO9755[0x2e]] ;} ;} ;if(element[OxO9755[0x2f]]){if(element[OxO9755[0x2f]]==0x7fffffff){ inp_MaxLength[OxO9755[0x22]]=OxO9755[0x2c] ;} else { inp_MaxLength[OxO9755[0x22]]=element[OxO9755[0x2f]] ;} ;} ; inp_width[OxO9755[0x22]]=element[OxO9755[0x30]] ; inp_height[OxO9755[0x22]]=element[OxO9755[0x31]] ; inp_HSpace[OxO9755[0x22]]=element[OxO9755[0x32]] ; inp_VSpace[OxO9755[0x22]]=element[OxO9755[0x33]] ; inp_Border[OxO9755[0x22]]=element[OxO9755[0x34]] ; sel_Align[OxO9755[0x22]]=element[OxO9755[0x35]] ; AlternateText[OxO9755[0x22]]=element[OxO9755[0x36]] ;switch((element[OxO9755[0x27]]).toLowerCase()){case OxO9755[0x42]:case OxO9755[0x41]: row_img[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img3[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img4[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img5[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_chk[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ;break ;case OxO9755[0x40]: row_img[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img3[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img4[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img5[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_chk[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt1[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt3[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt4[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt5[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt6[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ;break ;case OxO9755[0x3f]:case OxO9755[0x3e]: row_img[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img3[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img4[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img5[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt1[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt6[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ;break ;case OxO9755[0x3d]:case OxO9755[0x3c]:case OxO9755[0x3b]: row_chk[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img3[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img4[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_img5[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt1[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt6[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ;break ;case OxO9755[0x3a]: row_chk[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt1[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt2[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ; row_txt6[OxO9755[0x38]][OxO9755[0x37]]=OxO9755[0x39] ;break ;;;;;;;;;;} ;}  ; function SyncTo(element){ element[OxO9755[0x24]]=inp_name[OxO9755[0x22]] ;if(element[OxO9755[0x23]]){ element[OxO9755[0x23]]=inp_name[OxO9755[0x22]] ;} else {if(element[OxO9755[0x24]]){ element.removeAttribute(OxO9755[0x24],0x0) ; element[OxO9755[0x23]]=inp_name[OxO9755[0x22]] ;} else { element[OxO9755[0x23]]=inp_name[OxO9755[0x22]] ;} ;} ; element[OxO9755[0x25]]=inp_id[OxO9755[0x22]] ; element[OxO9755[0x22]]=inp_value[OxO9755[0x22]] ; element[OxO9755[0x26]]=inp_src[OxO9755[0x22]] ; element[OxO9755[0x28]]=inp_checked[OxO9755[0x28]] ;if(element[OxO9755[0x26]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x26]) ;} ;if(element[OxO9755[0x22]]==OxO9755[0x2c]){ element.setAttribute(OxO9755[0x22],OxO9755[0x43]) ;} ; element[OxO9755[0x29]]=inp_Disabled[OxO9755[0x28]] ; element[OxO9755[0x2a]]=inp_Readonly[OxO9755[0x28]] ; element[OxO9755[0x2d]]=inp_access[OxO9755[0x22]] ; element[OxO9755[0x2b]]=inp_index[OxO9755[0x22]] ; element[OxO9755[0x2f]]=inp_MaxLength[OxO9755[0x22]] ; element[OxO9755[0x30]]=inp_width[OxO9755[0x22]] ; element[OxO9755[0x31]]=inp_height[OxO9755[0x22]] ; element[OxO9755[0x32]]=inp_HSpace[OxO9755[0x22]] ; element[OxO9755[0x33]]=inp_VSpace[OxO9755[0x22]] ; element[OxO9755[0x34]]=inp_Border[OxO9755[0x22]] ; element[OxO9755[0x35]]=sel_Align[OxO9755[0x22]] ; element[OxO9755[0x36]]=AlternateText[OxO9755[0x22]] ;try{ element[OxO9755[0x2e]]=inp_Size[OxO9755[0x22]] ;} catch(e){ element[OxO9755[0x2e]]=0x14 ;} ;if(element[OxO9755[0x2b]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x2b]) ;} ;if(element[OxO9755[0x2d]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x2d]) ;} ;if(element[OxO9755[0x2f]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x2f]) ;} ;if(element[OxO9755[0x2e]]==0x0){ element.removeAttribute(OxO9755[0x2e]) ;} ;if(element[OxO9755[0x30]]==0x0){ element.removeAttribute(OxO9755[0x30]) ;} ;if(element[OxO9755[0x31]]==0x0){ element.removeAttribute(OxO9755[0x31]) ;} ;if(element[OxO9755[0x33]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x33]) ;} ;if(element[OxO9755[0x32]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x32]) ;} ;if(element[OxO9755[0x25]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x25]) ;} ;if(element[OxO9755[0x23]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x23]) ;} ;if(element[OxO9755[0x36]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x36]) ;} ;if(element[OxO9755[0x35]]==OxO9755[0x2c]){ element.removeAttribute(OxO9755[0x35]) ;} ;switch((element[OxO9755[0x27]]).toLowerCase()){case OxO9755[0x42]:case OxO9755[0x41]:case OxO9755[0x40]:case OxO9755[0x3f]:case OxO9755[0x3e]:case OxO9755[0x3d]:case OxO9755[0x3c]:case OxO9755[0x3b]: element.removeAttribute(OxO9755[0x31]) ; element.removeAttribute(OxO9755[0x34]) ;break ;case OxO9755[0x3a]:break ;;;;;;;;;;} ;}  ; String[OxO9755[0x45]][OxO9755[0x44]]=function (){return this.replace(/(^\s*)|(\s*$)/g,OxO9755[0x2c]);}  ;


</script>
