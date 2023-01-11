/**
 * header.js
 */
 
$(document).ready(function(){
	
	$('#user_button').on('click', function(){
		if($('#header_sidebar').css('right') == '0px') {
			$('#header_sidebar').css('right', '-50%');
		} else {
			$('#header_sidebar').css('right', '0px');
		}
	});
	$('#sidebar_closeBtn').on('click', function(){
		if($('#header_sidebar').css('right') == '0px') {
			$('#header_sidebar').css('right', '-50%');
		} else {
			$('#header_sidebar').css('right', '0px');
		}
	});
	//$('#header_searchNone').on('click', function(){
	//	if($('#header_search2').css('display') == 'none') {
	//		$('#header_search2').css('display', 'block');
	//	} else {
	//		$('#header_search2').css('display', 'none');
	//	}
	//});
});