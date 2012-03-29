<%@ Page Language="C#" %>
<%@ OutputCache Duration="31536000" VaryByParam="None" Location="Client" %>
<%
if(Request.HttpMethod=="POST")
{
%>
<html>	
	<head runat=server ID="Head1">
		<title>Posted Values</title>
		<style>
		 body { font:normal 12px arial;} 
		 table { font:normal 12px arial; }
		</style>
	</head>
	<body>
		<table border="1" cellspacing="0" cellpadding="3" style="border-collapse:collapse;width:400px;">
			<thead style="color:white;background-color:steelblue">
				<tr>
					<td>Name</td>
					<td>Value</td>
				</tr>
			</thead>
			<tbody>
				<%foreach(string key in Request.Form.AllKeys){%>
				<tr>
					<td><%=HttpUtility.HtmlEncode(key+"")%></td>
					<td><pre><%=HttpUtility.HtmlEncode(Request.Form[key]+"")%></pre></td>
				</tr>
				<%}%>
			</tbody>
		</table>
	</body>
</html>
<%
}
else
{
	string referrer=Request.QueryString["Referrer"];
	if(referrer==null)
	{
		referrer=Convert.ToString(Request.UrlReferrer);
	}
%>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
	<head>
		<title>Untitled</title>
		<meta name="GENERATOR" Content="CuteEditor">
		<base target="_blank"  href="<%=referrer%>" />
	</head>
	<body>
	</body>
</html>
<%
}
%>
