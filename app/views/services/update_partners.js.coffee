$("#florists_select").empty().append("<%= escape_javascript(render(:partial => @florists)) %>");
$("#caterers_select").empty().append("<%= escape_javascript(render(:partial => @caterers)) %>");
$("#photographers_select").empty().append("<%= escape_javascript(render(:partial => @photographers)) %>")