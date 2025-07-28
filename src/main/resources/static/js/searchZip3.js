/**
 *  searchZip.js
    주소 검색
 */
 
 $(document).ready(function(){
    $('#searchZipBtn2').on('click', function(){
       new daum.Postcode({
          // 팝업 창에서 검색 결과 클릭했을 때
          oncomplete:function(data){
             var address1 = "";
             
             // 도로명 주소인 경우
             if(data.userSelectedType == 'R'){
                address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
             } else {   // 지번 주소인 경우
                address1 = data.jibunAddress;
             }
             
             // 입력란에 검색한 우편번호, 주소1 출력
             document.getElementById('pAddress1').value = address1;
             
             // 상세 주소 입력란에 입력한 값은 삭제하고 포커스 주기
             var address2 = document.getElementById('pAddress2');
             address2.value = "";
             address2.focus();
          }
       }).open();
    });
 });