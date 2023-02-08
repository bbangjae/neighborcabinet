/**
 * review.js
 */

$(document).ready(function(){
	
	$('.reviewWrite').on('click', function(){
		
		var lin = $(this).attr('id');
		var frmPa = document.frmPa;
		
		let url = '/mypage/reviewReg/' + lin;
		let title = 'review';
		let option = 'width=500, height=450, top=150, left=600, status=yes, scrollbars=yes';
		window.open( url , title, option);
		
//		frmPa.action = url;
//		frmPa.method = "post";
//		frmPa.target = title;
//		frmPa.check.value = '3';
//		frmPa.submit();
	});
	
	
	$('.paging').on('click', function(e){
		e.stopImmediatePropagation();
		var pageNum = $(this).attr('id');
		
		$.ajax({
 			type:"post",
 			url:"/mypage/review/" + pageNum,
 			success:function(result){
 				
				$('#myReviewBox').html(result);
 			},
 		});
	});
	$('.myReview_delete').on('click', function(e){
		
		var pNo = $(this).attr('id');
		
	    if(confirm("재작성이 불가능합니다. \n삭제하시겠습니까?")){
	        location.href = "/mypage/myReview/delete/" + pNo;
	        return true;
	    } else {
	        return false;
	    }
	});
});