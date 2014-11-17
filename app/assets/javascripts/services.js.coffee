# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.jflatTimeline').jflatTimeline({scroll : '2', width : '700px', scrollingTime : '300'});
sfw = '';

$(window).load ->
    $(".sf-wizard fieldset").mCustomScrollbar({
      theme:"dark-3",
      scrollButtons:{
        enable:true}
    });  
    sfw.refresh();