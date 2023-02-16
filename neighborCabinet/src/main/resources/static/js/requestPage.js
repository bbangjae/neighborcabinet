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
 					
 					$('#resultDiv').append('<input type="checkbox" id="object_'+ result[i].number +'" class="objectCheck" value="'+ result[i].name +'">' + 
				'<label for="object_'+ result[i].number + '">' + result[i].name + '</label>');
 				}
 			},
 			error:function(){
 				alert("왜 실패");
 			}
 		});
 	});
 	
 	
 	
 	$(document).on("change",".objectCheck",function(){
 		var tagColor = ['#AFEEEE', '#40E0D0', '#48D1CC', '#00CED1', '#D7FFF1', '#8CD790', '#77AF9C'];
 		if($(this).is(":checked")){
 			$('#selectedObject').append('<div id="'+$(this).attr('id')+'x1">' + $(this).val() + '<i class="fa-regular fa-circle-xmark"></i><div>');
 			$('#'+$(this).attr('id')+'x1').css('background', tagColor[Math.floor(Math.random() * tagColor.length)]);
 		}
 		else{
 			$('#'+$(this).attr('id')+'x1').detach();
 		}
 	});
 	$(document).on("click",".fa-circle-xmark",function(){
 		var allId = $(this).parent().attr('id');
 		var good = allId.split('x', 1);
 		$(this).parent().detach();
 		$('#'+good).prop("checked", false);
 	});
 	$(document).on("click","#complete",function(){
 		var result ="";
 		var cnt = 0;
 		$('input[class="objectCheck"]').each(function(){
 			if($(this).is(":checked") && cnt==0){
 				cnt = 1;
 				result += $(this).val();
 			}else if($(this).is(":checked") && cnt==1){
 				result += ", "+$(this).val();
 			}
 		});
 		$('#storList').val(result);
 		$('#objectModal').prop("checked", false);
 		$('#resultDiv').empty();
 		$('#selectedObject').empty();
 	});
});