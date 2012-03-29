<%@ Page Language="C#" ContentType="text/css" %>
<%@ OutputCache Duration="31536000" VaryByParam="None" Location="Client" %>

<script runat="server">
   string editorid;
   protected override void OnInit(EventArgs e)
   {
	  //do not call base's OnInit , skip the theme bug!
      //base.OnInit(e);
	  editorid="#"+Request.QueryString["EditorID"];
   }
</script>
/*<style>*/
<%=editorid%> {}
<%=editorid%> IMG { border:0px;display:inline;}


<%=editorid%> .CuteEditorSelect { font:normal 11px Tahoma; vertical-align:middle;}
<%=editorid%> .CuteEditorDropDown { font:normal 11px Tahoma; padding:0; margin:0; width:80px;}
<%=editorid%> .CuteEditorDropDown Li {LIST-STYLE-TYPE: none;padding:0;}
<%=editorid%> .CuteEditorDropDown Span {font:normal 11px Tahoma;}
<%=editorid%> .CuteEditorToolbar {}
<%=editorid%> .CuteEditorToolBarContainer {padding:3px 3px 1px 3px;height:1px;overflow-y:visible;}
<%=editorid%> .CuteEditorFrameContainer {padding:0;margin:2px 0 0px 0px;}
<%=editorid%> .CuteEditorBottomBarContainer {padding:3px 3px 3px 3px;height:1px;overflow-y:visible;}
<%=editorid%> .CuteEditorGroupMenu {display: inline; float: left; height:24px; vertical-align:middle;}
<%=editorid%> .CuteEditorGroupMenuCell{background-image: url(images/horizontal.start.gif); background-repeat:no-repeat; background-position:left center;padding-left:7px;}
<%=editorid%> .CuteEditorLineBreak {padding:0px; height:0px; margin:0px}
<%=editorid%> .CuteEditorFrame {padding:0px 0 0px 0px;border-top: #dddddd 1px solid!important;border-bottom: #cccccc 1px solid!important;border-left: #ffffff 0px solid!important;border-right: #ffffff 0px solid!important;}
<%=editorid%> .CuteEditorButton { margin:1px; vertical-align:middle;}
<%=editorid%> .CuteEditorButtonActive { margin:0px; vertical-align:middle; border:#0a246a 1px solid!important; background-color:#d4d5d8;}
<%=editorid%> .CuteEditorButtonOver { margin:0px;vertical-align:middle;border:#0a246a 1px solid!important; background-color:#b6bdd2;}
<%=editorid%> .CuteEditorButtonDown { border-right: buttonhighlight 1px solid!important; border-TOP: buttonshadow 1px solid!important; border-left: buttonshadow 1px solid!important; border-bottom: buttonhighlight 1px solid!important; margin:0px;vertical-align:middle; }
<%=editorid%> .CuteEditorButtonDisabled { /* filter:gray alpha(opacity=25); margin:1px;vertical-align:middle; */ margin:1px;vertical-align:middle;}
<%=editorid%> .ToolControl{}
<%=editorid%> .ToolControlOver{}
<%=editorid%> .ToolControlDown{}
<%=editorid%> .separator {background-image: url(images/Separator.gif); height:22px; background-repeat: no-repeat; vertical-align:middle; width:2px;margin-left:2px; margin-right:2px;	}

/*case sensive for CSS1*/
<%=editorid%> #cmd_tofullpage.CuteEditorButtonActive { display:none }
<%=editorid%> #cmd_fromfullpage.CuteEditorButton { display:none }

/*</style>*/
