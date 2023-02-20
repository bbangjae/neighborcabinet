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
    //$(".listData").empty();
  });
  
 //검색창 포커스 여부 jQuery로 작성하기
 
 //검색폼
	$("#searchBtn").on('click', function(){
		event.preventDefault();
	
	$.ajax({
		type: "post",
		url : "/rentHistorySearch",
		data : $("form[name=searchForm]").serialize(),
		success : function(data){
				var html = '';	
				if(data.length>=1){
				data.forEach(function(item){
				html += '<tr>';
				html += '<td>'+item.rentNo+'</td>';
				html += '<td>'+item.rentPlace+'</td>';
				html += '<td>'+item.receiptDate+'</td>';
				html += '<td>'+item.userName+'</td>';
				html += '<td>'+item.rentTime+'</td>';
				html += '<td>'+item.rentState+'</td>';
				html +=	'<td>'+item.pickup+'</td>';
				html += '</tr>';	
				})
				$(".listData").empty();
				$(".listData").append(html);	
				}
				}
	
		})
	//모달 창 종료 시 데이터 초기화 작성
	})


//qr코드
	$("#qrBtn").click(function(){
		alert("qr코드 링크 생성");
		url="/qr";
		var content = $("#content").val();
		$("#img").attr("src",url+"?content="+content);
	});




});
