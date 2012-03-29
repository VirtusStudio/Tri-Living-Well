<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.TemplateBrowserPage" %>
<HTML>
	<HEAD>
		
		<title>[[InsertTemplate]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='Safari_style.css'>
		<script src=safari_dialog.js></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxO7ef0=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[NotAailableinSafari]]","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","htmlcode","hiddenFile","url","TargetUrl",".aspx","src","framepreview"]; function CreateDir_click(){if(event[OxO7ef0[0x1]][OxO7ef0[0x0]]){ alert(OxO7ef0[0x2]) ;return false;} ;var Ox2fb=prompt(OxO7ef0[0x3],OxO7ef0[0x4]);if(Ox2fb){ document.getElementById(OxO7ef0[0x6])[OxO7ef0[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function NewTemplate_Click(){ alert(OxO7ef0[0x7]) ;return false;}  ; function Move_click(){if(event[OxO7ef0[0x1]][OxO7ef0[0x0]]){ alert(OxO7ef0[0x2]) ;return false;} ;var Ox2fb=prompt(OxO7ef0[0x8],OxO7ef0[0x9]);if(Ox2fb){ document.getElementById(OxO7ef0[0x6])[OxO7ef0[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxO7ef0[0x1]][OxO7ef0[0x0]]){ alert(OxO7ef0[0x2]) ;return false;} ;var Ox2fb=prompt(OxO7ef0[0x8],OxO7ef0[0x9]);if(Ox2fb){ document.getElementById(OxO7ef0[0x6])[OxO7ef0[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxO7ef0[0x1]][OxO7ef0[0x0]]){ alert(OxO7ef0[0x2]) ;return false;} ;return confirm(OxO7ef0[0xa]);}  ; function RenImg_click(Oxb9){if(Oxb9[OxO7ef0[0x0]]){ alert(OxO7ef0[0x2]) ;return false;} ; row=Oxb9[OxO7ef0[0xb]][OxO7ef0[0xb]] ;var Ox550=row[OxO7ef0[0xc]];var name;if(row[OxO7ef0[0xd]]){ name=prompt(OxO7ef0[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxO7ef0[0xe]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxO7ef0[0xe])); name=prompt(OxO7ef0[0xf],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxO7ef0[0xc]]){ document.getElementById(OxO7ef0[0x10])[OxO7ef0[0x5]]=OxO7ef0[0x11] ; document.getElementById(OxO7ef0[0x6])[OxO7ef0[0x5]]=(row[OxO7ef0[0xd]]?OxO7ef0[0x13]:OxO7ef0[0x14])+OxO7ef0[0x15]+row[OxO7ef0[0x12]]+OxO7ef0[0x15]+name ; postback() ;} ; event[OxO7ef0[0x16]]=true ;}  ; function EditImg_click(Oxb9){ alert(OxO7ef0[0x7]) ;return false;}  ; function row_over(Oxc3){ Oxc3[OxO7ef0[0x18]][OxO7ef0[0x17]]=OxO7ef0[0x19] ;}  ; function row_out(Oxc3){ Oxc3[OxO7ef0[0x18]][OxO7ef0[0x17]]=OxO7ef0[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxO7ef0[0xd]]){if(event[OxO7ef0[0x1]][OxO7ef0[0x1a]]==OxO7ef0[0x1b]){return ;} ; document.getElementById(OxO7ef0[0x10])[OxO7ef0[0x5]]=OxO7ef0[0x1c] ; document.getElementById(OxO7ef0[0x6])[OxO7ef0[0x5]]=Oxc3.getAttribute(OxO7ef0[0x12]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxO7ef0[0x12]);var htmlcode=Oxc3.getAttribute(OxO7ef0[0x1d]); document.getElementById(OxO7ef0[0x1e])[OxO7ef0[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxO7ef0[0x1f]); document.getElementById(OxO7ef0[0x20])[OxO7ef0[0x5]]=Oxba ; Oxba=Oxba.toLowerCase() ;if(Oxba.indexOf(OxO7ef0[0x21])!=-0x1){try{ document.getElementById(OxO7ef0[0x23])[OxO7ef0[0x22]]=Oxba ;} catch(e){} ;} ; document.getElementById(OxO7ef0[0x20])[OxO7ef0[0x5]]=Oxba ; do_preview(htmlcode) ; pageurl=Oxba ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
		#framepreview {
			width: 100%;
			height: 100%;
			overflow:hidden;
			text-align: left;
			vertical-align: top;
			padding: 0px;
			margin: 0px;
			border:0;
			background-color: white;
		}
		</style>
	</HEAD>
	<body>
		<form runat="server" enctype="multipart/form-data" id="Form1">
			<!-- start hidden -->
			<script>
        var OxO63b4=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO63b4[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO63b4[0x2])[OxO63b4[0x1]]){ alert(document.getElementById(OxO63b4[0x2]).value) ;} ; document.getElementById(OxO63b4[0x2])[OxO63b4[0x1]]=OxO63b4[0x3] ; document.getElementById(OxO63b4[0x4])[OxO63b4[0x1]]=OxO63b4[0x3] ; document.getElementById(OxO63b4[0x5])[OxO63b4[0x1]]=OxO63b4[0x3] ;}  ;
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
						<asp:ImageButton ID="NewTemplate" Runat="server" AlternateText="[[NewTemplate]]" ImageUrl="../images/newtemplate.gif"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"  Visible="true"
							OnClick="NewTemplate_Click" />
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="250">
						<div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 100%; HEIGHT: 240px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
							<asp:Table ID="FoldersAndFiles" Runat="server" CellSpacing="1" CellPadding="1" Width="100%" CssClass="sortable">
								<asp:TableRow BackColor="#f0f0f0">
									<asp:TableHeaderCell Width="16px" >
						<asp:ImageButton ID="Delete" Runat="server" AlternateText="Delete the selected files/directories"
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
									<asp:TableHeaderCell ID="op_Cell2"  Width="16px">&nbsp;</asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td width="10">
					</td>
					<td valign="top">	
						<div style="BORDER-RIGHT: 1.5pt inset; PADDING-RIGHT: 0px; BORDER-TOP: 1.5pt inset; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; VERTICAL-ALIGN: middle; OVERFLOW: auto; BORDER-LEFT: 1.5pt inset; WIDTH: 100%; PADDING-TOP: 0px; BORDER-BOTTOM: 1.5pt inset; HEIGHT: 240px; BACKGROUND-COLOR: white;WIDTH: 360px;">
							<iframe id="framepreview" src="../template.aspx"></iframe>
						</div>
					</td>
				</tr>
			</table>
			<br>
			<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center">
				<tr>
					<td valign="top">						
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<input type="hidden" id="TargetUrl" size="40" name="TargetUrl" runat="server">
						<fieldset runat="server" id="fieldsetUpload">
							<legend>
								[[Upload]] (Max file size allowed
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxTemplateSize * 1024)%>
								)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center" class="normal">
								<tr>
									<td valign="top" width="54%" style="FONT-SIZE: 8pt; VERTICAL-ALIGN: middle;">
										<asp:Label ID="Label_PictureUpload" Runat="server">&nbsp;</asp:Label>
										<input id="InputFile" size="40" type="file" runat="server" style="HEIGHT:20p;Width:200px" NAME="InputFile">&nbsp;&nbsp;<asp:Button ID="uploadButton" Text="[[Upload]]" Runat="server" OnClick="uploadButton_Click" />&nbsp;
									</td>
								</tr>
								<tr>
									<td height="5">
									</td>
								</tr>
								<tr>
									<td>
										<table cellpadding=0 cellspacing=0 border=0>
											<tr>
												<td>
													<nobr>
														Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxTemplateFolderSize * 1024)%>.
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
				fs.VirtualRoot=CuteEditor.EditorUtility.ProcessWebPath(Context,null,secset.TemplateGalleryPath).TrimEnd('/')+"/";
			}
			protected override void GetFiles(ArrayList files)
			{
				files.AddRange(fs.GetFileItems(CurrentDirectory, secset.FileNamePrefix + "*.htm"));
			}
			protected override bool AllowFileName(string filename)
			{
				filename = filename.ToLower();
				return filename.EndsWith(".htm") || filename.EndsWith(".html");
			}
			protected override string CheckUploadData(ref byte[] data)
			{
				if (fs.GetDirectorySize(fs.VirtualRoot) >= secset.MaxTemplateFolderSize * 1024)
					return "Template folder size exceeds the limit: "+ CuteEditor.Impl.FileStorage.FormatSize(secset.MaxTemplateFolderSize * 1024);

				if (data.Length >= secset.MaxTemplateSize * 1024)
					return "Template size exceeds "+CuteEditor.Impl.FileStorage.FormatSize(secset.MaxTemplateSize * 1024)+" limit: "+ CuteEditor.Impl.FileStorage.FormatSize(data.Length);
				return null;
			}
    
			protected int GetUsedSpaceBarWidth()
			{
				int w = Convert.ToInt32(40*fs.GetDirectorySize(fs.VirtualRoot)/(secset.MaxTemplateFolderSize * 1024));
				if(w<1)
					w=1;
		
				if(w>40)
					w=40;
		
				return w;      
			}
    
		</script>
		<script>
			var OxO7bca=["availWidth","availHeight","contentWindow","framepreview","","DIV","innerHTML",".aspx","body","document","dialogArguments","opener"]; window.resizeTo(0x28a,0x1c2) ; window.moveTo((screen[OxO7bca[0x0]]-0x28a)/0x2,(screen[OxO7bca[0x1]]-0x1c2)/0x2) ; window.focus() ;var framepreview=document.getElementById(OxO7bca[0x3])[OxO7bca[0x2]];var htmlcode=OxO7bca[0x4];var pageurl=OxO7bca[0x4]; function do_preview(Oxaf){ htmlcode=Oxaf ;var div=document.createElement(OxO7bca[0x5]); div[OxO7bca[0x6]]=Oxaf ;try{ htmlcode=div[OxO7bca[0x6]] ;} catch(er){} ;}  ; function do_insert(){if(pageurl.indexOf(OxO7bca[0x7])!=-0x1){ framepreview=document.getElementById(OxO7bca[0x3])[OxO7bca[0x2]] ; htmlcode=framepreview[OxO7bca[0x9]][OxO7bca[0x8]][OxO7bca[0x6]] ;} ;var editor=window[OxO7bca[0xb]][OxO7bca[0xa]];if(htmlcode&&editor){ editor.PasteHTML(htmlcode) ;} ; window[OxO7bca[0xb]].focus() ; top.close() ;}  ; function do_cancel(){ top.close() ;}  ;
		</script>
	</body>
</HTML>
