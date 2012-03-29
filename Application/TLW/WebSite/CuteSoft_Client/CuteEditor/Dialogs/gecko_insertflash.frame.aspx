<%@ Page Language="C#" Inherits="CuteEditor.Dialogs.FileBrowserPage" %>
<HTML>
	<HEAD>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="stylesheet" href='gecko_style.css'>
		<script src=Gecko_dialog.js></script><script src=../_shared.js></script>
		<script src="filebrowserpage.js"></script>
		<script src="sorttable.js"></script>
		<script language="JavaScript">
		var OxO6aca=["disabled","target","[[Disabled]]","[[SpecifyNewFolderName]]","","value","hiddenActionData","[[CopyMoveto]]","/","[[AreyouSureDelete]]","parentNode","text","isdir",".","[[SpecifyNewFileName]]","hiddenAction","rename","path","True","False",":","cancelBubble","backgroundColor","style","#eeeeee","tagName","INPUT","changedir","hiddenFile","url","TargetUrl"]; function CreateDir_click(){if(event){if(event[OxO6aca[0x1]][OxO6aca[0x0]]){ alert(OxO6aca[0x2]) ;return false;} ;} ;var Ox2fb=prompt(OxO6aca[0x3],OxO6aca[0x4]);if(Ox2fb){ document.getElementById(OxO6aca[0x6])[OxO6aca[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Move_click(){if(event){if(event[OxO6aca[0x1]][OxO6aca[0x0]]){ alert(OxO6aca[0x2]) ;return false;} ;} ;var Ox2fb=prompt(OxO6aca[0x7],OxO6aca[0x8]);if(Ox2fb){ document.getElementById(OxO6aca[0x6])[OxO6aca[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Copy_click(){if(event){if(event[OxO6aca[0x1]][OxO6aca[0x0]]){ alert(OxO6aca[0x2]) ;return false;} ;} ;var Ox2fb=prompt(OxO6aca[0x7],OxO6aca[0x8]);if(Ox2fb){ document.getElementById(OxO6aca[0x6])[OxO6aca[0x5]]=Ox2fb ;return true;} else {return false;} ;}  ; function Delete_click(){ iif(event) ;{if(event.target.disabled){ alert("[[Disabled]]") ;return false;} ;} ;return confirm(OxO6aca[0x9]);}  ; function EditImg_click(Oxb9){if(Oxb9[OxO6aca[0x0]]){ alert(OxO6aca[0x2]) ;return false;} ; row=Oxb9[OxO6aca[0xa]][OxO6aca[0xa]] ;var Ox550=row[OxO6aca[0xb]];var name;if(row[OxO6aca[0xc]]){ name=prompt(OxO6aca[0x3],Ox550) ;} else {var i=Ox550.lastIndexOf(OxO6aca[0xd]);var Ox551=Ox550.substr(i);var Ox20=Ox550.substr(0x0,Ox550.lastIndexOf(OxO6aca[0xd])); name=prompt(OxO6aca[0xe],Ox20) ;if(name){ name=name+Ox551 ;} ;} ;if(name&&name!=row[OxO6aca[0xb]]){ document.getElementById(OxO6aca[0xf])[OxO6aca[0x5]]=OxO6aca[0x10] ; document.getElementById(OxO6aca[0x6])[OxO6aca[0x5]]=(row[OxO6aca[0xc]]?OxO6aca[0x12]:OxO6aca[0x13])+OxO6aca[0x14]+row[OxO6aca[0x11]]+OxO6aca[0x14]+name ; postback() ;} ;if(event){ event[OxO6aca[0x15]]=true ;} ;}  ; function row_over(Oxc3){ Oxc3[OxO6aca[0x17]][OxO6aca[0x16]]=OxO6aca[0x18] ;}  ; function row_out(Oxc3){ Oxc3[OxO6aca[0x17]][OxO6aca[0x16]]=OxO6aca[0x4] ;}  ; function row_click(Oxc3){if(Oxc3[OxO6aca[0xc]]){if(event){if(event[OxO6aca[0x1]]&&event[OxO6aca[0x1]][OxO6aca[0x19]]==OxO6aca[0x1a]){return ;} ;} ; document.getElementById(OxO6aca[0xf])[OxO6aca[0x5]]=OxO6aca[0x1b] ; document.getElementById(OxO6aca[0x6])[OxO6aca[0x5]]=Oxc3.getAttribute(OxO6aca[0x11]) ; postback() ;} else {var Ox4f4=Oxc3.getAttribute(OxO6aca[0x11]); document.getElementById(OxO6aca[0x1c])[OxO6aca[0x5]]=Ox4f4 ;var Oxba=Oxc3.getAttribute(OxO6aca[0x1d]); document.getElementById(OxO6aca[0x1e])[OxO6aca[0x5]]=Oxba ; do_preview() ;} ;}  ; function postback(){ <%=Page.GetPostBackEventReference(hiddenAction,"")%> ;}  ;
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
        var OxOa99c=["onload","value","hiddenAlert","","hiddenAction","hiddenActionData"]; window[OxOa99c[0x0]]=reset_hiddens ; function reset_hiddens(){if(document.getElementById(OxOa99c[0x2])[OxOa99c[0x1]]){ alert(document.getElementById(OxOa99c[0x2]).value) ;} ; document.getElementById(OxOa99c[0x2])[OxOa99c[0x1]]=OxOa99c[0x3] ; document.getElementById(OxOa99c[0x4])[OxOa99c[0x1]]=OxOa99c[0x3] ; document.getElementById(OxOa99c[0x5])[OxOa99c[0x1]]=OxOa99c[0x3] ;}  ;
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
						<asp:ImageButton ID="Delete" Runat="server" AlternateText="Deletefiles"
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
							<div id="divpreview" style="BACKGROUND-COLOR: white; height:100%;width:100%">
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
													<img id="s_bgColortext" src="../images/colorpicker.gif" onclick="SelectColor('bgColortext',this);" align="absMiddle">	
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
						<fieldset runat="server" id="fieldsetUpload">
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
										<table cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td>
													<nobr>
													Max Upload folder size is : <%= CuteEditor.Impl.FileStorage.FormatSize(secset.MaxFlashFolderSize * 1024)%>.
													Used: <%= CuteEditor.Impl.FileStorage.FormatSize(fs.GetDirectorySize(fs.VirtualRoot)) %>
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
								id="Button1" runat="server">&nbsp;&nbsp;&nbsp; <input class="inputbuttoncancel" type="button" value="[[Cancel]]" onclick="do_cancel()"
								id="Button2" runat="server">
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
			var OxOec2c=["dialogArguments","availWidth","availHeight","TargetUrl","bgColortext","Width","Height","Quality","chk_Transparency","chk_Loop","chk_Autoplay","VSpace","HSpace","Align","Scale","divpreview","value","","scale=\x27noborder\x27","scale=\x27exactfit\x27","Exactfit","Noborder","hspace=\x22","\x22 ","vspace=\x22","align=\x22","checked","wmode=\x22transparent\x22","loop=\x22false\x22","play=\x22false\x22","bgcolor=\x22","\x22","\x3Cembed src=\x22","\x22 width=\x22"," "," height=\x22","\x22 quality=\x22","\x22 type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","innerHTML","Please choose a Flash movie to insert","\x22 height=\x22"," quality=\x22"," type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22\x3E\x3C/embed\x3E\x0A","\x3Cobject xcodebase=","\x22http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab\x22"," classid=","\x22clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\x22\x3E"," \x3CPARAM name=\x22Movie\x22 value=\x22","\x22 /\x3E"," \x3CPARAM name=\x22Quality\x22 value=\x22","\x22/\x3E","\x3Cparam name=\x22wmode\x22 value=\x22transparent\x22/\x3E","\x3Cparam name=\x22loop\x22 value=\x22false\x22/\x3E","\x3Cparam name=\x22play\x22 value=\x22false\x22/\x3E","\x3Cparam name=\x22scale\x22 value=\x22","\x3Cparam name=\x22bgcolor\x22 value=\x22","\x3C/object\x3E","../colorpicker.aspx","width=505,height=330,resizable=0,toolbars=0,menubar=0,status=0","returnValue","backgroundColor","style"];var editor=top[OxOec2c[0x0]]; window.resizeTo(0x24a,0x236) ; window.moveTo((screen[OxOec2c[0x1]]-0x258)/0x2,(screen[OxOec2c[0x2]]-0x190)/0x2) ;var flashname=document.getElementById(OxOec2c[0x3]);var bgColortext=document.getElementById(OxOec2c[0x4]);var Width=document.getElementById(OxOec2c[0x5]);var Height=document.getElementById(OxOec2c[0x6]);var Quality=document.getElementById(OxOec2c[0x7]);var chk_Transparency=document.getElementById(OxOec2c[0x8]);var chk_Loop=document.getElementById(OxOec2c[0x9]);var chk_Autoplay=document.getElementById(OxOec2c[0xa]);var VSpace=document.getElementById(OxOec2c[0xb]);var HSpace=document.getElementById(OxOec2c[0xc]);var Align=document.getElementById(OxOec2c[0xd]);var Scale=document.getElementById(OxOec2c[0xe]);var divpreview=document.getElementById(OxOec2c[0xf]);var bgColortext=document.getElementById(OxOec2c[0x4]); do_preview() ; function do_preview(){var Oxba;var Ox57b;var Ox563;var Ox81;var Ox2e2;var Ox57c; Oxba=flashname[OxOec2c[0x10]] ; Ox81=Width[OxOec2c[0x10]] ; Ox2e2=Height[OxOec2c[0x10]] ; Ox57c=Quality[OxOec2c[0x10]] ; preview_width=0xf0 ; preview_height=0xc8 ; w=parseInt(Ox81) ; h=parseInt(Ox2e2) ;if(w>h){ Ox81=preview_width ; Ox2e2=preview_height*h/w ;} else { Ox81=preview_width*w/h ; Ox2e2=preview_height ;} ; Ox81=parseInt(Ox81) ; Ox2e2=parseInt(Ox2e2) ;if(Oxba==OxOec2c[0x11]){return ;} ;var Ox57dOx57eOx57fOx580Ox581Ox582;switch(Scale[OxOec2c[0x10]]){case OxOec2c[0x15]: Ox581=OxOec2c[0x12] ;break ;case OxOec2c[0x14]: Ox581=OxOec2c[0x13] ;break ;case OxOec2c[0x11]: Ox581=OxOec2c[0x11] ;break ;;;;} ; Ox582=OxOec2c[0x11] ;if(HSpace[OxOec2c[0x10]]){ Ox582=Ox582+OxOec2c[0x16]+HSpace[OxOec2c[0x10]]+OxOec2c[0x17] ;} ;if(VSpace[OxOec2c[0x10]]){ Ox582=Ox582+OxOec2c[0x18]+VSpace[OxOec2c[0x10]]+OxOec2c[0x17] ;} ;if(Align[OxOec2c[0x10]]){ Ox582=Ox582+OxOec2c[0x19]+Align[OxOec2c[0x10]]+OxOec2c[0x17] ;} ; Ox57d=chk_Transparency[OxOec2c[0x1a]]?OxOec2c[0x1b]:OxOec2c[0x11] ; Ox57e=chk_Loop[OxOec2c[0x1a]]?OxOec2c[0x11]:OxOec2c[0x1c] ; Ox57f=chk_Autoplay[OxOec2c[0x1a]]?OxOec2c[0x11]:OxOec2c[0x1d] ; Ox580=bgColortext[OxOec2c[0x10]]==OxOec2c[0x11]?OxOec2c[0x11]:OxOec2c[0x1e]+bgColortext[OxOec2c[0x10]]+OxOec2c[0x1f] ;var Ox563=OxOec2c[0x20]+Oxba+OxOec2c[0x21]+Ox81+OxOec2c[0x17]+Ox582+OxOec2c[0x22]+Ox57d+OxOec2c[0x22]+Ox57e+OxOec2c[0x22]+Ox57f+OxOec2c[0x22]+Ox580+OxOec2c[0x22]+Ox581+OxOec2c[0x23]+Ox2e2+OxOec2c[0x24]+Ox57c+OxOec2c[0x25]; divpreview[OxOec2c[0x26]]=Ox563 ;}  ;var parameters= new Array(); function do_insert(){if(flashname[OxOec2c[0x10]]==OxOec2c[0x11]){ alert(OxOec2c[0x27]) ;return false;} ;var Ox2ehOx583Ox584Ox57cOxba; Ox2e=Width[OxOec2c[0x10]]+OxOec2c[0x11] ; h=Height[OxOec2c[0x10]]+OxOec2c[0x11] ; Ox583=chk_Transparency[OxOec2c[0x10]] ; Ox57c=Quality[OxOec2c[0x10]] ; Oxba=flashname[OxOec2c[0x10]] ;var Ox57dOx57eOx57fOx580Ox581Ox582;switch(Scale[OxOec2c[0x10]]){case OxOec2c[0x15]: Ox581=OxOec2c[0x12] ;break ;case OxOec2c[0x14]: Ox581=OxOec2c[0x13] ;break ;case OxOec2c[0x11]: Ox581=OxOec2c[0x11] ;break ;;;;} ; Ox582=OxOec2c[0x11] ;if(HSpace[OxOec2c[0x10]]){ Ox582=Ox582+OxOec2c[0x16]+HSpace[OxOec2c[0x10]]+OxOec2c[0x17] ;} ;if(VSpace[OxOec2c[0x10]]){ Ox582=Ox582+OxOec2c[0x18]+VSpace[OxOec2c[0x10]]+OxOec2c[0x17] ;} ;if(Align[OxOec2c[0x10]]){ Ox582=Ox582+OxOec2c[0x19]+Align[OxOec2c[0x10]]+OxOec2c[0x17] ;} ; Ox57d=chk_Transparency[OxOec2c[0x1a]]?OxOec2c[0x1b]:OxOec2c[0x11] ; Ox57e=chk_Loop[OxOec2c[0x1a]]?OxOec2c[0x11]:OxOec2c[0x1c] ; Ox57f=chk_Autoplay[OxOec2c[0x1a]]?OxOec2c[0x11]:OxOec2c[0x1d] ; Ox580=bgColortext[OxOec2c[0x10]]==OxOec2c[0x11]?OxOec2c[0x11]:OxOec2c[0x1e]+bgColortext[OxOec2c[0x10]]+OxOec2c[0x1f] ;var Ox585=OxOec2c[0x20]+Oxba+OxOec2c[0x21]+Ox2e+OxOec2c[0x28]+h+OxOec2c[0x17]+Ox582+OxOec2c[0x29]+Ox57c+OxOec2c[0x17]+Ox57d+OxOec2c[0x22]+Ox57e+OxOec2c[0x22]+Ox57f+OxOec2c[0x22]+Ox580+OxOec2c[0x22]+Ox581+OxOec2c[0x2a];var Oxbe=OxOec2c[0x2b]+OxOec2c[0x2c]+OxOec2c[0x23]+h+OxOec2c[0x21]+Ox2e+OxOec2c[0x17]+Ox582+OxOec2c[0x2d]+OxOec2c[0x2e]+OxOec2c[0x2f]+Oxba+OxOec2c[0x30]+OxOec2c[0x31]+Ox57c+OxOec2c[0x32];if(chk_Transparency[OxOec2c[0x1a]]){ Oxbe=Oxbe+OxOec2c[0x33] ;} ;if(!chk_Loop[OxOec2c[0x1a]]){ Oxbe=Oxbe+OxOec2c[0x34] ;} ;if(!chk_Loop[OxOec2c[0x1a]]){ Oxbe=Oxbe+OxOec2c[0x34] ;} ;if(!chk_Autoplay[OxOec2c[0x1a]]){ Oxbe=Oxbe+OxOec2c[0x35] ;} ;if(Scale[OxOec2c[0x10]]!=OxOec2c[0x11]){ Oxbe=Oxbe+OxOec2c[0x36]+Scale[OxOec2c[0x10]]+OxOec2c[0x32] ;} ;if(bgColortext[OxOec2c[0x10]]!=OxOec2c[0x11]){ Oxbe=Oxbe+OxOec2c[0x37]+bgColortext[OxOec2c[0x10]]+OxOec2c[0x32] ;} ; Oxbe=Oxbe+Ox585+OxOec2c[0x38] ; editor.PasteHTML(Oxbe) ; top.close() ;}  ; function do_cancel(){ top.close() ;}  ; function SelectColor(Ox19a,Ox566){var Ox567=OxOec2c[0x39]; showModalDialog(Ox567,null,OxOec2c[0x3a],function (Ox2dc,Ox18d){if(Ox18d[OxOec2c[0x3b]]){ document.getElementById(Ox19a)[OxOec2c[0x10]]=Ox18d[OxOec2c[0x3b]].toUpperCase() ; document.getElementById(Ox19a)[OxOec2c[0x3d]][OxOec2c[0x3c]]=Ox18d[OxOec2c[0x3b]] ; Ox566[OxOec2c[0x3d]][OxOec2c[0x3c]]=Ox18d[OxOec2c[0x3b]] ;} ;} ) ;}  ;
		</script>
	</body>
</HTML>
