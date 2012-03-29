//fuctions used by addpost.aspx

function MozillaInsertText(element, text, pos) 
{
    element.value = element.value.slice(0,pos)+text+element.value.slice(pos);
}

function AddTag(t1,t2)
{
	if (is_ie5up)
	{
		if (document.selection)
		{
			textboxelement.focus();

			var txt = textboxelement.value;
			var str = document.selection.createRange();

			if (str.text == "")
			{
					str.text = t1 + t2;
			}
			else if (txt.indexOf(str.text) >= 0)
			{
			str.text = t1 + str.text + t2;
			}
			else
			{
				textboxelement.value = txt + t1 + t2;
			}
			str.select();
		}
	}
	else if (is_nav4up)
	{
		var element = textboxelement;
		var sel_start = element.selectionStart;
		var sel_end = element.selectionEnd;
		MozillaInsertText(element, t1, sel_start);
		MozillaInsertText(element, t2, sel_end+t1.length);
		element.selectionStart = sel_start;
		element.selectionEnd = sel_end+t1.length+t2.length;
		element.focus();    
	}    
	else
	{
		textboxelement.value = textboxelement.value + t1 + t2;
	}
}

function StripHtml(strInput)
{
	//var regexpression = /<\S[^>]*>/g;
	strInput = strInput.replace("<","&lt;");
	strInput = strInput.replace(">","&gt;");
	return strInput;
}


//=======color picker
function getScrollY(){var scrOfX = 0,scrOfY=0;if(typeof(window.pageYOffset)=='number'){scrOfY=window.pageYOffset;scrOfX=window.pageXOffset;}else if(document.body&&(document.body.scrollLeft||document.body.scrollTop)){scrOfY=document.body.scrollTop;scrOfX=document.body.scrollLeft;}else if(document.documentElement&&(document.documentElement.scrollLeft||document.documentElement.scrollTop)){scrOfY=document.documentElement.scrollTop;scrOfX=document.documentElement.scrollLeft;}return scrOfY;}

document.write("<style type='text/css'>.colorpicker201{visibility:hidden;display:none;position:absolute;background:#FFF;border:solid 1px #CCC;padding:4px;z-index:999;filter:progid:DXImageTransform.Microsoft.Shadow(color=#D0D0D0,direction=135);}.o5582brd{padding:0;width:12px;height:14px;border-bottom:solid 1px #DFDFDF;border-right:solid 1px #DFDFDF;}a.o5582n66,.o5582n66,.o5582n66a{font-family:arial,tahoma,sans-serif;text-decoration:underline;font-size:9px;color:#666;border:none;}.o5582n66,.o5582n66a{text-align:center;text-decoration:none;}a:hover.o5582n66{text-decoration:none;color:#FFA500;cursor:pointer;}.a01p3{padding:1px 4px 1px 2px;background:whitesmoke;border:solid 1px #DFDFDF;}</style>");

function getTop2(){csBrHt=0;if(typeof(window.innerWidth)=='number'){csBrHt=window.innerHeight;}else if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)){csBrHt=document.documentElement.clientHeight;}else if(document.body&&(document.body.clientWidth||document.body.clientHeight)){csBrHt=document.body.clientHeight;}ctop=((csBrHt/2)-115)+getScrollY();return ctop;}
var nocol1="&#78;&#79;&#32;&#67;&#79;&#76;&#79;&#82;",
clos1="X";

function getLeft2(){var csBrWt=0;if(typeof(window.innerWidth)=='number'){csBrWt=window.innerWidth;}else if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)){csBrWt=document.documentElement.clientWidth;}else if(document.body&&(document.body.clientWidth||document.body.clientHeight)){csBrWt=document.body.clientWidth;}cleft=(csBrWt/2)-125;return cleft;}

function setCCbldID2(val){AddTag('[color='+val+']', '[/color]');}

function setCCbldSty2(objID,prop,val){
 switch(prop){
 case "bc":if(objID!='none'){document.getElementById(objID).style.backgroundColor=val;};break;
 case "vs":document.getElementById(objID).style.visibility=val;break;
 case "ds":document.getElementById(objID).style.display=val;break;
 case "tp":document.getElementById(objID).style.top=val;break;
 case "lf":document.getElementById(objID).style.left=val;break;}}

function putOBJxColor2(Samp,pigMent){if(pigMent!='x'){setCCbldID2(pigMent);setCCbldSty2(Samp,'bc',pigMent);}setCCbldSty2('colorpicker201','vs','hidden');setCCbldSty2('colorpicker201','ds','none');}

function showColorGrid2(Sam){
var objX=new Array('00','33','66','99','CC','FF');
var c=0;var z='"'+Sam+'",""';
var xl='"'+Sam+'","x"';var mid='';
mid+='<table bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" style="border:solid 0px #F0F0F0;padding:2px;"><tr>';
mid+="<td colspan='9' align='left' style='margin:0;padding:2px;height:12px;' ><input class='o5582n66' type='text' size='12' id='o5582n66' value='#FFFFFF'><input class='o5582n66a' type='text' size='2' style='width:14px;' id='o5582n66a' onclick='javascript:alert(\"click on selected swatch below...\");' value='' style='border:solid 1px #666;'></td><td colspan='9' align='right'><a class='o5582n66' href='javascript:onclick=putOBJxColor2("+xl+")'><span class='a01p3'>"+clos1+"</span></a></td></tr><tr>";
var br=1;
for(o=0;o<6;o++){
	mid+='</tr><tr>';
	for(y=0;y<6;y++){
		if(y==3){mid+='</tr><tr>';}
		for(x=0;x<6;x++){
			var grid='';
			grid=objX[o]+objX[y]+objX[x];
			var b="'"+Sam+"','#"+grid+"'";
			mid+='<td class="o5582brd" style="background-color:#'+grid+'"><a class="o5582n66"  href="javascript:onclick=putOBJxColor2('+b+');" onmouseover=javascript:document.getElementById("o5582n66").value="#'+grid+'";javascript:document.getElementById("o5582n66a").style.backgroundColor="#'+grid+'";  title="#'+grid+'"><div style="width:12px;height:14px;"></div></a></td>';
			c++;
		}
	}
}
mid+="</tr><tr><td colspan='18' align='right' style='padding:2px;border:solid 1px #FFF;background:#FFF;'></td></tr></table>";
//var ttop=getTop2();
//setCCbldSty2('colorpicker201','tp',ttop);
//document.getElementById('colorpicker201').style.left=getLeft2();
document.getElementById('colorpicker201').innerHTML=mid;
setCCbldSty2('colorpicker201','vs','visible');
setCCbldSty2('colorpicker201','ds','inline');
}