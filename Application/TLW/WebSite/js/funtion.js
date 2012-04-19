function validateEmail(email){
       var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
       return emailPattern.test(email);
}

function validateMobile(ctl00_txtMobile){
	//var digit=/^((\+)?(\d{2}))?(\d{10}){1}?$/;
	var digit = /^\d{10}$/; 
	return digit.test(ctl00_txtMobile);
}



function registerValidation1(){
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').value ;
	var name = document.getElementById('ctl00_ContentPlaceHolder1_txtRName').value ;
	var email = document.getElementById('ctl00_ContentPlaceHolder1_txtRemail').value ;
	var dob = document.getElementById('ctl00_ContentPlaceHolder1_dob').value ;
	var ann = document.getElementById('ctl00_ContentPlaceHolder1_ann').value ;
	var occupation = document.getElementById('ctl00_ContentPlaceHolder1_txtRoccupation').value ;
	var address = document.getElementById('ctl00_ContentPlaceHolder1_txtRAddress').value ;
	var city = document.getElementById('ctl00_ContentPlaceHolder1_txtRCity').value ;

	if(phone == ""){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
	return false;
	}		
	if(!fnValidateMobileNumberR())
		return false;
    
    if( name == ""){
	alert("Please Enter your Name.");
	document.getElementById('ctl00_ContentPlaceHolder1_txtRName').focus();
	return false;
	}
	if(!fnValidateNameR())
		return false;
		
	if( email == "" ){
	alert("Please Enter your Email ID.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRemail').focus();
	return false;
	}	
	if(!fnValidateEmailIdR())
		return false;
	
	if( address  == "" ){
	alert("Please Enter your Address.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRAddress').focus();
	return false;
	}
	
	if( city  == "" ){
	alert("Please Enter your City.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRCity').focus();
	return false;
	}	
}


function registerValidation(){
    var city = document.getElementById('ctl00_ContentPlaceHolder1_txtRCity').value ;
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').value ;
	var name = document.getElementById('ctl00_ContentPlaceHolder1_txtRName').value ;
	var npassword = document.getElementById('ctl00_ContentPlaceHolder1_txtRPassword').value ;
	var cpassword = document.getElementById('ctl00_ContentPlaceHolder1_txtRPassword1').value ;
	var email = document.getElementById('ctl00_ContentPlaceHolder1_txtRemail').value ;
	var dob = document.getElementById('ctl00_ContentPlaceHolder1_dob').value ;
	var ann = document.getElementById('ctl00_ContentPlaceHolder1_ann').value ;
	var occupation = document.getElementById('ctl00_ContentPlaceHolder1_txtRoccupation').value ;
	var address = document.getElementById('ctl00_ContentPlaceHolder1_txtRAddress').value ;

	if(phone == ""){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
	return false;
	}		
	if(!fnValidateMobileNumberR())
		return false;
    
    if( name == ""){
	alert("Please Enter your Name.");
	document.getElementById('ctl00_ContentPlaceHolder1_txtRName').focus();
	return false;
	}
	if(!fnValidateNameR())
		return false;
		
	if(npassword == ""){
	    alert("Please Enter Password")
	    document.getElementById('ctl00_ContentPlaceHolder1_txtRPassword').focus();
	    return false;
	}
	
	if(cpassword == ""){
	    alert("Please confirm New Password")
	    document.getElementById('ctl00_ContentPlaceHolder1_txtRPassword1').focus();
	    return false;
	}
	
	if(npassword != cpassword){
	    alert("Password does not match.")
	    document.getElementById('ctl00_ContentPlaceHolder1_txtRPassword1').focus();
	    return false;
	}
	
	if( email == "" ){
	alert("Please Enter your Email ID.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRemail').focus();
	return false;
	}	
	if(!fnValidateEmailIdR())
		return false;
	
	if( address  == "" ){
	alert("Please Enter your Address.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRAddress').focus();
	return false;
	}
	
	if( city  == "" ){
	alert("Please Enter your City.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtRCity').focus();
	return false;
	}	
}

function fnValidateEmailIdR()
{
	var strEmailId = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtRemail').value);
	if(strEmailId != '')
	{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(strEmailId))
		{
			alert("Please Check your Email Id.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRemail').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateNameR()
{
	var strName = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtRName').value);
	if(strName != '')
	{
		if(!fnIsAlphaNChar(strName, ' '))
		{
			alert("Please Check your Name.")
			
			document.getElementById('ctl00_ContentPlaceHolder1_txtRName').focus();
			return false;	
		}	
	}
	return true;
}


function fnValidateMobileNumberR()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length != 10)
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
			return false;	
		}	
		if(strMobileNumber.charAt(0) != '9' && strMobileNumber.charAt(0) != '8' && strMobileNumber.charAt(0) != '7')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
			return false;			
		}		
		if(strMobileNumber =='9000000000' || strMobileNumber == '9111111111' || strMobileNumber == '9222222222' || strMobileNumber == '9333333333' || strMobileNumber == '944444444' || strMobileNumber == '955555555' || strMobileNumber == '966666666' || strMobileNumber == '9777777777' || strMobileNumber == '9888888888' || strMobileNumber == '9999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
			return false;			
		}		
		if(strMobileNumber =='8000000000' || strMobileNumber == '8111111111' || strMobileNumber == '8222222222' || strMobileNumber == '8333333333' || strMobileNumber == '844444444' || strMobileNumber == '855555555' || strMobileNumber == '866666666' || strMobileNumber == '8777777777' || strMobileNumber == '8888888888' || strMobileNumber == '8999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
			return false;			
		}
		if(strMobileNumber =='7000000000' || strMobileNumber == '7111111111' || strMobileNumber == '7222222222' || strMobileNumber == '7333333333' || strMobileNumber == '744444444' || strMobileNumber == '755555555' || strMobileNumber == '766666666' || strMobileNumber == '7777777777' || strMobileNumber == '7888888888' || strMobileNumber == '7999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtRMobileNo').focus();
			return false;			
		}		
	}
	return true;
}



function changeValidation(){
	var opassword = document.getElementById('ctl00_ContentPlaceHolder1_txtOPassword').value ;
	var npassword = document.getElementById('ctl00_ContentPlaceHolder1_newPassword').value ;
	var cpassword = document.getElementById('ctl00_ContentPlaceHolder1_newPassword1').value ;

	if(opassword == ""){
	    alert("Please Enter Old Password")
	    document.getElementById('ctl00_ContentPlaceHolder1_txtOPassword').focus();
	    return false;
	}
	
	if(npassword == ""){
	    alert("Please Enter New Password")
	    document.getElementById('ctl00_ContentPlaceHolder1_newPassword').focus();
	    return false;
	}
	
	if(cpassword == ""){
	    alert("Please confirm New Password")
	    document.getElementById('ctl00_ContentPlaceHolder1_newPassword1').focus();
	    return false;
	}
	
	if(npassword != cpassword){
	    alert("Password does not match.")
	    document.getElementById('ctl00_ContentPlaceHolder1_newPassword1').focus();
	    return false;
	}
}

function forgotValidation(){
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').value ;

	if(phone == ""){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
	return false;
	}		
	if(!fnValidateMobileNumberF())
		return false;
	
}

function cancelValidation(){
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtTransaction').value ;
	if(phone == ""){
	alert("Please Enter Transaction ID.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtTransaction').focus();
	return false;
	}		
}

function fnValidateMobileNumberF()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length != 10)
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;	
		}	
		if(strMobileNumber.charAt(0) != '9' && strMobileNumber.charAt(0) != '8' && strMobileNumber.charAt(0) != '7')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}		
		if(strMobileNumber =='9000000000' || strMobileNumber == '9111111111' || strMobileNumber == '9222222222' || strMobileNumber == '9333333333' || strMobileNumber == '944444444' || strMobileNumber == '955555555' || strMobileNumber == '966666666' || strMobileNumber == '9777777777' || strMobileNumber == '9888888888' || strMobileNumber == '9999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}		
		if(strMobileNumber =='8000000000' || strMobileNumber == '8111111111' || strMobileNumber == '8222222222' || strMobileNumber == '8333333333' || strMobileNumber == '844444444' || strMobileNumber == '855555555' || strMobileNumber == '866666666' || strMobileNumber == '8777777777' || strMobileNumber == '8888888888' || strMobileNumber == '8999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}
		if(strMobileNumber =='7000000000' || strMobileNumber == '7111111111' || strMobileNumber == '7222222222' || strMobileNumber == '7333333333' || strMobileNumber == '744444444' || strMobileNumber == '755555555' || strMobileNumber == '766666666' || strMobileNumber == '7777777777' || strMobileNumber == '7888888888' || strMobileNumber == '7999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}		
	}
	return true;
}



function loginValidation(){
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').value ;
	var password = document.getElementById('ctl00_ContentPlaceHolder1_txtPassword').value ;

	if(phone == ""){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
	return false;
	}		
	if(!fnValidateMobileNumberL())
		return false;
	
	if(password == ""){
	alert("Please Enter Password")
	document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
	return false;
	}		
	
}
function fnValidateMobileNumberL()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length != 10)
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;	
		}	
		if(strMobileNumber.charAt(0) != '9' && strMobileNumber.charAt(0) != '8' && strMobileNumber.charAt(0) != '7')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}		
		if(strMobileNumber =='9000000000' || strMobileNumber == '9111111111' || strMobileNumber == '9222222222' || strMobileNumber == '9333333333' || strMobileNumber == '944444444' || strMobileNumber == '955555555' || strMobileNumber == '966666666' || strMobileNumber == '9777777777' || strMobileNumber == '9888888888' || strMobileNumber == '9999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}		
		if(strMobileNumber =='8000000000' || strMobileNumber == '8111111111' || strMobileNumber == '8222222222' || strMobileNumber == '8333333333' || strMobileNumber == '844444444' || strMobileNumber == '855555555' || strMobileNumber == '866666666' || strMobileNumber == '8777777777' || strMobileNumber == '8888888888' || strMobileNumber == '8999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}
		if(strMobileNumber =='7000000000' || strMobileNumber == '7111111111' || strMobileNumber == '7222222222' || strMobileNumber == '7333333333' || strMobileNumber == '744444444' || strMobileNumber == '755555555' || strMobileNumber == '766666666' || strMobileNumber == '7777777777' || strMobileNumber == '7888888888' || strMobileNumber == '7999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtMobileNo').focus();
			return false;			
		}		
	}
	return true;
}


