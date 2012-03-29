<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<%
	string QUERY_STRING=Request.ServerVariables["QUERY_STRING"];
%>
<html>
	<head>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='style.css'>
		<script src=dialog.js></script><script src=../_shared.js></script>
		<script src="filebrowserpage.js"></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxOfd4a=["disabled","srcElement","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxOfd4a[0x1]][OxOfd4a[0x0]]){ alert(OxOfd4a[0x2]) ;return false;} ;var Ox2fb=prompt(OxOfd4a[0x3],OxOfd4a[0x4]);if(Ox2fb){ document.getElementById(OxOfd4a[0x6])[OxOfd4a[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxOfd4a[0x1]][OxOfd4a[0x0]]){ alert(OxOfd4a[0x2]) ;return false;} ;var Ox2fb=prompt(OxOfd4a[0x7],OxOfd4a[0x8]);if(Ox2fb){ document.getElementById(OxOfd4a[0x6])[OxOfd4a[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxOfd4a[0x1]][OxOfd4a[0x0]]){ alert(OxOfd4a[0x2]) ;return false;} ;var Ox2fb=prompt(OxOfd4a[0x7],OxOfd4a[0x8]);if(Ox2fb){ document.getElementById(OxOfd4a[0x6])[OxOfd4a[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxOfd4a[0x1]][OxOfd4a[0x0]]){ alert(OxOfd4a[0x2]) ;return false;} ;return confirm(OxOfd4a[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxOfd4a[0x0]]){ alert(OxOfd4a[0x2]) ;return false;} ; row=Oxb9[OxOfd4a[0xa]][OxOfd4a[0xa]] ;var Ox550=row[OxOfd4a[0xb]];var name;if(row[OxOfd4a[0xc]]){ name=prompt(OxOfd4a[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxOfd4a[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxOfd4a[0xd])); name=prompt(OxOfd4a[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&(name!=row[OxOfd4a[0xb]])){ document.getElementById(OxOfd4a[0xf])[OxOfd4a[0x5]]=OxOfd4a[0x10] ; document.getElementById(OxOfd4a[0x6])[OxOfd4a[0x5]]=(row[OxOfd4a[0xc]]?OxOfd4a[0x12]:OxOfd4a[0x13])+OxOfd4a[0x14]+row[OxOfd4a[0x11]]+OxOfd4a[0x14]+name ; postback() ;} ; event[OxOfd4a[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxOfd4a[0x17]][OxOfd4a[0x16]]=OxOfd4a[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxOfd4a[0x17]][OxOfd4a[0x16]]=OxOfd4a[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxOfd4a[0xc]]){if(event[OxOfd4a[0x1]][OxOfd4a[0x19]]==OxOfd4a[0x1a]){return ;} ; document.getElementById(OxOfd4a[0xf])[OxOfd4a[0x5]]=OxOfd4a[0x1b] ; document.getElementById(OxOfd4a[0x6])[OxOfd4a[0x5]]=Oxc3.getAttribute(OxOfd4a[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxOfd4a[0x11]); document.getElementById(OxOfd4a[0x1c])[OxOfd4a[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxOfd4a[0x1d]); document.getElementById(OxOfd4a[0x1e])[OxOfd4a[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
	</head>
	<body bottomMargin="0" topMargin="10" leftmargin="3" marginwidth="0" marginheight="0">
		<form runat="server" enctype="multipart/form-data" id="Form1">
			<!-- start hidden -->
			<script>
        var OxO506e=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO506e[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO506e[0x2])[OxO506e[0x1]]){ alert(document.getElementById(OxO506e[0x2]).value) ;} ; document.getElementById(OxO506e[0x2])[OxO506e[0x1]]=OxO506e[0x3] ; document.getElementById(OxO506e[0x4])[OxO506e[0x1]]=OxO506e[0x3] ; document.getElementById(OxO506e[0x5])[OxO506e[0x1]]=OxO506e[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory" NAME="hiddenDirectory" />
			<input type="hidden" runat="server" id="hiddenFile" NAME="hiddenFile" /> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert" NAME="hiddenAlert" />
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange"
				NAME="hiddenAction" /> <input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData" NAME="hiddenActionData" />
			<!-- end hidden -->
			<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
				<tr>
					<td width="20" nowrap>
						<asp:Image ID="Image1" Runat="server" ImageUrl="../images/openfolder.gif"></asp:Image>
					</td>
					<td width="200" class="normal" nowrap>
						<asp:Label Runat="server" ID="FolderDescription"></asp:Label>
					</td>
					<td width=100%>
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
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> <IMG src="../images/bestfit.gif" onclick="BestFit();" Alt="[[BestFit]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> <IMG src="../images/Actualsize.gif" onclick="Actualsize();" Alt="[[ActualSize]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> <IMG src="../images/resize.gif" id="img_AutoThumbnail" onclick="AutoThumbnail();" Alt="[[AutoThumbnail]]" class="dialogButton"
							onmouseover="CuteEditor_ColorPicker_ButtonOver(this);"> 
							<% if(secset.AllowModify) {%>
							<IMG  class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" src="../images/imageeditor.gif" id="img_ImageEditor" onclick="ImageEditor();" Alt="[[ImageEditor]]">
							<%
							}
							else
							{
							%>
								<IMG  class="CuteEditorButtonDisabled" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" src="../images/imageeditor.gif" Alt="[[ImageEditor]]">
							<%
							}
							%>
					</td>
				</tr>
			</table>
			
			<table border="0" cellspacing="0" cellpadding="2" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="260">
						<div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 260; HEIGHT: 250px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
							<asp:Table ID="FoldersAndFiles" Runat="server" CellSpacing="1" CellPadding="0" Width="100%" CssClass="sortable">
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
									<asp:TableHeaderCell ID="name_Cell" Wrap=True Width="125px" CssClass="filelistHeadCol" Font-Bold="False">[[Name]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="size_Cell" Width="62px" CssClass="filelistHeadCol" Font-Bold="False">[[Count]]/[[Size]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell"  Width="16px">&nbsp;</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_space" Width="1px"></asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td valign="top" nowrap width="320">
						<div style="border:1.5pt inset; Padding: 0 0 0 0; vertical-align: top; overflow: auto; WIDTH: 280px; HEIGHT: 250px;  BACKGROUND-COLOR: white;">
							<div id="divpreview" style="BACKGROUND-COLOR: white; height:100%;width:100%">
								<img id="img_demo" src="../images/1x1.gif">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" height=2>
					</td>
				</tr>
			</table>
			
			<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center">
				<tr>
					<td valign="top">
						<fieldset style="width:480">
							<legend>
								[[Insert]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td>
										<TABLE id="Table8" cellSpacing="0" cellPadding="2" border="0" class="normal">
											<TR>
												<TD vAlign="middle">URL:</TD>
												<td><input type="text" id="TargetUrl" style="width:400" name="TargetUrl" runat="server"></td>
											</TR>
										</TABLE>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset style="width:480">
							<legend>
								[[Upload]] (Max file size allowed
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxImageSize * 1024)%>
								)</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" class="normal">
											<tr>
												<td>[[Upload]]:</td>
												<td>
													<input id="InputFile" size="40" type="file" runat="server" style="height:20px">
													<asp:Label ID="Label_PictureUpload" Runat="server">&nbsp;</asp:Label>
													<asp:Button ID="uploadButton" Text="[[Upload]]" Runat="server" OnClick="uploadButton_Click" />&nbsp;
													<asp:Label ID="uploadResult" Runat="server"></asp:Label></td>
											</tr>
											<tr>
												<td height="10" colspan="2">
												</td>
											</tr>
											<tr>
												<td height="5" colspan="2">
												</td>
											</tr>
											<tr>
												<td colspan="2">
										<% if(secset.RestrictUploadedImageDimension) {%>
										<li>
											Max image dimension is
											<%= secset.MaxImageWidth%>
											x
											<%= secset.MaxImageHeight%>
											pixels.
										</li>
										<li>
											Auto resize uploaded images function is
											<%= secset.AutoResizeUploadedImages? "on":"off" %>
											.</li>
										<%}%>
										<li>
											<nobr>
											Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxImageFolderSize * 1024)%>.
											Used: <%= CuteEditor.Impl.FileStorage.FormatSize(fs.GetDirectorySize(fs.VirtualRoot)) %>
											<span style="background-color:green;height:3px;width:40px;font-size:3px">
												<span style="background-color:red;height:3px;width:<%= GetUsedSpaceBarWidth() %>px;font-size:3px"></span>
											</span>
											</nobr>
										</li>
												</td>
											</tr>
											
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<div align="center" style="padding-top:4px;">
							<input class="inputbuttoninsert" type="button" value="[[OK]]" onclick="do_insert()" id="Button1"
								runat="server" NAME="Button1">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2" runat="server" NAME="Button2">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script runat="server">
	protected override void InitOfType()
	{
		fs.VirtualRoot=CuteEditor.EditorUtility.ProcessWebPath(Context,null,secset.ImageGalleryPath).TrimEnd('/')+"/";
	}
	
    protected override void GetFiles(ArrayList files)
    {
        foreach (string ext in secset.ImageFilters)
        {
            if (ext == null || ext.Length == 0) continue;

            files.AddRange(fs.GetFileItems(CurrentDirectory, secset.FileNamePrefix + "*" + ext));
        }
    }
    protected override bool AllowFileName(string filename)
    {
        filename = filename.ToLower();
        foreach (string ext in secset.ImageFilters)
        {
            if (ext == null || ext.Length == 0) continue;
            if(filename.EndsWith(ext.ToLower()))
                return true;
        }
        return false;
    }
    
    protected int GetUsedSpaceBarWidth()
    {
      int w = Convert.ToInt32(40*fs.GetDirectorySize(fs.VirtualRoot)/(secset.MaxImageFolderSize * 1024));
      if(w<1)
		w=1;
		
	  if(w>40)
		w=40;
		
      return w;      
    }
    
    protected override string CheckUploadData(ref byte[] data)
    {  
		if (fs.GetDirectorySize(fs.VirtualRoot) >= secset.MaxImageFolderSize * 1024)
           return "Image folder size exceeds the limit: "+ CuteEditor.Impl.FileStorage.FormatSize(secset.MaxImageFolderSize * 1024);
          
      
        System.Drawing.Image img;
        try
        {
            img = System.Drawing.Image.FromStream(new System.IO.MemoryStream(data));
        }
        catch
        {
            return "Image is in the wrong format.";
        }

        //let base class to implement
        /*
        
        if (data.Length >= secset.MaxImageSize * 1024)
           return "Image size exceeds "+CuteEditor.Impl.FileStorage.FormatSize(secset.MaxImageSize * 1024)+" limit: "+ CuteEditor.Impl.FileStorage.FormatSize(data.Length);


        if(secset.RestrictUploadedImageDimension)
        {
			if(secset.AutoResizeUploadedImages)
			{
				return null;//let base class implement the secset.AutoResizeUploadedImages
			}
			else
			{
				if ((img.Width > secset.MaxImageWidth) || ((img.Height > secset.MaxImageHeight)))
					return String.Format("Image dimension ({0} x {1} pixels) exceeding limits.", img.Width, img.Height);
			}	
		}
		*/
		
        return null;
    }
	</script>
	<script src="addvars.js"></script>
	<script>
			var OxOc887=["value","TargetUrl","","src",".aspx","display","style","img_AutoThumbnail","none","img_ImageEditor","returnValue","zoom","height","width","Width","Height","IMG","length","[[SelectImagetoThumbnail]]","[[_CuteEditorResource_]]","\x26p=","dialogWidth:310px;dialogHeight:200px;help:no;scroll:no;status:no;resizable:0;","hiddenAction","refresh","[[SelectImagetoEdit]]","dialogWidth:676px;dialogHeight:500px;help:no;scroll:no;status:no;resizable:0;"]; do_preview() ; function do_preview(){var Oxba=document.getElementById(OxOc887[0x1])[OxOc887[0x0]];if(Oxba==OxOc887[0x2]){return ;} ;var img2=GetPreviewedImage(); img2[OxOc887[0x3]]=Oxba ; Oxba=Oxba.toLowerCase() ;if(Oxba.indexOf(OxOc887[0x4])!=-0x1){ document.getElementById(OxOc887[0x7])[OxOc887[0x6]][OxOc887[0x5]]=OxOc887[0x8] ; document.getElementById(OxOc887[0x9])[OxOc887[0x6]][OxOc887[0x5]]=OxOc887[0x8] ;} ;}  ; function do_insert(){ top[OxOc887[0xa]]=document.getElementById(OxOc887[0x1])[OxOc887[0x0]] ; top.close() ;}  ; function do_cancel(){ top[OxOc887[0xa]]=null ; top.close() ;}  ; function Zoom_In(){if(divpreview[OxOc887[0x6]][OxOc887[0xb]]!=0x0){ divpreview[OxOc887[0x6]][OxOc887[0xb]]*=1.2 ;} else { divpreview[OxOc887[0x6]][OxOc887[0xb]]=1.2 ;} ;}  ; function Zoom_Out(){if(divpreview[OxOc887[0x6]][OxOc887[0xb]]!=0x0){ divpreview[OxOc887[0x6]][OxOc887[0xb]]*=0.8 ;} else { divpreview[OxOc887[0x6]][OxOc887[0xb]]=0.8 ;} ;}  ; function BestFit(){var Oxb9=GetPreviewedImage();if(!Oxb9){return ;} ;var Ox2e2=0x118;var Ox81=0x122; divpreview[OxOc887[0x6]][OxOc887[0xb]]=0x1/Math.max(Oxb9[OxOc887[0xd]]/Ox81,Oxb9[OxOc887[0xc]]/Ox2e2) ;}  ; function Actualsize(){try{var Oxb9= new Image(); Oxb9[OxOc887[0x3]]=document.getElementById(OxOc887[0x1])[OxOc887[0x0]] ;if(Oxb9[OxOc887[0xd]]){ document.getElementById(OxOc887[0xe])[OxOc887[0x0]]=Oxb9[OxOc887[0xd]] ;} ;if(Oxb9[OxOc887[0xc]]){ document.getElementById(OxOc887[0xf])[OxOc887[0x0]]=Oxb9[OxOc887[0xc]] ;} ;} catch(er){} ; do_preview() ; divpreview[OxOc887[0x6]][OxOc887[0xb]]=0x1 ;}  ; function GetPreviewedImage(){var Ox355=divpreview.getElementsByTagName(OxOc887[0x10]);if(Ox355&&(Ox355[OxOc887[0x11]]>0x0)){return Ox355.item(0x0);} else {return null;} ;}  ; function AutoThumbnail(){if(document.getElementById(OxOc887[0x1])[OxOc887[0x0]]==OxOc887[0x2]){ alert(OxOc887[0x12]) ;return false;} ;var src=document.getElementById(OxOc887[0x1])[OxOc887[0x0]];var Ox2f=OxOc887[0x13];var Ox422=showModalDialog('Thumbnail.aspx?<%= QUERY_STRING %>&f='+src+OxOc887[0x14]+Ox2f+OxOc887[0x2],src,OxOc887[0x15]); document.getElementById(OxOc887[0x1])[OxOc887[0x0]]=Ox422 ; Actualsize() ; document.getElementById(OxOc887[0x16])[OxOc887[0x0]]=OxOc887[0x17] ; postback() ;}  ; function ImageEditor(){if(document.getElementById(OxOc887[0x1])[OxOc887[0x0]]==OxOc887[0x2]){ alert(OxOc887[0x18]) ;return false;} ;var Oxb9= new Image(); Oxb9[OxOc887[0x3]]=document.getElementById(OxOc887[0x1])[OxOc887[0x0]] ;var src=document.getElementById(OxOc887[0x1])[OxOc887[0x0]];var Ox2f=OxOc887[0x13];var arr=showModalDialog('../ImageEditor/ImageEditor.aspx?<%= QUERY_STRING %>&f='+src+OxOc887[0x14]+Ox2f+OxOc887[0x2],Oxb9,OxOc887[0x19]); document.getElementById(OxOc887[0x1])[OxOc887[0x0]]=src ; do_preview() ;}  ;	
	</script>
</html>
