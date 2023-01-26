/**
 * boxOrder2.js
 */

$(document).ready(function(){
	
	$("#SI_changeForm").on("submit", function(){
	
		if($("#userHp").val().length != 11){
			alert("핸드폰 번호를 확인해주세요");
			return false;
		}
	
		var check = confirm("배송정보를 변경하시겠습니까?");
		
		
		
		var HP1 = $("#userHp").val().substring(0, 3);
		var HP2 = $("#userHp").val().substring(3, 7);
		var HP3 = $("#userHp").val().substring(7);
		
		if(check){
		
			$("#shipping_name", opener.document).val($("#recipient").val());
			$("#shipping_zipcode", opener.document).val($("#userZipcode").val());
			$("#shipping_address1", opener.document).val($("#userAddress1").val());
			$("#shipping_address2", opener.document).val($("#userAddress2").val());
			$("#shipping_phoneF", opener.document).val(HP1 + "-" + HP2 + "-" + HP3);
			$("#shipping_phoneB", opener.document).val($("#userHp").val());
			window.close();
		}
		
	});
	
	$("#SI_changeForm").on("reset", function(){
	
		window.close();
		
	});
});