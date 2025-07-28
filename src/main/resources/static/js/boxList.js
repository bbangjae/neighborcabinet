/**
 * boxList.js
 */
window.onpageshow = function(event) {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		var chk = $(".select_checkBox").is(":checked");
		if(chk) {$(".select_checkBox").prop("checked", false).attr("checked", false).removeAttr("checked");}
    }
};
	
$(document).ready(function(){
	
	
	$(document).on("submit","#orderPage",function(){
		
		var boxNum = $('.boxPrice').length;
		var sid = $('#sid').val();
		
		if(boxNum == 0){
			event.preventDefault();
			alert("박스를 선택해주세요");
		}
		
		if(sid == ""){
			event.preventDefault();
			var login = confirm("로그인 후 이용이 가능합니다.\n"+
					"로그인 페이지로 이동하시겠습니까?");
				if(login){
					location.href="/member/loginform";
				}
		}
		
	});
	
	$(document).on("click",".select_checkBox",function(){
	
		var check = $(this).is(':checked');
		var boxName = this.getAttribute('data-boxName');
		var boxPrice = this.getAttribute('data-boxPrice');
		var boxStock = this.getAttribute('data-boxStock');
		var boxType = $(this).val();
		
		if(check){
			$('#selectedUl').append(
						'<li id="' + boxType + '_1">'+
							'<div>'+
								'<p>'+ boxName +'</p>'+
								'<span class="selected_delete" data-boxType="'+ boxType +'"><i class="fa-solid fa-xmark fa-2x"></i></span>'+
							'</div>'+
							'<div class="selectedBox_qty">'+
								'<div class="font_size_zero">'+
									'<button class="box_QtyBtn" data-boxPrice="'+ boxPrice +'" data-boxStock="'+ boxStock +'" value="1"><i class="fa-solid fa-minus" ></i></button>'+
									'<input name="Selected_boxName" type="hidden" value="'+ boxName +'">' + 
									'<input name="Selected_boxType" type="hidden" value="'+ boxType +'">' + 
									'<input name="Selected_boxPrice" type="hidden" value="'+ boxPrice +'">' + 
									'<input name="Selected_boxQty" class="input_number" type="number" data-boxPrice="'+ boxPrice +'" data-boxStock="'+ boxStock +'" value="1">'+
									'<button class="box_QtyBtn" data-boxPrice="'+ boxPrice +'" data-boxStock="'+ boxStock +'" value="2"><i class="fa-solid fa-plus"></i></button>'+
								'</div>'+
								'<div class="price"><input name="boxPrice" class="boxPrice" type="text" value="'+ boxPrice +'원" readonly></div>'+
							'</div>'+
						'</li>');
			doSum();
		} else{
			$('#' + boxType + '_1').detach();
			doSum();
		}
	});
	
	// A타입 박스 사이즈 눌렀을 때
	$('#boxA_sizeListBox').on('click', function(){
        if($('#boxA_type').css('display') == 'none') {
        	$('#boxA_type').css('display', 'block');
        	$('#boxA_sizeListBox').css('border-bottom-left-radius', '0px');
        	$('#boxA_sizeListBox').css('border-bottom-right-radius', '0px');
        	
        } else{
        	$('#boxA_type').css('display', 'none');
        	$('#boxA_sizeListBox').css('border-bottom-left-radius', '10px');
        	$('#boxA_sizeListBox').css('border-bottom-right-radius', '10px');
        }
    });

	$(document).mouseup(function (e){
		if($('#boxA_type').has(e.target).length==0&&!$(e.target).is('#boxA_sizeListBox')) {
			$('#boxA_type').css('display', 'none');
        	$('#boxA_sizeListBox').css('border-bottom-left-radius', '10px');
        	$('#boxA_sizeListBox').css('border-bottom-right-radius', '10px');
		}
	});

    // B타입 박스 사이즈 눌렀을 때
    $('#boxB_sizeListBox').on('click', function(){
        if($('#boxB_type').css('display') == 'none') {
        	$('#boxB_type').css('display', 'block');
        	$('#boxB_sizeListBox').css('border-bottom-left-radius', '0px');
        	$('#boxB_sizeListBox').css('border-bottom-right-radius', '0px');
        	
        } else{
        	$('#boxB_type').css('display', 'none');
        	$('#boxB_sizeListBox').css('border-bottom-left-radius', '10px');
        	$('#boxB_sizeListBox').css('border-bottom-right-radius', '10px');
        }
    });
    
    $(document).mouseup(function (e){
		if($('#boxB_type').has(e.target).length==0&&!$(e.target).is('#boxB_sizeListBox')) {
			$('#boxB_type').css('display', 'none');
        	$('#boxB_sizeListBox').css('border-bottom-left-radius', '10px');
        	$('#boxB_sizeListBox').css('border-bottom-right-radius', '10px');
		}
	});
    
    // A타입 박스 정보 확인
    $('#A_typeInfo').on('click', function(){
        if($('#boxA_TypeBox').css('display') == 'none') {
        	$('#boxA_TypeBox').css('display', 'block');
        	$('#boxB_TypeBox').css('display', 'none');
        	$('#A_typeInfo').css('background-color', 'gray');
        	$('#A_typeInfo').css('color', 'white');
        	$('#B_typeInfo').css('background-color', 'white');
        	$('#B_typeInfo').css('color', 'gray');
        }
    });
    
    // B타입 박스 정보 확인
    $('#B_typeInfo').on('click', function(){
        if($('#boxB_TypeBox').css('display') == 'none') {
        	$('#boxB_TypeBox').css('display', 'block');
        	$('#boxA_TypeBox').css('display', 'none');
        	$('#A_typeInfo').css('background-color', 'white');
        	$('#A_typeInfo').css('color', 'gray');
        	$('#B_typeInfo').css('background-color', 'gray');
        	$('#B_typeInfo').css('color', 'white');
        	
        }
//         else{
//        	$('#boxB_TypeBox').css('display', 'none');
//        }
    });
	$(document).on("click",".box_QtyBtn",function(){
	
		event.preventDefault();
		
		var number = $(this).siblings('.input_number');
		var boxPrice = parseInt(this.getAttribute('data-boxPrice'));
		var boxStock = parseInt(this.getAttribute('data-boxStock'));
		var qty = parseInt(number.val());
		
			if($(this).val() == 1){
				qty -= 1;
				if(qty < 1){
					qty = 1;
					alert("최소 수량입니다");
				}
				//else if(qty > boxStock){
				//	qty = boxStock;
				//	alert("최대 수량입니다");
				//}
				number.val(qty);
				var total = qty * boxPrice;
				var price = $(this).parent().siblings('.price').children();
				price.val(total.toLocaleString()+"원");
			} else{
				qty += 1;
				//if(qty > boxStock){
				//	qty = boxStock;
				//	alert("최대 수량입니다");
				//}
				number.val(qty);
				var total = qty * boxPrice;
				var price = $(this).parent().siblings('.price').children();
				price.val(total.toLocaleString()+"원");
			}
			doSum();
    });
     $(document).on("input",".input_number",function(){
     	
     	var number = $(this).siblings('.input_number');
     	var qty = parseInt($(this).val());
     	var boxPrice = parseInt(this.getAttribute('data-boxPrice'));
     	var boxStock = parseInt(this.getAttribute('data-boxStock'));
     	var total = qty * boxPrice;
     	var price = $(this).parent().siblings('.price').children();
     	
     	if (isNaN(total)) {
			 total = 0;
		}
		if(qty < 1){
			qty = 1;
			number.val(1);
			alert("최소 수량입니다");
		}
		//else if(qty > boxStock){
		//	qty = boxStock;
		//	number.val(boxStock);
		//	alert("최대 수량입니다");
		//}
     	price.val(total.toLocaleString() + "원");
     	doSum();
    });
    
    $(document).on("click",".selected_delete",function(){
    	var boxType = this.getAttribute('data-boxType');
    	$(this).parent().parent().detach();
    	$('#' + boxType).prop("checked", false);
    	doSum();
    });
    
	function doSum(){
		
		var sum = 0;
		var boxNum = $('.boxPrice').length;
		
		if(boxNum == 0){
			$('#total_priceVal').val("0원");
			return;
		}
		
		$('input[name="boxPrice"]').each(function(){
			
			
			var regex = /[^0-9]/g;
			var result = $(this).val().replace(regex, "");
			
			if(!isNaN(result)){
				sum += parseInt(result);
	        }
	        
			$('#total_priceVal').val(sum.toLocaleString() + "원");
	    });
	}
});