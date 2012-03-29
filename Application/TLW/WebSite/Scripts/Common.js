/****************************************/
/// Function Header*******************************************************
/// Function Name: RedirectToOtherPage
/// Function Type: Function
/// Functionality: Following function is used to redirect to any page
/// Input: url -- where to redirect
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************

function RedirectToOtherPage(url) {
    window.location.href = url;

}


/****************************************/
/// Function Header*******************************************************
/// Function Name: CheckDateisGreaterThenTodayDate
/// Function Type: Function
/// Functionality: Following function is used to check wheather the date is greater then today date or not.
/// Input: 
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function CheckDateisGreaterThenTodayDate(ctrlID, ErrorMsg) {

    var dtToCompare = new Date(document.getElementById(ctrlID).value);
    var currentTime = new Date();
    var month = currentTime.getMonth() + 1;
    var day = currentTime.getDate();
    var year = currentTime.getFullYear();

    if (Date.parse(month + "/" + day + "/" + year) > Date.parse(dtToCompare)) {
        document.getElementById(ctrlID).value = "";
        alert(ErrorMsg);
    }
}


/****************************************/
/// Function Header*******************************************************
/// Function Name: AllowDecimal
/// Function Type: Function
/// Functionality: Following function is used to enter only the decimal values
/// Input: 
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function AllowDecimal(e, ctrl) {
    var varStr = document.getElementById(ctrl.id).value.split('.');
    var varCode = e.keyCode ? e.keyCode : e.charCode

    if (Number(varCode) == Number(46)) {
        if (varStr.length > 1) {
            return false;
        }
    }


    if (Number(varCode) == Number(8) || Number(varCode) == Number(9) || Number(varCode) == Number(37) || Number(varCode) == Number(39))
        return true;
    if (Number(varCode) == Number(47)) {
        return false;
    }
    if (Number(varCode) <= Number(57) && Number(varCode) > Number(45)) {
        return true;
    }
    else
        return false;
}
/****************************************/
/// Function Header*******************************************************
/// Function Name: AllowChar
/// Function Type: Function
/// Functionality: Following function used to enter only the char values
/// Input: event, 
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function AllowChar(e) {
    var varCode = e.keyCode ? e.keyCode : e.charCode;
    if (Number(varCode) >= Number(97) && Number(varCode) <= Number(122) || Number(varCode) >= Number(65) && Number(varCode) <= Number(90))
        return true;
    else
        return false;
}
/****************************************/
/// Function Header*******************************************************
/// Function Name: OpenPopup
/// Function Type: Function
/// Functionality: Following function is used to open the popup and as per the parameter 
// parameter of popup can be change if required.
/// Input: FullUrl it contains the whole URL including the Querystring , 
// SectionNameWithoutSpace = contains the name of the Section Without any space, with the help of this 
// seciton name the properties of the popup can be changed.
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function OpenPopup(FullUrl, SectionNameWithoutSpace, PopupHeight, PopupWidth) {

    //width, height, top, left, directories, location, resizable, menubar, toolbar, scrollbars, status
    var newwindow = window.open(FullUrl, SectionNameWithoutSpace, 'height=' + PopupHeight + ',width=' + PopupWidth + ',status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');
    if (window.focus) { newwindow.focus() }
    return false;
}

/****************************************/
/// Function Header*******************************************************
/// Function Name: OpenPopup
/// Function Type: Function
/// Functionality: Following function is used to open the popup and as per the parameter 
// parameter of popup can be change if required.
/// Input: FullUrl it contains the whole URL including the Querystring , 
// SectionNameWithoutSpace = contains the name of the Section Without any space, with the help of this 
// seciton name the properties of the popup can be changed.
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function OpenPopupCMSPopup(FullUrl, SectionNameWithoutSpace) {
     
    //width, height, top, left, directories, location, resizable, menubar, toolbar, scrollbars, status
    var newwindow = window.open(FullUrl, SectionNameWithoutSpace, 'height=600,width=700,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');
    if (window.focus) { newwindow.focus() }
    return false;
}


/****************************************/
/// Function Header*******************************************************
/// Function Name: RedirectToOtherPage
/// Function Type: Function
/// Functionality: Following function is used to redirect to any page
/// Input: url -- where to redirect
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************

