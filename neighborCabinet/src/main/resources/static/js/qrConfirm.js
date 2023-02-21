/**
 * qrConfirm.js
 */
 $(document).ready(function(){
 
 $(".bt1").on("click", function(e){   
         let update_form = $(".update_form");
         
         if ( !confirm("QR")) {
                alert("취소를 누르셨습니다.");
                return false;
            } else {
               e.preventDefault();
               update_form.submit();
               alert("거래중"); 
            }   
      });
 
 })