/**
 * pagination.js
 var thisIndex = "${searchVO.pageIndex}"
	$(".pagination li a").each(function(){
		var idx = $(this).parent().index();
		var thistitle = $(this).attr("title");
		//if(thistitle == thisIndex){
		//	$(".pagination").find("li").eq(idx).addClass("active");
		//}
	});
 */
 
 function fn_go_page(pageNo) {
 
	var submitObj = new Object();
	 
	submitObj.pageIndex= pageNo;
	submitObj.searchWrd= $("#searchWrd").val();
	 
	$.ajax({ 
		url: "/rentHistory/list", 
		type: "POST", 
		contentType: "application/json;charset=UTF-8",
		data:JSON.stringify(submitObj),
		dataType : "json",
		progress: true
		}) 
		
		.done(function(data) {
	    
	    var  result = new Array;
	    result = data.resultList;
	    var searchVO = data.searchVO;
	    var realEnd = searchVO.realEnd;
	    var startDate = searchVO.startDate;
	    var startButtonDate = startDate - 1;
	    var endDate = searchVO.endDate;
	    var endButtonDate = endDate + 1;
	    var pageIndex = searchVO.pageIndex;
	    var resultCnt = data.resultCnt;
	    var totalPageCnt = data.totalPageCnt;
	    var recordCountPerPage = searchVO.recordCountPerPage;
	    
	    
	    var ii = (resultCnt - (pageIndex - 1) * recordCountPerPage);
	    
	    var content = '';
	    var content2 = '';
	    
	    $.each(result, function(key, value) {
	        content +=    '<tr class="rentHistory">';
	        content +=    '<td class="t_c">' + ii + '</td>';
	        content +=    '<td class="t_c">' + value.rentPlace + '</td>';
	        content +=    '<td>' + value.receiptDate + '<button type="button" class="btnInfo fr"></button></td>';
	        content +=    '<td class="t_c">' + value.userName + '</td>';
	        content +=    '<td class="t_c">' +  value.rentTime  +'</td>';
	        content +=    '<td class="t_c">' +  value.rentState + '</td>';
	        content +=    '<td class="t_c">' +  value.pickup + '</td>';
	        content +=    '</tr>';
	         ii--;
	      });
	    
	    $(".listData").html(content);    
	    
	    content2 = '<input type="hidden" id="pageIndex" name="pageIndex" value="1">';
	    content2 +=    '<ol class="pagination" id="pagination">';
	    
	    if(searchVO.prev){
	        content2 +=    '<li class="prev_end"><a href="javascript:void(0);" onclick="fn_go_page(1); return false;" ></a></li>';    
	        content2 +=    '<li class="prev"><a href="javascript:void(0);"  onclick="fn_go_page(' + startButtonDate + '); return false;" ></a></li>';    
	    }
	    
	    for (var num=startDate; num<=endDate; num++) {
	         if (num == pageIndex) {
	             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '"  class="num on">' + num + '</a></li>';
	         } else {
	             content2 +=    '<li><a href="javascript:void(0);" onclick="fn_go_page(' + num + '); return false;" title="' + num + '" class="num">' + num + '</a></li>';
	         }
	    }
	    
	    if(searchVO.next){
	        content2 +=    '<li class="next"><a href="javascript:void(0);"  onclick="fn_go_page(' + endButtonDate + '); return false;" ></a></li>';    
	        content2 +=    '<li class="next_end"><a href="javascript:void(0);" onclick="fn_go_page(' + searchVO.realEnd +'); return false;"></a></li>';    
	    }
	    
	    content2 +=    '</ol>';
	    content2 +=    '</div>';
	 
	    $(".board-list-paging").html(content2);
	    
	 }) 
	 .fail(function(e) {  
	     alert("검색에 실패하였습니다.");
	 }) 
	 .always(function() { 
	     
	 }); 
	 
	 
}