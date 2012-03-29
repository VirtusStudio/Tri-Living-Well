<%@ Page Language="C#" Inherits="CuteEditor.EditorUtilityPage" %>
<%@ Register TagPrefix="CE" Namespace="CuteEditor" Assembly="CuteEditor" %>
<script runat="server">
override protected void OnInit(EventArgs e)
{
	base.OnInit(e);
	
	//Use This As Your Own Risk In Current Version
	OuterEditor.Attributes["oninitialized"]="editor_oninitialized(this)";
	
	this.Load += new System.EventHandler(this.Page_Load); 
}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>[[NewTemplate]]</title>
	</head>
	<script runat="server">
	void Page_Load(object sender, System.EventArgs e)
	{
		CuteEditor.ToolControl tc = OuterEditor.ToolControls["insertcustombutonhere"];
		if(tc!=null)
		{				
			System.Web.UI.WebControls.Image Image1 = new System.Web.UI.WebControls.Image ();
			Image1.ToolTip				= "Close";
			Image1.ImageUrl				= "../Themes/custom/images/close.gif";
			Image1.CssClass				= "CuteEditorButton";
			SetMouseEvents(Image1);
			Image1.Attributes["onclick"]="top.returnValue=null; self.close();";
			
			System.Web.UI.WebControls.Image Image2 = new System.Web.UI.WebControls.Image ();
			Image2.ToolTip				= "Add uneditable regions";
			Image2.ImageUrl				= "../Themes/custom/images/noneditable.gif";
			Image2.CssClass				= "CuteEditorButton";
			SetMouseEvents(Image2);
			Image2.Attributes["onclick"]="CuteEditor_GetEditor(this).ExecCommand('noneditable');";
			
			tc.Control.Controls.Add(Image2);
			tc.Control.Controls.Add(Image1);
		}
		
		bool isnew = true;
		
		string filename = Request.QueryString["f"];
		
		if(System.IO.File.Exists(HttpContext.Current.Server.MapPath(filename)))
		{
			isnew = false;
		}
		else
		{
			if(!filename.EndsWith(".htm")&& !filename.EndsWith(".html"))
				 filename=filename+".htm";
		}
		
		if (!IsPostBack) 
		{
			if(!isnew)
			{
				OuterEditor.LoadHtml(filename);
			}
		}
		else
		{ 
			CuteEditor.Impl.EditorProvider provider;
			CuteEditor.Impl.SecuritySetting secset;
			CuteEditor.EditorSetting setting;	
			setting=CuteEditor.EditorSetting.GetFromContext(Context,true);
			provider = CuteEditor.Impl.EditorProvider.CreateInstance(Context, setting);
			secset = provider.Security;
			string templateroot = CuteEditor.EditorUtility.ProcessWebPath(Context,null,secset.TemplateGalleryPath).TrimEnd('/')+"/";
			string js_finish;
			
			if(isnew)	
			{
				OuterEditor.SaveFile(templateroot+filename); 
				js_finish = "alert('Template created successfully!');window.opener.location.href = window.opener.location.href; top.close();";
			}
			else
			{
				OuterEditor.SaveFile(filename); 	
				js_finish = "alert('Template modified successfully!');window.opener.location.href = window.opener.location.href; top.close();";
			}
			HttpContext.Current.Response.Write("<script>"+js_finish+"</scr" + "ipt>");
	    } 
	}
	
	void SetMouseEvents(WebControl control)
	{
		control.Attributes["onmouseover"]="CuteEditor_ButtonCommandOver(this)";
		control.Attributes["onmouseout"]="CuteEditor_ButtonCommandOut(this)";
		control.Attributes["onmousedown"]="CuteEditor_ButtonCommandDown(this)";
		control.Attributes["onmouseup"]="CuteEditor_ButtonCommandUp(this)";
		control.Attributes["ondragstart"]="CuteEditor_CancelEvent()";
	}
	</script>
	<body bottomMargin="0" topMargin="0" marginwidth="0" marginheight="0" bgcolor="white">
		<form runat="server">
		<CE:EDITOR 
				id="OuterEditor" 
				RenderRichDropDown="false"
				ShowDecreaseButton="false" 
				ShowEnlargeButton="false" 
				AutoConfigure="full"
				FullPage="true"
				runat="server"
				DisableItemList="print,DocumentPropertyPage,ToFullPage,FromFullPage"
			></CE:EDITOR>
		</form>
	</body>
</html>

	<script>	
     
	var OxO8b39=["href","location","opener"];var editor; function editor_oninitialized(Ox3f5){}  ; function do_finish(){ window[OxO8b39[0x2]][OxO8b39[0x1]][OxO8b39[0x0]]=window[OxO8b39[0x2]][OxO8b39[0x1]][OxO8b39[0x0]] ; top.close() ;}  ; function do_cancel(){ top.close() ;}  ;
	</script>
