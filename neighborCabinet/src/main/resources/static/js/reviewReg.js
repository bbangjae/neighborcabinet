/**
 * boxOrder2.js
 */

$(document).ready(function(){
	
	$("#reviewForm").on("submit", function(){
	
		event.preventDefault();
 		
 		var grade = $("input[type=radio][name=reviewGrade]:checked").val();
 		
 		$.ajax({
 			type:"post",
 			url:"/mypage/reviewReg/regist",
 			data: {"grade":grade,
 			        "content":$('#reviewContent').val(),
 			        "pNo":$('#pNo').val()},
 			dataType:'text',
 			success:function(result){
 				if(result == "success"){
 					alert("성공");
 					window.close();
 					opener.location.href="/mypage/review";
 				}
 			},
 			error:function(){
 				alert("실패");
 			},
 		});
	});
	$("#reviewForm").on("reset", function(){
	
		window.close();
		
	});
});