<%@ Page language="c#" CodeFile="addpost.aspx.cs" ValidateRequest="false" AutoEventWireup="True" Inherits="addpost" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
	<script type="text/javascript" src="broswerDetection.js"></script>
	<script type="text/javascript" src="forum.js"></script>
	<script type="text/javascript">
	function OpenSmilies()
	{
		OpenCloseDiv('divSmilies');
	}
	function OpenFiles()
	{
		OpenCloseDiv('divFilesContainer');
	}
	function OpenPolls()
	{
		OpenCloseDiv('divPollsContainer');
	}
	function OpenMoreSmilies()
	{
		window.open("smilies.htm", null, "height=200,width=400,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes");
	}
	function OpenCloseDiv(divname)
	{
		objDiv = document.getElementById(divname);
		if (objDiv.style.display == 'none')
			objDiv.style.display = '';
		else
			objDiv.style.display = 'none';
	}
	function InsertSmile(txt)
	{
		textboxelement.value += txt;
		document.getElementById('divSmilies').style.display = 'none';
		//divMoreSmilies.style.display = 'none';
	}
	
    var numFiles=1;
    function AddFileInput()
    {
        filesDiv = document.getElementById("divFileInputs");
	    f = document.createElement("INPUT");
	    f.type = "file";
	    f.name = "file"+numFiles;
	    br = document.createElement("br");
	    numFiles++;
	    filesDiv.appendChild(br);
	    filesDiv.appendChild(f);
    }
    
    var numOptions=1;
    function AddOptionInput()
    {
        optionsDiv = document.getElementById("divOptions");
	    opt = document.createElement("INPUT");
	    opt.type = "text";
	    opt.name = "PollOption"+numOptions;
	    br = document.createElement("br");
	    lbl = document.createTextNode("Poll option: ");
	    numOptions++;
	    optionsDiv.appendChild(br);
	    optionsDiv.appendChild(lbl);
	    optionsDiv.appendChild(opt);
    }
    
    window.setInterval("renewSession();", 9000);
    function renewSession()
    {
        try { document.images("renewSession").src = "renewses.aspx?par1=" + Math.random() + "&par2=" + Math.random(); }
        catch(e) { }
    }
	</script>
	<br />
	<asp:Label ID="lblDenied" Runat="server" Visible="False" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblDeniedResource1">Posting to this forum is restricted</asp:Label>
	<div id="divMain" runat="server">
		<table style="width:100%">
			<tr><th><asp:Label ID="lblNewPost" runat="server" EnableViewState="False" meta:resourcekey="lblNewPostResource1">Add new post</asp:Label></th></tr>
		</table>
		<asp:label id="lblSubject" runat="server" Visible="False" EnableViewState="False" meta:resourcekey="lblSubjectResource1">Subject:</asp:label>
		<asp:textbox id="tbSubj" runat="server" Visible="False" MaxLength="50" meta:resourcekey="tbSubjResource1"></asp:textbox><br />
		<div class="editbar">
		    <button class="formatting" title="bold" onclick="javascript:AddTag('[b]','[/b]')" type="button"><b>B</b></button>
			<button class="formatting" title="italic" onclick="javascript:AddTag('[i]','[/i]')" type="button"><i>I</i></button>
			<button class="formatting" title="underline" onclick="javascript:AddTag('[u]','[/u]')" type="button"><u>U</u></button>
			<button class="formatting" title="hyperlink" onclick="javascript:AddTag('[url=',']link[/url]')" type="button"><img src="images/url.gif" alt="hyperlink" /></button>
			<button class="formatting" title="image" onclick="javascript:AddTag('[img]', '[/img]')" type="button"><img src="images/img.gif" alt="image" /></button>
			<button class="formatting" title="color" onclick="javascript:showColorGrid2('none')" type="button"><img src="images/colors.gif" alt="color" /></button><span id="colorpicker201" class="colorpicker201"></span>
			<button class="formatting" title="smilies" onclick="javascript:OpenSmilies()" type="button"><img src="images/smilies/smile.gif" alt="smilies" /></button>
			<span id="divSmilies" style="DISPLAY:none;position:absolute;border:1px solid slategray;background:#ffffff;padding: 5px 5px 5px 5px">
			    <img style="cursor:pointer" onclick="InsertSmile(':)')" src="images/smilies/smile.gif" alt=":)" />
			    <img style="cursor:pointer" onclick="InsertSmile(';)')" src="images/smilies/wink.gif" alt=";)" />
			    <img style="cursor:pointer" onclick="InsertSmile(':(')" src="images/smilies/upset.gif" alt=":(" />
			    <img style="cursor:pointer" onclick="InsertSmile(':cool:')" src="images/smilies/1cool.gif" alt="cool" />
			    <img style="cursor:pointer" onclick="InsertSmile(':\\:')" src="images/smilies/eek7.gif" alt="Whaaaaa?" />
			    <br />
			    <a href="javascript:OpenMoreSmilies()"><asp:Label ID="lblMoreSmilies" runat="server" EnableViewState="False" meta:resourcekey="lblMoreSmiliesResource1">more smilies</asp:Label></a>
		    </span>
		    <button class="formatting" title="bold" onclick="javascript:AddTag('[quote=]','[/quote]')" type="button">[q]</button>
		</div>
		<asp:textbox id="tbMsg" runat="server" TextMode="MultiLine" Rows="10"></asp:textbox>
		<div id="divCaptcha" runat="server" enableviewstate="false" visible="false">
		    <img alt="" src="captchajpgimg.aspx" /> :: <asp:textbox id="tbImgCode" autocomplete="off" runat="server"></asp:textbox>
		</div>
		<asp:checkbox id="cbSubscribe" runat="server" Text="Notify me when a reply is posted" meta:resourcekey="cbSubscribeResource1"></asp:checkbox>
		<asp:Label ID="lblFileSizeError" runat="server" ForeColor="red" Visible="false" EnableViewState="false">Max attachment size is </asp:Label>
		<asp:Label ID="lblMaxSize" runat="server" ForeColor="red" Visible="false" EnableViewState="false"></asp:Label>
		<table style="width:100%;">
			<tr>
				<th>
					<asp:button CssClass="gradientbutton" id="btnSave" runat="server" Text="add message" Font-Bold="True" onclick="btnSave_Click" meta:resourcekey="btnSaveResource1"></asp:button>
					<asp:button CssClass="gradientbutton" id="btnPreview" runat="server" Text="preview" onclick="btnPreview_Click" meta:resourcekey="btnPreviewResource1"></asp:button>
					<button class="gradientbutton" onclick="history.back()" type="button"><asp:Label ID="lblCancel" runat="server" EnableViewState="false" meta:resourcekey="lblCancelResource1">cancel</asp:Label></button>
				</th>
			</tr>
		</table>
		<div id="divFiles" runat="server">
		    <hr />
		    <a href="javascript:OpenFiles()"><asp:Label ID="lblAttach" runat="server" EnableViewState="False" meta:resourcekey="lblAttachResource1">attach files</asp:Label></a>
		    <div id="divFilesContainer" style="display:none;">
	        <div id="divFileInputs">
	            <asp:FileUpload ID="tmpUpload" runat="server" />
	        </div>
	        <button onclick="javascript:AddFileInput();" type="button" class="gradientbutton"><asp:Label ID="lblAnotherFile" runat="server" EnableViewState="False" meta:resourcekey="lblAnotherFileResource1">another file...</asp:Label></button>
	        </div>
		</div>
		<div id="divPolls" runat="server">
		    <hr />
		    <a href="javascript:OpenPolls()">create a poll</a>
		    <div id="divPollsContainer" style="DISPLAY:none;">
		        <b>Poll Question</b>: <asp:TextBox ID="tbPollQuestion" runat="server"></asp:TextBox>
		        <br />
		        <div id="divOptions">
		            Poll option: <input type="text" name="PollOption0" />
		        </div>
		        <button onclick="javascript:AddOptionInput();" type="button" class="gradientbutton">add option...</button>
		    </div>
		</div>
		<br />
		<table width="100%">
			<tr><td><div id="divPreview" runat="server"></div></td></tr>
		</table>
		<asp:Repeater ID="rptMessages" runat="server">
		    <HeaderTemplate>
		        <br />
                <asp:Label ID="lblPrevMsgs" runat="server" EnableViewState="False" meta:resourcekey="lblPrevMsgsResource1">Previous messages in the topic:</asp:Label>
                <table style="width:100%;" cellpadding="5">
            </HeaderTemplate>
	        <ItemTemplate>
	            <tr><td>
					<%# aspnetforum.Utils.Formatting.FormatMessageHTML(Eval("Body").ToString())%>
				</td></tr>
	        </ItemTemplate>
	        <FooterTemplate></table></FooterTemplate>
		</asp:Repeater>
	</div>
	<img src="renewses.aspx" id="renewSession" alt="" />
	<script type="text/javascript">
	//focus inputs onload:
	var tbSubjId = '<%= tbSubj.ClientID %>';
	var tbMsgId = '<%= tbMsg.ClientID %>';
	try { document.getElementById(tbSubjId).focus(); }
	catch (err) {
	    try { document.getElementById(tbMsgId).focus(); }
	    catch(err1) { }
	}
	</script>
</asp:Content>