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
		<tr>
			<td>[[CssClass]]:</td>
			<td colspan="3"><input type="text" id="inp_class" style="width:100px"></td>
		</tr>
		<tr id="row_txt1">
			<td>[[Size]]:</td>
			<td colspan="3"><input type="text" id="inp_Size" style="width:100px" onkeypress="return IsDigit(event);"></td>
		</tr>
		<tr id="row_txt2">
			<td>[[MaxLength]]:</td>
			<td colspan="3"><input type="text" id="inp_MaxLength" style="width:100px" maxlength="9" onkeypress="return IsDigit(event);"></td>
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
				<INPUT TYPE="text" SIZE="2" NAME="inp_Border" onkeypress="return IsDigit(event);" style="WIDTH : 80px" id="inp_Border">
			</td>
		</tr>
		<tr id="row_img3">
			<td>[[Width]]:</td>
			<td>
				<INPUT TYPE="text" onkeypress="return IsDigit(event);" style="width:80px"SIZE="2" id="inp_width">
			</td>
			<td>[[Height]]:</td>
			<td>
				<INPUT TYPE="text" onkeypress="return IsDigit(event);" style="width:80px" SIZE="2" id="inp_height">
			</td>									
		</tr>
		<tr id="row_img4">
			<td>[[Horizontal]]:</td>
			<td>
				<INPUT TYPE="text" onkeypress="return IsDigit(event);" style="width:80px" SIZE="2" id="inp_HSpace">
			</td>
			<td>[[Vertical]]:</td>
			<td>
				<INPUT TYPE="text" onkeypress="return IsDigit(event);" style="width:80px" SIZE="2" id="inp_VSpace">
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
				<input type="text" id="inp_index" size="5" value="" maxlength=5 onkeypress="return IsDigit(event);">&nbsp;		
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

<script src=Gecko_dialog.js></script><script src=../_shared.js></script>

<script>