function registrationValidation(){
    
    var phone = document.getElementById('ctl00_txtMobile').value ;
	var name = document.getElementById('ctl00_txtName').value ;
	var email = document.getElementById('ctl00_txtEmail').value ;
	
	var date = document.getElementById('ctl00_datepicker').value ;
	var time = document.getElementById('ctl00_txtTime').value ;
	var location = document.getElementById('ctl00_ddlLocation').value ;
	var location1 = document.getElementById('ctl00_DropDownList1').value ;
	var location2 = document.getElementById('ctl00_DropDownList2').value ;
	var address = document.getElementById('ctl00_txtAddress').value ;
	var area = document.getElementById('ctl00_txtArea').value ;
	
	if(phone == "" || phone == "Your mobile number"){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_txtMobile').focus();
	return false;
	}		
	if(!fnValidateMobileNumber())
		return false;
		
	if( name == "" || name == "Your name"){
	alert("Please Enter your Name.");
	document.getElementById('ctl00_txtName').focus();
	return false;
	}
	if(!fnValidateName())
		return false;
		
	if( email == "" || email == "Your Email ID" ){
	alert("Please Enter your Email ID.")
	document.getElementById('ctl00_txtEmail').focus();
	return false;
	}	
	if(!fnValidateEmailId())
		return false;
		
	if(date == "" || date == "Select Date" ){
	alert("Please select the date you would like to travel from.")
	document.getElementById('ctl00_datepicker').focus();
	return false;
	}	
		
	if(time == "" ){
	alert("Please select the time you would like to travel from.")
	document.getElementById('ctl00_txtTime').focus();
	return false;
	}	
	
	var d = new Date();
	var date1 = d.getDate();
	var month = d.getMonth() + 1;
	var year = d.getFullYear();
	
	if (date1 < 10)
	    date1 = "0" + date1;
	
	if (month < 10)
	    month = "0" + month;
	    
	strDate = date1 + "-" + month  + "-" + year;
	//alert(ctl00_datepicker);
	
	//alert(date);
	//alert(strDate);
    
    var curr_hour = d.getHours();   
    var curr_min = d.getMinutes();
    
    if (curr_hour < 10)
	    curr_hour = "0" + curr_hour;
	
	if (curr_min < 10)
	    curr_min = "0" + curr_min;
    
    strTime = curr_hour + ":" + curr_min;
    
    //alert(curr_hour);
    //alert(curr_min);
    //alert(strTime);
    //alert(time);
    if (curr_min < 30)
    {
        curr_min1 = d.getMinutes() + 30;
	    strTime1 = curr_hour + ":" + curr_min1;
	}
	else
	{
	    curr_min1 = d.getMinutes() + 30;
	    curr_hour = curr_hour + 1;
	    curr_min1 = curr_min1 - 60;
	    strTime1 = curr_hour + ":" + curr_min1;
	}
	
	
	//alert(strTime1);
   
   if (date == strDate)
   {
        if(time < strTime)
        {
	        alert("The time of travel can't be less than current time.")
	        document.getElementById('ctl00_txtTime').focus();
	        return false;
	    }     
	    
	    if(time < strTime1)
        {
	        alert("The time of travel should exceed atleast half hr than current time.")
	        document.getElementById('ctl00_txtTime').focus();
	        return false;
	    }   
   }
   
	
	if(location == "" || location == "Pickup City" ){
	alert("Please enter a City you would like to travel from.")
	document.getElementById('ctl00_ddlLocation').focus();
	return false;
	}
	
	if(location == "Delhi" || location == "Mumbai" || location == "Hyderabad" || location == "Bangalore" ){
	}
	else
	{
		alert("Booking is not available for specified location.")
		document.getElementById('ctl00_ddlLocation').focus();
		return false;
	}
	
	if(location1 == "" || location1 == "Location"){
	alert("Please enter the location you would like to travel from.")
	document.getElementById('ctl00_DropDownList1').focus();
	return false;
	}
	
	if(location2 == "" || location2 == "0"){
	alert("Please select a sub-location you would like to travel from.")
	document.getElementById('ctl00_DropDownList2').focus();
	return false;
	}	
	
	if(address == "" || address == "Pickup Address" ){
	alert("Please enter your Address.")
	document.getElementById('ctl00_txtAddress').focus();
	return false;
	}
	
	if(area == "" || area == "Drop Address" ){
	alert("Please enter the area you would like to travel to.")
	document.getElementById('ctl00_txtArea').focus();
	return false;
	}	
	document.getElementById("submit").style.display = "none";
	document.getElementById("waiting").style.display = "block";
	
}


