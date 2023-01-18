/**
 * header.js
 */

$(document).ready(function(){
	$("#shipping_option option:selected").val();
	$("#shipping_option").on("change", function(){
	    if(this.val()=="기타사항"){
	    	$("shipping_optionInput").css('display','block');
	    }
	});
	
});