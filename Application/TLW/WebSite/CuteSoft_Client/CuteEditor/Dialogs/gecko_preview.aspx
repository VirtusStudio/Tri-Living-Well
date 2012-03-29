<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<HTML>
	<head runat=server ID="Head1">
		<title>[[Preview]] 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		</title>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<meta name="content-type" content="text/html ;charset=Unicode">
		<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
		<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
		<link rel="stylesheet" href='gecko_style.css'>
		<script src=Gecko_dialog.js></script><script src=../_shared.js></script>
	</HEAD>
	<body>
		<form id="formSearch" method="post" runat="server">
			<table height="100%" cellSpacing="0" cellPadding="5" width="100%" align="center">
				<tbody>
					<tr>
						<td style="HEIGHT: 100%" colspan="3">
							<iframe id="idSource" name="idSource" src="../template.aspx" scrolling="auto" style="WIDTH: 100%; HEIGHT: 100%;background-color:#ffffff;"></iframe>
						</td>
					</tr>
					<tr>
						<td>
							<IMG src="../images/print.gif" onclick="window.print();" Alt="[[Print]]" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)">
						</td>
						<td align="right" style="PADDING-LEFT: 30px;" >
							[[Width]]: 
							<input type="text" name="inc_width" id="inc_width" size=5>&nbsp;&nbsp;
							[[Height]]: 
							<input type="text" name="inc_height" id="inc_height" size=5>
						</td>
						<td class="dialogFooter" vAlign="top" align="right" style="PADDING-RIGHT: 13px; PADDING-LEFT: 13px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
							[[Size]]: 
							<input type='radio' name="radio_size" id="W640" onclick='ResizeThis(640,480)'>640x480
							<input type='radio' name="radio_size" id="W800"  onclick='ResizeThis(800,600)'>800x600 
							<input type='radio' name="radio_size" id="W1024" onclick='ResizeThis(1024,768)'>1024x768
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="[[Cancel]]" onclick="do_cancel()">&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</HTML>
		<script>	
			
			var OxO7560=["onload","availWidth","screen","window","availHeight","contentWindow","idSource","dialogArguments","text/html","replace","document","onresize","attributes","tagName","\x3C","length","specified","value","name"," ","=\x22","\x22","\x3E","innerHTML","\x3C/","PARAM","META","LINK","ISINDEX","INPUT","BR","IMG","HR","FRAME","COL","BASEFONT","BASE","AREA","innerWidth","inc_width","innerHeight","inc_height","screenY","screenX","checked","W600","W800","W1024"];var ParentW;var ParentH; window[OxO7560[0x0]]=function (){ ParentW=top[OxO7560[0x3]][OxO7560[0x2]][OxO7560[0x1]] ; ParentH=top[OxO7560[0x3]][OxO7560[0x2]][OxO7560[0x4]] ;var iframe=document.getElementById(OxO7560[0x6])[OxO7560[0x5]];var editdoc=top[OxO7560[0x7]];var Ox17f=outerHTML(editdoc.documentElement);var Ox5ea=iframe[OxO7560[0xa]].open(OxO7560[0x8],OxO7560[0x9]); Ox5ea.write(Ox17f) ; Ox5ea.close() ; ShowSizeInfo() ;}  ; window[OxO7560[0xb]]=ShowSizeInfo ; function outerHTML(element){var attr;var Ox284=element[OxO7560[0xc]];var Ox1f=OxO7560[0xe]+element[OxO7560[0xd]];for(var i=0x0;i<Ox284[OxO7560[0xf]];i++){ attr=Ox284[i] ;if(attr[OxO7560[0x10]]){ Ox1f+=OxO7560[0x13]+attr[OxO7560[0x12]]+OxO7560[0x14]+attr[OxO7560[0x11]]+OxO7560[0x15] ;} ;} ;if(!canHaveChildren(element)){return Ox1f+OxO7560[0x16];} ;return Ox1f+OxO7560[0x16]+element[OxO7560[0x17]]+OxO7560[0x18]+element[OxO7560[0xd]]+OxO7560[0x16];}  ; function canHaveChildren(element){switch(element[OxO7560[0xd]]){case OxO7560[0x25]:case OxO7560[0x24]:case OxO7560[0x23]:case OxO7560[0x22]:case OxO7560[0x21]:case OxO7560[0x20]:case OxO7560[0x1f]:case OxO7560[0x1e]:case OxO7560[0x1d]:case OxO7560[0x1c]:case OxO7560[0x1b]:case OxO7560[0x1a]:case OxO7560[0x19]:return false;;;;;;;;;;;;;;} ;return true;}  ; function ShowSizeInfo(){ document.getElementById(OxO7560[0x27])[OxO7560[0x11]]=self[OxO7560[0x26]] ; document.getElementById(OxO7560[0x29])[OxO7560[0x11]]=self[OxO7560[0x28]] ;}  ; function do_cancel(){ window.close() ;}  ; function ResizeThis(Ox2e,h){ self[OxO7560[0x26]]=Ox2e ; self[OxO7560[0x28]]=h ;var Ox5ef=ParentW/0x2-Ox2e/0x2;var Ox20c=ParentH/0x2-h/0x2; self[OxO7560[0x2a]]=Ox20c ; self[OxO7560[0x2b]]=Ox5ef ;switch(Ox2e){case 0x258: document.getElementById(OxO7560[0x2d])[OxO7560[0x2c]]=true ;break ;case 0x320: document.getElementById(OxO7560[0x2e])[OxO7560[0x2c]]=true ;break ;case 0x400: document.getElementById(OxO7560[0x2f])[OxO7560[0x2c]]=true ;break ;;;;} ;}  ;	
			
		</script>