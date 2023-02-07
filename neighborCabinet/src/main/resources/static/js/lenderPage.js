/**
 *  공급자 페이지
 */
 
$(document).ready(function () { // 페이지 document 로딩 완료 후 스크립트 실행
	$(document).on("click","#viewaboxTable",function(){
		status = $("#aboxModify").css("display");
        if (status == "none") {
        	$("#aboxModify").css("display", "");
        	$("#modifyBtn1").css("display", "");        	
        } else {
            $("#aboxModify").css("display", "none");
            $("#modifyBtn1").css("display", "none");
            $("#saveBtn1").css("display", "none");
		}
	});

	$(document).on("click","#modifyBtn1",function(){
		status = $(".pmth").css("display");
        if (status == "none") {
        	$("#saveBtn1").css("display", "");
        	$(".pmth").css("display", "");
        	$("#modifyBtn1").css("display", "none");       	
		}else {
            $("#saveBtn1").css("display", "none");
        	$(".pmth").css("display", "none");
        	$("#modifyBtn1").css("display", ""); 
		}
	});
	
	$(document).on("click","#saveBtn1",function(){	
		status = $("#aboxModify").css("display");
        if (status == "none") {
        	$("#modifyBtn1").css("display", "");
        	$("#saveBtn1").css("display", "none"); 
        	$(".pmth").css("display", "none");     	
        }else {
            $("#saveBtn1").css("display", "none");
        	$(".pmth").css("display", "none");
        	$("#modifyBtn1").css("display", "");
        	alert("저장 완료"); 
		}
	});
	
	$(document).on("click","#viewbboxTable",function(){
		status = $("#bboxModify").css("display");
        if (status == "none") {
        	$("#bboxModify").css("display", "");
        	$("#modifyBtn2").css("display", "");        	
        } else {
            $("#bboxModify").css("display", "none");
            $("#modifyBtn2").css("display", "none");
            $("#saveBtn2").css("display", "none");
		}
	});

	$(document).on("click","#modifyBtn2",function(){
		status = $(".pmth1").css("display");
        if (status == "none") {
        	$("#saveBtn2").css("display", "");
        	$(".pmth1").css("display", "");
        	$("#modifyBtn2").css("display", "none");       	
		}else {
            $("#saveBtn2").css("display", "none");
        	$(".pmth1").css("display", "none");
        	$("#modifyBtn2").css("display", ""); 
		}
	});
	
	$(document).on("click","#saveBtn2",function(){	
		status = $("#aboxModify").css("display");
        if (status == "none") {
        	$("#modifyBtn2").css("display", "");
        	$("#saveBtn2").css("display", "none"); 
        	$(".pmth1").css("display", "none");     	
        }else {
            $("#saveBtn2").css("display", "none");
        	$(".pmth1").css("display", "none");
        	$("#modifyBtn2").css("display", "");
        	alert("저장 완료"); 
		}
	});
});



function fnCalCount(type, ths){
    var $input = $(ths).parents("tr").find("input[name='pop_out']");
    var tCount = Number($input.val());
    
    if(type=='p'){
        if(tCount < 100) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}