function dealValidation(){
    var name = document.getElementById('ctl00_txtDealName').value ;
    var phone = document.getElementById('ctl00_txtDealMobile').value ;
	var email = document.getElementById('ctl00_txtDealEmail').value ;
	
	if( name == "" || name == "Name"){
	alert("Please Enter your Name.");
	document.getElementById('ctl00_txtDealName').focus();
	return false;
	}
	if(!fnValidateName1())
		return false;
	
	if( email == "" || email == "Email" ){
	alert("Please Enter your Email ID.")
	document.getElementById('ctl00_txtDealEmail').focus();
	return false;
	}	
	if(!fnValidateEmailId1())
		return false;
	
	if(phone == "" || phone == "Mobile"){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_txtDealMobile').focus();
	return false;
	}		
	if(!fnValidateMobileNumber1())
		return false;
}

function validateEnquiry(){
    var name = document.getElementById('ctl00_ContentPlaceHolder1_txtBName').value ;
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').value ;
    var city = document.getElementById('ctl00_ContentPlaceHolder1_txtBCity').value ;
	var email = document.getElementById('ctl00_ContentPlaceHolder1_txtBEmail').value ;
	var enquiry = document.getElementById('ctl00_ContentPlaceHolder1_txtBEnquiry').value ;
	
	if( name == ""){
	alert("Please Enter your Name.");
	document.getElementById('ctl00_ContentPlaceHolder1_txtBName').focus();
	return false;
	}
	if(!fnValidateName2())
		return false;
	
	if(phone == ""){
	alert("Please Enter Your Mobile No.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
	return false;
	}		
	if(!fnValidateMobileNumber2())
		return false;
	
	if(email == ""){
	alert("Please Enter your Email ID.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtBEmail').focus();
	return false;
	}	
	if(!fnValidateEmailId2())
		return false;
	
	if(city == ""){
	alert("Please select Your City.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtBCity').focus();
	return false;
	}		

    if(enquiry == ""){
	alert("Please enter Your Enquiry.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtBEnquiry').focus();
	return false;
	}	
}

function fnValidateMobileNumber()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_txtMobile').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length != 10)
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtMobile').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtMobile').focus();
			return false;	
		}	
		if(strMobileNumber.charAt(0) != '9' && strMobileNumber.charAt(0) != '8' && strMobileNumber.charAt(0) != '7')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtMobile').focus();
			return false;			
		}		
		if(strMobileNumber =='9000000000' || strMobileNumber == '9111111111' || strMobileNumber == '9222222222' || strMobileNumber == '9333333333' || strMobileNumber == '944444444' || strMobileNumber == '955555555' || strMobileNumber == '966666666' || strMobileNumber == '9777777777' || strMobileNumber == '9888888888' || strMobileNumber == '9999999999')
		{
			alert("Please Check your Mobile No.")
			
			document.getElementById('ctl00_txtMobile').focus();
			return false;			
		}		
		if(strMobileNumber =='8000000000' || strMobileNumber == '8111111111' || strMobileNumber == '8222222222' || strMobileNumber == '8333333333' || strMobileNumber == '844444444' || strMobileNumber == '855555555' || strMobileNumber == '866666666' || strMobileNumber == '8777777777' || strMobileNumber == '8888888888' || strMobileNumber == '8999999999')
		{
			alert("Please Check your Mobile No.")
			
			document.getElementById('ctl00_txtMobile').focus();
			return false;			
		}
		if(strMobileNumber =='7000000000' || strMobileNumber == '7111111111' || strMobileNumber == '7222222222' || strMobileNumber == '7333333333' || strMobileNumber == '744444444' || strMobileNumber == '755555555' || strMobileNumber == '766666666' || strMobileNumber == '7777777777' || strMobileNumber == '7888888888' || strMobileNumber == '7999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtMobile').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateMobileNumber1()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_txtDealMobile').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length != 10)
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtDealMobile').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtDealMobile').focus();
			return false;	
		}	
		if(strMobileNumber.charAt(0) != '9' && strMobileNumber.charAt(0) != '8' && strMobileNumber.charAt(0) != '7')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtDealMobile').focus();
			return false;			
		}		
		if(strMobileNumber =='9000000000' || strMobileNumber == '9111111111' || strMobileNumber == '9222222222' || strMobileNumber == '9333333333' || strMobileNumber == '944444444' || strMobileNumber == '955555555' || strMobileNumber == '966666666' || strMobileNumber == '9777777777' || strMobileNumber == '9888888888' || strMobileNumber == '9999999999')
		{
			alert("Please Check your Mobile No.")
			
			document.getElementById('ctl00_txtDealMobile').focus();
			return false;			
		}		
		if(strMobileNumber =='8000000000' || strMobileNumber == '8111111111' || strMobileNumber == '8222222222' || strMobileNumber == '8333333333' || strMobileNumber == '844444444' || strMobileNumber == '855555555' || strMobileNumber == '866666666' || strMobileNumber == '8777777777' || strMobileNumber == '8888888888' || strMobileNumber == '8999999999')
		{
			alert("Please Check your Mobile No.")
			
			document.getElementById('ctl00_txtDealMobile').focus();
			return false;			
		}
		if(strMobileNumber =='7000000000' || strMobileNumber == '7111111111' || strMobileNumber == '7222222222' || strMobileNumber == '7333333333' || strMobileNumber == '744444444' || strMobileNumber == '755555555' || strMobileNumber == '766666666' || strMobileNumber == '7777777777' || strMobileNumber == '7888888888' || strMobileNumber == '7999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_txtDealMobile').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateMobileNumber2()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length != 10)
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
			return false;	
		}	
		if(strMobileNumber.charAt(0) != '9' && strMobileNumber.charAt(0) != '8' && strMobileNumber.charAt(0) != '7')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
			return false;			
		}		
		if(strMobileNumber =='9000000000' || strMobileNumber == '9111111111' || strMobileNumber == '9222222222' || strMobileNumber == '9333333333' || strMobileNumber == '944444444' || strMobileNumber == '955555555' || strMobileNumber == '966666666' || strMobileNumber == '9777777777' || strMobileNumber == '9888888888' || strMobileNumber == '9999999999')
		{
			alert("Please Check your Mobile No.")
			
			document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
			return false;			
		}		
		if(strMobileNumber =='8000000000' || strMobileNumber == '8111111111' || strMobileNumber == '8222222222' || strMobileNumber == '8333333333' || strMobileNumber == '844444444' || strMobileNumber == '855555555' || strMobileNumber == '866666666' || strMobileNumber == '8777777777' || strMobileNumber == '8888888888' || strMobileNumber == '8999999999')
		{
			alert("Please Check your Mobile No.")
			
			document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
			return false;			
		}
		if(strMobileNumber =='7000000000' || strMobileNumber == '7111111111' || strMobileNumber == '7222222222' || strMobileNumber == '7333333333' || strMobileNumber == '744444444' || strMobileNumber == '755555555' || strMobileNumber == '766666666' || strMobileNumber == '7777777777' || strMobileNumber == '7888888888' || strMobileNumber == '7999999999')
		{
			alert("Please Check your Mobile No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtBPhone').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateEmailId()
{
	var strEmailId = fnTrim(document.getElementById('ctl00_txtEmail').value);
	if(strEmailId != '')
	{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(strEmailId))
		{
			alert("Please Check your Email Id.")
			document.getElementById('ctl00_txtEmail').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateEmailId1()
{
	var strEmailId = fnTrim(document.getElementById('ctl00_txtDealEmail').value);
	if(strEmailId != '')
	{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(strEmailId))
		{
			alert("Please Check your Email Id.")
			document.getElementById('ctl00_txtDealEmail').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateEmailId2()
{
	var strEmailId = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtBEmail').value);
	if(strEmailId != '')
	{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(strEmailId))
		{
			alert("Please Check your Email Id.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtBEmail').focus();
			return false;			
		}		
	}
	return true;
}

function fnValidateName()
{
	var strName = fnTrim(document.getElementById('ctl00_txtName').value);
	if(strName != '')
	{
		if(!fnIsAlphaNChar(strName, ' '))
		{
			alert("Please Check your Name.")
			
			document.getElementById('ctl00_txtName').focus();
			return false;	
		}	
	}
	return true;
}

function fnValidateName1()
{
	var strName = fnTrim(document.getElementById('ctl00_txtDealName').value);
	if(strName != '')
	{
		if(!fnIsAlphaNChar(strName, ' '))
		{
			alert("Please Check your Name.")
			
			document.getElementById('ctl00_txtDealName').focus();
			return false;	
		}	
	}
	return true;
}

function fnValidateName2()
{
	var strName = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtBName').value);
	if(strName != '')
	{
		if(!fnIsAlphaNChar(strName, ' '))
		{
			alert("Please Check your Name.")
			
			document.getElementById('ctl00_ContentPlaceHolder1_txtBName').focus();
			return false;	
		}	
	}
	return true;
}

function fnValidateName3()
{
	var strName = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtCName').value);
	if(strName != '')
	{
		if(!fnIsAlphaNChar(strName, ' '))
		{
			alert("Please Check your Name.")
			
			document.getElementById('ctl00_ContentPlaceHolder1_txtCName').focus();
			return false;	
		}	
	}
	return true;
}


function validateSupportForm(){
    var name = document.getElementById('ctl00_ContentPlaceHolder1_txtCName').value ;
    var phone = document.getElementById('ctl00_ContentPlaceHolder1_txtCMobile').value ;
    var city = document.getElementById('ctl00_ContentPlaceHolder1_txtCCity').value ;
	var email = document.getElementById('ctl00_ContentPlaceHolder1_txtCEmail').value ;
	var enquiry = document.getElementById('ctl00_ContentPlaceHolder1_txtSuggestion').value ;
	var cabno = document.getElementById('ctl00_ContentPlaceHolder1_txtCCabno').value ;
	var date = document.getElementById('ctl00_ContentPlaceHolder1_txtDD').value ;
	var month = document.getElementById('ctl00_ContentPlaceHolder1_txtMM').value ;
	var year = document.getElementById('ctl00_ContentPlaceHolder1_txtYY').value ;
	var time = document.getElementById('ctl00_ContentPlaceHolder1_txtCTime').value ;
	var bookingid = document.getElementById('ctl00_ContentPlaceHolder1_txtCbookingId').value ;
	
	
	if( name == ""){
	alert("Please Enter your Name.");
	document.getElementById('ctl00_ContentPlaceHolder1_txtCName').focus();
	return false;
	}
	if(!fnValidateName3())
		return false;
		
	if(city == ""){
	alert("Please select Your City.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtCCity').focus();
	return false;
	}	
	
	if(cabno == ""){
	alert("Please enter Cab Number.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtCCabno').focus();
	return false;
	}
	
	if(date == ""){
	alert("Please select date of journey.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtDD').focus();
	return false;
	}
	
	if(month == ""){
	alert("Please select month of journey.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtMM').focus();
	return false;
	}
	
	if(year == ""){
	alert("Please select year of journey.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtYY').focus();
	return false;
	}
	
	if(time == ""){
	alert("Please select pick-up time.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtCTime').focus();
	return false;
	}
	
	if(bookingid == ""){
	alert("Please enter Booking Id.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtCbookingId').focus();
	return false;
	}
	
	
	
	if(enquiry == ""){
	alert("Please enter Your specific complaints/suggestions.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtSuggestion').focus();
	return false;
	}	
	
	
	if(phone == "" && email == ""){
	alert("Please Enter Your Mobile No. or Email ID for contact.")
	document.getElementById('ctl00_ContentPlaceHolder1_txtCMobile').focus();
	return false;
	}
	
	if(phone != ""){
		if(!fnValidateMobileNumber3())
		return false;
	}
	
	if(email != ""){
	    if(!fnValidateEmailId3())
		    return false;
	}
}

function fnValidateMobileNumber3()
{	
	var strMobileNumber = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtCMobile').value);
	if(strMobileNumber != '')
	{
		if(strMobileNumber.length > 12)
		{
			alert("Please Check your Contact No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtCMobile').focus();
			return false;			
		}
		if(!fnIsNumeric(strMobileNumber))
		{
			alert("Please Check your Contact No.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtCMobile').focus();
			return false;	
		}	
	}
	return true;
}

function fnValidateEmailId3()
{
	var strEmailId = fnTrim(document.getElementById('ctl00_ContentPlaceHolder1_txtCEmail').value);
	if(strEmailId != '')
	{
		var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		if (!filter.test(strEmailId))
		{
			alert("Please Check your Email Id.")
			document.getElementById('ctl00_ContentPlaceHolder1_txtCEmail').focus();
			return false;			
		}		
	}
	return true;
}

