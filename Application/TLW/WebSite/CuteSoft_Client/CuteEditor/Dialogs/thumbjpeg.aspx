<%@ Page Language="C#" Inherits="System.Web.UI.Page" %>
<script runat=server>

	protected override void OnInit(EventArgs e)
	{
		new CuteEditor.Dialogs.ThumbnailHandler().ProcessRequest(Context);
		Response.End();
	}

</script>