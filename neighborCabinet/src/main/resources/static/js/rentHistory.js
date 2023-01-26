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
 
 //
 
 

});
