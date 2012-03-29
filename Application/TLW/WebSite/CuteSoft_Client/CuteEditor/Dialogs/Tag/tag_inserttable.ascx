<%@ Control Inherits="CuteEditor.EditorUtilityCtrl" Language="c#" AutoEventWireup="false" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<table width=380 height="30" cellpadding="1" cellspacing="0" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" onclick="selectTemplates()" id="richDropDown" style="border:1px solid #ffffff;">
    <tr>
        <td bgcolor=white style="padding-left:20px;">
            <img src="../images/h-f-3Columns-Body.gif" alt="[[Table layout]]" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            [[Table layout]]
        </td>
        <td style='width:8px;padding:0px 1px 1px 1px;color:black;text-align:center;font-family:Webdings;font-size:8px;'>6</td>
    </tr>
</table>

<div align="center" id="list_Templates" style="display:none;">
	<div style="position:absolute; top:0; left:0; overflow:scroll; overflow-x:hidden;width:380; height:220; border-bottom:0px solid black;" >
        <DIV onmouseover="this.style.filter='progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#99ccff, EndColorStr=#FFFFFF)';" 
             onmouseout="this.style.filter='';" 
             STYLE="font:normal 11px Tahoma; height:25px; background:#ffffff; border:1px solid black; padding:3px; padding-left:20px;  cursor:hand; filter:;">
            <span onclick="parent.selectTemplate(1)"><img src="../images/One-Column-Table.gif" alt="One-Column Table" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            One-Column Table</span> 
        </DIV>
        <DIV onmouseover="this.style.filter='progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=yellowgreen, EndColorStr=#FFFFFF)';" 
             onmouseout="this.style.filter='';"  
             STYLE="font:normal 11px Tahoma; height:25px; background:#ffffff; border:1px solid black; padding:3px; padding-left:20px; cursor:hand; border-top:0px solid black">
              <span onclick="parent.selectTemplate(2)"><img src="../images/Two-Column-Table.gif" alt="Two-Column Table" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Two-Column Table </span>
        </DIV>
        <DIV onmouseover="this.style.filter='progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=gold, EndColorStr=#FFFFFF)';" 
             onmouseout="this.style.filter='';"  
             STYLE="font:normal 11px Tahoma; height:25px; background:#ffffff; border:1px solid black; padding:3px; padding-left:20px; cursor:hand; border-top:0px solid black">
             <span onclick="parent.selectTemplate(3)"><img src="../images/Three-Column-Table.gif" alt="Three-Column Table" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Three-Column Table</span>
        </DIV>
        <DIV onmouseover="this.style.filter='progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=violet, EndColorStr=#FFFFFF)';" 
             onmouseout="this.style.filter='';"  
             STYLE="font:normal 11px Tahoma; height:25px; background:#ffffff; border:1px solid black; padding:3px; padding-left:20px; cursor:hand; border-top:0px solid black">
              <span onclick="parent.selectTemplate(4)"><img src="../images/h-R-t-Body.gif" alt="Header, Right, Top Left, and Body" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           Header, Right, Top Left, and Body</span>
        </DIV>
        <DIV onmouseover="this.style.filter='progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#99ccff, EndColorStr=#FFFFFF)';" 
             onmouseout="this.style.filter='';"  
             STYLE="font:normal 11px Tahoma; height:25px; background:#ffffff; border:1px solid black; padding:3px; padding-left:20px; cursor:hand; border-top:0px solid black">
             <span onclick="parent.selectTemplate(5)"><img src="../images/h-l-tr-Body.gif" alt="Header, Left, Top Right, and Body" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           Header, Left, Top Right, and Body</span>
          </DIV>
         <DIV onmouseover="this.style.filter='progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#99ccff, EndColorStr=#FFFFFF)';" 
             onmouseout="this.style.filter='';" 
             STYLE="font:normal 11px Tahoma; height:25px; background:#ffffff; border:1px solid black; padding:3px; padding-left:20px;  cursor:hand; border-top:0px solid black;">
             <span onclick="parent.selectTemplate(6)"><img src="../images/h-f-3Columns-Body.gif" alt="Header, Footer, and 3 Columns" align="absmiddle"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             Header, Footer, and 3 Columns</span>
        </DIV>
	</div>
</div>

