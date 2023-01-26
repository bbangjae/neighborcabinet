/**
 * requestPage.js
 */
 
$(document).ready(function(){
 	
	$(document).on("submit","#payment",function(){
		
		var count = 0;
		
		$('input[name*="req"]').each(function(){
		
			if($(this).val() == ''){
				count = 1;
			}
			
		});
		
		if(count == 1){
			event.preventDefault();
			alert("빈값 체크");
		}
		
	});
 
});