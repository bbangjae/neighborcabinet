/**
 * header.js
 */

$(document).ready(function(){
	
	$('#SI_change').on('click', function(){
		let b = '/boxOrder2';
		let a = 'width=400, height=500, top=150, left=600, status=yes, scrollbars=yes, resizable=yes';
		window.open(b , 'SI_change', a);
	});
	
	$("#shipping_option").on("change", function(){
		
	    if($("#shipping_option").val()=="기타사항"){
	    	$("#shipping_optionInput").val('');
	    	$("#shipping_optionInput").css('display','block');
	    	
	    }else{
	    	$("#shipping_optionInput").css('display','none');
	    	$("#shipping_optionInput").val($("#shipping_option").val());
	    }
	});
	
	$("#a").on("submit", function(){
		
	
	});
	
});