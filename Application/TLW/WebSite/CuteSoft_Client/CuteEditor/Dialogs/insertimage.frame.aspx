<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<%
	string QUERY_STRING=Request.ServerVariables["QUERY_STRING"];
%>
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
		var OxOf7c2=["disabled","srcElement","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event[OxOf7c2[0x1]][OxOf7c2[0x0]]){ alert(OxOf7c2[0x2]) ;return false;} ;var Ox2fb=prompt(OxOf7c2[0x3],OxOf7c2[0x4]);if(Ox2fb){ document.getElementById(OxOf7c2[0x6])[OxOf7c2[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event[OxOf7c2[0x1]][OxOf7c2[0x0]]){ alert(OxOf7c2[0x2]) ;return false;} ;var Ox2fb=prompt(OxOf7c2[0x7],OxOf7c2[0x8]);if(Ox2fb){ document.getElementById(OxOf7c2[0x6])[OxOf7c2[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event[OxOf7c2[0x1]][OxOf7c2[0x0]]){ alert(OxOf7c2[0x2]) ;return false;} ;var Ox2fb=prompt(OxOf7c2[0x7],OxOf7c2[0x8]);if(Ox2fb){ document.getElementById(OxOf7c2[0x6])[OxOf7c2[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){if(event[OxOf7c2[0x1]][OxOf7c2[0x0]]){ alert(OxOf7c2[0x2]) ;return false;} ;var Ox5a1=confirm(OxOf7c2[0x9]);if(Ox5a1){ ResetFields() ;return true;} else {return false;} ;}  ; function EditImg_click(Oxb9){if(Oxb9[OxOf7c2[0x0]]){ alert(OxOf7c2[0x2]) ;return false;} ; row=Oxb9[OxOf7c2[0xa]][OxOf7c2[0xa]] ;var Ox550=row[OxOf7c2[0xb]];var name;if(row[OxOf7c2[0xc]]){ name=prompt(OxOf7c2[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxOf7c2[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxOf7c2[0xd])); name=prompt(OxOf7c2[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&(name!=row[OxOf7c2[0xb]])){ document.getElementById(OxOf7c2[0xf])[OxOf7c2[0x5]]=OxOf7c2[0x10] ; document.getElementById(OxOf7c2[0x6])[OxOf7c2[0x5]]=(row[OxOf7c2[0xc]]?OxOf7c2[0x12]:OxOf7c2[0x13])+OxOf7c2[0x14]+row[OxOf7c2[0x11]]+OxOf7c2[0x14]+name ; postback() ;} ; event[OxOf7c2[0x15]]=true ;}  ; function row_over(Oxc3){ Oxc3[OxOf7c2[0x17]][OxOf7c2[0x16]]=OxOf7c2[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxOf7c2[0x17]][OxOf7c2[0x16]]=OxOf7c2[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxOf7c2[0xc]]){if(event[OxOf7c2[0x1]][OxOf7c2[0x19]]==OxOf7c2[0x1a]){return ;} ; document.getElementById(OxOf7c2[0xf])[OxOf7c2[0x5]]=OxOf7c2[0x1b] ; document.getElementById(OxOf7c2[0x6])[OxOf7c2[0x5]]=Oxc3.getAttribute(OxOf7c2[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxOf7c2[0x11]); document.getElementById(OxOf7c2[0x1c])[OxOf7c2[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxOf7c2[0x1d]); document.getElementById(OxOf7c2[0x1e])[OxOf7c2[0x5]]=Oxba ; Actualsize(Oxba) ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
        var OxO2fda=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxO2fda[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxO2fda[0x2])[OxO2fda[0x1]]){ alert(document.getElementById(OxO2fda[0x2]).value) ;} ; document.getElementById(OxO2fda[0x2])[OxO2fda[0x1]]=OxO2fda[0x3] ; document.getElementById(OxO2fda[0x4])[OxO2fda[0x1]]=OxO2fda[0x3] ; document.getElementById(OxO2fda[0x5])[OxO2fda[0x1]]=OxO2fda[0x3] ;}  ;
			</script>
			<input type="hidden" runat="server" id="hiddenDirectory" NAME="hiddenDirectory"> <input type="hidden" runat="server" id="hiddenFile" NAME="hiddenFile">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenAlert" NAME="hiddenAlert"> <input type="hidden" runat="server" enableviewstate="false" id="hiddenAction" onserverchange="hiddenAction_ServerChange" NAME="hiddenAction">
			<input type="hidden" runat="server" enableviewstate="false" id="hiddenActionData" NAME="hiddenActionData">
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
							<IMG  class="dialogButton" onmouseover="CuteEditor_ColorPicker_ButtonOver(this);" id="img_ImageEditor" src="../images/imageeditor.gif" onclick="ImageEditor();" Alt="[[ImageEditor]]">
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
					<td valign="top" nowrap width="280">
						<div style="BORDER: 1.5pt inset;  VERTICAL-ALIGN: middle; OVERFLOW: auto; WIDTH: 280; HEIGHT: 250px; Padding: 0 0 0 0; BACKGROUND-COLOR: white">
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
									<asp:TableHeaderCell ID="name_Cell" Wrap=True Width="145px" CssClass="filelistHeadCol" Font-Bold="False">[[Name]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="size_Cell" Width="62px" CssClass="filelistHeadCol" Font-Bold="False">[[Count]]/[[Size]]</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_Cell"  Width="16px">&nbsp;</asp:TableHeaderCell>
									<asp:TableHeaderCell ID="op_space" Width="1px"></asp:TableHeaderCell>
								</asp:TableRow>
							</asp:Table>
						</div>
					</td>
					<td valign="top" nowrap width="326">
						<div style="border:1.5pt inset; Padding: 0 0 0 0; vertical-align: top; overflow: auto; width:100%; HEIGHT: 250px; BACKGROUND-COLOR: white;">
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
			<table border="0" cellspacing="0" cellpadding="2" width="100%" align="center">			
				<tr>
					<td valign="top">
						<fieldset>
							<legend>
								[[Layout]]</legend>
							<table border="0" cellpadding="4" cellspacing="0" width="100%">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal">
											<tr>
												<td width="100">[[Alignment]]:</td>
												<td>
													<select NAME="ImgAlign" style="WIDTH : 80px" ID="Align" onchange="do_preview()" onpropertychange="do_preview()">
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
												<td nowrap>[[Bordersize]]:</td>
												<td>
													<INPUT TYPE="text" SIZE="2" NAME="Border" onchange="do_preview()" onpropertychange="do_preview()"
														ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px" ID="Border">
												</td>
											</tr>
											<tr>
												<td nowrap>[[Bordercolor]]:</td>
												<td>
													<input type="text" id="bordercolor" name="bordercolor" size="7" style="WIDTH:57px" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
														oncolorchange="bordercolor.value=this.selectedColor; bordercolor.style.backgroundColor=this.selectedColor;bordercolor_Preview.style.backgroundColor=this.selectedColor">
													<img src="../images/colorpicker.gif" id="bordercolor_Preview" align="absMiddle" style='BEHAVIOR:url(../ColorPicker.htc.aspx?culture=[[_culture_]]&[[DNN_Arg]])'
														oncolorchange="bordercolor.value=this.selectedColor; bordercolor.style.backgroundColor=this.selectedColor;bordercolor_Preview.style.backgroundColor=this.selectedColor">
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<table border="0" cellpadding="0" cellspacing="0" class="normal">
														<tr>
															<td width="100" nowrap>[[Width]]:</td>
															<td>
																<INPUT TYPE="text" SIZE="2" id="inp_width" onkeyup="checkConstrains('width');" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px">
															</td>
															<td rowspan="2" align="right" valign="middle"><img src="../images/locked.gif" id="imgLock" width="25" height="32" alt="Constrained Proportions" /></td>
														</tr>
														<tr>
															<td nowrap>[[Height]]:</td>
															<td>
																<INPUT TYPE="text" SIZE="2" id="inp_height" onkeyup="checkConstrains('height');" ONKEYPRESS="event.returnValue=IsDigit();" style="WIDTH : 80px">
															</td>
														</tr>
														<tr>
															<td colspan="2">
																<input type="checkbox" id="constrain_prop" checked onclick="javascript:toggleConstrains();" />
																Constrain Proportions</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</fieldset>
						<fieldset>
						<legend>[[Spacing]]</legend>
							<table border="0" cellpadding="4" cellspacing="0" width="100%">
								<tr>
									<td>
										<table border="0" cellpadding="1" cellspacing="0" class="normal" width="100%">
											<tr>
												<td valign="middle" width="100">[[Horizontal]]:</td>
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
					<td width="2"></td>
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
													<input type="text" id="TargetUrl" onchange="do_preview()" onpropertychange="do_preview()" size="43" name="TargetUrl"
														runat="server"></td>
												<td></td>
											</tr>
											<tr>
												<td valign="middle">[[Alternate]]:</td>
												<td valign="middle"><input type="text" id="AlternateText" size="22" NAME="AlternateText"></td>
												<td valign="middle" nowrap>&nbsp;[[ID]]:</td>
												<td><input type="text" id="inp_id" size="12"></td>
												<td></td>
											</tr>
											<tr>
												<td valign="middle" nowrap>[[longDesc]]:</td>
												<td valign="middle" colspan="3"><input type="text" id="longDesc" size="43" NAME="longDesc"></td>
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
									<td valign="top" style="FONT-SIZE: 8pt; vertical-align: middle; FONT-FAMILY: MS Sans Serif">
										<asp:Label ID="Label_PictureUpload" Runat="server"></asp:Label>
										<input id="InputFile" size="45" type="file" runat="server" style="HEIGHT:20px" NAME="InputFile">&nbsp; <br>
										<asp:Button ID="uploadButton" Text="[[Upload]]" Runat="server" OnClick="uploadButton_Click" />&nbsp;
									</td>
								</tr>
								<tr>
									<td height="5">
									</td>
								</tr>
								<tr>
									<td>
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
						</fieldset>
						<div align="center" style="padding-top:4px;">
							<input class="inputbuttoninsert" type="button" value="[[Insert]]" onclick="do_insert()"
								id="Button1">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<script runat="server">
			protected override void InitOfType()
			{
				this.Context.Response.Cache.SetCacheability(HttpCacheability.NoCache);	
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
		
			var OxO5f6d=["dialogArguments","img","editor","inp_width","inp_height","inp_id","VSpace","HSpace","Border","bordercolor","bordercolor_Preview","Align","AlternateText","longDesc","TargetUrl","img_demo","frameloaded","src","","src_cetemp","value","width","height","id","vspace","hspace","border","borderColor","style","backgroundColor","align","alt","specified","nodeName","file","../images/1x1.gif","?","\x26","0","onmousewheel",".aspx","display","img_AutoThumbnail","none","img_ImageEditor","wheelDelta","zoom","0%","BaseHref","$1","Edit","[[ValidID]]","[[ValidColor]]","[[SelectImagetoInsert]]","Code"," ","=\x22","\x22","imgLock","constrain_prop","checked","../images/locked.gif","length","[[SelectImagetoThumbnail]]","[[_CuteEditorResource_]]","\x26p=","dialogWidth:310px;dialogHeight:200px;help:no;scroll:no;status:no;resizable:0;","hiddenAction","refresh","[[SelectImagetoEdit]]","dialogWidth:676px;dialogHeight:500px;help:no;scroll:no;status:no;resizable:0;","keyCode","[[ValidNumber]]"];var obj=top[OxO5f6d[0x0]];var element=obj[OxO5f6d[0x1]];var editor=obj[OxO5f6d[0x2]];var count=0xa;var inp_width=document.getElementById(OxO5f6d[0x3]);var inp_height=document.getElementById(OxO5f6d[0x4]);var inp_id=document.getElementById(OxO5f6d[0x5]);var VSpace=document.getElementById(OxO5f6d[0x6]);var HSpace=document.getElementById(OxO5f6d[0x7]);var Border=document.getElementById(OxO5f6d[0x8]);var bordercolor=document.getElementById(OxO5f6d[0x9]);var bordercolor_Preview=document.getElementById(OxO5f6d[0xa]);var Align=document.getElementById(OxO5f6d[0xb]);var AlternateText=document.getElementById(OxO5f6d[0xc]);var longDesc=document.getElementById(OxO5f6d[0xd]);var TargetUrl=document.getElementById(OxO5f6d[0xe]);var img_demo=document.getElementById(OxO5f6d[0xf]);if(!top[OxO5f6d[0x10]]){ top[OxO5f6d[0x10]]=true ;try{var src; src=element.getAttribute(OxO5f6d[0x11])+OxO5f6d[0x12] ;if(element.getAttribute(OxO5f6d[0x13])){ src=element.getAttribute(OxO5f6d[0x13])+OxO5f6d[0x12] ;} ; TargetUrl[OxO5f6d[0x14]]=src ; inp_width[OxO5f6d[0x14]]=element[OxO5f6d[0x15]]||OxO5f6d[0x12] ; inp_height[OxO5f6d[0x14]]=element[OxO5f6d[0x16]]||OxO5f6d[0x12] ; inp_id[OxO5f6d[0x14]]=element[OxO5f6d[0x17]]||OxO5f6d[0x12] ; VSpace[OxO5f6d[0x14]]=element[OxO5f6d[0x18]]||OxO5f6d[0x12] ; HSpace[OxO5f6d[0x14]]=element[OxO5f6d[0x19]]||OxO5f6d[0x12] ; Border[OxO5f6d[0x14]]=element[OxO5f6d[0x1a]]||OxO5f6d[0x12] ; bordercolor[OxO5f6d[0x14]]=element[OxO5f6d[0x1c]][OxO5f6d[0x1b]]||GetAttribute(OxO5f6d[0x9])||OxO5f6d[0x12] ; bordercolor[OxO5f6d[0x1c]][OxO5f6d[0x1d]]=bordercolor[OxO5f6d[0x14]]||OxO5f6d[0x12] ; Align[OxO5f6d[0x14]]=element[OxO5f6d[0x1e]]||OxO5f6d[0x12] ; AlternateText[OxO5f6d[0x14]]=element[OxO5f6d[0x1f]]||OxO5f6d[0x12] ; longDesc[OxO5f6d[0x14]]=element[OxO5f6d[0xd]]||OxO5f6d[0x12] ;} catch(e){} ;} ; function GetAttribute(Ox512){var attr=element.getAttributeNode(Ox512);if(attr&&attr[OxO5f6d[0x20]]){return element[attr[OxO5f6d[0x21]]];} ;return OxO5f6d[0x12];}  ;var sCheckFlag=OxO5f6d[0x22]; function ResetFields(){ TargetUrl[OxO5f6d[0x14]]=OxO5f6d[0x12] ; inp_width[OxO5f6d[0x14]]=OxO5f6d[0x12] ; inp_height[OxO5f6d[0x14]]=OxO5f6d[0x12] ; inp_id[OxO5f6d[0x14]]=OxO5f6d[0x12] ; VSpace[OxO5f6d[0x14]]=OxO5f6d[0x12] ; HSpace[OxO5f6d[0x14]]=OxO5f6d[0x12] ; Border[OxO5f6d[0x14]]=OxO5f6d[0x12] ; bordercolor[OxO5f6d[0x14]]=OxO5f6d[0x12] ; bordercolor[OxO5f6d[0x1c]][OxO5f6d[0x1d]]=OxO5f6d[0x12] ; Align[OxO5f6d[0x14]]=OxO5f6d[0x12] ; AlternateText[OxO5f6d[0x14]]=OxO5f6d[0x12] ; longDesc[OxO5f6d[0x14]]=OxO5f6d[0x12] ;}  ; do_preview() ; function do_preview(Ox5ac){var Ox20d;if(Ox5ac){ Ox20d=Ox5ac ;} else { Ox20d=document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]] ;} ;var Ox5af=Ox20d;if(Ox20d==OxO5f6d[0x12]){return ;} ;var Oxb9= new Image(); Oxb9[OxO5f6d[0x11]]=Ox20d ;if(!Oxb9[OxO5f6d[0x15]]||Oxb9[OxO5f6d[0x15]]==0x0){ setTimeout(do_preview,0x64) ;return ;} ;var Ox5b0= new Date();var Ox4f8=Ox5b0.getTime();if(Ox5af==OxO5f6d[0x12]){ Ox5af=OxO5f6d[0x23] ;} ;if(Ox5af.indexOf(OxO5f6d[0x24])!=-0x1){ Ox5af=Ox5af+OxO5f6d[0x25]+Ox4f8 ;} else { Ox5af=Ox5af+OxO5f6d[0x24]+Ox4f8 ;} ;if(inp_width[OxO5f6d[0x14]]==OxO5f6d[0x26]||inp_width[OxO5f6d[0x14]]==OxO5f6d[0x12]){ inp_width[OxO5f6d[0x14]]=Oxb9[OxO5f6d[0x15]] ; inp_height[OxO5f6d[0x14]]=Oxb9[OxO5f6d[0x16]] ;} ; img_demo[OxO5f6d[0x11]]=Ox5af ; img_demo.attachEvent(OxO5f6d[0x27],Picture) ; img_demo[OxO5f6d[0x1f]]=AlternateText[OxO5f6d[0x14]] ; img_demo[OxO5f6d[0x1e]]=Align[OxO5f6d[0x14]] ; img_demo[OxO5f6d[0x15]]=inp_width[OxO5f6d[0x14]] ; img_demo[OxO5f6d[0x16]]=inp_height[OxO5f6d[0x14]] ; img_demo[OxO5f6d[0x18]]=VSpace[OxO5f6d[0x14]] ; img_demo[OxO5f6d[0x19]]=HSpace[OxO5f6d[0x14]] ;if(parseInt(Border.value)>0x0){ img_demo[OxO5f6d[0x1a]]=Border[OxO5f6d[0x14]] ;} ;if(bordercolor[OxO5f6d[0x14]]!=OxO5f6d[0x12]){ img_demo[OxO5f6d[0x1c]][OxO5f6d[0x1b]]=bordercolor[OxO5f6d[0x14]] ;} ; Ox20d=Ox20d.toLowerCase() ;if(Ox20d.indexOf(OxO5f6d[0x28])!=-0x1){ document.getElementById(OxO5f6d[0x2a])[OxO5f6d[0x1c]][OxO5f6d[0x29]]=OxO5f6d[0x2b] ; document.getElementById(OxO5f6d[0x2c])[OxO5f6d[0x1c]][OxO5f6d[0x29]]=OxO5f6d[0x2b] ;} ;}  ; function Picture(){if(event[OxO5f6d[0x2d]]>=0x78){ count++ ;} else {if(event[OxO5f6d[0x2d]]<=-0x78){ count-- ;} ;} ; img_demo[OxO5f6d[0x1c]][OxO5f6d[0x2e]]=count+OxO5f6d[0x2f] ;return false;}  ; function RemoveServerNamesFromUrl(Ox4f4){var Ox629=obj[OxO5f6d[0x30]]; Ox629=Ox629.replace(/^(https?:\/\/[^\/]+)(.*)$/,OxO5f6d[0x31]) ; serverre= new RegExp(Ox629) ;return Ox4f4.replace(serverre,OxO5f6d[0x12]);}  ; function do_insert(){var Oxb9=element; Oxb9[OxO5f6d[0x11]]=TargetUrl[OxO5f6d[0x14]] ;if(editor.GetActiveTab()==OxO5f6d[0x32]){ Oxb9.setAttribute(OxO5f6d[0x13],TargetUrl.value) ;} ; Oxb9[OxO5f6d[0x15]]=inp_width[OxO5f6d[0x14]] ; Oxb9[OxO5f6d[0x16]]=inp_height[OxO5f6d[0x14]] ;if(Oxb9[OxO5f6d[0x1c]][OxO5f6d[0x15]]||Oxb9[OxO5f6d[0x1c]][OxO5f6d[0x16]]){ Oxb9[OxO5f6d[0x1c]][OxO5f6d[0x15]]=inp_width[OxO5f6d[0x14]] ; Oxb9[OxO5f6d[0x1c]][OxO5f6d[0x16]]=inp_height[OxO5f6d[0x14]] ;} ; Oxb9[OxO5f6d[0x18]]=VSpace[OxO5f6d[0x14]] ; Oxb9[OxO5f6d[0x19]]=HSpace[OxO5f6d[0x14]] ; Oxb9[OxO5f6d[0x1a]]=Border[OxO5f6d[0x14]] ;var Ox535=/[^a-z\d]/i;if(Ox535.test(inp_id.value)){ alert(OxO5f6d[0x33]) ;return ;} ; Oxb9[OxO5f6d[0x17]]=inp_id[OxO5f6d[0x14]] ;try{ Oxb9[OxO5f6d[0x1c]][OxO5f6d[0x1b]]=bordercolor[OxO5f6d[0x14]] ;} catch(er){ alert(OxO5f6d[0x34]) ;return false;} ; Oxb9[OxO5f6d[0x1e]]=Align[OxO5f6d[0x14]] ; Oxb9[OxO5f6d[0x1f]]=AlternateText[OxO5f6d[0x14]] ; Oxb9[OxO5f6d[0xd]]=longDesc[OxO5f6d[0x14]] ;if(TargetUrl[OxO5f6d[0x14]]==OxO5f6d[0x12]){ alert(OxO5f6d[0x35]) ;return false;} ;if(Oxb9[OxO5f6d[0x15]]==0x0){ Oxb9.removeAttribute(OxO5f6d[0x15]) ;} ;if(Oxb9[OxO5f6d[0x16]]==0x0){ Oxb9.removeAttribute(OxO5f6d[0x16]) ;} ;if(Oxb9[OxO5f6d[0xd]]==OxO5f6d[0x12]){ Oxb9.removeAttribute(OxO5f6d[0xd]) ;} ;if(Oxb9[OxO5f6d[0x19]]==OxO5f6d[0x12]){ Oxb9.removeAttribute(OxO5f6d[0x19]) ;} ;if(Oxb9[OxO5f6d[0x18]]==OxO5f6d[0x12]){ Oxb9.removeAttribute(OxO5f6d[0x18]) ;} ;if(Oxb9[OxO5f6d[0x17]]==OxO5f6d[0x12]){ Oxb9.removeAttribute(OxO5f6d[0x17]) ;} ;if(editor.GetActiveTab()==OxO5f6d[0x36]){ editor.PasteHTML(Oxb9.outerHTML) ;} else { editor.InsertElement(Oxb9,obj.img) ;} ; top.close() ;}  ; function attr(name,Ox223){if(!Ox223||Ox223==OxO5f6d[0x12]){return OxO5f6d[0x12];} ;return OxO5f6d[0x37]+name+OxO5f6d[0x38]+Ox223+OxO5f6d[0x39];}  ; function do_cancel(){ top.close() ;}  ; function Zoom_In(){if(divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]!=0x0){ divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]*=1.2 ;} else { divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]=1.2 ;} ;}  ; function Zoom_Out(){if(divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]!=0x0){ divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]*=0.8 ;} else { divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]=0.8 ;} ;}  ; function BestFit(){var Oxb9=img_demo;if(!Oxb9){return ;} ;var Ox2e2=0x118;var Ox81=0x122; divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]=0x1/Math.max(Oxb9[OxO5f6d[0x15]]/Ox81,Oxb9[OxO5f6d[0x16]]/Ox2e2) ;}  ; function Actualsize(Ox5ac){var Ox20d;if(Ox5ac){ Ox20d=Ox5ac ;} else { Ox20d=document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]] ;} ; img_demo[OxO5f6d[0x15]]=OxO5f6d[0x12] ; img_demo[OxO5f6d[0x16]]=OxO5f6d[0x12] ; inp_width[OxO5f6d[0x14]]=img_demo[OxO5f6d[0x15]] ; inp_height[OxO5f6d[0x14]]=img_demo[OxO5f6d[0x16]] ; do_preview(Ox20d) ; divpreview[OxO5f6d[0x1c]][OxO5f6d[0x2e]]=0x1 ;}  ; function toggleConstrains(){var Ox5b2=document.getElementById(OxO5f6d[0x3a]);var Ox5b3=document.getElementById(OxO5f6d[0x3b]);if(Ox5b3[OxO5f6d[0x3c]]){ Ox5b2[OxO5f6d[0x11]]=OxO5f6d[0x3d] ; checkConstrains(OxO5f6d[0x15]) ;} else { Ox5b2[OxO5f6d[0x11]]=OxO5f6d[0x23] ;} ;}  ;var checkingConstrains=false; function checkConstrains(Ox197){if(checkingConstrains){return ;} ; checkingConstrains=true ;try{var Ox5b3=document.getElementById(OxO5f6d[0x3b]);if(Ox5b3[OxO5f6d[0x3c]]){var Ox5b6= new Image(); Ox5b6[OxO5f6d[0x11]]=TargetUrl[OxO5f6d[0x14]] ; original_width=Ox5b6[OxO5f6d[0x15]] ; original_height=Ox5b6[OxO5f6d[0x16]] ;if((original_width>0x0)&&(original_height>0x0)){ width=inp_width[OxO5f6d[0x14]] ; height=inp_height[OxO5f6d[0x14]] ;if(Ox197==OxO5f6d[0x15]){if(width[OxO5f6d[0x3e]]==0x0||isNaN(width)){ inp_width[OxO5f6d[0x14]]=OxO5f6d[0x12] ; inp_height[OxO5f6d[0x14]]=OxO5f6d[0x12] ;} else { height=parseInt(width*original_height/original_width) ; inp_height[OxO5f6d[0x14]]=height ;} ;} ;if(Ox197==OxO5f6d[0x16]){if(height[OxO5f6d[0x3e]]==0x0||isNaN(height)){ inp_width[OxO5f6d[0x14]]=OxO5f6d[0x12] ; inp_height[OxO5f6d[0x14]]=OxO5f6d[0x12] ;} else { width=parseInt(height*original_width/original_height) ; inp_width[OxO5f6d[0x14]]=width ;} ;} ;} ;} ; do_preview() ;} finally{ checkingConstrains=false ;} ;}  ; function AutoThumbnail(){if(document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]]==OxO5f6d[0x12]){ alert(OxO5f6d[0x3f]) ;return false;} ;var src=document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]];var Ox2f=OxO5f6d[0x40];var Ox422=showModalDialog('Thumbnail.aspx?<%= QUERY_STRING %>&f='+src+OxO5f6d[0x41]+Ox2f+OxO5f6d[0x12],src,OxO5f6d[0x42]); document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]]=Ox422 ; Actualsize() ; document.getElementById(OxO5f6d[0x43])[OxO5f6d[0x14]]=OxO5f6d[0x44] ; postback() ;}  ; function ImageEditor(){if(document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]]==OxO5f6d[0x12]){ alert(OxO5f6d[0x45]) ;return false;} ;var Oxb9= new Image(); Oxb9[OxO5f6d[0x11]]=document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]] ;var src=document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]];var Ox2f=OxO5f6d[0x40];var arr=showModalDialog('../ImageEditor/ImageEditor.aspx?<%= QUERY_STRING %>&f='+src+OxO5f6d[0x41]+Ox2f+OxO5f6d[0x12],Oxb9,OxO5f6d[0x46]); document.getElementById(OxO5f6d[0xe])[OxO5f6d[0x14]]=src ; do_preview() ;}  ; function IsDigit(){if((event[OxO5f6d[0x47]]>=0x30)&&(event[OxO5f6d[0x47]]<=0x39)||event[OxO5f6d[0x47]]==0x25){return true;} else { alert(OxO5f6d[0x48]) ;return false;} ;}  ;		
		</script>
	</body>
</HTML>
