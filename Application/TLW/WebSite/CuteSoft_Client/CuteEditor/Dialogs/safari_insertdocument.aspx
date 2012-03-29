<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<HTML>
	<HEAD>
		<title>[[InsertDocument]] 
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
		var OxOf768=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxOf768[0x1]][OxOf768[0x0]]){ alert(OxOf768[0x2]) ;return false;} ;var Ox2fb=prompt(OxOf768[0x3],OxOf768[0x4]);if(Ox2fb){ document.getElementById(OxOf768[0x6])[OxOf768[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxOf768[0x1]][OxOf768[0x0]]){ alert(OxOf768[0x2]) ;return false;} ;var Ox2fb=prompt(OxOf768[0x7],OxOf768[0x8]);if(Ox2fb){ document.getElementById(OxOf768[0x6])[OxOf768[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxOf768[0x1]][OxOf768[0x0]]){ alert(OxOf768[0x2]) ;return false;} ;var Ox2fb=prompt(OxOf768[0x7],OxOf768[0x8]);if(Ox2fb){ document.getElementById(OxOf768[0x6])[OxOf768[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxOf768[0x1]][OxOf768[0x0]]){ alert(OxOf768[0x2]) ;return false;} ;return confirm(OxOf768[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxOf768[0x0]]){ alert(OxOf768[0x2]) ;return false;} ; row=Oxb9[OxOf768[0xa]][OxOf768[0xa]] ;var Ox550=row[OxOf768[0xb]];var name;if(row[OxOf768[0xc]]){ name=prompt(OxOf768[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxOf768[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxOf768[0xd])); name=prompt(OxOf768[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxOf768[0xb]]){ document.getElementById(OxOf768[0xf])[OxOf768[0x5]]=OxOf768[0x10] ; document.getElementById(OxOf768[0x6])[OxOf768[0x5]]=(row[OxOf768[0xc]]?OxOf768[0x12]:OxOf768[0x13])+OxOf768[0x14]+row[OxOf768[0x11]]+OxOf768[0x14]+name ; postback() ;} ; event[OxOf768[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxOf768[0x17]][OxOf768[0x16]]=OxOf768[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxOf768[0x17]][OxOf768[0x16]]=OxOf768[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxOf768[0xc]]){if(event[OxOf768[0x1]][OxOf768[0x19]]==OxOf768[0x1a]){return ;} ; document.getElementById(OxOf768[0xf])[OxOf768[0x5]]=OxOf768[0x1b] ; document.getElementById(OxOf768[0x6])[OxOf768[0x5]]=Oxc3.getAttribute(OxOf768[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxOf768[0x11]); document.getElementById(OxOf768[0x1c])[OxOf768[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxOf768[0x1d]); document.getElementById(OxOf768[0x1e])[OxOf768[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
        var OxO2854=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO2854[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO2854[0x2])[OxO2854[0x1]]){ alert(document.getElementById(OxO2854[0x2]).value) ;} ; document.getElementById(OxO2854[0x2])[OxO2854[0x1]]=OxO2854[0x3] ; document.getElementById(OxO2854[0x4])[OxO2854[0x1]]=OxO2854[0x3] ; document.getElementById(OxO2854[0x5])[OxO2854[0x1]]=OxO2854[0x3] ;}  ;
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
					<td valign="top" nowrap width="270">
						<div style="BORDER: 1.5pt inset; VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 270; HEIGHT: 240px; BACKGROUND-COLOR: white">
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
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td width="10">
					</td>
					<td valign="top">
						<div style="paddng: 0 0 0 0; BORDER: 1.5pt inset; VERTICAL-ALIGN: top; OVERFLOW: auto; WIDTH: 280px; BORDER-BOTTOM: 1.5pt inset; HEIGHT: 240px; BACKGROUND-COLOR: white; TEXT-ALIGN: center">
							<div id="divpreview" style="BACKGROUND-COLOR: white" height="100%" width="100%">
								&nbsp;</div>
						</div>
					</td>
				</tr>
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
														<OPTION value="">[[NotSet]]</OPTION>
														<OPTION value="_blank">[[Newwindow]]</OPTION>
														<OPTION value="_self">[[Samewindow]]</OPTION>
														<OPTION value="_top">[[Topmostwindow]]</OPTION>
														<OPTION value="_parent">[[Parentwindow]]</OPTION>
													</SELECT></TD>
											</TR>
											<tr>
												<td>[[Color]]:</td>
												<td><input type="text" id="inp_color" name="inp_color" size="7" style="WIDTH:57px">	
													<img id="inp_color_preview" src="../images/colorpicker.gif" onclick="SelectColor('inp_color','inp_color_preview');"  align="absMiddle">
												</td>
											</tr>
											<tr>
												<td>[[CssClass]]:</td>
												<td><INPUT id="inc_class" type="text" size="14" style="WIDTH:80px" name="inc_class"></td>
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
											Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxDocumentFolderSize * 1024)%>.
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
		
		<script>	
			
			var OxOfb51=["availWidth","availHeight","dialogArguments","opener","editor","editdoc","h","TargetUrl","sel_target","inp_color","inc_class","inp_title","inp_color_preview","frameloaded","innerHTML","","value",".","\x3CIMG src=\x27","\x27\x3E","\x3Cembed src=\x22","\x22 quality=\x22high\x22 width=\x2290%\x22 height=\x2290%\x22 type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","\x3Cembed name=\x22MediaPlayer1\x22 src=\x22","\x22 autostart=-1 showcontrols=-1  type=\x22application/x-mplayer2\x22 width=\x22240\x22 height=\x22200\x22 pluginspage=\x22http://www.microsoft.com/Windows/MediaPlayer\x22 \x3E\x3C/embed\x3E\x0A",".mpeg",".mp3",".mpg",".avi",".swf",".bmp",".png",".gif",".jpg",".jpeg","A","className","target","title","href","color","style","name","link","DIV","Delete","returnValue"]; window.resizeTo(0x258,0x226) ; window.moveTo((screen[OxOfb51[0x0]]-0x258)/0x2,(screen[OxOfb51[0x1]]-0x190)/0x2) ;var dialogArguments=window[OxOfb51[0x3]][OxOfb51[0x2]];var obj=window[OxOfb51[0x3]][OxOfb51[0x2]];var editor=obj[OxOfb51[0x4]];var editdoc=obj[OxOfb51[0x5]];var h=obj[OxOfb51[0x6]]; window.focus() ;var TargetUrl=document.getElementById(OxOfb51[0x7]);var sel_target=document.getElementById(OxOfb51[0x8]);var inp_color=document.getElementById(OxOfb51[0x9]);var inc_class=document.getElementById(OxOfb51[0xa]);var inp_title=document.getElementById(OxOfb51[0xb]);var inp_color_preview=document.getElementById(OxOfb51[0xc]);if(!top[OxOfb51[0xd]]){} ; do_preview() ; function do_preview(){ divpreview[OxOfb51[0xe]]=OxOfb51[0xf] ;var Oxba=TargetUrl[OxOfb51[0x10]];if(Oxba==OxOfb51[0xf]){return ;} ;var Ox551=Oxba.substring(Oxba.lastIndexOf(OxOfb51[0x11])).toLowerCase();switch(Ox551){case OxOfb51[0x21]:case OxOfb51[0x20]:case OxOfb51[0x1f]:case OxOfb51[0x1e]:case OxOfb51[0x1d]: divpreview[OxOfb51[0xe]]=OxOfb51[0x12]+Oxba+OxOfb51[0x13] ;break ;case OxOfb51[0x1c]:var Ox563=OxOfb51[0x14]+Oxba+OxOfb51[0x15]; divpreview[OxOfb51[0xe]]=Ox563 ;break ;case OxOfb51[0x1b]:case OxOfb51[0x1a]:case OxOfb51[0x19]:case OxOfb51[0x18]:var Oxbd=OxOfb51[0x16]+Oxba+OxOfb51[0x17]; divpreview[OxOfb51[0xe]]=Oxbd ;break ;;;;;;;;;;;} ;}  ; function do_insert(){var Ox146=document.createElement(OxOfb51[0x22]); Ox146[OxOfb51[0x23]]=inc_class[OxOfb51[0x10]] ; Ox146[OxOfb51[0x24]]=sel_target[OxOfb51[0x10]] ; Ox146[OxOfb51[0x25]]=inp_title[OxOfb51[0x10]] ; Ox146[OxOfb51[0x26]]=TargetUrl[OxOfb51[0x10]] ;if(Ox146[OxOfb51[0x25]]==OxOfb51[0xf]){ Ox146.removeAttribute(OxOfb51[0x25]) ;} ;try{ Ox146[OxOfb51[0x28]][OxOfb51[0x27]]=inp_color[OxOfb51[0x10]] ;} catch(er){ Ox146[OxOfb51[0x28]][OxOfb51[0x27]]=OxOfb51[0xf] ;} ;if(h==OxOfb51[0xf]){ Ox146[OxOfb51[0xe]]=Ox146[OxOfb51[0x26]]||Ox146[OxOfb51[0x29]]||OxOfb51[0x2a] ;} else { Ox146[OxOfb51[0xe]]=h ;} ;var div=document.createElement(OxOfb51[0x2b]); div.appendChild(Ox146) ; editdoc.execCommand(OxOfb51[0x2c],false,OxOfb51[0xf]) ; editor.PasteHTML(div.innerHTML) ; top.close() ;}  ; function do_cancel(){ top[OxOfb51[0x2d]]=null ; top.close() ;}  ; function SelectColor(Ox683,Ox19a){var Ox3b6= new ColorPicker(Ox19a,Ox683); Ox3b6.showPopup() ;}  ;

		</script>
	</body>
</HTML>
