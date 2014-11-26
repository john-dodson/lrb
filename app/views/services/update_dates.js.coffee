window.dates = <%= raw @vendor_dates.to_json %>;
console.log("done with dates");
console.log(window.dates);
$('#date').multiDatesPicker('refresh')
# $('#date').multiDatesPicker('destroy');
# $('#date').multiDatesPicker({ 
#   dateFormat: "yy-mm-dd",
#   onSelect: updatePartners, 
#   defaultDate: window.dates[0], 
#   beforeShowDay: (date) -> 
#     formatted_date = moment(date).format("YYYY-MM-DD")
#     if $.inArray(formatted_date, window.dates) == -1
#       return [false, "", "unavailable"];
#     else
#       debugger;
#       return [true, "", "available"];
# });