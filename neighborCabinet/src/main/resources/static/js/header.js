/**
 * header.js
 */
 
$(document).ready(function(){
	
	var sidebar = $('#header_sidebar');
	var sidebar_background = $('#outside_sidebar');
	
	$('#user_button').on('click', function(){
        if(sidebar.css('right') != '0px') {
        	sidebar.animate({right:0}, 50);
        	sidebar_background.css('z-index', '150');
        	sidebar_background.css('background-color', 'rgba(0,0,0,0.5)');
        }
    });
    $('#sidebar_closeBtn').on('click', function(){
    	if(sidebar.css('right') == '0px') {
    		sidebar.animate({right:-410}, 50);
    		sidebar_background.css('z-index', '-1');
    		sidebar_background.css('background-color', 'transparent');
    	}
    });
    $(document).mouseup(function (e){
		if(sidebar.has(e.target).length==0) {
			sidebar.animate({right:-410}, 50);
			sidebar_background.css('z-index', '-1');
    		sidebar_background.css('background-color', 'transparent');
		}
	});
});