/**
 * message.js
 */

$(document).ready(function(){
	
	$(".requestInfo").on("click", function(){

		var reserveNo = $(this).attr('id');
 		$.ajax({
 			type:"post",
 			url:"/message/requestInfo/" + reserveNo,
 			success:function(result){
 				$('#infoResult').html(result);
 			},
 			error:function(){
 				alert("실패");
 			},
 		});
	});
});