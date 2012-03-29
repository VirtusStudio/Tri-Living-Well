<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityOuterEditorPage" %>
<%@ Register TagPrefix="CE" Namespace="CuteEditor" Assembly="CuteEditor" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{
	base.OnInit(e);
	
	//Use This As Your Own Risk In Current Version
	//OuterEditor.Attributes["oninitialized"]="editor_oninitialized(this)";
}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>[[OuterEditor]]</title>
		<style>
		
		body { 
		font:normal 12px arial; margin: 0px;
		background-color:#d7d3cc;;
		 }
		table { font:normal 12px arial; }
		img { border: 0; }  
		
		a:link {
			COLOR: navy; TEXT-DECORATION: underline
		}
		a:visited {
			COLOR: navy; TEXT-DECORATION: underline
		}
		a:active {
			COLOR: navy; TEXT-DECORATION: underline
		}
		a:hover {
			COLOR: #0000cc; TEXT-DECORATION: none
		}
		
		</style>
	</head>
	<script>

	
	var OxO9143=["dialogArguments","","Content","changed","returnValue"];var editor; function editor_oninitialized(Ox3f5){ editor=Ox3f5 ;var Oxaf=top[OxO9143[0x0]]||OxO9143[0x1]; editor[OxO9143[0x2]]=Oxaf ; top[OxO9143[0x3]]=true ; top[OxO9143[0x4]]=null ;}  ; function do_finish(){if(editor!=null){ top[OxO9143[0x4]]=editor[OxO9143[0x2]] ;} ; top.close() ;}  ; function do_cancel(){ top[OxO9143[0x4]]=null ; top.close() ;}  ;
	</script>
	<body style="overflow:auto">
		<form runat="server">
			<table border="0" cellspacing="0" cellpadding="0" style="width:100%;height:100%;">
				<tr>
					<td align="center">
						<h3>
							Edit In New Window Feature
						</h3>
						<p>
							Is currently not available .
						</p>
						<p>
							This feature means you could edit part of the document stand alone .
						</p>
						<p>Or you could switch the Minimal mode to Full mode at runtime.
						</p>
						<%--
						//Use This As Your Own Risk In Current Version
						<CE:EDITOR id="OuterEditor" runat="server" Width="100%" Height="100%"></CE:EDITOR>
						--%>
					</td>
				</tr>
				<tr style="height:48px">
					<td align="right">
						<table>
							<tr>
								<td>&nbsp;</td>
								<td><button style='width:100px' onclick="do_finish()">[[Finish]]</button></td>
								<td>&nbsp;</td>
								<td><button style='width:100px' onclick="do_cancel()">[[Cancel]]</button></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