<style>
.addsub
{
	width:21px;
	font-family:fixedsys;
}
</style>
<div style="padding:8px 4px 4px 4px;">
	<table border="1" cellspacing="0" cellpadding="2" style="border-collapse:collapse" class="normal">
		<caption>[[Table Designer]]</caption>
		<tr>
			<td align="center">
				[[EditCell]]
			</td>
			<td align="center">
				Columns : <button id="subcolumns" class="addsub">-</button> <button id="addcolumns" class="addsub">
					+</button> ColSpan : <button id="subcolspan" class="addsub">-</button> <button id="addcolspan" class="addsub">
					+</button>
			</td>
			<td></td>
		</tr>
		<tr>
			<td valign="top">
				<table class="normal">
					<tr>
						<td colspan="2" align="center">
							<input type="button" id="btn_row_dialog" value="[[EditRow]]"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" id="btn_cell_dialog" value="[[EditCell]]"></td>
					</tr>
					<tr>
						<td>[[Width]]</td>
						<td><input type="text" id="inp_cell_width" style="width:60"></td>
					</tr>
					<tr>
						<td>[[Height]]:</td>
						<td><input type="text" id="inp_cell_height" style="width:60"></td>
					</tr>
					<!-- //TODO: add more cell useful properties here -->
					<tr>
						<td colspan="2" align="center">
							<input type="button" id="btn_cell_editcell" value="[[EditHtml]]"></td>
					</tr>
				</table>
				<br>
			</td>
			<td>
				<div style="border:1px solid gray;padding:1px;OVERFLOW: auto; HEIGHT: 215px; HEIGHT: 215px; ">
					<table id="tabledesign" border="1" bordercolor='orange' cellspacing="" style='background-color:white;width:210px;height:210px;border-collapse:collapse'
						class="normal" align="center">
					</table>
				</div>
			</td>
			<td align="center">
				R<br>
				o<br>
				w<br>
				s<br>
				<button id="subrows" class="addsub">-</button><br>
				<button id="addrows" class="addsub">+</button>
				<br>
				S<br>
				p<br>
				a<br>
				n<br>
				<button id="subrowspan" class="addsub">-</button><br>
				<button id="addrowspan" class="addsub">+</button>
			</td>
		</tr>
	</table>
