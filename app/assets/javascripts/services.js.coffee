# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
sfw = '';

$(document).ready ->
    sfw = $("#event_selection").stepFormWizard(height:'auto');
    $('#date').multiDatesPicker({ dateFormat: "yy-mm-dd", defaultDate: window.dates[0], beforeShowDay: checkDate, onSelect: updatePartners });

$(document).on 'change', '#services_select', (evt) ->
    updateVenues();
    sfw.refresh();
    console.log(window.dates)

$(document).on 'change', '#venues_select', (evt) ->
    updateDates();
    sfw.refresh();

$(document).on 'change', '#date', (evt) ->
    updatePartners();
    sfw.refresh();

$(document).on 'change', '#any_date', (evt) ->
    if $('#any_date').is(':checked')
      $('#date').multiDatesPicker('addDates', dates)
    else
      $('#date').multiDatesPicker('removeDates', dates)

$(window).load ->
    $(".sf-wizard fieldset").mCustomScrollbar({
      theme:"dark-3",
      scrollButtons:{
        enable:true}
    });  
    sfw.refresh();

updateVenues = ->
    $.ajax 'services/update_venues',
      type: 'GET'
      dataType: 'script'
      data: {
        service_id: $("#services_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic venues select OK!");
    updateDates();

updateDates = ->
    $.ajax 'services/update_dates',
      type: 'GET'
      dataType: 'script'
      data: {
        service_id: $("#services_select option:selected").val(),
        venue_id: $("#venues_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic venue_dates select OK!");
    updatePartners();

updatePartners = ->
    $.ajax 'services/update_partners',
      type: 'GET'
      dataType: 'script'
      data: {
        service_id: $("#services_select option:selected").val(),
        venue_id: $("#venues_select option:selected").val(),
        vendor_date: getDates();
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic partners selects OK!")

getDates = ->
  picked_dates = $('#date').multiDatesPicker('getDates');
  if picked_dates.length > 0
    return picked_dates;
  else
    return window.dates;

checkDate = (date) ->
  formatted_date = moment(date).format("YYYY-MM-DD")
  if $.inArray(formatted_date, window.dates) == -1
    return [false, "", "unavailable"];
  else
    return [true, "", "available"];
