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
        	$("#a01").css("display", "");
        	$("#a1").css("display", "none");
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
		}
	});
	
		$("#saveBtn1").on("click", function(){	
		
		let a01 = $("#a01v").val();
		let a02 = $("#a02v").val();
		let a03 = $("#a03v").val();
		let a04 = $("#a04v").val();
		
		if ( !confirm("수정 하시겠습니까?")) {
				 alert("취소를 누르셨습니다.");
				 return false;
			} else {
				/*$("#a01").val(a01);
				$("#a02").val(a02);
				$("#a03").val(a03);
				$("#a04").val(a04);*/
				$(".update_a01").val(a01);
				$(".update_a02").val(a02);
				$(".update_a03").val(a03);
				$(".update_a04").val(a04);
				$("#modifyBoxForm").submit();
				 alert("저장 완료"); 
			}	
	});
	
			
		$("#saveBtn2").on("click", function(){		
		
		let b01 = $("#b01v").val();
		let b02 = $("#b02v").val();
		let b03 = $("#b03v").val();
		let b04 = $("#b04v").val();
		
		if ( !confirm("수정 하시겠습니까?")) {
				 alert("취소를 누르셨습니다.");
				 return false;
			} else {
				$(".update_b01").val(b01);
				$(".update_b02").val(b02);
				$(".update_b03").val(b03);
				$(".update_b04").val(b04);
				$("#modifyBoxForm").submit();
				 alert("저장 완료"); 
			}		
	});
	
		//상자구매 모달창
		  $('#boxorderLink').click(function(){  
		  	$('.modal1').fadeIn();
		  	$('.box-wrapper').fadeOut();
		  	$('.fb').fadeOut();
		  });
		  $('.modal_close1').click(function(){
		  	$('.modal1').fadeOut();	
		  	$('.box-wrapper').fadeIn();	
		  	$('.fb').fadeIn();	
		  });
		
		
});


function fnCalCount(type, ths){
    var $input = $(ths).parents("tr").find("input");
    var tCount = Number($input.val());
    
    if(type=='p'){
        if(tCount < 100) $input.val(Number(tCount)+1);
        
    }else{
        if(tCount >0) $input.val(Number(tCount)-1);    
        }
}