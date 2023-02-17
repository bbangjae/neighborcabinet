/**
 * header2.js
 */
 
$(document).ready(function(){
  	
  		$.ajax({
 			type:"post",
 			url:"/stt",
 			enctype:"multipart/form-data",
 			processData:false,
 			contentType:false,
 			data: formData,
 			success:function(result){
 				$('#header_searchInput').val(result);
 				
 			},
 			error:function(){
 				alert("실패");
 			},
 			complete:function(){
 			}
 		});
});