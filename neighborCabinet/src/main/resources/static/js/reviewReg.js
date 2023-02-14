/**
 * boxOrder2.js
 */

$(document).ready(function(){
	
	$("#reviewForm").on("submit", function(){
	
		event.preventDefault();
		
 		var grade = $("input[type=radio][name=reviewGrade]:checked").val();
 		if(grade == null){
 			alert("점수를 선택하세요");
 			return false;
 		}
 		if(!(confirm("수정이 불가능합니다. \n작성을 완료하시겠습니까?"))){
 			return false;
 		}
 		$.ajax({
 			type:"post",
 			url:"/mypage/reviewReg/regist",
 			data: {"grade":grade,
 			        "content":$('#reviewContent').val(),
 			        "pNo":$('#pNo').val()},
 			dataType:'text',
 			success:function(result){
 				if(result == "success"){
 					alert("작성되었습니다.");
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
	$("#abcd").on("click", function(){
		
		
		$.ajax({
 			type:"post",
 			url:"/sentiment",
 			data:{"content":$('#reviewContent').val()},
 			success:function(result){
 				$('#qwer').empty();
 				$('#qwer').append("부정 : "+result.negative + "중립 : "+ result.neutral + "긍정 : "+ result.positive);
 			},
 			error:function(){
 				alert("실패");
 			},
 		});
	});
	
});