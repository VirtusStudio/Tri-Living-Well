<%@ Page Language="C#" ContentType="text/javascript" Inherits="CuteEditor.EditorUtilityPageWithCache" %>
<%
string classname=Request.QueryString["ClassName"];

NameValueCollection nvc=GetResources();
StringBuilder sb=new StringBuilder();
foreach(string key in nvc.Keys)
{
	if(sb.Length!=0)
	{
		sb.Append("\r\n,\r\n");
	}
	sb.Append('"');
	sb.Append(key.ToLower());
	sb.Append('"');
	sb.Append(':');
	sb.Append('"');
	sb.Append(nvc[key]);
	sb.Append('"');
}
%>
//<script>


function <%=classname%>()
{
}
var __CuteEditorLastSettingClass=<%=classname%>;

__CuteEditorLastSettingClass.prototype.GetSettingHash=function()
{
	return "[[_setting_]]";
}

__CuteEditorLastSettingClass.prototype.GetCulture=function()
{
	return "[[_culture_]]";
}
__CuteEditorLastSettingClass.prototype.GetResourcePath=function()
{
	return "[[_CuteEditorResource_]]";
}

__CuteEditorLastSettingClass.prototype.GetDNNArg=function()
{
	var temp = '[[DNN_Arg]]';
	return (temp.indexOf('=')==-1? '':'&[[DNN_Arg]]');
}

__CuteEditorLastSettingClass.prototype.GetString=function(name)
{
	if(name==null)return null;
	var val=<%=classname%>_Strings[name.toLowerCase()];
	if(val)
		return val;
	return "("+name+")";
}

var <%=classname%>_Strings={<%=sb%>};