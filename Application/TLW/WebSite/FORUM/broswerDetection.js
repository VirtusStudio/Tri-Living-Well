// Set client's time zone
SetCookie("tz", -new Date().getTimezoneOffset());

// from http://www.mozilla.org/docs/web-developer/sniffer/browser_type.html
// convert all characters to lowercase to simplify testing
var agt=navigator.userAgent.toLowerCase();

// *** BROWSER VERSION ***
// Note: On IE5, these return 4, so use is_ie5up to detect IE5.
var is_major = parseInt(navigator.appVersion);
var is_minor = parseFloat(navigator.appVersion);

// Note: Opera and WebTV spoof Navigator.  We do strict client detection.
// If you want to allow spoofing, take out the tests for opera and webtv.
var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
			&& (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
			&& (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1));
var is_nav2 = (is_nav && (is_major == 2));
var is_nav3 = (is_nav && (is_major == 3));
var is_nav4 = (is_nav && (is_major == 4));
var is_nav4up = (is_nav && (is_major >= 4));
var is_navonly = (is_nav && ((agt.indexOf(";nav") != -1) ||
				(agt.indexOf("; nav") != -1)) );
var is_nav6 = (is_nav && (is_major == 5));
var is_nav6up = (is_nav && (is_major >= 5));
var is_gecko = (agt.indexOf('gecko') != -1);

var is_ie     = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
var is_ie3    = (is_ie && (is_major < 4));
var is_ie4    = (is_ie && (is_major == 4) && (agt.indexOf("msie 4")!=-1) );
var is_ie4up  = (is_ie && (is_major >= 4));
var is_ie5    = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.0")!=-1) );
var is_ie5_5  = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.5") !=-1));
var is_ie5up  = (is_ie && !is_ie3 && !is_ie4);
var is_ie5_5up =(is_ie && !is_ie3 && !is_ie4 && !is_ie5);
var is_ie6    = (is_ie && (is_major == 4) && (agt.indexOf("msie 6.")!=-1) );
var is_ie6up  = (is_ie && !is_ie3 && !is_ie4 && !is_ie5 && !is_ie5_5);

// KNOWN BUG: On AOL4, returns false if IE3 is embedded browser
// or if this is the first browser window opened.  Thus the
// variables is_aol, is_aol3, and is_aol4 aren't 100% reliable.
var is_aol   = (agt.indexOf("aol") != -1);
var is_aol3  = (is_aol && is_ie3);
var is_aol4  = (is_aol && is_ie4);
var is_aol5  = (agt.indexOf("aol 5") != -1);
var is_aol6  = (agt.indexOf("aol 6") != -1);

var is_opera = (agt.indexOf("opera") != -1);
var is_opera2 = (agt.indexOf("opera 2") != -1 || agt.indexOf("opera/2") != -1);
var is_opera3 = (agt.indexOf("opera 3") != -1 || agt.indexOf("opera/3") != -1);
var is_opera4 = (agt.indexOf("opera 4") != -1 || agt.indexOf("opera/4") != -1);
var is_opera5 = (agt.indexOf("opera 5") != -1 || agt.indexOf("opera/5") != -1);
var is_opera6 = (agt.indexOf("opera 6") != -1 || agt.indexOf("opera/6") != -1);
var is_opera5up = (is_opera && !is_opera2 && !is_opera3 && !is_opera4);

var is_webtv = (agt.indexOf("webtv") != -1); 

var is_TVNavigator = ((agt.indexOf("navio") != -1) || (agt.indexOf("navio_aoltv") != -1)); 
var is_AOLTV = is_TVNavigator;

var is_hotjava = (agt.indexOf("hotjava") != -1);
var is_hotjava3 = (is_hotjava && (is_major == 3));
var is_hotjava3up = (is_hotjava && (is_major >= 3));

