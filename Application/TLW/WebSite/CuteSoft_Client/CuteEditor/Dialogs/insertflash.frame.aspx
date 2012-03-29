<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<HTML>
	<HEAD>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<META Http-Equiv="Cache-Control" Content="no-cache">
		<META Http-Equiv="Pragma" Content="no-cache">
		<META HTTP-EQUIV="EXPIRES" CONTENT="0">
		<link rel="stylesheet" href='style.css'>
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script src="filebrowserpage.js"></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxO563f=["disabled","srcElement","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxO563f[0x1]][OxO563f[0x0]]){ alert(OxO563f[0x2]) ;return false;} ;var Ox2fb=prompt(OxO563f[0x3],OxO563f[0x4]);if(Ox2fb){ document.getElementById(OxO563f[0x6])[OxO563f[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxO563f[0x1]][OxO563f[0x0]]){ alert(OxO563f[0x2]) ;return false;} ;var Ox2fb=prompt(OxO563f[0x7],OxO563f[0x8]);if(Ox2fb){ document.getElementById(OxO563f[0x6])[OxO563f[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxO563f[0x1]][OxO563f[0x0]]){ alert(OxO563f[0x2]) ;return false;} ;var Ox2fb=prompt(OxO563f[0x7],OxO563f[0x8]);if(Ox2fb){ document.getElementById(OxO563f[0x6])[OxO563f[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxO563f[0x1]][OxO563f[0x0]]){ alert(OxO563f[0x2]) ;return false;} ;return confirm(OxO563f[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxO563f[0x0]]){ alert(OxO563f[0x2]) ;return false;} ; row=Oxb9[OxO563f[0xa]][OxO563f[0xa]] ;var Ox550=row[OxO563f[0xb]];var name;if(row[OxO563f[0xc]]){ name=prompt(OxO563f[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxO563f[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxO563f[0xd])); name=prompt(OxO563f[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxO563f[0xb]]){ document.getElementById(OxO563f[0xf])[OxO563f[0x5]]=OxO563f[0x10] ; document.getElementById(OxO563f[0x6])[OxO563f[0x5]]=(row[OxO563f[0xc]]?OxO563f[0x12]:OxO563f[0x13])+OxO563f[0x14]+row[OxO563f[0x11]]+OxO563f[0x14]+name ; postback() ;} ; event[OxO563f[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxO563f[0x17]][OxO563f[0x16]]=OxO563f[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxO563f[0x17]][OxO563f[0x16]]=OxO563f[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxO563f[0xc]]){if(event[OxO563f[0x1]][OxO563f[0x19]]==OxO563f[0x1a]){return ;} ; document.getElementById(OxO563f[0xf])[OxO563f[0x5]]=OxO563f[0x1b] ; document.getElementById(OxO563f[0x6])[OxO563f[0x5]]=Oxc3.getAttribute(OxO563f[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxO563f[0x11]); document.getElementById(OxO563f[0x1c])[OxO563f[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxO563f[0x1d]); document.getElementById(OxO563f[0x1e])[OxO563f[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
		</script>
		<style>
		.row { HEIGHT: 22px }
		.cb { VERTICAL-ALIGN: middle }
		.itemimg { VERTICAL-ALIGN: middle }
		.editimg { VERTICAL-ALIGN: middle }
		.cell1 { VERTICAL-ALIGN: middle }
		.cell2 { VERTICAL-ALIGN: middle }
		.cell3 { PADDING-RIGHT: 4px; VERTICAL-ALIGN: middle; TEXT-ALIGN: right }
		.cb { }
		</style>
	</HEAD>
	<body bottomMargin="0" topMargin="10" leftmargin="3" marginwidth="0" marginheight="0">
		<form runat="server" enctype="multipart/form-data" id="Form1">
			<!-- start hidden -->
			<script>
        var OxOdb9f=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxOdb9f[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxOdb9f[0x2])[OxOdb9f[0x1]]){ alert(document.getElementById(OxOdb9f[0x2]).value) ;} ; document.getElementById(OxOdb9f[0x2])[OxOdb9f[0x1]]=OxOdb9f[0x3] ; document.getElementById(OxOdb9f[0x4])[OxOdb9f[0x1]]=OxOdb9f[0x3] ; document.getElementById(OxOdb9f[0x5])[OxOdb9f[0x1]]=OxOdb9f[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory"> <input type="hidden" runat="server" id="hiddenFile">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert"> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData">
			<!-- end hidden -->
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td width="20">
						<asp:Image ID="Image1" Runat="server" ImageUrl="../images/openfolder.gif"></asp:Image>
					</td>
					<td width="240" class="normal">
						<asp:Label Runat="server" ID="FolderDescription"></asp:Label>
					</td>
					<td>
						<asp:ImageButton ID="CreateDir" Runat="server" AlternateText="[[Createdirectory]]" ImageUrl="../images/newfolder.gif"
							onMouseOver="CuteEditor_ColorPicker_ButtonOver(this);" Visible="true"
							OnClick="CreateDir_Click" />
						<asp:ImageButton ID="Copy" Runat="server" AlternateText="[[Copyfiles]]" ImageUrl="../images/Copy.gif"
							onMouseOver="CuteEditor_ColorPicker_ButtonOver(this);" Visible="true"
							OnClick="Copy_Click" />
						<asp:ImageButton ID="Move" Runat="server" AlternateText="[[Movefiles]]" ImageUrl="../images/move.gif"
							onMouseOver="CuteEditor_ColorPicker_ButtonOver(this);" Visible="true"
							OnClick="Move_Click" />
						<IMG src="../images/zoom_in.gif" onclick="Zoom_In();" Alt="[[ZoomIn]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> <IMG src="../images/zoom_out.gif" onclick="Zoom_Out();" Alt="[[ZoomOut]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"><IMG src="../images/Actualsize.gif" onclick="Actualsize();" Alt="[[ActualSize]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> 
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="2" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="250">
						<div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 250; HEIGHT: 240px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
							<asp:Table ID="FoldersAndFiles" Runat="server" CellSpacing="1" CellPadding="1" Width="100%" CssClass="sortable">
								<asp:TableRow BackColor="#f0f0f0">
									<asp:TableHeaderCell Width="16px" >
						<asp:ImageButton ID="Delete" Runat="server" AlternateText="[[Deletefiles]]"
							onMouseOver="CuteEditor_ColorPicker_ButtonOver(this);" ImageUrl="../images/s_cut.gif"
							Visible="true" OnClick="Delete_Click" />
									</asp:TableHeaderCell>
									<asp:TableHeaderCell Width="16px" >
						<asp:ImageButton ID="DoRefresh" Runat="server" AlternateText="[[Refresh]]" ImageUrl="../images/s_refresh.gif"
							onMouseOver="CuteEditor_ColorPicker_ButtonOver(this);" Visible="true"
							OnClick="DoRefresh_Click" />
									</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="name_Cell" Width="136px" CssClass="filelistHeadCol" Font-Bold="False">[[Name]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="size_Cell" Width="72px" CssClass="filelistHeadCol" Font-Bold="False">[[Count]]/[[Size]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell"  Width="16px">&nbsp;</asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td valign="top">
						<div style="BORDER: 1.5pt inset; VERTICAL-ALIGN: top; OVERFLOW: auto; WIDTH: 315px; HEIGHT: 240px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
							<div id="divpreview" style="BACKGROUND-COLOR: white" height="100%" width="100%">
								&nbsp;</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" height=2>
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td valign="top">
						<fieldset>
							<legend>
								[[Properties]]</legend>
							<table border="0" cellpadding="4" cellspacing="0" ID="Table3">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal">
											<tr>
												<td width="110">[[Width]]:</td>
												<td width="120"><input type="text" name="Width" id="Width" style="WIDTH : 80px" onchange="do_preview()"
														onpropertychange="do_preview()" ONKEYPRESS="event.returnValue=IsDigit();" value="200"></td>
											</tr>
											<tr>
												<td>[[Height]]:</td>
												<td><input type="text" name="Height" id="Height" style="WIDTH : 80px" onchange="do_preview()"
														onpropertychange="do_preview()" ONKEYPRESS="event.returnValue=IsDigit();" value="200"></td>
											</tr>
											<tr>
												<td>[[Backgroundcolor]]:</td>
												<td><input type="text" id="bgColortext" name="bgColortext" size="7" style="WIDTH:57px">
													<img src="../images/colorpicker.gif" align="absMiddle" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
														oncolorchange="bgColortext.value=this.selectedColor; bgColortext.style.backgroundColor=this.selectedColor">
												</td>
											</tr>
											<tr>
												<td>[[Quality]]:
												</td>
												<td><select name="Quality" id="Quality" style="WIDTH : 80px" onchange="do_preview()" onpropertychange="do_preview()"
														runat="server">
														<option selected value="high">High</option>
														<option value="medium">Medium</option>
														<option value="low">Low</option>
													</select>
												</td>
											</tr>
											<tr>
												<td width="100">[[Scale]]:</td>
												<td>
													<select NAME="Scale" style="WIDTH : 80px" ID="Scale" onchange="do_preview()" onpropertychange="do_preview()">
														<OPTION selected value="">[[Default]]</OPTION>
														<OPTION value="Noborder">[[Noborder]]</OPTION>
														<OPTION value="Exactfit">[[Exactfit]]</OPTION>
													</select>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset>
						<legend>[[Layout]]</legend>
							<table border="0" cellpadding="4" cellspacing="0" width="100%">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal" width="100%">
											<tr>
												<td width="100">[[Alignment]]:</td>
												<td>
													<select NAME="Align" style="WIDTH : 80px" ID="Align" onchange="do_preview()" onpropertychange="do_preview()">
														<OPTION id="optNotSet" selected value="">[[Notset]]</OPTION>
														<OPTION id="optLeft" value="left">[[Left]]</OPTION>
														<OPTION id="optRight" value="right">[[Right]]</OPTION>
														<OPTION id="optTexttop" value="textTop">[[Texttop]]</OPTION>
														<OPTION id="optAbsMiddle" value="absMiddle">[[Absmiddle]]</OPTION>
														<OPTION id="optBaseline" value="baseline">[[Baseline]]</OPTION>
														<OPTION id="optAbsBottom" value="absBottom">[[Absbottom]]</OPTION>
														<OPTION id="optBottom" value="bottom">[[Bottom]]</OPTION>
														<OPTION id="optMiddle" value="middle">[[Middle]]</OPTION>
														<OPTION id="optTop" value="top">[[Top]]</OPTION>
													</select>
												</td>
											</tr>
											<tr>
												<td valign="middle" width="110">[[Horizontal]]:</td>
												<td><INPUT TYPE="text" SIZE="2" NAME="HSpace" onchange="do_preview()" onpropertychange="do_preview()"
														ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH:80px" ID="HSpace">
												</td>
											</tr>
											<tr>
												<td valign="middle">[[Vertical]]:</td>
												<td><INPUT TYPE="text" SIZE="2" NAME="VSpace" onchange="do_preview()" onpropertychange="do_preview()"
														ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH:80px" ID="VSpace"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<fieldset style="margin-bottom:5px">
							<legend>
								[[Insert]]</legend>
							<table border="0" cellpadding="4" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal">
											<tr>
												<td valign="middle" width="100">
													URL:</td>
												<td>
													<input type="text" id="TargetUrl" size="43" name="TargetUrl" runat="server"></td>
											</tr>
											<tr>
												<td colspan=2>
													<input type="checkbox" checked id="chk_Loop" onchange="do_preview()" onpropertychange="do_preview()">&nbsp;[[Loop]]&nbsp;&nbsp;
													<input type="checkbox" checked id="chk_Autoplay" onchange="do_preview()" onpropertychange="do_preview()">&nbsp;[[Autoplay]]&nbsp;&nbsp;
													<input type="checkbox" checked id="chk_Transparency" onchange="do_preview()" onpropertychange="do_preview()">&nbsp;[[Transparency]]&nbsp;
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset id="fieldsetUpload">
							<legend>
								[[Upload]] (Max file size allowed
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashSize * 1024)%>
								)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center" class="normal">
								<tr>
									<td valign="top" width="54%" style="FONT-SIZE: 8pt; VERTICAL-ALIGN: middle;">
										<asp:Label ID="Label_PictureUpload" Runat="server">&nbsp;</asp:Label>
										<input id="InputFile" size="40" type="file" runat="server" style="HEIGHT:20px">&nbsp;
									</td>
								</tr>
								<tr>
									<td height="8">
									</td>
								</tr>
								<tr>
									<td>
										<asp:Button ID="uploadButton" Text="[[Upload]]" Runat="server" OnClick="uploadButton_Click" />&nbsp;
										<asp:Label ID="uploadResult" Runat="server"></asp:Label>
									</td>
								</tr>
								<tr>
									<td height="5">
									</td>
								</tr>
								<tr>
									<td>
											<nobr>
											Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashFolderSize * 1024)%>.
											Used: <%= CuteEditor.Impl.FileStorage.FormatSize(fs.GetDirectorySize(fs.VirtualRoot)) %>
											<span style="background-color:green;height:3px;width:40px;font-size:3px">
												<span style="background-color:red;height:3px;width:<%= GetUsedSpaceBarWidth() %>px;font-size:3px"></span>
											</span>
											</nobr>
									</td>
								</tr>
							</table>
						</fieldset>
						<div align="center" style="padding-top:4px;">
							<input class="inputbuttoninsert" type="button" value="[[Insert]]" onclick="do_insert()">&nbsp;&nbsp;&nbsp;
							<input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<script runat="server">
	protected override void InitOfType()
	{
		fs.VirtualRoot=CuteEditor.EditorUtility.ProcessWebPath(Context,null,secset.FlashGalleryPath).TrimEnd('/')+"/";
	}
    protected override void GetFiles(ArrayList files)
    {
        files.AddRange(fs.GetFileItems(CurrentDirectory, secset.FileNamePrefix + "*.swf"));
    }
    protected override bool AllowFileName(string filename)
    {
        filename = filename.ToLower();
        return filename.EndsWith(".swf");
    }
    protected override string CheckUploadData(ref byte[] data)
    {
		if (fs.GetDirectorySize(fs.VirtualRoot) >= secset.MaxFlashFolderSize * 1024)
           return "Flash folder size exceeds the limit: "+ CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashFolderSize * 1024);

		if (data.Length >= secset.MaxFlashSize * 1024)
            return "Flash size exceeds "+CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashSize * 1024)+" limit: "+ CuteEditor.Impl.FileStorage.FormatSize(data.Length);
        return null;
    }
    
    protected int GetUsedSpaceBarWidth()
    {
      int w = Convert.ToInt32(40*fs.GetDirectorySize(fs.VirtualRoot)/(secset.MaxFlashFolderSize * 1024));
      if(w<1)
		w=1;
		
	  if(w>40)
		w=40;
		
      return w;      
    }
		</script>
		<script src="addvars.js"></script>
		<script>
			var OxO153c=["dialogArguments","TargetUrl","bgColortext","Width","Height","Quality","chk_Transparency","chk_Loop","chk_Autoplay","VSpace","HSpace","Align","Scale","divpreview","value","","scale=\x27noborder\x27","scale=\x27exactfit\x27","Exactfit","Noborder","hspace=\x22","\x22 ","vspace=\x22","align=\x22","checked","wmode=\x22transparent\x22","loop=\x22false\x22","play=\x22false\x22","bgcolor=\x22","\x22","\x3Cembed src=\x22","\x22 width=\x22"," "," height=\x22","\x22 quality=\x22","\x22 type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","innerHTML","Please choose a Flash movie to insert","\x22 height=\x22"," quality=\x22"," type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","\x3Cobject xcodebase=","\x22http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab\x22"," classid=","\x22clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\x22\x3E"," \x3CPARAM name=\x22Movie\x22 value=\x22","\x22 /\x3E"," \x3CPARAM name=\x22Quality\x22 value=\x22","\x22/\x3E","\x3Cparam name=\x22wmode\x22 value=\x22transparent\x22/\x3E","\x3Cparam name=\x22loop\x22 value=\x22false\x22/\x3E","\x3Cparam name=\x22play\x22 value=\x22false\x22/\x3E","\x3Cparam name=\x22scale\x22 value=\x22","\x3Cparam name=\x22bgcolor\x22 value=\x22","\x3C/object\x3E","zoom","style","keyCode","[[ValidNumber]]"];var editor=top[OxO153c[0x0]];var flashname=document.getElementById(OxO153c[0x1]);var bgColortext=document.getElementById(OxO153c[0x2]);var Width=document.getElementById(OxO153c[0x3]);var Height=document.getElementById(OxO153c[0x4]);var Quality=document.getElementById(OxO153c[0x5]);var chk_Transparency=document.getElementById(OxO153c[0x6]);var chk_Loop=document.getElementById(OxO153c[0x7]);var chk_Autoplay=document.getElementById(OxO153c[0x8]);var VSpace=document.getElementById(OxO153c[0x9]);var HSpace=document.getElementById(OxO153c[0xa]);var Align=document.getElementById(OxO153c[0xb]);var Scale=document.getElementById(OxO153c[0xc]);var divpreview=document.getElementById(OxO153c[0xd]);var bgColortext=document.getElementById(OxO153c[0x2]); do_preview() ; function do_preview(){var Oxba;var Ox57b;var Ox563;var Ox81;var Ox2e2;var Ox57c; Oxba=flashname[OxO153c[0xe]] ; Ox81=Width[OxO153c[0xe]] ; Ox2e2=Height[OxO153c[0xe]] ; Ox57c=Quality[OxO153c[0xe]] ; preview_width=0xf0 ; preview_height=0xc8 ; w=parseInt(Ox81) ; h=parseInt(Ox2e2) ;if(w>h){ Ox81=preview_width ; Ox2e2=preview_height*h/w ;} else { Ox81=preview_width*w/h ; Ox2e2=preview_height ;} ; Ox81=parseInt(Ox81) ; Ox2e2=parseInt(Ox2e2) ;if(Oxba==OxO153c[0xf]){return ;} ;var Ox57dOx57eOx57fOx580Ox581Ox582;switch(Scale[OxO153c[0xe]]){case OxO153c[0x13]: Ox581=OxO153c[0x10] ;break ;case OxO153c[0x12]: Ox581=OxO153c[0x11] ;break ;case OxO153c[0xf]: Ox581=OxO153c[0xf] ;break ;;;;} ; Ox582=OxO153c[0xf] ;if(HSpace[OxO153c[0xe]]){ Ox582=Ox582+OxO153c[0x14]+HSpace[OxO153c[0xe]]+OxO153c[0x15] ;} ;if(VSpace[OxO153c[0xe]]){ Ox582=Ox582+OxO153c[0x16]+VSpace[OxO153c[0xe]]+OxO153c[0x15] ;} ;if(Align[OxO153c[0xe]]){ Ox582=Ox582+OxO153c[0x17]+Align[OxO153c[0xe]]+OxO153c[0x15] ;} ; Ox57d=chk_Transparency[OxO153c[0x18]]?OxO153c[0x19]:OxO153c[0xf] ; Ox57e=chk_Loop[OxO153c[0x18]]?OxO153c[0xf]:OxO153c[0x1a] ; Ox57f=chk_Autoplay[OxO153c[0x18]]?OxO153c[0xf]:OxO153c[0x1b] ; Ox580=bgColortext[OxO153c[0xe]]==OxO153c[0xf]?OxO153c[0xf]:OxO153c[0x1c]+bgColortext[OxO153c[0xe]]+OxO153c[0x1d] ;var Ox563=OxO153c[0x1e]+Oxba+OxO153c[0x1f]+Ox81+OxO153c[0x15]+Ox582+OxO153c[0x20]+Ox57d+OxO153c[0x20]+Ox57e+OxO153c[0x20]+Ox57f+OxO153c[0x20]+Ox580+OxO153c[0x20]+Ox581+OxO153c[0x21]+Ox2e2+OxO153c[0x22]+Ox57c+OxO153c[0x23]; divpreview[OxO153c[0x24]]=Ox563 ;}  ;var parameters= new Array(); function do_insert(){if(flashname[OxO153c[0xe]]==OxO153c[0xf]){ alert(OxO153c[0x25]) ;return false;} ;var Ox2ehOx583Ox584Ox57cOxba; Ox2e=Width[OxO153c[0xe]]+OxO153c[0xf] ; h=Height[OxO153c[0xe]]+OxO153c[0xf] ; Ox583=chk_Transparency[OxO153c[0xe]] ; Ox57c=Quality[OxO153c[0xe]] ; Oxba=flashname[OxO153c[0xe]] ;var Ox57dOx57eOx57fOx580Ox581Ox582;switch(Scale[OxO153c[0xe]]){case OxO153c[0x13]: Ox581=OxO153c[0x10] ;break ;case OxO153c[0x12]: Ox581=OxO153c[0x11] ;break ;case OxO153c[0xf]: Ox581=OxO153c[0xf] ;break ;;;;} ; Ox582=OxO153c[0xf] ;if(HSpace[OxO153c[0xe]]){ Ox582=Ox582+OxO153c[0x14]+HSpace[OxO153c[0xe]]+OxO153c[0x15] ;} ;if(VSpace[OxO153c[0xe]]){ Ox582=Ox582+OxO153c[0x16]+VSpace[OxO153c[0xe]]+OxO153c[0x15] ;} ;if(Align[OxO153c[0xe]]){ Ox582=Ox582+OxO153c[0x17]+Align[OxO153c[0xe]]+OxO153c[0x15] ;} ; Ox57d=chk_Transparency[OxO153c[0x18]]?OxO153c[0x19]:OxO153c[0xf] ; Ox57e=chk_Loop[OxO153c[0x18]]?OxO153c[0xf]:OxO153c[0x1a] ; Ox57f=chk_Autoplay[OxO153c[0x18]]?OxO153c[0xf]:OxO153c[0x1b] ; Ox580=bgColortext[OxO153c[0xe]]==OxO153c[0xf]?OxO153c[0xf]:OxO153c[0x1c]+bgColortext[OxO153c[0xe]]+OxO153c[0x1d] ;var Ox585=OxO153c[0x1e]+Oxba+OxO153c[0x1f]+Ox2e+OxO153c[0x26]+h+OxO153c[0x15]+Ox582+OxO153c[0x27]+Ox57c+OxO153c[0x15]+Ox57d+OxO153c[0x20]+Ox57e+OxO153c[0x20]+Ox57f+OxO153c[0x20]+Ox580+OxO153c[0x20]+Ox581+OxO153c[0x28];var Oxbe=OxO153c[0x29]+OxO153c[0x2a]+OxO153c[0x21]+h+OxO153c[0x1f]+Ox2e+OxO153c[0x15]+Ox582+OxO153c[0x2b]+OxO153c[0x2c]+OxO153c[0x2d]+Oxba+OxO153c[0x2e]+OxO153c[0x2f]+Ox57c+OxO153c[0x30];if(chk_Transparency[OxO153c[0x18]]){ Oxbe=Oxbe+OxO153c[0x31] ;} ;if(!chk_Loop[OxO153c[0x18]]){ Oxbe=Oxbe+OxO153c[0x32] ;} ;if(!chk_Loop[OxO153c[0x18]]){ Oxbe=Oxbe+OxO153c[0x32] ;} ;if(!chk_Autoplay[OxO153c[0x18]]){ Oxbe=Oxbe+OxO153c[0x33] ;} ;if(Scale[OxO153c[0xe]]!=OxO153c[0xf]){ Oxbe=Oxbe+OxO153c[0x34]+Scale[OxO153c[0xe]]+OxO153c[0x30] ;} ;if(bgColortext[OxO153c[0xe]]!=OxO153c[0xf]){ Oxbe=Oxbe+OxO153c[0x35]+bgColortext[OxO153c[0xe]]+OxO153c[0x30] ;} ; Oxbe=Oxbe+Ox585+OxO153c[0x36] ; editor.PasteHTML(Oxbe) ; top.close() ;}  ; function do_cancel(){ top.close() ;}  ; divpreview[OxO153c[0x38]][OxO153c[0x37]]=0x1 ; function Zoom_In(){if(divpreview[OxO153c[0x38]][OxO153c[0x37]]!=0x0){ divpreview[OxO153c[0x38]][OxO153c[0x37]]*=1.2 ;} else { divpreview[OxO153c[0x38]][OxO153c[0x37]]=1.2 ;} ;}  ; function Zoom_Out(){if(divpreview[OxO153c[0x38]][OxO153c[0x37]]!=0x0){ divpreview[OxO153c[0x38]][OxO153c[0x37]]*=0.8 ;} else { divpreview[OxO153c[0x38]][OxO153c[0x37]]=0.8 ;} ;}  ; function Actualsize(){ divpreview[OxO153c[0x38]][OxO153c[0x37]]=0x1 ;}  ; function IsDigit(){if((event[OxO153c[0x39]]>=0x30)&&(event[OxO153c[0x39]]<=0x39)||event[OxO153c[0x39]]==0x25){return true;} else { alert(OxO153c[0x3a]) ;return false;} ;}  ;
		</script>
	</body>
</HTML>
