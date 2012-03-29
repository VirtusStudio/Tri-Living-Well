<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<HTML>
	<HEAD>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='style.css'>
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script src="filebrowserpage.js"></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxO76b5=["disabled","srcElement","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxO76b5[0x1]][OxO76b5[0x0]]){ alert(OxO76b5[0x2]) ;return false;} ;var Ox2fb=prompt(OxO76b5[0x3],OxO76b5[0x4]);if(Ox2fb){ document.getElementById(OxO76b5[0x6])[OxO76b5[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxO76b5[0x1]][OxO76b5[0x0]]){ alert(OxO76b5[0x2]) ;return false;} ;var Ox2fb=prompt(OxO76b5[0x7],OxO76b5[0x8]);if(Ox2fb){ document.getElementById(OxO76b5[0x6])[OxO76b5[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxO76b5[0x1]][OxO76b5[0x0]]){ alert(OxO76b5[0x2]) ;return false;} ;var Ox2fb=prompt(OxO76b5[0x7],OxO76b5[0x8]);if(Ox2fb){ document.getElementById(OxO76b5[0x6])[OxO76b5[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxO76b5[0x1]][OxO76b5[0x0]]){ alert(OxO76b5[0x2]) ;return false;} ;return confirm(OxO76b5[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxO76b5[0x0]]){ alert(OxO76b5[0x2]) ;return false;} ; row=Oxb9[OxO76b5[0xa]][OxO76b5[0xa]] ;var Ox550=row[OxO76b5[0xb]];var name;if(row[OxO76b5[0xc]]){ name=prompt(OxO76b5[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxO76b5[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxO76b5[0xd])); name=prompt(OxO76b5[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxO76b5[0xb]]){ document.getElementById(OxO76b5[0xf])[OxO76b5[0x5]]=OxO76b5[0x10] ; document.getElementById(OxO76b5[0x6])[OxO76b5[0x5]]=(row[OxO76b5[0xc]]?OxO76b5[0x12]:OxO76b5[0x13])+OxO76b5[0x14]+row[OxO76b5[0x11]]+OxO76b5[0x14]+name ; postback() ;} ; event[OxO76b5[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxO76b5[0x17]][OxO76b5[0x16]]=OxO76b5[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxO76b5[0x17]][OxO76b5[0x16]]=OxO76b5[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxO76b5[0xc]]){if(event[OxO76b5[0x1]][OxO76b5[0x19]]==OxO76b5[0x1a]){return ;} ; document.getElementById(OxO76b5[0xf])[OxO76b5[0x5]]=OxO76b5[0x1b] ; document.getElementById(OxO76b5[0x6])[OxO76b5[0x5]]=Oxc3.getAttribute(OxO76b5[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxO76b5[0x11]); document.getElementById(OxO76b5[0x1c])[OxO76b5[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxO76b5[0x1d]); document.getElementById(OxO76b5[0x1e])[OxO76b5[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
        var OxO934d=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO934d[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO934d[0x2])[OxO934d[0x1]]){ alert(document.getElementById(OxO934d[0x2]).value) ;} ; document.getElementById(OxO934d[0x2])[OxO934d[0x1]]=OxO934d[0x3] ; document.getElementById(OxO934d[0x4])[OxO934d[0x1]]=OxO934d[0x3] ; document.getElementById(OxO934d[0x5])[OxO934d[0x1]]=OxO934d[0x3] ;}  ;
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
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> <IMG src="../images/Actualsize.gif" onclick="Actualsize();" Alt="[[ActualSize]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> 
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="2" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="270">
						<div style="BORDER: 1.5pt inset; VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 270; HEIGHT: 240px; BACKGROUND-COLOR: white">
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
						<div style="paddng: 0 0 0 0; BORDER: 1.5pt inset; VERTICAL-ALIGN: top; OVERFLOW: auto; WIDTH: 300px; BORDER-BOTTOM: 1.5pt inset; HEIGHT: 240px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
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
							<table border="0" cellpadding="4" cellspacing="0" ID="Table3">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" ID="Table4" class="normal">
											<TR>
												<TD>[[Target]]</TD>
												<TD><SELECT id="sel_target">
														<OPTION value="">[[NotSet]]</OPTION>
														<OPTION value="_blank">[[Newwindow]]</OPTION>
														<OPTION value="_self">[[Samewindow]]</OPTION>
														<OPTION value="_top">[[Topmostwindow]]</OPTION>
														<OPTION value="_parent">[[Parentwindow]]</OPTION>
													</SELECT></TD>
											</TR>
											<tr>
												<td>[[Color]]:</td>
												<td><input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px" runat="server">
													<img src="../images/colorpicker.gif" id="inp_color_preview" align="absMiddle" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
														oncolorchange="inp_color.value=this.selectedColor; inp_color.style.backgroundColor=this.selectedColor;inp_color_preview.style.backgroundColor=this.selectedColor">
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
												<td><INPUT id="inp_index" type="text" size="14" maxlength=5 style="WIDTH:80px" name="inp_index"  onkeypress="event.returnValue=IsDigit();"></td>
											</tr>
											<tr>
												<td>[[AccessKey]]:</td>
												<td><INPUT id="inp_access" type="text" size="14"  maxlength=1 style="WIDTH:80px" name="inp_access"  onkeypress="event.returnValue=IsDigit();"></td>
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
							<table border="0" cellpadding="4" cellspacing="0">
								<tr>
									<td>
										<TABLE id="Table8" cellSpacing="0" cellPadding="1" border="0" class="normal">
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
							<table border="0" cellspacing="1" cellpadding="0" width="98%" align="center" class="normal">
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
											<nobr>
											Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxDocumentFolderSize * 1024)%>.
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
							<input class="inputbuttoninsert" type="button" value="[[Insert]]" onclick="do_insert()"
								id="Button1" NAME="Button1">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2" NAME="Button2">
						</div>
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

			var OxO5ca9=["dialogArguments","TargetUrl","sel_target","inp_color","inc_class","inp_title","inp_color_preview","inp_id","inp_access","inp_index","frameloaded","color","style","value","backgroundColor","className","title","target","tabIndex","accessKey","href_cetemp","length","href","","id","innerHTML",".","\x3CIMG src=\x27","\x27\x3E","\x3Cembed src=\x22","\x22 quality=\x22high\x22 width=\x2290%\x22 height=\x2290%\x22 type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","\x3Cembed name=\x22MediaPlayer1\x22 src=\x22","\x22 autostart=-1 showcontrols=-1  type=\x22application/x-mplayer2\x22 width=\x22240\x22 height=\x22200\x22 pluginspage=\x22http://www.microsoft.com/Windows/MediaPlayer\x22 \x3E\x3C/embed\x3E\x0A",".mpeg",".mp3",".mpg",".avi",".swf",".bmp",".png",".gif",".jpg",".jpeg","\x3Cp\x3E\x26nbsp;\x3C/p\x3E","\x3Cp\x3E\x26#160;\x3C/p\x3E","\x3Cp\x3E\x3C/p\x3E","\x3Cdiv\x3E\x26#160;\x3C/div\x3E","\x3Cdiv\x3E\x26nbsp;\x3C/div\x3E","\x3Cdiv\x3E\x3C/div\x3E","name","link","returnValue","zoom"];var element=top[OxO5ca9[0x0]];var TargetUrl=document.getElementById(OxO5ca9[0x1]);var sel_target=document.getElementById(OxO5ca9[0x2]);var inp_color=document.getElementById(OxO5ca9[0x3]);var inc_class=document.getElementById(OxO5ca9[0x4]);var inp_title=document.getElementById(OxO5ca9[0x5]);var inp_color_preview=document.getElementById(OxO5ca9[0x6]);var inp_id=document.getElementById(OxO5ca9[0x7]);var inp_access=document.getElementById(OxO5ca9[0x8]);var inp_index=document.getElementById(OxO5ca9[0x9]);if(!top[OxO5ca9[0xa]]){ top[OxO5ca9[0xa]]=true ;if(element[OxO5ca9[0xc]][OxO5ca9[0xb]]){ inp_color[OxO5ca9[0xd]]=element[OxO5ca9[0xc]][OxO5ca9[0xb]] ; inp_color[OxO5ca9[0xc]][OxO5ca9[0xe]]=inp_color[OxO5ca9[0xd]] ; inp_color_preview[OxO5ca9[0xc]][OxO5ca9[0xe]]=inp_color[OxO5ca9[0xd]] ;} ;if(element[OxO5ca9[0xf]]){ inc_class[OxO5ca9[0xd]]=element[OxO5ca9[0xf]] ;} ;if(element[OxO5ca9[0x10]]){ inp_title[OxO5ca9[0xd]]=element[OxO5ca9[0x10]] ;} ;if(element[OxO5ca9[0x11]]){ sel_target[OxO5ca9[0xd]]=element[OxO5ca9[0x11]] ;} ;if(element[OxO5ca9[0x12]]){ inp_index[OxO5ca9[0xd]]=element[OxO5ca9[0x12]] ;} ;if(element[OxO5ca9[0x13]]){ inp_access[OxO5ca9[0xd]]=element[OxO5ca9[0x13]] ;} ;var src=element.getAttribute(OxO5ca9[0x14]);if(!src||src[OxO5ca9[0x15]]==0x0){ src=element.getAttribute(OxO5ca9[0x16],0x2)+OxO5ca9[0x17] ;} ; TargetUrl[OxO5ca9[0xd]]=src ; inp_id[OxO5ca9[0xd]]=element[OxO5ca9[0x18]] ;} ; do_preview() ; function do_preview(){ divpreview[OxO5ca9[0x19]]=OxO5ca9[0x17] ;var Oxba=TargetUrl[OxO5ca9[0xd]];if(Oxba==OxO5ca9[0x17]){return ;} ;var Ox551=Oxba.substring(Oxba.lastIndexOf(OxO5ca9[0x1a])).toLowerCase();switch(Ox551){case OxO5ca9[0x2a]:case OxO5ca9[0x29]:case OxO5ca9[0x28]:case OxO5ca9[0x27]:case OxO5ca9[0x26]: divpreview[OxO5ca9[0x19]]=OxO5ca9[0x1b]+Oxba+OxO5ca9[0x1c] ;break ;case OxO5ca9[0x25]:var Ox563=OxO5ca9[0x1d]+Oxba+OxO5ca9[0x1e]; divpreview[OxO5ca9[0x19]]=Ox563 ;break ;case OxO5ca9[0x24]:case OxO5ca9[0x23]:case OxO5ca9[0x22]:case OxO5ca9[0x21]:var Oxbd=OxO5ca9[0x1f]+Oxba+OxO5ca9[0x20]; divpreview[OxO5ca9[0x19]]=Oxbd ;break ;;;;;;;;;;;} ;}  ; function do_insert(){ element[OxO5ca9[0xf]]=inc_class[OxO5ca9[0xd]] ; element[OxO5ca9[0x11]]=sel_target[OxO5ca9[0xd]] ; element[OxO5ca9[0x10]]=inp_title[OxO5ca9[0xd]] ; element[OxO5ca9[0x16]]=TargetUrl[OxO5ca9[0xd]] ; element.setAttribute(OxO5ca9[0x14],TargetUrl.value) ; element[OxO5ca9[0x12]]=inp_index[OxO5ca9[0xd]] ; element[OxO5ca9[0x13]]=inp_access[OxO5ca9[0xd]] ; element[OxO5ca9[0x18]]=inp_id[OxO5ca9[0xd]] ;if(element[OxO5ca9[0x10]]==OxO5ca9[0x17]){ element.removeAttribute(OxO5ca9[0x10]) ;} ;if(element[OxO5ca9[0x11]]==OxO5ca9[0x17]){ element.removeAttribute(OxO5ca9[0x11]) ;} ;if(element[OxO5ca9[0xf]]==OxO5ca9[0x17]){ element.removeAttribute(OxO5ca9[0xf]) ;} ;if(element[OxO5ca9[0x12]]==OxO5ca9[0x17]){ element.removeAttribute(OxO5ca9[0x12]) ;} ;if(element[OxO5ca9[0x13]]==OxO5ca9[0x17]){ element.removeAttribute(OxO5ca9[0x13]) ;} ;try{ element[OxO5ca9[0xc]][OxO5ca9[0xb]]=inp_color[OxO5ca9[0xd]] ;} catch(er){ element[OxO5ca9[0xc]][OxO5ca9[0xb]]=OxO5ca9[0x17] ;} ;var Oxaf=element[OxO5ca9[0x19]];switch(Oxaf.toLowerCase()){case OxO5ca9[0x30]:case OxO5ca9[0x2f]:case OxO5ca9[0x2e]:case OxO5ca9[0x2d]:case OxO5ca9[0x2c]:case OxO5ca9[0x2b]: element[OxO5ca9[0x19]]=OxO5ca9[0x17] ;break ;default:break ;;;;;;;;} ;if(element[OxO5ca9[0x19]]==OxO5ca9[0x17]){ element[OxO5ca9[0x19]]=element[OxO5ca9[0x10]]||element[OxO5ca9[0x16]]||element[OxO5ca9[0x31]]||OxO5ca9[0x32] ;} ; top[OxO5ca9[0x33]]=element ; top.close() ;}  ; function do_cancel(){ top[OxO5ca9[0x33]]=null ; top.close() ;}  ; function Zoom_In(){if(divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]!=0x0){ divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]*=1.2 ;} else { divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]=1.2 ;} ;}  ; function Zoom_Out(){if(divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]!=0x0){ divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]*=0.8 ;} else { divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]=0.8 ;} ;}  ; function Actualsize(){ divpreview[OxO5ca9[0xc]][OxO5ca9[0x34]]=0x1 ;}  ;
		</script>
	</body>
</HTML>