// *** JAVASCRIPT VERSION CHECK ***
var is_js;
if (is_nav2 || is_ie3) is_js = 1.0;
else if (is_nav3) is_js = 1.1;
else if (is_opera5up) is_js = 1.3;
else if (is_opera) is_js = 1.1;
else if ((is_nav4 && (is_minor <= 4.05)) || is_ie4) is_js = 1.2;
else if ((is_nav4 && (is_minor > 4.05)) || is_ie5) is_js = 1.3;
else if (is_hotjava3up) is_js = 1.4;
else if (is_nav6 || is_gecko) is_js = 1.5;
// NOTE: In the future, update this code when newer versions of JS
// are released. For now, we try to provide some upward compatibility
// so that future versions of Nav and IE will show they are at
// *least* JS 1.x capable. Always check for JS version compatibility
// with > or >=.
else if (is_nav6up) is_js = 1.5;
// NOTE: ie5up on mac is 1.4
else if (is_ie5up) is_js = 1.3
// HACK: no idea for other browsers; always check for JS version with > or >=
else is_js = 0.0;

// end of browser detection

function MyGetElementById(id)
{
	return document.all[id];
}
if (document.getElementById == null)
	document.getElementById = MyGetElementById;

function OpenBlock(name)
{
	var el = document.getElementById(name);

	if (el._state == "hide") {
		el._state = "show";
		el.style.display = "block";
	} else {
		el._state = "hide";
		el.style.display = "none";
	}
}

function GetCookie(name)
{
	var nm = name + "=";
	var beg = document.cookie.indexOf(nm);
	if (beg == -1)
		return null;
	
	beg = beg + nm.length;
	
	var end = document.cookie.indexOf(";", beg);
	if (end == -1)
		end = document.cookie.length;
	
	return unescape(document.cookie.substring(beg,end))
}

function SetCookie(name,value)
{
	var argv = SetCookie.arguments;  
	var argc = SetCookie.arguments.length;  
	var expires = (argc > 2) ? argv[2] : null;  
	var path    = (argc > 3) ? argv[3] : null;  
	var domain  = (argc > 4) ? argv[4] : "rsdn.ru";  
	var secure  = (argc > 5) ? argv[5] : false;  

	if (expires == null)
	{	
		expires = new Date();
		expires.setFullYear(2020,1,1);
		expires.setHours(0,0,0,0);
	}

	if (path == null)
	{	
		path = "/";
	}

	document.cookie = 
		name + "=" + escape (value) + 
		((expires == null)? "" : ("; expires=" + expires.toGMTString())) + 
		((path    == null)? "" : ("; path="    + path)) +  
		((domain  == null)? "" : ("; domain="  + domain)) +    
		((secure  == true)? "; secure" : "");
}

function DeleteCookie(name)
{
	var exp = new Date();  
	exp.setTime (exp.getTime() - 1);   
	var cval = GetCookie(name);
	document.cookie = name + "=" + cval + "; expires=" + exp.toGMTString();
}

function GetOptions()
{
	var opt = GetCookie("opt");
	return opt == null? 0x00000001: parseInt(opt);
}

function IsOptions(opt)
{
	opt = 1 << (opt - 1);
	return (GetOptions(page) & opt) == opt;
}

function SetOption(opt,val)
{
	var gopt = GetOptions();
	opt = 1 << (opt - 1);
	opt = (gopt & ~opt) | (val?opt:0);
	SetCookie("opt",opt);
}

function FitWindowSize(objname,rw,rh)
{
	if (self == top)
	{
		var ww;
		var wh;

		if (self.innerWidth)
		{
			ww = self.innerWidth;
			wh = self.innerHeight;
		}
		else if (document.documentElement && document.documentElement.clientWidth)
		{
			ww = document.documentElement.clientWidth;
			wh = document.documentElement.clientHeight;
		}
		else if (document.body)
		{
			ww = document.body.offsetWidth;
			wh = document.body.offsetHeight;
		}
		else return;

		elm = document.getElementById(objname);
		if (elm)
		{		
			var fw;
			var fh;
			
			fw = elm.clientWidth;
			fh = elm.clientHeight;

			if (fw == 0) fw = 500;
			if (fh == 0) fh = 250;

			var dw = fw + rw - ww;
			var dh = fh + rh - wh;

			if (dw < 0) dw = 0;
			if (dh < 0) dh = 0;

			if (dw != 0 || dh != 0)
				window.resizeBy(dw,dh);
		}
	}
}