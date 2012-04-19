function fnIsAlphaNChar(param, strCharacters)
{
    var strAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + strCharacters;
    var intLen = param.length;
    for(i = 0; i < intLen; i++)
    {
        if(strAlphabet.indexOf(param.charAt(i).toUpperCase()) == -1)
        {
            return false;
        }
    }
    return true;
}

function fnIsAlpha(param)
{
    var strAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var intLen = param.length;
    for(i = 0; i < intLen; i++)
    {
        if(strAlphabet.indexOf(param.charAt(i).toUpperCase()) == -1)
        {
            return false;
        }
    }
    return true;
}

function fnIsNumeric(param)
{
    var strNumeric = "0123456789";
    var intLen = param.length;
    for(i = 0; i < intLen; i++)
    {
        if(strNumeric.indexOf(param.charAt(i)) == -1)
        {
            return false;
        }
    }
    return true;
}

function fnHasDigits(param)
{
    var strNumeric = "0123456789";
    var intLen = param.length;
    for(i = 0; i < intLen; i++)
    {
        if(strNumeric.indexOf(param.charAt(i)) != -1)
        {
            return true;
        }
    }
    return false;
}

function fnIsPositiveDecimalValue(param)
{
    var regExp=/(^\d+$)|(^\d+\.\d+$)/
	return regExp.test(param);
}

function fnTrim(strParam)
{
    strParam = fnLeftTrim(strParam);
    strParam = fnRightTrim(strParam);
    return strParam;
}

function fnLeftTrim(strParam)
{
    while (strParam.substring(0,1) == ' ')
    {
        strParam = strParam.substring(1, strParam.length);
    }
    return strParam;
}

function fnRightTrim(strParam) 
{
    while (strParam.substring(strParam.length-1, strParam.length) == ' ')
    {
        strParam = strParam.substring(0,strParam.length-1);
    }
    return strParam;
}

function fnIsValidEmail(param)
{
	var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	if (!filter.test(param))
		return false;			
	else
		return true;
}

function fnIsValidEmailAnother(emailStr)
{

/* The following variable tells the rest of the function whether or not
to verify that the address ends in a two-letter country or well-known
TLD.  1 means check it, 0 means don't. */

var checkTLD=0;

/* The following is the list of known TLDs that an e-mail address must end with. */

var knownDomsPat=/^(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum)$/;

/* The following pattern is used to check if the entered e-mail address
fits the user@domain format.  It also is used to separate the username
from the domain. */

var emailPat=/^(.+)@(.+)$/;

/* The following string represents the pattern for matching all special
characters.  We don't want to allow special characters in the address. 
These characters include ( ) < > @ , ; : \ " . [ ] */

var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";

/* The following string represents the range of characters allowed in a 
username or domainname.  It really states which chars aren't allowed.*/

var validChars="\[^\\s" + specialChars + "\]";

/* The following pattern applies if the "user" is a quoted string (in
which case, there are no rules about which characters are allowed
and which aren't; anything goes).  E.g. "jiminy cricket"@disney.com
is a legal e-mail address. */

var quotedUser="(\"[^\"]*\")";

/* The following pattern applies for domains that are IP addresses,
rather than symbolic names.  E.g. joe@[123.124.233.4] is a legal
e-mail address. NOTE: The square brackets are required. */

var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;

/* The following string represents an atom (basically a series of non-special characters.) */

var atom=validChars + '+';

/* The following string represents one word in the typical username.
For example, in john.doe@somewhere.com, john and doe are words.
Basically, a word is either an atom or quoted string. */

var word="(" + atom + "|" + quotedUser + ")";

// The following pattern describes the structure of the user

var userPat=new RegExp("^" + word + "(\\." + word + ")*$");

/* The following pattern describes the structure of a normal symbolic
domain, as opposed to ipDomainPat, shown above. */

var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");

/* Finally, let's start trying to figure out if the supplied address is valid. */

/* Begin with the coarse pattern to simply break up user@domain into
different pieces that are easy to analyze. */

var matchArray=emailStr.match(emailPat);

if (matchArray==null) {

/* Too many/few @'s or something; basically, this address doesn't
even fit the general mould of a valid e-mail address. */

//alert("Email address seems incorrect (check @ and .'s)");
return false;
}
var user=matchArray[1];
var domain=matchArray[2];

// Start by checking that only basic ASCII characters are in the strings (0-127).

for (i=0; i<user.length; i++) {
if (user.charCodeAt(i)>127) {
//alert("Ths username contains invalid characters.");
return false;
   }
}
for (i=0; i<domain.length; i++) {
if (domain.charCodeAt(i)>127) {
//alert("Ths domain name contains invalid characters.");
return false;
   }
}

// See if "user" is valid 

if (user.match(userPat)==null) {

// user is not valid

//alert("The username doesn't seem to be valid.");
return false;
}

/* if the e-mail address is at an IP address (as opposed to a symbolic
host name) make sure the IP address is valid. */

var IPArray=domain.match(ipDomainPat);
if (IPArray!=null) {

// this is an IP address

for (var i=1;i<=4;i++) {
if (IPArray[i]>255) {
//alert("Destination IP address is invalid!");
return false;
   }
}
return true;
}

// Domain is symbolic name.  Check if it's valid.
 
var atomPat=new RegExp("^" + atom + "$");
var domArr=domain.split(".");
var len=domArr.length;
for (i=0;i<len;i++) {
if (domArr[i].search(atomPat)==-1) {
//alert("The domain name does not seem to be valid.");
return false;
   }
}

/* domain name seems valid, but now make sure that it ends in a
known top-level domain (like com, edu, gov) or a two-letter word,
representing country (uk, nl), and that there's a hostname preceding 
the domain or country. */

if (checkTLD && domArr[domArr.length-1].length!=2 && 
domArr[domArr.length-1].search(knownDomsPat)==-1) {
//alert("The address must end in a well-known domain or two letter " + "country.");
return false;
}

// Make sure there's a host name preceding the domain.

if (len<2) {
//alert("This address is missing a hostname!");
return false;
}

// If we've gotten this far, everything's valid!
return true;
} 

function isDate(dtStr)
{
    //dtStr=document.getElementById("txtYrPass1").value
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : MM/DD/YYYY")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
	return true;
}

var dtCh= "/";
var minYear=1900;
var maxYear=2100;

function isInteger(s)
{
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag)
{
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year)
{
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) 
{
	for (var i = 1; i <= n; i++) 
	{
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   	} 
   	return this;
}

function CompareDates(strDate1, strDate2) 
{    
	var mon1  = parseInt(strDate1.split('/')[0]);    
	var dt1   = parseInt(strDate1.split('/')[1]);    
	var yr1   = parseInt(strDate1.split('/')[2]);    
	var mon2  = parseInt(strDate2.split('/')[0]);    
	var dt2   = parseInt(strDate2.split('/')[1]);    
	var yr2   = parseInt(strDate2.split('/')[2]);    
	var date1 = new Date(yr1, mon1, dt1);    
	var date2 = new Date(yr2, mon2, dt2);    
	if(date1 == date2)
		return 0;//date 1 is same as date 2	
	if(date1 > date2)   
		return 1;//date 1 is greater than date 2
	else    
		return -1;//date 2 is greater than date 1
} 