var OxOb405=["inp_name","inp_id","inp_type","inp_checked","inp_value","inp_src","inp_Disabled","inp_Readonly","inp_index","inp_access","inp_Size","inp_MaxLength","row_chk","row_txt1","row_txt2","row_txt3","row_txt4","row_txt5","row_txt6","row_img","row_img2","row_img3","row_img4","row_img5","sel_Align","inp_Border","inp_width","inp_height","inp_HSpace","inp_VSpace","AlternateText","inp_class","name","value","id","src","type","checked","disabled","readOnly","tabIndex","","accessKey","size","maxLength","width","height","vspace","hspace","border","align","alt","display","style","none","image","button","reset","submit","checkbox","radio","hidden","password","text"," ","className","class"];var inp_name=document.getElementById(OxOb405[0x0]);var inp_id=document.getElementById(OxOb405[0x1]);var inp_type=document.getElementById(OxOb405[0x2]);var inp_checked=document.getElementById(OxOb405[0x3]);var inp_value=document.getElementById(OxOb405[0x4]);var inp_src=document.getElementById(OxOb405[0x5]);var inp_Disabled=document.getElementById(OxOb405[0x6]);var inp_Readonly=document.getElementById(OxOb405[0x7]);var inp_index=document.getElementById(OxOb405[0x8]);var inp_access=document.getElementById(OxOb405[0x9]);var inp_Size=document.getElementById(OxOb405[0xa]);var inp_MaxLength=document.getElementById(OxOb405[0xb]);var row_chk=document.getElementById(OxOb405[0xc]);var row_txt1=document.getElementById(OxOb405[0xd]);var row_txt2=document.getElementById(OxOb405[0xe]);var row_txt3=document.getElementById(OxOb405[0xf]);var row_txt4=document.getElementById(OxOb405[0x10]);var row_txt5=document.getElementById(OxOb405[0x11]);var row_txt6=document.getElementById(OxOb405[0x12]);var row_img=document.getElementById(OxOb405[0x13]);var row_img2=document.getElementById(OxOb405[0x14]);var row_img3=document.getElementById(OxOb405[0x15]);var row_img4=document.getElementById(OxOb405[0x16]);var row_img5=document.getElementById(OxOb405[0x17]);var sel_Align=document.getElementById(OxOb405[0x18]);var inp_Border=document.getElementById(OxOb405[0x19]);var inp_width=document.getElementById(OxOb405[0x1a]);var inp_height=document.getElementById(OxOb405[0x1b]);var inp_HSpace=document.getElementById(OxOb405[0x1c]);var inp_VSpace=document.getElementById(OxOb405[0x1d]);var AlternateText=document.getElementById(OxOb405[0x1e]);var inp_class=document.getElementById(OxOb405[0x1f]); function SyncToView(){if(element[OxOb405[0x20]]){ inp_name[OxOb405[0x21]]=element[OxOb405[0x20]] ;} ;if(element[OxOb405[0x22]]){ inp_id[OxOb405[0x21]]=element[OxOb405[0x22]] ;} ;if(element[OxOb405[0x21]]){ inp_value[OxOb405[0x21]]=(element[OxOb405[0x21]]).trim() ;} ;if(element[OxOb405[0x23]]){ inp_src[OxOb405[0x21]]=element[OxOb405[0x23]] ;} ;if(element[OxOb405[0x24]]){ inp_type[OxOb405[0x21]]=element[OxOb405[0x24]] ;} ;if(element[OxOb405[0x25]]){ inp_checked[OxOb405[0x25]]=element[OxOb405[0x25]] ;} ;if(element[OxOb405[0x26]]){ inp_Disabled[OxOb405[0x25]]=element[OxOb405[0x26]] ;} ;if(element[OxOb405[0x27]]){ inp_Readonly[OxOb405[0x25]]=element[OxOb405[0x27]] ;} ;if(element[OxOb405[0x28]]<=0x0){ inp_index[OxOb405[0x21]]=OxOb405[0x29] ;} else { inp_index[OxOb405[0x21]]=element[OxOb405[0x28]] ;} ;if(element[OxOb405[0x2a]]){ inp_access[OxOb405[0x21]]=element[OxOb405[0x2a]] ;} ;if(element[OxOb405[0x2b]]){if(element[OxOb405[0x2b]]==0x14){ inp_Size[OxOb405[0x21]]=OxOb405[0x29] ;} else { inp_Size[OxOb405[0x21]]=element[OxOb405[0x2b]] ;} ;} ;if(element[OxOb405[0x2c]]){if(element[OxOb405[0x2c]]<=0x0){ inp_MaxLength[OxOb405[0x21]]=OxOb405[0x29] ;} else { inp_MaxLength[OxOb405[0x21]]=element[OxOb405[0x2c]] ;} ;} ;if(element[OxOb405[0x2d]]){ inp_width[OxOb405[0x21]]=element[OxOb405[0x2d]] ;} ;if(element[OxOb405[0x2e]]){ inp_height[OxOb405[0x21]]=element[OxOb405[0x2e]] ;} ;if(element[OxOb405[0x2f]]){ inp_HSpace[OxOb405[0x21]]=element[OxOb405[0x2f]] ;} ;if(element[OxOb405[0x30]]){ inp_VSpace[OxOb405[0x21]]=element[OxOb405[0x30]] ;} ;if(element[OxOb405[0x31]]){ inp_Border[OxOb405[0x21]]=element[OxOb405[0x31]] ;} ;if(element[OxOb405[0x32]]){ sel_Align[OxOb405[0x21]]=element[OxOb405[0x32]] ;} ;if(element[OxOb405[0x32]]){ alt[OxOb405[0x21]]=element[OxOb405[0x33]] ;} ;switch((element[OxOb405[0x24]]).toLowerCase()){case OxOb405[0x3f]:case OxOb405[0x3e]: row_img[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img3[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img4[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img5[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_chk[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ;break ;case OxOb405[0x3d]: row_img[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img3[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img4[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img5[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_chk[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt1[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt3[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt4[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt5[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt6[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ;break ;case OxOb405[0x3c]:case OxOb405[0x3b]: row_img[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img3[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img4[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img5[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt1[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt6[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ;break ;case OxOb405[0x3a]:case OxOb405[0x39]:case OxOb405[0x38]: row_chk[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img3[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img4[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_img5[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt1[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt6[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ;break ;case OxOb405[0x37]: row_chk[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt1[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt2[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ; row_txt6[OxOb405[0x35]][OxOb405[0x34]]=OxOb405[0x36] ;break ;;;;;;;;;;} ;}  ; function SyncTo(){ element[OxOb405[0x20]]=inp_name[OxOb405[0x21]] ; element[OxOb405[0x22]]=inp_id[OxOb405[0x21]] ; element[OxOb405[0x21]]=inp_value[OxOb405[0x21]] ; element[OxOb405[0x23]]=inp_src[OxOb405[0x21]] ; element[OxOb405[0x25]]=inp_checked[OxOb405[0x25]] ;if(element[OxOb405[0x23]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x23]) ;} ;if(element[OxOb405[0x21]]==OxOb405[0x29]){ element.setAttribute(OxOb405[0x21],OxOb405[0x40]) ;} ; element[OxOb405[0x28]]=inp_index[OxOb405[0x21]] ; element[OxOb405[0x26]]=inp_Disabled[OxOb405[0x25]] ; element[OxOb405[0x27]]=inp_Readonly[OxOb405[0x25]] ; element[OxOb405[0x2a]]=inp_access[OxOb405[0x21]] ; element[OxOb405[0x28]]=inp_index[OxOb405[0x21]] ; element[OxOb405[0x2c]]=inp_MaxLength[OxOb405[0x21]] ; element[OxOb405[0x2d]]=inp_width[OxOb405[0x21]] ; element[OxOb405[0x2e]]=inp_height[OxOb405[0x21]] ; element[OxOb405[0x2f]]=inp_HSpace[OxOb405[0x21]] ; element[OxOb405[0x30]]=inp_VSpace[OxOb405[0x21]] ; element[OxOb405[0x31]]=inp_Border[OxOb405[0x21]] ; element[OxOb405[0x32]]=sel_Align[OxOb405[0x21]] ; element[OxOb405[0x33]]=AlternateText[OxOb405[0x21]] ; element[OxOb405[0x41]]=inp_class[OxOb405[0x21]] ;try{ element[OxOb405[0x2b]]=inp_Size[OxOb405[0x21]] ;} catch(e){ element[OxOb405[0x2b]]=0x14 ;} ;if(element[OxOb405[0x28]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x28]) ;} ;if(element[OxOb405[0x2a]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x2a]) ;} ;if(element[OxOb405[0x2c]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x2c]) ;} ;if(element[OxOb405[0x2b]]==0x0){ element.removeAttribute(OxOb405[0x2b]) ;} ;if(element[OxOb405[0x2d]]==0x0){ element.removeAttribute(OxOb405[0x2d]) ;} ;if(element[OxOb405[0x2e]]==0x0){ element.removeAttribute(OxOb405[0x2e]) ;} ;if(element[OxOb405[0x30]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x30]) ;} ;if(element[OxOb405[0x2f]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x2f]) ;} ;if(element[OxOb405[0x22]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x22]) ;} ;if(element[OxOb405[0x20]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x20]) ;} ;if(element[OxOb405[0x41]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x42]) ;} ;if(element[OxOb405[0x33]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x33]) ;} ;if(element[OxOb405[0x32]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x32]) ;} ;if(element[OxOb405[0x23]]==OxOb405[0x29]){ element.removeAttribute(OxOb405[0x23]) ;} ;}  ;

</script>
