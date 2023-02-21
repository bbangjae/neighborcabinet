/**
 * message.js
 */

$(document).ready(function(){
	$(document).on("click",".R_Box",function(){
		var a = $(this);
		var reserveNo = $(this).attr('id');
 		$.ajax({
 			type:"post",
 			url:"/message/requestInfo/" + reserveNo,
 			success:function(result){
 				$('.infoResult').empty();
 					a.parents().next('.infoResult').html(result);
 			},
 			error:function(){
 				alert("실패");
 			},
 		});
	});
	$(document).on("click",".MResO",function(){
		var reserveNo = this.getAttribute('data-reserveNo');
		var sender = this.getAttribute('data-sender');
		e.stopImmediatePropagation();
		var check = confirm("수락하시겠습니까?");
		if(check){
			$.ajax({
	 			type:"post",
	 			url:"/message/requestO/" + reserveNo + "/" + sender,
	 			success:function(result){
	 				$("#re_resInfoBox").empty();
	 				for(var i=0; i < result.length; i++) {
		 				$("#re_resInfoBox").append('<div class="R_resInfoBox">'+
							'<div class="R_Box" id="'+ result[i].reserveNo +'">' +
								'<div>'+ result[i].sender +'</div>' +
								'<div>'+ result[i].pWriteTitle +'</div>' +
							'</div>' +
							'<div>' +
								'<button type="button" class="MResO"' +
								'data-reserveNo="'+ result[i].reserveNo +'" data-sender="'+ result[i].sender +'">수락</button>' +
								'<button type="button" class="MResX"' +
								'data-reserveNo="'+ result[i].reserveNo +'" data-sender="'+ result[i].sender +'">거절</button>' +
							'</div>' +
						'</div>' +
						'<div class="infoResult"></div>'
						)
					}
	 			},
	 			error:function(){
	 				alert("실패");
	 			},
	 		});
 		}
	});
	$(document).on("click",".MResX",function(){
		var reserveNo = this.getAttribute('data-reserveNo');
		var sender = this.getAttribute('data-sender');
		e.stopImmediatePropagation();
		var check = confirm("거절하시겠습니까?");
		if(check){
			$.ajax({
	 			type:"post",
	 			url:"/message/requestX/" + reserveNo + "/" + sender,
	 			success:function(result){
	 				$("#re_resInfoBox").empty();
		 			for(var i=0; i < result.length; i++) {
		 				$("#re_resInfoBox").append('<div class="R_resInfoBox">'+
							'<div class="R_Box" id="'+ result[i].reserveNo +'">' +
								'<div>'+ result[i].sender +'</div>' +
								'<div>'+ result[i].pWriteTitle +'</div>' +
							'</div>' +
							'<div>' +
								'<button type="button" class="MResO"' +
								'data-reserveNo="'+ result[i].reserveNo +'" data-sender="'+ result[i].sender +'">수락</button>' +
								'<button type="button" class="MResX"' +
								'data-reserveNo="'+ result[i].reserveNo +'" data-sender="'+ result[i].sender +'">거절</button>' +
							'</div>' +
						'</div>' +
						'<div class="infoResult"></div>'
						)
					}
	 			},
	 			error:function(){
	 				alert("실패");
	 			},
	 		});
 		}
	});
});