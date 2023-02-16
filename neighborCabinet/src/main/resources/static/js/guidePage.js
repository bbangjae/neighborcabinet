/**
 * 가이드 페이지
 */
 
 $(document).ready(function () {
 
 	$(document).on("click","#TypeA",function(){
 		
 		 $("#Type1Guide").css("display", "");
 		 $("#Type2Guide").css("display", "none");
	});
	
	$(document).on("click","#TypeB",function(){
 	
		 $("#Type2Guide").css("display", "");
 		 $("#Type1Guide").css("display", "none");
	});
 	
 });