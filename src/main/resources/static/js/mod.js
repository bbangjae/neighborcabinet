/**
 * modifyInfo
 */
 
/*$(document).ready(function(){
	
	var Form = $('#showForm');

	$('#modifyButton').on('click', function(){
		if(Form.css('display') == 'none'){
		    Form.show();
        }else{
            Form.hide();
        }
	});
});*/
 
 
function toggleform(){
  
  // 토글 할 버튼 선택 (form)
  const form = document.getElementById('formBox');
  
  // form 숨기기 (display: none)
  if(form.style.display !== 'none') {
    form.style.display = 'none';
  }
  // form 보이기 (display: block)
  else {
    form.style.display = 'block';
  }
  
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 