<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<html>
	<head>
		<title>[[Hyperlink_Information]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel=stylesheet href='style.css' >
		<script src=dialog.js></script><script src=../_shared.js></script>
		<style>
		.btn {border: 1px solid buttonface;padding: 1px;cursor: default;width:14px;height: 12px;vertical-align: middle;}
		select,input,td {font-family: MS Sans Serif; font-size: 9pt; vertical-align: top; cursor: hand;}
		</style>
	</head>
	<body  style="margin:0px;border-width:0px;padding:4px;">
		<table border="0" cellspacing="2" cellpadding="5" width="100%" align="center">
			<tr>
				<td nowrap>
					<div>
					<fieldset>
						<table class="normal">
							<tr>
								<td style="width:60px">[[Url]]:</td>
								<td><input type="text" id="inp_src" style="width:200px"></td>
								<td><button id="btnbrowse">[[Browse]]</button></td>
							</tr>
							<tr>
								<td style="width:60px">[[Title]]:</td>
								<td colspan="2"><input type="text" id="inp_title" style="width:200px"></td>
							</tr>
							<tr>
								<td style="width:60px">[[Type]]:</td>
								<td colspan="2">
									<select id=sel_protocol onchange="sel_protocol_change()">
										<option value="http://">http://</option>
										<option value="https://">https://</option>
										<option value="ftp://">ftp://</option>
										<option value="news://">news://</option>
										<option value="mailto:">mailto:</option>
										<!-- last one : if move this to front , change the script too -->
										<option value="others">[[Other]]</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:60px">[[Target]]</td>
								<td colspan="2">
									<SELECT id="inp_target" NAME="inp_target">
										<OPTION value="">[[NotSet]]</OPTION>
										<OPTION value="_blank">[[Newwindow]]</OPTION>
										<OPTION value="_self">[[Samewindow]]</OPTION>
										<OPTION value="_top">[[Topmostwindow]]</OPTION>
										<OPTION value="_parent">[[Parentwindow]]</OPTION>
									</SELECT>
								</td>
							</tr>		
						</table>
					</fieldset>
					</div>
					<div style="margin-top:8px;width:60%; text-align:center">
						<input class="inputbuttoninsert" type="button" value="[[Insert]]" style="width:80px" onclick="insert_link()">&nbsp;&nbsp;
						<input class="inputbuttoncancel" type="button" value="[[Cancel]]" style="width:80px" onclick="top.returnValue=false;top.close()">
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
	
		<script language="JavaScript">
		
			var OxO64e4=["dialogArguments","","href","value","title","target","SelectFile.Aspx?settinghash=[[_setting_]]\x26type=gif,jpg,jpeg,png,bmp\x26file=","\x26[[DNN_Arg]]","[[SelectFileDialogOption]]","length","options","://",":","others","selectedIndex","returnValue"];var obj=top[OxO64e4[0x0]]; SyncToView() ; function SyncToView(){var src=obj[OxO64e4[0x2]].replace(/$\s*/,OxO64e4[0x1]); Update_sel_protocol(src) ; inp_src[OxO64e4[0x3]]=src ;if(obj[OxO64e4[0x4]]){ inp_title[OxO64e4[0x3]]=obj[OxO64e4[0x4]] ;} ;if(obj[OxO64e4[0x5]]){ inp_target[OxO64e4[0x3]]=obj[OxO64e4[0x5]] ;} ;}  ; function btnbrowse.onclick(){var Ox74=showModalDialog(OxO64e4[0x6]+escape(inp_src.value)+OxO64e4[0x7],null,OxO64e4[0x8]);if(Ox74){ inp_src[OxO64e4[0x3]]=Ox74 ;} ;}  ; function sel_protocol_change(){var src=inp_src[OxO64e4[0x3]].replace(/$\s*/,OxO64e4[0x1]);for(var i=0x0;i<sel_protocol[OxO64e4[0xa]][OxO64e4[0x9]];i++){var Ox5b=sel_protocol.options(i)[OxO64e4[0x3]];if(src.substr(0x0,Ox5b.length).toLowerCase()==Ox5b){ src=src.substr(Ox5b[OxO64e4[0x9]],src[OxO64e4[0x9]]-Ox5b.length) ;break ;} ;} ;var Ox674=src.indexOf(OxO64e4[0xb]);if(Ox674!=-0x1){ src=src.substr(Ox674+0x3,src[OxO64e4[0x9]]-0x3-Ox674) ;} ;var Ox674=src.indexOf(OxO64e4[0xc]);if(Ox674!=-0x1){ src=src.substr(Ox674+0x1,src[OxO64e4[0x9]]-0x1-Ox674) ;} ;var Ox675=sel_protocol[OxO64e4[0x3]];if(Ox675==OxO64e4[0xd]){ Ox675=OxO64e4[0x1] ;} ; inp_src[OxO64e4[0x3]]=Ox675+src ;}  ; function Update_sel_protocol(src){var Ox458=false;for(var i=0x0;i<sel_protocol[OxO64e4[0xa]][OxO64e4[0x9]];i++){var Ox5b=sel_protocol.options(i)[OxO64e4[0x3]];if(src.substr(0x0,Ox5b.length).toLowerCase()==Ox5b){if(sel_protocol[OxO64e4[0xe]]!=i){ sel_protocol[OxO64e4[0xe]]=i ;} ; Ox458=true ;break ;} ;} ;if(!Ox458){ sel_protocol[OxO64e4[0xe]]=sel_protocol[OxO64e4[0xa]][OxO64e4[0x9]]-0x1 ;} ;}  ; function insert_link(){var arr= new Array(); arr[0x0]=inp_src[OxO64e4[0x3]] ;if(inp_target[OxO64e4[0x3]]){ arr[0x1]=inp_target[OxO64e4[0x3]] ;} ;if(inp_title[OxO64e4[0x3]]){ arr[0x2]=inp_title[OxO64e4[0x3]] ;} ; top[OxO64e4[0xf]]=arr ; top.close() ;}  ;
		</script>
