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
	$(document).on("submit","#objectForm",function(){
 	
 		event.preventDefault();
 		
 		
 		var formData = new FormData($('#objectForm')[0]);
 		var fileName = $('#uploadFile').val().split("\\").pop();
 		console.log("여기까지옴" + fileName);
 		console.log(formData);
 		
 		$.ajax({
 			type:"post",
 			url:"/objectDetect",
 			enctype:"multipart/form-data",
 			processData:false,
 			contentType:false,
 			data: formData,
 			success:function(result){
 				$('#resultDiv').empty();
 				for(var i=0; i < result.length; i++) {
 					
 					$('#resultDiv').append('<div>'+ result[i].name + "</div>");
 				}
 			},
 			error:function(){
 				alert("왜 실패");
 			}
 		});
 	});
 	
});