function ConfirmDelete(itemName) {
    return confirm('Are you sure that you want to delete/remove this ' + itemName + ' ?');
}

function check_uncheck(Val) {
    var ValChecked = Val.checked;

    var ValId = Val.id;

    var frm = document.forms[0];
    // Loop through all elements
    for (i = 0; i < frm.length; i++) {
        // Look for Header Template's Checkbox
        if (this != null) {
            if (ValId.indexOf('chkSelectAll') != -1) {
                // Check if main checkbox is checked, then select or deselect datagrid checkboxes 
                if (ValChecked) {
                    if (frm.elements[i].disabled) {
                        //alert(frm.elements[i].disabled);
                    }
                    else {
                        frm.elements[i].checked = true;
                    }


                }
                else {
                    if (frm.elements[i].disabled) {
                    }
                    else {
                        frm.elements[i].checked = false;
                    }
                }
            }
            else if (ValId.indexOf('chkSelect') != -1) {
                // Check if any of the checkboxes are not checked, and then uncheck top select all checkbox
                if (frm.elements[i].checked == false) frm.elements[1].checked = false;
            }
        } // if
    } // for
} // function



/****************************************/
/// Function Header*******************************************************
/// Function Name: ConfirmChangeStatus
/// Function Type: Function
/// Functionality: function used to confirm the user regarding the changing in status
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function ConfirmChangeStatus() {
    return confirm('Are you sure that you want to change the status?');
}


/****************************************/
/// Function Header*******************************************************
/// Function Name: RoundNumber
/// Function Type: Function
/// Functionality: function used to round the decimal value
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function RoundNumber(num, dec) {
    var result = num.toFixed(dec);
    return result;
}


/****************************************/
/// Function Header*******************************************************
/// Function Name: ConfirmChangeStatus
/// Function Type: Function
/// Functionality: function used to confirm the user regarding the changing in status
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function ConfirmBid(actionType) {
    return confirm('Are you sure that you want to ' + actionType + '? ');
}

/****************************************/
/// Function Header*******************************************************
/// Function Name: ConfirmChangeStatus
/// Function Type: Function
/// Functionality: function used to confirm the user regarding the changing in status
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function isValidEmail(str) {

    var at = "@";
    var dot = ".";
    var lat = str.indexOf(at);
    var lstr = str.length;
    var ldot = str.indexOf(dot);
    if (str.indexOf(at) == -1) {
        alert("Invalid E-mail ID");
        return false;
    }

    if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
        alert("Invalid E-mail ID");
        return false;
    }

    if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
        alert("Invalid E-mail ID");
        return false;
    }

    if (str.indexOf(at, (lat + 1)) != -1) {
        alert("Invalid E-mail ID");
        return false;
    }

    if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
        alert("Invalid E-mail ID");
        return false;
    }

    if (str.indexOf(dot, (lat + 2)) == -1) {
        alert("Invalid E-mail ID");
        return false;
    }

    if (str.indexOf(" ") != -1) {
        alert("Invalid E-mail ID");
        return false;
    }

    return true;
}


/****************************************/
/// Function Header*******************************************************
/// Function Name: mask
/// Function Type: Function
/// Functionality: function used to return the mask output for the textbox.
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function mask(str, textbox, loc, delim) {
    var locs = loc.split(',');
    for (var i = 0; i <= locs.length; i++) {

        for (var k = 0; k <= str.length; k++) {
            if (k == locs[i]) {
                if (str.substring(k, k + 1) != delim) {
                    str = str.substring(0, k) + delim + str.substring(k, str.length);
                }
            }
        }
    }

    textbox.value = str;
}


/****************************************/
/// Function Header*******************************************************
/// Function Name: ConvertOZToGram
/// Function Type: Function
/// Functionality: function used to convert the value of oz to gram
/// Output: 
/// Return Value:
/// Note: 
/// *********************************************************************
function ConvertOZToGram(ValueinOZ) {

    return parseFloat(ValueinOZ) * parseFloat(28.34);
}


function DisplayCurrencyDeactivatedMsg() {

}