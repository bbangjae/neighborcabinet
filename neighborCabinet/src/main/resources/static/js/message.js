/**
 * message.js
 */

$(document).ready(function(){
	$(document).on("click","input[name='mes_messageS']",function(){
		var check = $(this).is(':checked');
		var a = $(this);
		if(check){
			$(this).next().children('.paymentMInfo').css("display","block");
			$(this).next().children('.mesCutLine').css("display","none");
			$(this).prev().css("background","#ebebeb");
			
			var reserveNo = $(this).attr('id').split('_', 1);
		}else{
			$(this).next().children('.paymentMInfo').css("display","none");
			$(this).next().children('.mesCutLine').css("display","block");
			$(this).prev().css("background","white");
		}
	});
	$('#mesAllSelect').on('click', function(){
	 	var chk = $("#mesAllSelect").prop("checked");
	 	
	 	if(chk) {
	 		$('.mesSelect').prop("checked", true);
	 	} else {
	 		$('.mesSelect').prop("checked", false);
	 	}
	});
	$('.mesSelect').on('click', function(){
 		var total = $('.mesSelect').length;
 		var checked = $('.mesSelect:checked').length;
 		
 		if(total != checked)
 			$("#mesAllSelect").prop("checked", false);
 		else
 			$("#mesAllSelect").prop("checked", true);
 	});
 	
 	$('#deleteMesBtn').on('click', function(){
 	 	
 	 	var checked = $('.mesSelect').is(':checked');
 	 	
 	 	if(checked) {
 	 		var answer = confirm("메일을 삭제하시겠습니까?");
 	 		
 	 		if(answer) {
 	 		
 	 		var checkArr = new Array();
 	 		$('.mesSelect:checked').each(function(){
 	 			checkArr.push($(this).attr('id'));
 	 		});
 	 		
 	 		$.ajax({
	 			type:"post",
	 			url:"/message/delete",
	 			data: {"chmes":checkArr},
	 			success:function(result){
	 					$('#applyDiv').html(result);
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		}); 	
 	 	
 	 		}
 	 	
 	 	} else {
 	 		alert("선택된 메일이 없습니다");
 	 	}
 	 });
 	 $('#deleteMesAllBtn').on('click', function(){
 	 	var answer = confirm("메일을 전체 삭제하시겠습니까?");
 	 		
 	 	if(answer) {
	 		$.ajax({
	 			type:"post",
	 			url:"/message/deleteAll",
	 			success:function(result){
	 					$('#applyDiv').html(result);
	 			},
	 			error:function(){
	 				alert("실패");
	 			}
	 		}); 	
	 	}
 	 });
});