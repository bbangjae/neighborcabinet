/**
 * message.js
 */

$(document).ready(function(){
	$(document).on("click","input[name='mes_messageS']",function(){
		var check = $(this).is(':checked');
		var a = $(this);
			if(check){
				$(this).next().children('.paymentMInfo').css("display","block");
				$(this).next().children('.mesCutLine').css("display","none");
				$(this).prev().css("background","#ebebeb");
				
				var reserveNo = $(this).attr('id').split('_', 1);
			}else{
				$(this).next().children('.paymentMInfo').css("display","none");
				$(this).next().children('.mesCutLine').css("display","block");
				$(this).prev().css("background","white");
			}
	});
	
});