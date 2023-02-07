/**
 * rentHistory.js
 */
 
$(document).ready(function() {
 //조회 버튼
  $('ul.btns li').click(function() {
    var tab_id = $(this).attr('data-tab');

    $('ul.btns li').removeClass('current');	
    $('.tab-content').removeClass('current');

    $(this).addClass('current');
    $("#" + tab_id).addClass('current');
  })
 
 //전체조회 모달창
  $('#all').click(function(){  
  	$('.modal').fadeIn();
  });
  $('.modal_close').click(function(){
  	$('.modal').fadeOut();
   //여기서 모달창 끄면 대여전으로 자동선택
  	$('ul.btns li').removeClass('current');	
    $('.tab-content').removeClass('current');
    $('#before').addClass('current');
    $('#before-tr').addClass('current');	
  });
  
 //검색창 포커스 여부 jQuery로 작성하기
 
 //검색폼

/**
 function fn_search(){
	var formData = new FormData();
	$.ajax({
		type : "get",
		url : "/rentHistory",
			dataType : "text",
			data : formData, 
			contentType: false, 
			processData: false, 
			cache : false,
			success : function(data) {
           		 // 데이터 새로 도출하기
				var html = jQuery('<div>').html(data);
				var contents1 = html.find("div#replyList").html();
				var contents2 = html.find("div#replyCount").html();
				$("#replyList").html(contents1);
				$("#replyCount").html(contents2);
			},
			error : function(){
                alert("조회에 실패하였습니다");
            }
		});
	}
*/
	
	$("#searchBtn").on('click', function(){
		event.preventDefault();
	
	$.ajax({
		type: "post",
		url : "/rentHistorySearch",
		data : $("form[name=searchForm]").serialize(),
		success : function(result){
			//테이블 초기화
			$('#all-tr').empty();
			if(result.length>=1){
				result.forEach(function(item){
					str='<tr>'
					str+= "<td>"+item.rentNo+"</td>";
					str+="<td>"+item.rentPlace+"</td>";
					str+="<td>"+item.receiptDate+"</td>";
					str+="<td>"+item.userName+"</td>";
					str+="<td>"+item.rentTime+"</td>";
					str+="<td>"+item.rentState+"</td>";
					str+="<td>"+item.pickup+"</td>";
					str+="</tr>"
					$('#all-tr').append(str);
        		})				 
			}
		}
	})
})


});
