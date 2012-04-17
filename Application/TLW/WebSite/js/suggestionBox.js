$(function() {


    $("#txtLocation").autocomplete({
	source: function(request, response) {
    $.ajax({
        url: "Autocomplete.ashx?location=" + document.getElementById("txtLocation").value + "&branch=" + document.getElementById("DropDownListPickupCity").value,
        contentType: "application/json; charset=utf-8",
        dataFilter: function(data) { return data; },
        success: function(data) {
            response($.map(data.d, function(item) {
                return {
                    value: item.Branch
                }
            }))
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert(textStatus);
        }
    });
    },
    minLength: 1            
});


});