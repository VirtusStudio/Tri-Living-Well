<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<html>
	<head>
		<title>[[InsertMedia]] 
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
		var OxO81df=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxO81df[0x1]][OxO81df[0x0]]){ alert(OxO81df[0x2]) ;return false;} ;var Ox2fb=prompt(OxO81df[0x3],OxO81df[0x4]);if(Ox2fb){ document.getElementById(OxO81df[0x6])[OxO81df[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxO81df[0x1]][OxO81df[0x0]]){ alert(OxO81df[0x2]) ;return false;} ;var Ox2fb=prompt(OxO81df[0x7],OxO81df[0x8]);if(Ox2fb){ document.getElementById(OxO81df[0x6])[OxO81df[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxO81df[0x1]][OxO81df[0x0]]){ alert(OxO81df[0x2]) ;return false;} ;var Ox2fb=prompt(OxO81df[0x7],OxO81df[0x8]);if(Ox2fb){ document.getElementById(OxO81df[0x6])[OxO81df[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxO81df[0x1]][OxO81df[0x0]]){ alert(OxO81df[0x2]) ;return false;} ;return confirm(OxO81df[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxO81df[0x0]]){ alert(OxO81df[0x2]) ;return false;} ; row=Oxb9[OxO81df[0xa]][OxO81df[0xa]] ;var Ox550=row[OxO81df[0xb]];var name;if(row[OxO81df[0xc]]){ name=prompt(OxO81df[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxO81df[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxO81df[0xd])); name=prompt(OxO81df[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxO81df[0xb]]){ document.getElementById(OxO81df[0xf])[OxO81df[0x5]]=OxO81df[0x10] ; document.getElementById(OxO81df[0x6])[OxO81df[0x5]]=(row[OxO81df[0xc]]?OxO81df[0x12]:OxO81df[0x13])+OxO81df[0x14]+row[OxO81df[0x11]]+OxO81df[0x14]+name ; postback() ;} ; event[OxO81df[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxO81df[0x17]][OxO81df[0x16]]=OxO81df[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxO81df[0x17]][OxO81df[0x16]]=OxO81df[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxO81df[0xc]]){if(event[OxO81df[0x1]][OxO81df[0x19]]==OxO81df[0x1a]){return ;} ; document.getElementById(OxO81df[0xf])[OxO81df[0x5]]=OxO81df[0x1b] ; document.getElementById(OxO81df[0x6])[OxO81df[0x5]]=Oxc3.getAttribute(OxO81df[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxO81df[0x11]); document.getElementById(OxO81df[0x1c])[OxO81df[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxO81df[0x1d]); document.getElementById(OxO81df[0x1e])[OxO81df[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
		</script>
		<style>
		.row
		{
			height:22px;
		}
		.cb
		{
			vertical-align:middle;
		}
		.itemimg
		{
			vertical-align:middle;
		}
		.editimg
		{
			vertical-align:middle;
		}
		.cell1
		{
			vertical-align:middle;
		}
		.cell2
		{
			vertical-align:middle;
		}
		.cell3
		{
			vertical-align:middle;
		    
			text-align:right;
			padding-right:4px;
		}
		.cb
		{
		}
		</style>
	</head>
	<body>
		<form runat="server" enctype="multipart/form-data" id="Form1">
			<!-- start hidden -->
			<script>
        var OxO40ef=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO40ef[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO40ef[0x2])[OxO40ef[0x1]]){ alert(document.getElementById(OxO40ef[0x2]).value) ;} ; document.getElementById(OxO40ef[0x2])[OxO40ef[0x1]]=OxO40ef[0x3] ; document.getElementById(OxO40ef[0x4])[OxO40ef[0x1]]=OxO40ef[0x3] ; document.getElementById(OxO40ef[0x5])[OxO40ef[0x1]]=OxO40ef[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory" NAME="hiddenDirectory"/> <input type="hidden" runat="server" id="hiddenFile" NAME="hiddenFile"/>
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert" NAME="hiddenAlert"/> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange" NAME="hiddenAction"/>
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData" NAME="hiddenActionData"/>
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
						<asp:ImageButton ID="CreateDir" Runat="server" AlternateText="[[Createdirectory]]" 
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" ImageUrl="../images/newfolder.gif" Visible="true"
							OnClick="CreateDir_Click" />
						<asp:ImageButton ID="Copy" Runat="server" AlternateText="[[Copyfiles]]"  onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"
							ImageUrl="../images/Copy.gif" Visible="true" OnClick="Copy_Click" />
						<asp:ImageButton ID="Move" Runat="server" AlternateText="[[Movefiles]]"  onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"
							ImageUrl="../images/move.gif" Visible="true" OnClick="Move_Click" />
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="250px">
                       <div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 100%; HEIGHT: 250px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
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
									<asp:TableHeaderCell ID="name_Cell" Width="146px" CssClass="filelistHeadCol" Font-Bold="False">[[Name]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="size_Cell" Width="62px" CssClass="filelistHeadCol" Font-Bold="False">[[Count]]/[[Size]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell"  Width="16px">&nbsp;</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell2"  Width="16px">&nbsp;</asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<div style="Height:240px; BORDER: 1.0pt inset; PADDING: 5px;VERTICAL-ALIGN: top; OVERFLOW: auto;BACKGROUND-COLOR: white; TEXT-ALIGN: center">
							<div id="divpreview" style="BACKGROUND-COLOR: white" style="width:100%">
							</div>
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
							<table border="0" cellpadding="5" cellspacing="0" class="normal">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" class="normal">
											<tr>
												<td width="100">
													[[Width]]:</td>
												<td>
													<input type="text" name="Width" id="Width" style="width: 80px;" onchange="do_preview()"
														onpropertychange="do_preview()" value="200" runat="server"></td>
											</tr>
											<tr>
												<td>
													[[Height]]:</td>
												<td>
													<input type="text" name="Height" id="Height" style="width: 80px;" onchange="do_preview()"
														onpropertychange="do_preview()" value="200" runat="server"></td>
											</tr>
											<tr>
												<td>
													[[AutoStart]]:</td>
												<td>
													<input type="checkbox" name="Transparency" onchange="do_preview()" onpropertychange="do_preview()"
														id="AutoStart" checked value="AutoStart" runat="server"></td>
											</tr>
											<tr>
												<td style="height: 24px">
													[[ShowControls]]:</td>
												<td style="height: 24px">
													<input type="checkbox" name="Transparency" onchange="do_preview()" onpropertychange="do_preview()"
														id="ShowControls" checked value="ShowControls" runat="server"></td>
											</tr>
											<tr>
												<td>
													[[ShowStatusBar]]:</td>
												<td>
													<input type="checkbox" name="Transparency" onchange="do_preview()" onpropertychange="do_preview()"
														id="ShowStatusBar" checked value="ShowStatusBar" runat="server"></td>
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
						<fieldset style="width:300px" style="margin-bottom:5px">
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
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxMediaSize * 1024)%>
								)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center" class="normal">
								<tr>
									<td valign="top" width="54%" style="font-size: 8pt; vertical-align: middle; font-family: MS Sans Serif">
										<asp:Label ID="Label_PictureUpload" Runat="server">&nbsp;</asp:Label>
										<input id="InputFile" size="40" type="file" runat="server" style="height:20px" NAME="InputFile">&nbsp;
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
													Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxMediaFolderSize * 1024)%>.
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
							<input class="inputbuttoninsert" type="button" value="[[Insert]]" onclick="do_insert()"	id="Button1">
							&nbsp;&nbsp;&nbsp; 
							<input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"	id="Button2">
						</p>
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script runat="server">
		protected override void InitOfType()
		{
			fs.VirtualRoot=CuteEditor.EditorUtility.ProcessWebPath(Context,null,secset.MediaGalleryPath).TrimEnd('/')+"/";
		}
		protected override void GetFiles(ArrayList files)
		{
			foreach (string ext in secset.MediaFilters)
			{
				if (ext == null || ext.Length == 0) continue;

				files.AddRange(fs.GetFileItems(CurrentDirectory, secset.FileNamePrefix + "*" + ext));
			}
		}
		protected override bool AllowFileName(string filename)
		{
			filename = filename.ToLower();
			foreach (string ext in secset.MediaFilters)
			{
				if (ext == null || ext.Length == 0) continue;
				if(filename.EndsWith(ext.ToLower()))
					return true;
			}
			return false;
		}
		protected override string CheckUploadData(ref byte[] data)
		{
			if (fs.GetDirectorySize(fs.VirtualRoot) >= secset.MaxMediaFolderSize * 1024)
				return "Media folder size exceeds the limit: "+ CuteEditor.Impl.FileStorage.FormatSize(secset.MaxMediaFolderSize * 1024);
		
			if (data.Length >= secset.MaxMediaSize * 1024)
				return "Media size exceeds "+CuteEditor.Impl.FileStorage.FormatSize(secset.MaxMediaSize * 1024)+" limit: "+ CuteEditor.Impl.FileStorage.FormatSize(data.Length);
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
			
		var OxOe44c=["availWidth","availHeight","TargetUrl","value","","Width","Height","ShowControls","AutoStart","ShowStatusBar","checked","\x3Cembed name=\x22MediaPlayer1\x22 src=\x22","\x22 autostart=\x22","\x22 showcontrols=\x22","\x22  width=\x22","\x22 height=\x22","\x22 type=\x22application/x-mplayer2\x22 pluginspage=\x22http://www.microsoft.com/Windows/MediaPlayer\x22 \x3E\x3C/embed\x3E\x0A","innerHTML","Please choose a Media movie to insert","w","px","h","medianame","dialogArguments","opener"]; window.resizeTo(0x23c,0x21c) ; window.moveTo((screen[OxOe44c[0x0]]-0x258)/0x2,(screen[OxOe44c[0x1]]-0x190)/0x2) ; window.focus() ; do_preview() ; function do_preview(){var Ox57b;var Ox81;var Ox2e2;var TargetUrl=document.getElementById(OxOe44c[0x2]);if(TargetUrl[OxOe44c[0x3]]==OxOe44c[0x4]){return ;} ;var Width=document.getElementById(OxOe44c[0x5]);var Height=document.getElementById(OxOe44c[0x6]);var Ox5bc=document.getElementById(OxOe44c[0x7]);var Ox5bd=document.getElementById(OxOe44c[0x8]);var Ox5be=document.getElementById(OxOe44c[0x9]);var Ox5bfOx5c0Ox5c1;if(Ox5bd[OxOe44c[0xa]]){ Ox5bf=0x1 ;} else { Ox5bf=0x0 ;} ;if(Ox5be[OxOe44c[0xa]]){ Ox5c0=0x1 ;} else { Ox5c0=0x0 ;} ;if(Ox5bc[OxOe44c[0xa]]){ Ox5c1=0x1 ;} else { Ox5c1=0x0 ;} ; Ox81=Width[OxOe44c[0x3]] ; Ox2e2=Height[OxOe44c[0x3]] ; preview_width=0xf0 ; preview_height=0xc8 ; w=parseInt(Ox81) ; h=parseInt(Ox2e2) ;if(w>h){ Ox81=preview_width ; Ox2e2=preview_height*h/w ;} else { Ox81=preview_width*w/h ; Ox2e2=preview_height ;} ; Ox81=parseInt(Ox81) ; Ox2e2=parseInt(Ox2e2) ;var Oxbd=OxOe44c[0xb]+TargetUrl[OxOe44c[0x3]]+OxOe44c[0xc]+Ox5bf+OxOe44c[0xd]+Ox5c1+OxOe44c[0xe]+Ox81+OxOe44c[0xf]+Ox2e2+OxOe44c[0x10]; divpreview[OxOe44c[0x11]]=Oxbd ;}  ;var parameters= new Array(); function do_insert(){var TargetUrl=document.getElementById(OxOe44c[0x2]);var Width=document.getElementById(OxOe44c[0x5]);var Height=document.getElementById(OxOe44c[0x6]);var Ox5bc=document.getElementById(OxOe44c[0x7]);var Ox5bd=document.getElementById(OxOe44c[0x8]);var Ox5be=document.getElementById(OxOe44c[0x9]);if(TargetUrl[OxOe44c[0x3]]==OxOe44c[0x4]){ alert(OxOe44c[0x12]) ;return false;} ; parameters[OxOe44c[0x13]]=Width[OxOe44c[0x3]]+OxOe44c[0x14] ; parameters[OxOe44c[0x15]]=Height[OxOe44c[0x3]]+OxOe44c[0x14] ; parameters[OxOe44c[0x16]]=document.getElementById(OxOe44c[0x2])[OxOe44c[0x3]] ;if(Ox5bd[OxOe44c[0xa]]){ parameters[OxOe44c[0x8]]=0x1 ;} else { parameters[OxOe44c[0x8]]=0x0 ;} ;if(Ox5be[OxOe44c[0xa]]){ parameters[OxOe44c[0x9]]=0x1 ;} else { parameters[OxOe44c[0x9]]=0x0 ;} ;if(Ox5bc[OxOe44c[0xa]]){ parameters[OxOe44c[0x7]]=0x1 ;} else { parameters[OxOe44c[0x7]]=0x0 ;} ;if(TargetUrl[OxOe44c[0x3]]==OxOe44c[0x4]){ alert(OxOe44c[0x12]) ;return false;} ;var Oxbd=OxOe44c[0xb]+parameters[OxOe44c[0x16]]+OxOe44c[0xc]+parameters[OxOe44c[0x8]]+OxOe44c[0xd]+parameters[OxOe44c[0x7]]+OxOe44c[0xe]+parameters[OxOe44c[0x13]]+OxOe44c[0xf]+parameters[OxOe44c[0x15]]+OxOe44c[0x10];var editor=window[OxOe44c[0x18]][OxOe44c[0x17]]; editor.PasteHTML(Oxbd) ; top.close() ;}  ; function do_cancel(){ top.close() ;}  ;
	
	</script>
</html>
