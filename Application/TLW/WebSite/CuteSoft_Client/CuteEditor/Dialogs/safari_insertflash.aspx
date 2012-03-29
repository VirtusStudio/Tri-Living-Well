<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<HTML>
	<HEAD>
		<title>[[InsertFlash]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='Safari_style.css'>
		<script src=Safari_dialog.js></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxOa48c=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxOa48c[0x1]][OxOa48c[0x0]]){ alert(OxOa48c[0x2]) ;return false;} ;var Ox2fb=prompt(OxOa48c[0x3],OxOa48c[0x4]);if(Ox2fb){ document.getElementById(OxOa48c[0x6])[OxOa48c[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxOa48c[0x1]][OxOa48c[0x0]]){ alert(OxOa48c[0x2]) ;return false;} ;var Ox2fb=prompt(OxOa48c[0x7],OxOa48c[0x8]);if(Ox2fb){ document.getElementById(OxOa48c[0x6])[OxOa48c[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxOa48c[0x1]][OxOa48c[0x0]]){ alert(OxOa48c[0x2]) ;return false;} ;var Ox2fb=prompt(OxOa48c[0x7],OxOa48c[0x8]);if(Ox2fb){ document.getElementById(OxOa48c[0x6])[OxOa48c[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxOa48c[0x1]][OxOa48c[0x0]]){ alert(OxOa48c[0x2]) ;return false;} ;return confirm(OxOa48c[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxOa48c[0x0]]){ alert(OxOa48c[0x2]) ;return false;} ; row=Oxb9[OxOa48c[0xa]][OxOa48c[0xa]] ;var Ox550=row[OxOa48c[0xb]];var name;if(row[OxOa48c[0xc]]){ name=prompt(OxOa48c[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxOa48c[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxOa48c[0xd])); name=prompt(OxOa48c[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxOa48c[0xb]]){ document.getElementById(OxOa48c[0xf])[OxOa48c[0x5]]=OxOa48c[0x10] ; document.getElementById(OxOa48c[0x6])[OxOa48c[0x5]]=(row[OxOa48c[0xc]]?OxOa48c[0x12]:OxOa48c[0x13])+OxOa48c[0x14]+row[OxOa48c[0x11]]+OxOa48c[0x14]+name ; postback() ;} ; event[OxOa48c[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxOa48c[0x17]][OxOa48c[0x16]]=OxOa48c[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxOa48c[0x17]][OxOa48c[0x16]]=OxOa48c[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxOa48c[0xc]]){if(event[OxOa48c[0x1]][OxOa48c[0x19]]==OxOa48c[0x1a]){return ;} ; document.getElementById(OxOa48c[0xf])[OxOa48c[0x5]]=OxOa48c[0x1b] ; document.getElementById(OxOa48c[0x6])[OxOa48c[0x5]]=Oxc3.getAttribute(OxOa48c[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxOa48c[0x11]); document.getElementById(OxOa48c[0x1c])[OxOa48c[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxOa48c[0x1d]); document.getElementById(OxOa48c[0x1e])[OxOa48c[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
	<body>
		<form runat="server" enctype="multipart/form-data" id="Form1">
			<!-- start hidden -->
			<script>
				var OxO7e2e=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO7e2e[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO7e2e[0x2])[OxO7e2e[0x1]]){ alert(document.getElementById(OxO7e2e[0x2]).value) ;} ; document.getElementById(OxO7e2e[0x2])[OxO7e2e[0x1]]=OxO7e2e[0x3] ; document.getElementById(OxO7e2e[0x4])[OxO7e2e[0x1]]=OxO7e2e[0x3] ; document.getElementById(OxO7e2e[0x5])[OxO7e2e[0x1]]=OxO7e2e[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory" NAME="hiddenDirectory"> <input type="hidden" runat="server" id="hiddenFile" NAME="hiddenFile">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert" NAME="hiddenAlert"> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange" NAME="hiddenAction">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData" NAME="hiddenActionData">
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
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true"
							OnClick="CreateDir_Click" />
						<asp:ImageButton ID="Copy" Runat="server" AlternateText="[[Copyfiles]]" ImageUrl="../images/Copy.gif"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true"
							OnClick="Copy_Click" />
						<asp:ImageButton ID="Move" Runat="server" AlternateText="[[Movefiles]]" ImageUrl="../images/move.gif"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true"
							OnClick="Move_Click" />
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="250">
						<div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 250; HEIGHT: 240px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
							<asp:Table ID="FoldersAndFiles" Runat="server" CellSpacing="1" CellPadding="1" Width="100%" CssClass="sortable">
								<asp:TableRow BackColor="#f0f0f0">
									<asp:TableHeaderCell Width="16px" >
						<asp:ImageButton ID="Delete" Runat="server" AlternateText="[[Deletefiles]]"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" ImageUrl="../images/s_cut.gif"
							Visible="true" OnClick="Delete_Click" />
									</asp:TableHeaderCell>
									<asp:TableHeaderCell Width="16px" >
						<asp:ImageButton ID="DoRefresh" Runat="server" AlternateText="[[Refresh]]" ImageUrl="../images/s_refresh.gif"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true"
							OnClick="DoRefresh_Click" />
									</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="name_Cell" Width="136px" CssClass="filelistHeadCol" Font-Bold="False">[[Name]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="size_Cell" Width="72px" CssClass="filelistHeadCol" Font-Bold="False">[[Count]]/[[Size]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell"  Width="16px">&nbsp;</asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<div style="BORDER: 1.5pt inset; VERTICAL-ALIGN: top; OVERFLOW: auto; WIDTH: 300px; HEIGHT: 240px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
							<div id="divpreview" style="BACKGROUND-COLOR: white" height="100%" width="100%">
								&nbsp;</div>
						</div>
					</td>
				</tr>
			</table>
			<br>
			<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center">
				<tr>
					<td valign="top">
						<fieldset>
							<legend>
								[[Properties]]</legend>
							<table border="0" cellpadding="5" cellspacing="0" ID="Table3">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" class="normal">
											<tr>
												<td width="120">[[Width]]:</td>
												<td width="100"><input type="text" name="Width" id="Width" style="WIDTH : 80px" onchange="do_preview()"
														onpropertychange="do_preview()" value="200" runat="server"></td>
											</tr>
											<tr>
												<td>[[Height]]:</td>
												<td><input type="text" name="Height" id="Height" style="WIDTH : 80px" onchange="do_preview()"
														onpropertychange="do_preview()" value="200" runat="server"></td>
											</tr>
											<tr>
												<td>[[Backgroundcolor]]:</td>
												<td>
													<input type="text" id="bordercolor" name="bordercolor" size="7" style="WIDTH:57px">	
													<img id="s_bgColortext" src="../images/colorpicker.gif" onclick="SelectColor('bordercolor','s_bgColortext');" align="absMiddle">												
												</td>
											</tr>
											<tr>
												<td>[[Transparency]]:</td>
												<td><input type="checkbox" name="Transparency" onchange="do_preview()" onpropertychange="do_preview()"
														id="Transparency" value="Transparency" runat="server"></td>
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
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<fieldset  style="width:300px" style="margin-bottom:5px">
							<legend>
								[[Insert]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" class="normal">
											<tr>
												<td valign="middle">
													URL:</td>
												<td>
													<input type="text" id="TargetUrl" size="40" name="TargetUrl" runat="server"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset style="width:300px" id="fieldsetUpload">
							<legend>
								[[Upload]] (Max file size allowed
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashSize * 1024)%>
								)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center" class="normal">
								<tr>
									<td valign="top" width="54%" style="FONT-SIZE: 8pt; VERTICAL-ALIGN: middle;">
										<asp:Label ID="Label_PictureUpload" Runat="server">&nbsp;</asp:Label>
										<input id="InputFile" size="40" type="file" runat="server" style="HEIGHT:20px" NAME="InputFile">&nbsp;
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
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td>
													<nobr>
													Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashFolderSize * 1024)%>.
													Used: <%= CuteEditor.Impl.FileStorage.FormatSize(fs.GetDirectorySize(fs.VirtualRoot)) %>&nbsp;&nbsp;
													</nobr>
												</td>
												<td>
													<div style="background-color:green;height:3px;width:40px;font-size:3px">
														<div style="background-color:red;height:3px;width:<%= GetUsedSpaceBarWidth() %>px;font-size:3px"></div>
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<p align="center">
							<input class="inputbuttoninsert" type="button" value="[[Insert]]" onclick="do_insert()"
								id="Button1" runat="server" NAME="Button1">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2" runat="server" NAME="Button2">
						</p>
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
			var OxO9bfe=["dialogArguments","opener","availWidth","availHeight","TargetUrl","bordercolor","Width","Height","Quality","Transparency","value","","\x3Cembed src=\x22","\x22 quality=\x22","\x22 bgcolor=\x22","\x22  width=\x22","\x22 height=\x22","\x22 type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","innerHTML","Please choose a Flash movie to insert","w","px","h","wm","bg","qu","swf"];var dialogArguments=window[OxO9bfe[0x1]][OxO9bfe[0x0]]; window.resizeTo(0x24a,0x236) ; window.moveTo((screen[OxO9bfe[0x2]]-0x258)/0x2,(screen[OxO9bfe[0x3]]-0x190)/0x2) ; window.focus() ; do_preview() ; function do_preview(){var Oxba;var Ox57b;var Ox563;var Ox81;var Ox2e2;var Ox57c;var Ox693;var flashname=document.getElementById(OxO9bfe[0x4]);var bordercolor=document.getElementById(OxO9bfe[0x5]);var Width=document.getElementById(OxO9bfe[0x6]);var Height=document.getElementById(OxO9bfe[0x7]);var Quality=document.getElementById(OxO9bfe[0x8]);var Ox694=document.getElementById(OxO9bfe[0x9]); Ox693=bordercolor[OxO9bfe[0xa]] ; Oxba=flashname[OxO9bfe[0xa]] ; Ox81=Width[OxO9bfe[0xa]] ; Ox2e2=Height[OxO9bfe[0xa]] ; Ox57c=Quality[OxO9bfe[0xa]] ; preview_width=0xf0 ; preview_height=0xc8 ; w=parseInt(Ox81) ; h=parseInt(Ox2e2) ;if(w>h){ Ox81=preview_width ; Ox2e2=preview_height*h/w ;} else { Ox81=preview_width*w/h ; Ox2e2=preview_height ;} ; Ox81=parseInt(Ox81) ; Ox2e2=parseInt(Ox2e2) ;if(Oxba==OxO9bfe[0xb]){return ;} ;var Ox563=OxO9bfe[0xc]+Oxba+OxO9bfe[0xd]+Ox57c+OxO9bfe[0xe]+Ox693+OxO9bfe[0xf]+Ox81+OxO9bfe[0x10]+Ox2e2+OxO9bfe[0x11]; divpreview[OxO9bfe[0x12]]=Ox563 ;}  ;var parameters= new Array(); function do_insert(){var bordercolor=document.getElementById(OxO9bfe[0x5]);var Width=document.getElementById(OxO9bfe[0x6]);var Height=document.getElementById(OxO9bfe[0x7]);var Quality=document.getElementById(OxO9bfe[0x8]);var flashname=document.getElementById(OxO9bfe[0x4]);var Ox694=document.getElementById(OxO9bfe[0x9]);if(flashname[OxO9bfe[0xa]]==OxO9bfe[0xb]){ alert(OxO9bfe[0x13]) ;return false;} ; parameters[OxO9bfe[0x14]]=Width[OxO9bfe[0xa]]+OxO9bfe[0x15] ; parameters[OxO9bfe[0x16]]=Height[OxO9bfe[0xa]]+OxO9bfe[0x15] ; parameters[OxO9bfe[0x17]]=Ox694[OxO9bfe[0xa]] ; parameters[OxO9bfe[0x18]]=bordercolor[OxO9bfe[0xa]] ; parameters[OxO9bfe[0x19]]=Quality[OxO9bfe[0xa]] ; parameters[OxO9bfe[0x1a]]=flashname[OxO9bfe[0xa]] ;var Oxbe=OxO9bfe[0xc]+parameters[OxO9bfe[0x1a]]+OxO9bfe[0xd]+parameters[OxO9bfe[0x19]]+OxO9bfe[0xe]+parameters[OxO9bfe[0x18]]+OxO9bfe[0xf]+parameters[OxO9bfe[0x14]]+OxO9bfe[0x10]+parameters[OxO9bfe[0x16]]+OxO9bfe[0x11];var editor=window[OxO9bfe[0x1]][OxO9bfe[0x0]]; editor.PasteHTML(Oxbe) ; top.close() ;}  ; function do_cancel(){ top.close() ;}  ; function SelectColor(Ox683,Ox19a){var Ox3b6= new ColorPicker(Ox19a,Ox683); Ox3b6.showPopup() ;}  ;
		</script>
	</body>
</HTML>
