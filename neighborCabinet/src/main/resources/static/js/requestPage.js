/**
 * requestPage.js
 */
 
$(document).ready(function(){
 	
	$(document).on("submit","#payment",function(){
		
		var count = 0;
		
		$('input[name*="sender"]').each(function(){
		
			if($(this).val() == ''){
				count = 1;
			}
			
		});
		
		if($('input[name="storList"]').val() == ''){
			count = 1;
		};
		
		if(count == 1){
			event.preventDefault();
			alert("빈값 체크");
		}
		
		if($('#pickup').is(':checked')){
			$('#pickup').val(1);
		}else{
			$('#pickup').val(0);
		}
		if($('#food').is(':checked')){
			$('#food').val(1);
		}else{
			$('#food').val(0);
		}
		
	});
	
 
});