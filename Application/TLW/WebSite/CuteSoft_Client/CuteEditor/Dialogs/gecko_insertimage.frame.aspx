<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<%
	string QUERY_STRING=Request.ServerVariables["QUERY_STRING"];
%>
<HTML>
	<HEAD>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" href='gecko_style.css'>
		<script src=Gecko_dialog.js></script><script src=../_shared.js></script>
		<script src="filebrowserpage.js"></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxOfef6=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl","../colorpicker.aspx","returnValue","s_bordercolor"]; function CreateDir_click(){if(event){if(event[OxOfef6[0x1]][OxOfef6[0x0]]){ alert(OxOfef6[0x2]) ;return false;} ;} ;var Ox2fb=window.prompt(OxOfef6[0x3],OxOfef6[0x4]);if(Ox2fb){ document.getElementById(OxOfef6[0x6])[OxOfef6[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event){if(event[OxOfef6[0x1]][OxOfef6[0x0]]){ alert(OxOfef6[0x2]) ;return false;} ;} ;var Ox2fb=window.prompt(OxOfef6[0x7],OxOfef6[0x8]);if(Ox2fb){ document.getElementById(OxOfef6[0x6])[OxOfef6[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event){if(event[OxOfef6[0x1]][OxOfef6[0x0]]){ alert(OxOfef6[0x2]) ;return false;} ;} ;var Ox2fb=window.prompt(OxOfef6[0x7],OxOfef6[0x8]);if(Ox2fb){ document.getElementById(OxOfef6[0x6])[OxOfef6[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxOfef6[0x1]][OxOfef6[0x0]]){ alert(OxOfef6[0x2]) ;return false;} ;var Ox5a1=confirm(OxOfef6[0x9]);if(Ox5a1){ ResetFields() ;return true;} else {return false;} ;}  ; function EditImg_click(Oxb9){if(Oxb9[OxOfef6[0x0]]){ alert(OxOfef6[0x2]) ;return false;} ; row=Oxb9[OxOfef6[0xa]][OxOfef6[0xa]] ;var Ox550=row[OxOfef6[0xb]];var name;if(row[OxOfef6[0xc]]){ name=prompt(OxOfef6[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxOfef6[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxOfef6[0xd])); name=prompt(OxOfef6[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxOfef6[0xb]]){ document.getElementById(OxOfef6[0xf])[OxOfef6[0x5]]=OxOfef6[0x10] ; document.getElementById(OxOfef6[0x6])[OxOfef6[0x5]]=(row[OxOfef6[0xc]]?OxOfef6[0x12]:OxOfef6[0x13])+OxOfef6[0x14]+row[OxOfef6[0x11]]+OxOfef6[0x14]+name ; postback() ;} ;if(event){ event[OxOfef6[0x15]]=true ;} ;}  ; function row_over(Oxc3){ Oxc3[OxOfef6[0x17]][OxOfef6[0x16]]=OxOfef6[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxOfef6[0x17]][OxOfef6[0x16]]=OxOfef6[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxOfef6[0xc]]){if(event){if(event[OxOfef6[0x1]]&&event[OxOfef6[0x1]][OxOfef6[0x19]]==OxOfef6[0x1a]){return ;} ;} ; document.getElementById(OxOfef6[0xf])[OxOfef6[0x5]]=OxOfef6[0x1b] ; document.getElementById(OxOfef6[0x6])[OxOfef6[0x5]]=Oxc3.getAttribute(OxOfef6[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxOfef6[0x11]); document.getElementById(OxOfef6[0x1c])[OxOfef6[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxOfef6[0x1d]); document.getElementById(OxOfef6[0x1e])[OxOfef6[0x5]]=Oxba ; Actualsize(Oxba) ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ; function SelectColor(){var Ox567=OxOfef6[0x1f]; showModalDialog(Ox567,null,_colorpickerDialogFeature,function (Ox2dc,Ox18d){if(Ox18d[OxOfef6[0x20]]){ bordercolor[OxOfef6[0x5]]=Ox18d[OxOfef6[0x20]].toUpperCase() ; document.getElementById(OxOfef6[0x21])[OxOfef6[0x17]][OxOfef6[0x16]]=Ox18d[OxOfef6[0x20]] ;} ;} ) ;}  ;
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
        var OxOd732=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxOd732[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxOd732[0x2])[OxOd732[0x1]]){ alert(document.getElementById(OxOd732[0x2]).value) ;} ; document.getElementById(OxOd732[0x2])[OxOd732[0x1]]=OxOd732[0x3] ; document.getElementById(OxOd732[0x4])[OxOd732[0x1]]=OxOd732[0x3] ; document.getElementById(OxOd732[0x5])[OxOd732[0x1]]=OxOd732[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory"> <input type="hidden" runat="server" id="hiddenFile">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert"> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData">
			<!-- end hidden -->
				<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
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
							OnClick="Move_Click" /><IMG src="../images/Actualsize.gif" onclick="Actualsize();" Alt="[[ActualSize]]" class="dialogButton"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"><IMG src="../images/resize.gif" id="img_AutoThumbnail" onclick="AutoThumbnail();" Alt="[[AutoThumbnail]]" class="dialogButton"
							onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="0" cellpadding="0" width="100%" align="center">
				<tr>
					<td valign="top" nowrap width="270">
						<div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 100%; HEIGHT: 270px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
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
					<td width="10">&nbsp;
					</td>
					<td width="10" nowrap>&nbsp;
					</td>
					<td valign="top">
						<div style="Height:260px; WIDTH: 330px; BORDER: 1.0pt inset; PADDING: 5px;VERTICAL-ALIGN: top; OVERFLOW: auto;BACKGROUND-COLOR: white; TEXT-ALIGN: center">
							<div id="divpreview" style="BACKGROUND-COLOR: white" style="width:100%">
								<img id="img_demo" src="../images/1x1.gif">
							</div>
						</div>
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="2" cellpadding="0" width="98%" align="center">
				<tr>
					<td valign="top">
						<fieldset>
							<legend>
								[[Layout]]</legend>
							<table border="0" cellpadding="5" cellspacing="0"  width="220">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" class="normal">
											<tr>
												<td width="100">[[Alignment]]:</td>
												<td>
													<select name="ImgAlign" style="WIDTH : 80px" ID="Align" onchange="do_preview()" onpropertychange="do_preview()"
														runat="server">
														<OPTION id="optNotSet" value="">[[Notset]]</OPTION>
														<OPTION id="optLeft" value="left">[[Left]]</OPTION>
														<OPTION id="optRight" value="right">[[Right]]</OPTION>
														<OPTION id="optTexttop" value="textTop">[[Texttop]]</OPTION>
														<OPTION id="optAbsMiddle" value="absMiddle">[[Absmiddle]]</OPTION>
														<OPTION id="optBaseline" value="baseline" selected>[[Baseline]]</OPTION>
														<OPTION id="optAbsBottom" value="absBottom">[[Absbottom]]</OPTION>
														<OPTION id="optBottom" value="bottom">[[Bottom]]</OPTION>
														<OPTION id="optMiddle" value="middle">[[Middle]]</OPTION>
														<OPTION id="optTop" value="top">[[Top]]</OPTION>
													</select>
												</td>
											</tr>
											<tr>
												<td nowrap>[[Bordersize]]:</td>
												<td>
													<INPUT type="text" SIZE="2" name="Border" onchange="do_preview()" onkeypress="return IsDigit(event);" style="WIDTH : 80px" ID="Border">
												</td>
											</tr>
											<tr>
												<td nowrap>[[Bordercolor]]:</td>
												<td>
													<input type="text" id="bordercolor" name="bordercolor" size="7" style="WIDTH:57px">	
													<img id="s_bordercolor" src="../images/colorpicker.gif" onclick="SelectColor();" align="absMiddle">
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<table border="0" cellpadding="0" cellspacing="0" class="normal">
														<tr>
															<td width="100" nowrap>[[Width]]:</td>
															<td>
																<INPUT type="text" SIZE="2" onkeyup="checkConstrains('width');" onkeypress="return IsDigit(event);" style="WIDTH : 80px" id="inp_width">
															</td>
															<td rowspan="2" align="right" valign="middle"><img src="../images/locked.gif" id="imgLock" width="25" height="32" alt="Constrained Proportions" /></td>
														</tr>
														<tr>
															<td nowrap>[[Height]]:</td>
															<td>
																<INPUT type="text" SIZE="2" onkeyup="checkConstrains('height');" onkeypress="return IsDigit(event);" style="WIDTH : 80px" id="inp_height">
															</td>
														</tr>
														<tr>
															<td colspan="2">
																<input type="checkbox" id="constrain_prop" checked onclick="javascript:toggleConstrains();" />
																Constrain Proportions</td>
														</tr>
													</table>
												</td>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset><legend>[[Spacing]]</legend>
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td>
										<table border="0" cellpadding="2" cellspacing="0" class="normal">
											<tr>
												<td valign="middle" width="100">[[Horizontal]]:</td>
												<td><INPUT type="text" SIZE="2" name="HSpace" value="" onchange="do_preview()" onkeypress="return IsDigit(event);" style="WIDTH:80px" id="HSpace">
												</td>
											</tr>
											<tr>
												<td valign="middle">[[Vertical]]:</td>
												<td><INPUT type="text" SIZE="2" name="VSpace" value="" onchange="do_preview()" onkeypress="return IsDigit(event);" style="WIDTH:80px" id="VSpace"></td>
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
										<table border="0" cellpadding="1" cellspacing="0" class="normal">
											<tr>
												<td valign="middle">
													URL:</td>
												<td colspan="3">
													<input type="text" id="TargetUrl" onpropertychange="do_preview()" size="42" name="TargetUrl"
														runat="server"></td>
												<td></td>
											</tr>
											<tr>
												<td valign="middle">[[Alternate]]:</td>
												<td valign="middle"><input type="text" id="AlternateText" size="20" NAME="AlternateText"></td>
												<td valign="middle" nowrap>[[ID]]:</td>
												<td><input type="text" id="inp_id" size="14"></td>
												<td></td>
											</tr>
											<tr>
												<td valign="middle" nowrap>[[longDesc]]:</td>
												<td valign="middle" colspan="3"><input type="text" id="longDesc" size="42" NAME="longDesc"></td>
												<td><img src="../images/Accessibility.gif" align="absMiddle" hspace="5"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset id="fieldsetUpload">
							<legend>
								[[Upload]] (Max file size allowed
								<%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxImageSize * 1024)%>
								)</legend>
							<table border="0" cellspacing="2" cellpadding="0" width="100%" class="normal" align="center">
								<tr>
									<td valign="top" style="FONT-SIZE: 8pt; VERTICAL-ALIGN: middle; FONT-FAMILY: MS Sans Serif">
										<asp:Label ID="Label_PictureUpload" Runat="server"></asp:Label>
										<input id="InputFile" size="45" type="file" runat="server" style="HEIGHT:20px" name="InputFile">&nbsp; <br>
										<asp:Button ID="uploadButton" Text="[[Upload]]" Runat="server" OnClick="uploadButton_Click" />&nbsp;
									</td>
								</tr>
								<tr>
									<td height="5">
									</td>
								</tr>
								<tr>
									<td width=100%>
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
											<table cellpadding="0" cellspacing="0" border="0" style="display:inline">
												<tr>
													<td>
														<nobr>
															Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxImageFolderSize * 1024)%>.
															Used: <%= CuteEditor.Impl.FileStorage.FormatSize(fs.GetDirectorySize(fs.VirtualRoot)) %>
														</nobr>
													</td>
													<td>
														<div style="background-color:green;height:3px;width:40;font-size:3px">
															<div style="background-color:red;height:3px;width:<%= GetUsedSpaceBarWidth() %>px;font-size:3px"></div>
														</div>
													</td>
												</tr>
											</table>											
										</li>
									</td>
								</tr>
							</table>
						</fieldset>
						<p align="center">
							<input class="inputbuttoninsert" type="button" value="[[Insert]]" onclick="do_insert()"
								id="Button1">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2">
						</p>
					</td>
				</tr>
			</table>
		</form>
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
			var OxOcc41=["dialogArguments","img","editor","inp_width","inp_height","inp_id","VSpace","HSpace","Border","bordercolor","s_bordercolor","Align","AlternateText","longDesc","TargetUrl","img_demo","divpreview","frameloaded","className","cetempFlash","","src","src_cetemp","value","width","height","id","vspace","hspace","border"," ","style","backgroundColor","align","alt","file","../images/1x1.gif","0","?","\x26","borderColor",".aspx","display","img_AutoThumbnail","none","[[ValidID]]","[[ValidColor]]","[[SelectImagetoInsert]]","longdesc","=\x22","\x22","imgLock","constrain_prop","checked","../images/locked.gif","length","specified","nodeName","[[SelectImagetoThumbnail]]","[[_CuteEditorResource_]]","\x26p=","width=315,height=200,resizable=0,toolbars=0,menubar=0,status=0","returnValue","hiddenAction","refresh"];var obj=top[OxOcc41[0x0]];var element;var editor;if(obj){ element=obj[OxOcc41[0x1]] ; editor=obj[OxOcc41[0x2]] ;} ;var inp_width=document.getElementById(OxOcc41[0x3]);var inp_height=document.getElementById(OxOcc41[0x4]);var inp_id=document.getElementById(OxOcc41[0x5]);var VSpace=document.getElementById(OxOcc41[0x6]);var HSpace=document.getElementById(OxOcc41[0x7]);var Border=document.getElementById(OxOcc41[0x8]);var bordercolor=document.getElementById(OxOcc41[0x9]);var s_bordercolor=document.getElementById(OxOcc41[0xa]);var Align=document.getElementById(OxOcc41[0xb]);var AlternateText=document.getElementById(OxOcc41[0xc]);var longDesc=document.getElementById(OxOcc41[0xd]);var TargetUrl=document.getElementById(OxOcc41[0xe]);var img_demo=document.getElementById(OxOcc41[0xf]);var divpreview=document.getElementById(OxOcc41[0x10]);if(!top[OxOcc41[0x11]]){ top[OxOcc41[0x11]]=true ;try{if(element[OxOcc41[0x12]]!=OxOcc41[0x13]){var src=OxOcc41[0x14];if(element.getAttribute(OxOcc41[0x15])){ src=element.getAttribute(OxOcc41[0x15]) ;} ;if(element.getAttribute(OxOcc41[0x16])){ src=element.getAttribute(OxOcc41[0x16]) ;} ; TargetUrl[OxOcc41[0x17]]=src ; inp_width[OxOcc41[0x17]]=element[OxOcc41[0x18]]||OxOcc41[0x14] ; inp_height[OxOcc41[0x17]]=element[OxOcc41[0x19]]||OxOcc41[0x14] ; inp_id[OxOcc41[0x17]]=element[OxOcc41[0x1a]]||OxOcc41[0x14] ;if(element[OxOcc41[0x1b]]<=0x0){ VSpace[OxOcc41[0x17]]=OxOcc41[0x14] ;} else { VSpace[OxOcc41[0x17]]=element[OxOcc41[0x1b]] ;} ;if(element[OxOcc41[0x1c]]<=0x0){ HSpace[OxOcc41[0x17]]=OxOcc41[0x14] ;} else { HSpace[OxOcc41[0x17]]=element[OxOcc41[0x1c]] ;} ; Border[OxOcc41[0x17]]=element[OxOcc41[0x1d]]||OxOcc41[0x14] ;var arr=revertColor(element[OxOcc41[0x1f]].borderColor).split(OxOcc41[0x1e]); bordercolor[OxOcc41[0x17]]=arr[0x0] ; bordercolor[OxOcc41[0x1f]][OxOcc41[0x20]]=bordercolor[OxOcc41[0x17]]||OxOcc41[0x14] ; s_bordercolor[OxOcc41[0x1f]][OxOcc41[0x20]]=bordercolor[OxOcc41[0x17]]||OxOcc41[0x14] ; Align[OxOcc41[0x17]]=element[OxOcc41[0x21]]||OxOcc41[0x14] ; AlternateText[OxOcc41[0x17]]=element[OxOcc41[0x22]]||OxOcc41[0x14] ; longDesc[OxOcc41[0x17]]=element[OxOcc41[0xd]]||OxOcc41[0x14] ;} ;} catch(e){} ;} ; function Actualsize(Ox5ac){var Ox20d=TargetUrl[OxOcc41[0x17]]; img_demo[OxOcc41[0x18]]=OxOcc41[0x14] ; img_demo[OxOcc41[0x19]]=OxOcc41[0x14] ; inp_width[OxOcc41[0x17]]=img_demo[OxOcc41[0x18]] ; inp_height[OxOcc41[0x17]]=img_demo[OxOcc41[0x19]] ; do_preview(Ox20d) ;}  ; function ResetFields(){ TargetUrl[OxOcc41[0x17]]=OxOcc41[0x14] ; inp_width[OxOcc41[0x17]]=OxOcc41[0x14] ; inp_height[OxOcc41[0x17]]=OxOcc41[0x14] ; inp_id[OxOcc41[0x17]]=OxOcc41[0x14] ; VSpace[OxOcc41[0x17]]=OxOcc41[0x14] ; HSpace[OxOcc41[0x17]]=OxOcc41[0x14] ; Border[OxOcc41[0x17]]=OxOcc41[0x14] ; bordercolor[OxOcc41[0x17]]=OxOcc41[0x14] ; bordercolor[OxOcc41[0x1f]][OxOcc41[0x20]]=OxOcc41[0x14] ; Align[OxOcc41[0x17]]=OxOcc41[0x14] ; AlternateText[OxOcc41[0x17]]=OxOcc41[0x14] ; longDesc[OxOcc41[0x17]]=OxOcc41[0x14] ;}  ;var sCheckFlag=OxOcc41[0x23]; do_preview() ; function do_preview(Ox5ac){var Ox20d;if(Ox5ac){ Ox20d=Ox5ac ;} else { Ox20d=document.getElementById(OxOcc41[0xe])[OxOcc41[0x17]] ;} ;var Ox5af=Ox20d;if(Ox20d==OxOcc41[0x14]){return ;} ;var Oxb9= new Image(); Oxb9[OxOcc41[0x15]]=Ox20d ;if(Oxb9[OxOcc41[0x18]]){var Ox5b0= new Date();var Ox4f8=Ox5b0.getTime();if(Ox5af==OxOcc41[0x14]){ Ox5af=OxOcc41[0x24] ;} ;if(inp_width[OxOcc41[0x17]]==OxOcc41[0x25]||inp_width[OxOcc41[0x17]]==OxOcc41[0x14]){ inp_width[OxOcc41[0x17]]=Oxb9[OxOcc41[0x18]] ; inp_height[OxOcc41[0x17]]=Oxb9[OxOcc41[0x19]] ;} ;if(Ox5af.indexOf(OxOcc41[0x26])!=-0x1){ Ox5af=Ox5af+OxOcc41[0x27]+Ox4f8 ;} else { Ox5af=Ox5af+OxOcc41[0x26]+Ox4f8 ;} ; img_demo[OxOcc41[0x15]]=Ox5af ; img_demo[OxOcc41[0x22]]=AlternateText[OxOcc41[0x17]] ; img_demo[OxOcc41[0x21]]=Align[OxOcc41[0x17]] ; img_demo[OxOcc41[0x18]]=inp_width[OxOcc41[0x17]] ; img_demo[OxOcc41[0x19]]=inp_height[OxOcc41[0x17]] ; img_demo[OxOcc41[0x1b]]=VSpace[OxOcc41[0x17]] ; img_demo[OxOcc41[0x1c]]=HSpace[OxOcc41[0x17]] ;if(parseInt(Border.value)>0x0){ img_demo[OxOcc41[0x1d]]=Border[OxOcc41[0x17]] ;} ;if(bordercolor[OxOcc41[0x17]]!=OxOcc41[0x14]){ img_demo[OxOcc41[0x1f]][OxOcc41[0x28]]=bordercolor[OxOcc41[0x17]] ;} ;} ; Ox20d=Ox20d.toLowerCase() ;if(Ox20d.indexOf(OxOcc41[0x29])!=-0x1){ document.getElementById(OxOcc41[0x2b])[OxOcc41[0x1f]][OxOcc41[0x2a]]=OxOcc41[0x2c] ;} ;}  ; function do_insert(){if(element){var Oxb9=element;} else {var Oxb9= new Image();} ; Oxb9[OxOcc41[0x15]]=TargetUrl[OxOcc41[0x17]] ;try{ Oxb9.setAttribute(OxOcc41[0x16],TargetUrl.value) ;} catch(e){} ; Oxb9[OxOcc41[0x18]]=inp_width[OxOcc41[0x17]] ; Oxb9[OxOcc41[0x19]]=inp_height[OxOcc41[0x17]] ;if(Oxb9[OxOcc41[0x1f]][OxOcc41[0x18]]||Oxb9[OxOcc41[0x1f]][OxOcc41[0x19]]){ Oxb9[OxOcc41[0x1f]][OxOcc41[0x18]]=inp_width[OxOcc41[0x17]] ; Oxb9[OxOcc41[0x1f]][OxOcc41[0x19]]=inp_height[OxOcc41[0x17]] ;} ; Oxb9[OxOcc41[0x1b]]=VSpace[OxOcc41[0x17]] ; Oxb9[OxOcc41[0x1c]]=HSpace[OxOcc41[0x17]] ; Oxb9[OxOcc41[0x1d]]=Border[OxOcc41[0x17]] ;var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxOcc41[0x2d]) ;return ;} ; Oxb9[OxOcc41[0x1a]]=inp_id[OxOcc41[0x17]] ;try{ Oxb9[OxOcc41[0x1f]][OxOcc41[0x28]]=bordercolor[OxOcc41[0x17]] ;} catch(er){ alert(OxOcc41[0x2e]) ;return false;} ; Oxb9[OxOcc41[0x21]]=Align[OxOcc41[0x17]] ; Oxb9[OxOcc41[0x22]]=AlternateText[OxOcc41[0x17]] ; Oxb9[OxOcc41[0xd]]=longDesc[OxOcc41[0x17]] ;if(TargetUrl[OxOcc41[0x17]]==OxOcc41[0x14]){ alert(OxOcc41[0x2f]) ;return false;} ;if(Oxb9[OxOcc41[0x18]]==0x0){ Oxb9.removeAttribute(OxOcc41[0x18]) ;} ;if(Oxb9[OxOcc41[0x19]]==0x0){ Oxb9.removeAttribute(OxOcc41[0x19]) ;} ;if(Oxb9[OxOcc41[0xd]]==OxOcc41[0x14]){ Oxb9.removeAttribute(OxOcc41[0xd]) ;} ;if(Oxb9[OxOcc41[0x30]]==OxOcc41[0x14]||Oxb9[OxOcc41[0x30]]==null){ Oxb9.removeAttribute(OxOcc41[0x30]) ;} ;if(Oxb9[OxOcc41[0x1c]]==OxOcc41[0x14]){ Oxb9.removeAttribute(OxOcc41[0x1c]) ;} ;if(Oxb9[OxOcc41[0x1b]]==OxOcc41[0x14]){ Oxb9.removeAttribute(OxOcc41[0x1b]) ;} ;if(Oxb9[OxOcc41[0x1a]]==OxOcc41[0x14]){ Oxb9.removeAttribute(OxOcc41[0x1a]) ;} ;if(Oxb9[OxOcc41[0x1d]]==OxOcc41[0x14]){ Oxb9.removeAttribute(OxOcc41[0x1d]) ;} ;if(Oxb9[OxOcc41[0x21]]==OxOcc41[0x14]){ Oxb9.removeAttribute(OxOcc41[0x21]) ;} ; editor.InsertElement(Oxb9,element) ; top.close() ;}  ; function attr(name,Ox223){if(!Ox223||Ox223==OxOcc41[0x14]){return OxOcc41[0x14];} ;return OxOcc41[0x1e]+name+OxOcc41[0x31]+Ox223+OxOcc41[0x32];}  ; function do_cancel(){ top.close() ;}  ; function toggleConstrains(){var Ox5b2=document.getElementById(OxOcc41[0x33]);var Ox5b3=document.getElementById(OxOcc41[0x34]);if(Ox5b3[OxOcc41[0x35]]){ Ox5b2[OxOcc41[0x15]]=OxOcc41[0x36] ; checkConstrains(OxOcc41[0x18]) ;} else { Ox5b2[OxOcc41[0x15]]=OxOcc41[0x24] ;} ;}  ;var checkingConstrains=false; function checkConstrains(Ox197){if(checkingConstrains){return ;} ; checkingConstrains=true ;try{var Ox5b3=document.getElementById(OxOcc41[0x34]);if(Ox5b3[OxOcc41[0x35]]){var Ox5b6= new Image(); Ox5b6[OxOcc41[0x15]]=TargetUrl[OxOcc41[0x17]] ; original_width=Ox5b6[OxOcc41[0x18]] ; original_height=Ox5b6[OxOcc41[0x19]] ;if(original_width>0x0&&original_height>0x0){ width=inp_width[OxOcc41[0x17]] ; height=inp_height[OxOcc41[0x17]] ;if(Ox197==OxOcc41[0x18]){if(width[OxOcc41[0x37]]==0x0||isNaN(width)){ inp_width[OxOcc41[0x17]]=OxOcc41[0x14] ; inp_height[OxOcc41[0x17]]=OxOcc41[0x14] ;return ;} else { height=parseInt(width*original_height/original_width) ; inp_height[OxOcc41[0x17]]=height ;} ;} ;if(Ox197==OxOcc41[0x19]){if(height[OxOcc41[0x37]]==0x0||isNaN(height)){ inp_width[OxOcc41[0x17]]=OxOcc41[0x14] ; inp_height[OxOcc41[0x17]]=OxOcc41[0x14] ;return ;} else { width=parseInt(height*original_width/original_height) ; inp_width[OxOcc41[0x17]]=width ;} ;} ;} ;} ; do_preview() ;} finally{ checkingConstrains=false ;} ;}  ; function GetAttribute(Ox2fc,Ox512){if(Ox2fc){var attr=Ox2fc.getAttributeNode(Ox512);if(attr&&attr[OxOcc41[0x38]]){return Ox2fc[attr[OxOcc41[0x39]]];} ;return OxOcc41[0x14];} else {return OxOcc41[0x14];} ;}  ; function AutoThumbnail(){if(document.getElementById(OxOcc41[0xe])[OxOcc41[0x17]]==OxOcc41[0x14]){ alert(OxOcc41[0x3a]) ;return false;} ;var src=document.getElementById(OxOcc41[0xe])[OxOcc41[0x17]];var Ox2f=OxOcc41[0x3b]; showModalDialog('Thumbnail.aspx?<%= QUERY_STRING %>&f='+src+OxOcc41[0x3c]+Ox2f+OxOcc41[0x14],src,OxOcc41[0x3d],function (Ox2dc,Ox18d){if(Ox18d[OxOcc41[0x3e]]){var arr=Ox18d[OxOcc41[0x3e]];if(arr){ document.getElementById(OxOcc41[0xe])[OxOcc41[0x17]]=arr ; Actualsize() ; document.getElementById(OxOcc41[0x3f])[OxOcc41[0x17]]=OxOcc41[0x40] ; postback() ;} ;} ;} ) ;}  ;	
				

	</script>
	</body>
</HTML>
