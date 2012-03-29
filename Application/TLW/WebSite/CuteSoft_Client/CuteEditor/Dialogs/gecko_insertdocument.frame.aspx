<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<HTML>
	<HEAD>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" href='gecko_style.css'>
		<script src="Gecko_dialog.js"></script>
		<script src="../_shared.js"></script>
		<script src="filebrowserpage.js"></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxOc666=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event){if(event[OxOc666[0x1]][OxOc666[0x0]]){ alert(OxOc666[0x2]) ;return false;} ;} ;var Ox2fb=prompt(OxOc666[0x3],OxOc666[0x4]);if(Ox2fb){ document.getElementById(OxOc666[0x6])[OxOc666[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event){if(event[OxOc666[0x1]][OxOc666[0x0]]){ alert(OxOc666[0x2]) ;return false;} ;} ;var Ox2fb=prompt(OxOc666[0x7],OxOc666[0x8]);if(Ox2fb){ document.getElementById(OxOc666[0x6])[OxOc666[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event){if(event[OxOc666[0x1]][OxOc666[0x0]]){ alert(OxOc666[0x2]) ;return false;} ;} ;var Ox2fb=prompt(OxOc666[0x7],OxOc666[0x8]);if(Ox2fb){ document.getElementById(OxOc666[0x6])[OxOc666[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxOc666[0x1]][OxOc666[0x0]]){ alert(OxOc666[0x2]) ;return false;} ;return confirm(OxOc666[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxOc666[0x0]]){ alert(OxOc666[0x2]) ;return false;} ; row=Oxb9[OxOc666[0xa]][OxOc666[0xa]] ;var Ox550=row[OxOc666[0xb]];var name;if(row[OxOc666[0xc]]){ name=prompt(OxOc666[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxOc666[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxOc666[0xd])); name=prompt(OxOc666[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxOc666[0xb]]){ document.getElementById(OxOc666[0xf])[OxOc666[0x5]]=OxOc666[0x10] ; document.getElementById(OxOc666[0x6])[OxOc666[0x5]]=(row[OxOc666[0xc]]?OxOc666[0x12]:OxOc666[0x13])+OxOc666[0x14]+row[OxOc666[0x11]]+OxOc666[0x14]+name ; postback() ;} ;if(event){ event[OxOc666[0x15]]=true ;} ;}  ; function row_over(Oxc3){ Oxc3[OxOc666[0x17]][OxOc666[0x16]]=OxOc666[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxOc666[0x17]][OxOc666[0x16]]=OxOc666[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxOc666[0xc]]){if(event){if(event[OxOc666[0x1]]&&event[OxOc666[0x1]][OxOc666[0x19]]==OxOc666[0x1a]){return ;} ;} ; document.getElementById(OxOc666[0xf])[OxOc666[0x5]]=OxOc666[0x1b] ; document.getElementById(OxOc666[0x6])[OxOc666[0x5]]=Oxc3.getAttribute(OxOc666[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxOc666[0x11]); document.getElementById(OxOc666[0x1c])[OxOc666[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxOc666[0x1d]); document.getElementById(OxOc666[0x1e])[OxOc666[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
        var OxO1618=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO1618[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO1618[0x2])[OxO1618[0x1]]){ alert(document.getElementById(OxO1618[0x2]).value) ;} ; document.getElementById(OxO1618[0x2])[OxO1618[0x1]]=OxO1618[0x3] ; document.getElementById(OxO1618[0x4])[OxO1618[0x1]]=OxO1618[0x3] ; document.getElementById(OxO1618[0x5])[OxO1618[0x1]]=OxO1618[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory" NAME="hiddenDirectory">
			<input type="hidden" runat="server" id="hiddenFile" NAME="hiddenFile"> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert" NAME="hiddenAlert">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange"
				NAME="hiddenAction"> <input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData" NAME="hiddenActionData">
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
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true" OnClick="CreateDir_Click" />
						<asp:ImageButton ID="Copy" Runat="server" AlternateText="[[Copyfiles]]" ImageUrl="../images/Copy.gif"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true" OnClick="Copy_Click" />
						<asp:ImageButton ID="Move" Runat="server" AlternateText="[[Movefiles]]" ImageUrl="../images/move.gif"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true" OnClick="Move_Click" />
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="270">
						<div style="BORDER-RIGHT: 1.5pt inset; BORDER-TOP: 1.5pt inset; VERTICAL-ALIGN: middle; OVERFLOW: auto; BORDER-LEFT: 1.5pt inset; WIDTH: 270px; BORDER-BOTTOM: 1.5pt inset; HEIGHT: 240px; BACKGROUND-COLOR: white">
							<asp:Table ID="FoldersAndFiles" Runat="server" CellSpacing="1" CellPadding="1" Width="100%"
								CssClass="sortable">
								<asp:TableRow BackColor="#f0f0f0">
									<asp:TableHeaderCell Width="16px">
										<asp:ImageButton ID="Delete" Runat="server" AlternateText="[[Deletefiles]]" onMouseOver="Check(this,1)"
											onMouseOut="Check(this,0)" ImageUrl="../images/s_cut.gif" Visible="true" OnClick="Delete_Click" />
									</asp:TableHeaderCell>
									<asp:TableHeaderCell Width="16px">
										<asp:ImageButton ID="DoRefresh" Runat="server" AlternateText="[[Refresh]]" ImageUrl="../images/s_refresh.gif"
											onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" Visible="true" OnClick="DoRefresh_Click" />
									</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="name_Cell" Width="146px" CssClass="filelistHeadCol" Font-Bold="False">[[Name]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="size_Cell" Width="62px" CssClass="filelistHeadCol" Font-Bold="False">[[Count]]/[[Size]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell" Width="16px">&nbsp;</asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<div style="BORDER-RIGHT: 1.5pt inset; PADDING-RIGHT: 0px; BORDER-TOP: 1.5pt inset; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; VERTICAL-ALIGN: top; OVERFLOW: auto; BORDER-LEFT: 1.5pt inset; WIDTH: 280px; PADDING-TOP: 0px; BORDER-BOTTOM: 1.5pt inset; HEIGHT: 240px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
							<div id="divpreview" style="BACKGROUND-COLOR: white" height="100%" width="100%">
								&nbsp;</div>
						</div>
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center">
				<tr>
					<td valign="top">
						<fieldset>
							<legend>
								[[Properties]]</legend>
							<table border="0" cellpadding="5" cellspacing="0" ID="Table3">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" ID="Table4" class="normal">
											<TR>
												<TD>[[Target]]</TD>
												<TD><SELECT id="sel_target">
														<OPTION value="" selected>[[NotSet]]</OPTION>
														<OPTION value="_blank">[[Newwindow]]</OPTION>
														<OPTION value="_self">[[Samewindow]]</OPTION>
														<OPTION value="_top">[[Topmostwindow]]</OPTION>
														<OPTION value="_parent">[[Parentwindow]]</OPTION>
													</SELECT></TD>
											</TR>
											<tr>
												<td>[[Color]]:</td>
												<td><input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px"> <img id="inp_color_preview" src="../images/colorpicker.gif" onclick="SelectColor('inp_color',this);"
														align="absMiddle">
												</td>
											</tr>
											<tr>
												<td>[[CssClass]]:</td>
												<td><INPUT id="inc_class" type="text" size="14" style="WIDTH:80px" name="inc_class"></td>
											</tr>
											<tr>
												<td>[[ID]]:</td>
												<td><INPUT id="inp_id" type="text" size="14" style="WIDTH:80px" name="inp_id"></td>
											</tr>
											<tr>
												<td>[[TabIndex]]:</td>
												<td><INPUT id="inp_index" type="text" size="14" maxlength="5" style="WIDTH:80px" name="inp_index"
														onkeypress="return IsDigit(event);"></td>
											</tr>
											<tr>
												<td>[[AccessKey]]:</td>
												<td><INPUT id="inp_access" type="text" size="14" maxlength="1" style="WIDTH:80px" name="inp_access"
														onkeypress="return IsDigit(event);"></td>
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
						<fieldset>
							<legend>
								[[Insert]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td>
										<TABLE id="Table8" cellSpacing="0" cellPadding="2" border="0" class="normal">
											<TR>
												<TD vAlign="middle">URL:</TD>
												<TD><INPUT id="TargetUrl" onpropertychange="do_preview()" type="text" size="40" name="TargetUrl"
														runat="server"></TD>
											</TR>
											<TR>
												<TD vAlign="middle">[[Title]]:</TD>
												<TD vAlign="middle"><INPUT id="inp_title" type="text" size="40" name="inp_title"></TD>
											</TR>
										</TABLE>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset id="fieldsetUpload">
							<legend>
								[[Upload]] (Max file size allowed
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxDocumentSize * 1024)%>
								)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center" class="normal">
								<tr>
									<td valign="top" width="54%" style="FONT-SIZE: 8pt; VERTICAL-ALIGN: middle; FONT-FAMILY: MS Sans Serif">
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
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td>
													<nobr>Max Upload folder size is :
														<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxDocumentFolderSize * 1024)%>
														. Used:
														<%= CuteEditor.Impl.FileStorage.FormatSize(fs.GetDirectorySize(fs.VirtualRoot)) %>
													</nobr>
												</td>
												<td>
													<div style="FONT-SIZE:3px;WIDTH:40px;HEIGHT:3px;BACKGROUND-COLOR:green">
														<div style="FONT-SIZE:3px;HEIGHT:3px;BACKGROUND-COLOR:red"></div>
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
								id="Button1" NAME="Button1">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2" NAME="Button2">
						</p>
					</td>
				</tr>
			</table>
		</form>
		<script runat="server">
	protected override void InitOfType()
	{
		fs.VirtualRoot=CuteEditor.EditorUtility.ProcessWebPath(Context,null,secset.FilesGalleryPath).TrimEnd('/')+"/";
	}
    protected override void GetFiles(ArrayList files)
    {
        foreach (string ext in secset.DocumentFilters)
        {
            if (ext == null || ext.Length == 0) continue;

            files.AddRange(fs.GetFileItems(CurrentDirectory, secset.FileNamePrefix + "*" + ext));

        }
        
        
    }
    protected override bool AllowFileName(string filename)
    {
        filename = filename.ToLower();
        foreach (string ext in secset.DocumentFilters)
        {
            if (ext == null || ext.Length == 0) continue;
            if(filename.EndsWith(ext.ToLower()))
                return true;
        }
        return false;
    }
    protected override string CheckUploadData(ref byte[] data)
    {	
		if (fs.GetDirectorySize(fs.VirtualRoot) >= secset.MaxDocumentFolderSize * 1024)
           return "File folder size exceeds the limit: "+ CuteEditor.Impl.FileStorage.FormatSize(secset.MaxDocumentFolderSize * 1024);

		if (data.Length >= secset.MaxDocumentSize * 1024)
            return "File size exceeds "+CuteEditor.Impl.FileStorage.FormatSize(secset.MaxDocumentSize * 1024)+" limit: "+ CuteEditor.Impl.FileStorage.FormatSize(data.Length);
        return null;
    }    
    
    protected int GetUsedSpaceBarWidth()
    {
      int w = Convert.ToInt32(40*fs.GetDirectorySize(fs.VirtualRoot)/(secset.MaxDocumentFolderSize * 1024));
      if(w<1)
		w=1;
		
	  if(w>40)
		w=40;
		
      return w;      
    }
    
		</script>
		<script src="addvars.js"></script>
		<script>

			var OxO9ab1=["dialogArguments","TargetUrl","sel_target","inp_color","inc_class","inp_title","inp_color_preview","inp_id","inp_access","inp_index","frameloaded","color","style","value","backgroundColor","className","title","target","tabIndex","","accessKey","id","href","href_cetemp","innerHTML",".","\x3CIMG src=\x27","\x27\x3E","\x3Cembed src=\x22","\x22 quality=\x22high\x22 width=\x2290%\x22 height=\x2290%\x22 type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","\x3Cembed name=\x22MediaPlayer1\x22 src=\x22","\x22 autostart=-1 showcontrols=-1  type=\x22application/x-mplayer2\x22 width=\x22240\x22 height=\x22200\x22 pluginspage=\x22http://www.microsoft.com/Windows/MediaPlayer\x22 \x3E\x3C/embed\x3E\x0A",".mpeg",".mp3",".mpg",".avi",".swf",".bmp",".png",".gif",".jpg",".jpeg","class","\x3Cp\x3E\x26nbsp;\x3C/p\x3E","\x3Cp\x3E\x26#160;\x3C/p\x3E","\x3Cp\x3E\x3C/p\x3E","\x3Cdiv\x3E\x26#160;\x3C/div\x3E","\x3Cdiv\x3E\x26nbsp;\x3C/div\x3E","\x3Cdiv\x3E\x3C/div\x3E","name","link","returnValue","../colorpicker.aspx"];var element=top[OxO9ab1[0x0]];var TargetUrl=document.getElementById(OxO9ab1[0x1]);var sel_target=document.getElementById(OxO9ab1[0x2]);var inp_color=document.getElementById(OxO9ab1[0x3]);var inc_class=document.getElementById(OxO9ab1[0x4]);var inp_title=document.getElementById(OxO9ab1[0x5]);var inp_color_preview=document.getElementById(OxO9ab1[0x6]);var inp_id=document.getElementById(OxO9ab1[0x7]);var inp_access=document.getElementById(OxO9ab1[0x8]);var inp_index=document.getElementById(OxO9ab1[0x9]);if(!top[OxO9ab1[0xa]]){ top[OxO9ab1[0xa]]=true ;if(element[OxO9ab1[0xc]][OxO9ab1[0xb]]){ inp_color[OxO9ab1[0xd]]=revertColor(element[OxO9ab1[0xc]].color) ; inp_color[OxO9ab1[0xc]][OxO9ab1[0xe]]=inp_color[OxO9ab1[0xd]] ; inp_color_preview[OxO9ab1[0xc]][OxO9ab1[0xe]]=inp_color[OxO9ab1[0xd]] ;} ;if(element[OxO9ab1[0xf]]){ inc_class[OxO9ab1[0xd]]=element[OxO9ab1[0xf]] ;} ;if(element[OxO9ab1[0x10]]){ inp_title[OxO9ab1[0xd]]=element[OxO9ab1[0x10]] ;} ;if(element[OxO9ab1[0x11]]){ sel_target[OxO9ab1[0xd]]=element[OxO9ab1[0x11]] ;} ;if(element[OxO9ab1[0x12]]<=0x0){ inp_index[OxO9ab1[0xd]]=OxO9ab1[0x13] ;} else { inp_index[OxO9ab1[0xd]]=element[OxO9ab1[0x12]] ;} ;if(element[OxO9ab1[0x14]]){ inp_access[OxO9ab1[0xd]]=element[OxO9ab1[0x14]] ;} ; inp_id[OxO9ab1[0xd]]=element[OxO9ab1[0x15]] ;var src=OxO9ab1[0x13];if(element.getAttribute(OxO9ab1[0x16])){ src=element.getAttribute(OxO9ab1[0x16]) ;} ;if(element.getAttribute(OxO9ab1[0x17])){ src=element.getAttribute(OxO9ab1[0x17]) ;} ; TargetUrl[OxO9ab1[0xd]]=src ;} ; do_preview() ; function do_preview(){ divpreview[OxO9ab1[0x18]]=OxO9ab1[0x13] ;var Oxba=TargetUrl[OxO9ab1[0xd]];if(Oxba==OxO9ab1[0x13]){return ;} ;var Ox551=Oxba.substring(Oxba.lastIndexOf(OxO9ab1[0x19])).toLowerCase();switch(Ox551){case OxO9ab1[0x29]:case OxO9ab1[0x28]:case OxO9ab1[0x27]:case OxO9ab1[0x26]:case OxO9ab1[0x25]: divpreview[OxO9ab1[0x18]]=OxO9ab1[0x1a]+Oxba+OxO9ab1[0x1b] ;break ;case OxO9ab1[0x24]:var Ox563=OxO9ab1[0x1c]+Oxba+OxO9ab1[0x1d]; divpreview[OxO9ab1[0x18]]=Ox563 ;break ;case OxO9ab1[0x23]:case OxO9ab1[0x22]:case OxO9ab1[0x21]:case OxO9ab1[0x20]:var Oxbd=OxO9ab1[0x1e]+Oxba+OxO9ab1[0x1f]; divpreview[OxO9ab1[0x18]]=Oxbd ;break ;;;;;;;;;;;} ;}  ; function do_insert(){ element[OxO9ab1[0xf]]=inc_class[OxO9ab1[0xd]] ; element[OxO9ab1[0x11]]=sel_target[OxO9ab1[0xd]] ; element[OxO9ab1[0x10]]=inp_title[OxO9ab1[0xd]] ; element[OxO9ab1[0x16]]=TargetUrl[OxO9ab1[0xd]] ; element.setAttribute(OxO9ab1[0x17],TargetUrl.value) ; element[OxO9ab1[0x12]]=inp_index[OxO9ab1[0xd]] ; element[OxO9ab1[0x14]]=inp_access[OxO9ab1[0xd]] ; element[OxO9ab1[0x15]]=inp_id[OxO9ab1[0xd]] ;if(element[OxO9ab1[0x10]]==OxO9ab1[0x13]){ element.removeAttribute(OxO9ab1[0x10]) ;} ;if(element[OxO9ab1[0x11]]==OxO9ab1[0x13]){ element.removeAttribute(OxO9ab1[0x11]) ;} ;if(element[OxO9ab1[0xf]]==OxO9ab1[0x13]){ element.removeAttribute(OxO9ab1[0x2a]) ;} ;if(element[OxO9ab1[0x12]]==OxO9ab1[0x13]){ element.removeAttribute(OxO9ab1[0x12]) ;} ;if(element[OxO9ab1[0x14]]==OxO9ab1[0x13]){ element.removeAttribute(OxO9ab1[0x14]) ;} ;if(element[OxO9ab1[0x15]]==OxO9ab1[0x13]){ element.removeAttribute(OxO9ab1[0x15]) ;} ;try{ element[OxO9ab1[0xc]][OxO9ab1[0xb]]=inp_color[OxO9ab1[0xd]] ;} catch(er){ element[OxO9ab1[0xc]][OxO9ab1[0xb]]=OxO9ab1[0x13] ;} ;var Oxaf=element[OxO9ab1[0x18]];switch(Oxaf.toLowerCase()){case OxO9ab1[0x30]:case OxO9ab1[0x2f]:case OxO9ab1[0x2e]:case OxO9ab1[0x2d]:case OxO9ab1[0x2c]:case OxO9ab1[0x2b]: element[OxO9ab1[0x18]]=OxO9ab1[0x13] ;break ;default:break ;;;;;;;;} ;if(element[OxO9ab1[0x18]]==OxO9ab1[0x13]){ element[OxO9ab1[0x18]]=element[OxO9ab1[0x10]]||element[OxO9ab1[0x16]]||element[OxO9ab1[0x31]]||OxO9ab1[0x32] ;} ; top[OxO9ab1[0x33]]=element ; top.close() ;}  ; function do_cancel(){ top[OxO9ab1[0x33]]=null ; top.close() ;}  ; function SelectColor(Ox19a,Ox566){var Ox567=OxO9ab1[0x34]; showModalDialog(Ox567,null,_colorpickerDialogFeature,function (Ox2dc,Ox18d){if(Ox18d[OxO9ab1[0x33]]){ document.getElementById(Ox19a)[OxO9ab1[0xd]]=Ox18d[OxO9ab1[0x33]].toUpperCase() ; document.getElementById(Ox19a)[OxO9ab1[0xc]][OxO9ab1[0xe]]=Ox18d[OxO9ab1[0x33]] ; Ox566[OxO9ab1[0xc]][OxO9ab1[0xe]]=Ox18d[OxO9ab1[0x33]] ;} ;} ) ;}  ;
		</script>
	</body>
</HTML>