</div>
<!-- #include file="../../_sharedie.htm" -->
<script>

	var OxO490a=["subcolumns","addcolumns","subcolspan","addcolspan","btn_row_dialog","btn_cell_dialog","inp_cell_width","inp_cell_height","btn_cell_editcell","tabledesign","subrowspan","addrowspan","display","style","none","disabled","width","value","height","[[ValidNumber]]","","\x3Ctable\x3E\x3Ctr\x3E\x3Ctd height=\x2224\x22\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E","\x3Ctable\x3E\x3Ctr\x3E\x3Ctd\x3E\x3C/td\x3E\x3Ctd\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E","\x3Ctable\x3E\x3Ctr\x3E\x3Ctd\x3E\x3C/td\x3E\x3Ctd\x3E\x3C/td\x3E\x3Ctd\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E","\x3Ctable border=\x220\x22 cellpadding=\x220\x22 cellspacing=\x220\x22\x3E\x3Ctr\x3E\x3Ctd valign=\x22top\x22 colspan=\x222\x22\x3E\x3C/td\x3E\x3C/tr\x3E","\x3Ctr\x3E\x3Ctd valign=\x22top\x22 rowspan=\x222\x22\x3E\x3C/td\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3C/tr\x3E","\x3Ctr\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E","\x3Ctr\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3Ctd valign=\x22top\x22 rowspan=\x222\x22\x3E\x3C/td\x3E\x3C/tr\x3E\x3Ctr\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E","\x3Ctable border=\x220\x22 cellpadding=\x220\x22 cellspacing=\x220\x22\x3E\x3Ctr\x3E\x3Ctd valign=\x22top\x22 colspan=\x223\x22\x3E\x3C/td\x3E\x3C/tr\x3E","\x3Ctr\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3Ctd valign=\x22top\x22\x3E\x3C/td\x3E\x3C/tr\x3E","\x3Ctr\x3E\x3Ctd valign=\x22top\x22 colspan=\x223\x22\x3E\x3C/td\x3E\x3C/tr\x3E\x3C/table\x3E","DIV","innerHTML","length","rows","cells","backgroundColor","currentStyle","body","bgColor","onmouseover","onmouseout","onclick","ondblclick","highlight","parentNode","cssText","runtimeStyle","background-color:gray","rowSpan","colSpan","richDropDown","list_Templates","document","csstext","font:normal 11px Tahoma;background-color:windowtext;","isOpen"];var subcolumns=document.getElementById(OxO490a[0x0]);var addcolumns=document.getElementById(OxO490a[0x1]);var subcolspan=document.getElementById(OxO490a[0x2]);var addcolspan=document.getElementById(OxO490a[0x3]);var btn_row_dialog=document.getElementById(OxO490a[0x4]);var btn_cell_dialog=document.getElementById(OxO490a[0x5]);var inp_cell_width=document.getElementById(OxO490a[0x6]);var inp_cell_height=document.getElementById(OxO490a[0x7]);var btn_cell_editcell=document.getElementById(OxO490a[0x8]);var tabledesign=document.getElementById(OxO490a[0x9]);var subrowspan=document.getElementById(OxO490a[0xa]);var addrowspan=document.getElementById(OxO490a[0xb]); btn_cell_editcell[OxO490a[0xd]][OxO490a[0xc]]=OxO490a[0xe] ; function UpdateState(){ btn_cell_editcell[OxO490a[0xf]]=btn_row_dialog[OxO490a[0xf]]=btn_cell_dialog[OxO490a[0xf]]=GetElementCell()==null ;}  ; function SyncToView(){var Ox77c=GetElementCell();if(Ox77c){ inp_cell_width[OxO490a[0x11]]=Ox77c[OxO490a[0x10]] ; inp_cell_height[OxO490a[0x11]]=Ox77c[OxO490a[0x12]] ;} ;}  ; function SyncTo(element){var Ox77c=GetElementCell();if(Ox77c){try{ Ox77c[OxO490a[0x10]]=inp_cell_width[OxO490a[0x11]] ; Ox77c[OxO490a[0x12]]=inp_cell_height[OxO490a[0x11]] ;} catch(er){ alert(OxO490a[0x13]) ;} ;} ;}  ; function selectTemplate(Ox19a){var Ox1f0=OxO490a[0x14];switch(Ox19a){case 0x1: Ox1f0=OxO490a[0x15] ;break ;case 0x2: Ox1f0=OxO490a[0x16] ;break ;case 0x3: Ox1f0=OxO490a[0x17] ;break ;case 0x4: Ox1f0=OxO490a[0x18] ; Ox1f0=Ox1f0+OxO490a[0x19] ; Ox1f0=Ox1f0+OxO490a[0x1a] ;break ;case 0x5: Ox1f0=OxO490a[0x18] ; Ox1f0=Ox1f0+OxO490a[0x1b] ;break ;case 0x6: Ox1f0=OxO490a[0x1c] ; Ox1f0=Ox1f0+OxO490a[0x1d] ; Ox1f0=Ox1f0+OxO490a[0x1e] ;break ;default:break ;;;;;;;;} ;var div=document.createElement(OxO490a[0x1f]); div[OxO490a[0x20]]=Ox1f0 ;var table=div.children(0x0); ApplyTable(table,element) ; ApplyTable(table,tabledesign) ; HandleTableChanged() ; hidePopup() ;}  ; function subcolumns.onclick(){ Table_SubCol(GetElementCell()) ; Table_SubCol(currentcell) ; HandleTableChanged() ;}  ; function addcolumns.onclick(){ Table_AddCol(GetElementCell()) ; Table_AddCol(currentcell) ; HandleTableChanged() ;}  ; function subrows.onclick(){ Table_SubRow(GetElementCell()) ; Table_SubRow(currentcell) ; HandleTableChanged() ;}  ; function addrows.onclick(){ Table_AddRow(currentcell) ; Table_AddRow(GetElementCell()) ; HandleTableChanged() ;}  ; function subcolspan.onclick(){ Table_SubColSpan(GetElementCell()) ; Table_SubColSpan(currentcell) ; HandleTableChanged() ;}  ; function addcolspan.onclick(){ Table_AddColSpan(GetElementCell()) ; Table_AddColSpan(currentcell) ; HandleTableChanged() ;}  ; function subrowspan.onclick(){ Table_SubRowSpan(GetElementCell()) ; Table_SubRowSpan(currentcell) ; HandleTableChanged() ;}  ; function addrowspan.onclick(){ Table_AddRowSpan(GetElementCell()) ; Table_AddRowSpan(currentcell) ; HandleTableChanged() ;}  ; function InitDesignTableCells(){for(var r=0x0;r<tabledesign[OxO490a[0x22]][OxO490a[0x21]];r++){var Oxc3=tabledesign.rows(r);for(var Oxc4=0x0;Oxc4<Oxc3[OxO490a[0x23]][OxO490a[0x21]];Oxc4++){var Oxc5=Oxc3.cells(Oxc4); Oxc5.removeAttribute(OxO490a[0x10]) ; Oxc5.removeAttribute(OxO490a[0x12]) ; Oxc5[OxO490a[0x10]]=OxO490a[0x14] ; Oxc5[OxO490a[0x12]]=OxO490a[0x14] ; Oxc5[OxO490a[0x27]]=document[OxO490a[0x26]][OxO490a[0x25]][OxO490a[0x24]] ; Oxc5[OxO490a[0x28]]=cell_mouseover ; Oxc5[OxO490a[0x29]]=cell_mouseout ; Oxc5[OxO490a[0x2a]]=cell_click ; Oxc5[OxO490a[0x2b]]=cell_dblclick ;} ;} ;}  ; function HandleTableChanged(){if(!tabledesign.contains(currentcell)){ SetCurrentCell(tabledesign.rows(0x0).cells(0x0)) ;} ; InitDesignTableCells() ; UpdateButtonStates() ;}  ; function cell_mouseover(){var Oxc5=this; Oxc5[OxO490a[0xd]][OxO490a[0x24]]=OxO490a[0x2c] ;}  ; function cell_mouseout(){var Oxc5=this; Oxc5[OxO490a[0xd]][OxO490a[0x24]]=document[OxO490a[0x26]][OxO490a[0x25]][OxO490a[0x24]] ;}  ; function cell_click(){var Oxc5=this; SetCurrentCell(Oxc5) ;}  ; function cell_dblclick(){var Oxc5=this; SetCurrentCell(Oxc5) ;}  ; function btn_cell_editcell.onclick(){var Oxc5=GetElementCell();var Oxaf=editor.EditInWindow(Oxc5.innerHTML,window);if(Oxaf!=null&&Oxaf!=false){ Oxc5[OxO490a[0x20]]=Oxaf ;} ;}  ; function btn_cell_dialog.onclick(){ editor.ShowTagDialogWithNoCancellable(GetElementCell()) ;}  ; function btn_row_dialog.onclick(){ editor.ShowTagDialogWithNoCancellable(GetElementCell().parentNode) ;}  ;var currentcell=null; function GetElementCell(){if(currentcell==null){return null;} ;return element.rows(currentcell[OxO490a[0x2d]].rowIndex).cells(currentcell.cellIndex);}  ; function SetCurrentCell(Oxc5){if(currentcell!=null){ currentcell[OxO490a[0x2f]][OxO490a[0x2e]]=OxO490a[0x14] ;} ; currentcell=Oxc5 ; currentcell[OxO490a[0x2f]][OxO490a[0x2e]]=OxO490a[0x30] ; UpdateButtonStates() ; SyncToViewInternal() ;}  ; function UpdateButtonStates(){ subcolspan[OxO490a[0xf]]=!Table_CanSubColSpan(currentcell) ; addcolspan[OxO490a[0xf]]=!Table_CanAddColSpan(currentcell) ; subrowspan[OxO490a[0xf]]=!Table_CanSubRowSpan(currentcell) ; addrowspan[OxO490a[0xf]]=!Table_CanAddRowSpan(currentcell) ; subrows[OxO490a[0xf]]=Table_GetRowCount(currentcell)<0x2 ; subcolumns[OxO490a[0xf]]=Table_GetColCount(currentcell)<0x2 ;}  ; function ApplyTable(src,Ox789){for(var r=Ox789[OxO490a[0x22]][OxO490a[0x21]]-0x1;r>=0x0;r--){ Ox789.rows(r).removeNode(true) ;} ;for(var r=0x0;r<src[OxO490a[0x22]][OxO490a[0x21]];r++){var Ox78a=src.rows(r);var Oxd4=Ox789.insertRow(); Oxd4[OxO490a[0xd]][OxO490a[0x2e]]=Ox78a[OxO490a[0xd]][OxO490a[0x2e]] ;for(var Oxc4=0x0;Oxc4<Ox78a[OxO490a[0x23]][OxO490a[0x21]];Oxc4++){var Ox78b=Ox78a.cells(Oxc4);var Ox78c=Oxd4.insertCell(); Ox78c[OxO490a[0x31]]=Ox78b[OxO490a[0x31]] ; Ox78c[OxO490a[0x32]]=Ox78b[OxO490a[0x32]] ; Ox78c[OxO490a[0xd]][OxO490a[0x2e]]=Ox78b[OxO490a[0xd]][OxO490a[0x2e]] ;} ;} ;}  ; function window.onload(){ ApplyTable(element,tabledesign) ; InitDesignTableCells() ; SetCurrentCell(tabledesign.rows(0x0).cells(0x0)) ;}  ; function updateList(){}  ;var oPopup=window.createPopup(); function selectTemplates(){var Ox78f=document.getElementById(OxO490a[0x33]);var Ox790=document.getElementById(OxO490a[0x34]); oPopup[OxO490a[0x35]][OxO490a[0x26]][OxO490a[0x20]]=Ox790[OxO490a[0x20]] ; oPopup[OxO490a[0x35]][OxO490a[0x26]][OxO490a[0xd]][OxO490a[0x36]]=OxO490a[0x37] ; oPopup.show(0x0,0x20,0x17c,0xdc,Ox78f) ;}  ; function hidePopup(){if(oPopup){if(oPopup[OxO490a[0x38]]){ oPopup.hide() ;} ;} ;}  ;
</script>