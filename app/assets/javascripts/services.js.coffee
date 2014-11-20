# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$('.jflatTimeline').jflatTimeline({scroll : '2', width : '700px', scrollingTime : '300'});

sfw = '';

$(document).ready ->
    sfw = $("#event_selection").stepFormWizard();

$(document).on 'change', '#services_select', (evt) ->
    updateVenues()
    sfw.refresh();

$(document).on 'change', '#venues_select', (evt) ->
    updateDates()
    sfw.refresh();

$(document).on 'change', '#venue_dates_select', (evt) ->
    updatePartners()
    sfw.refresh();

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
        vendor_date: $("#vendor_dates_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic partners selects OK!")