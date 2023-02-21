/**
 * qrConfirm.js
 */
 $(document).ready(function(){
 
 $(".bt1").on("click", function(e){   
         let update_form = $(".update_form");
         let userId = $("#sender").val();
         let senderPhone = $("#senderPhone").val();
         
         if (!confirm("본인 확인을 진행하시겠습니까?")) {
                alert("취소");
                return false;
            } else {
               e.preventDefault();
               update_form.submit();
               //일치 여부 확인 후
               alert("거래 시작");
               //location.href = "/qrConfirm";
            }   
      });
 
 })