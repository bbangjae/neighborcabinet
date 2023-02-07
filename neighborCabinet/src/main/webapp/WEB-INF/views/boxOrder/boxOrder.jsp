<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/boxOrder.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value='/js/boxOrder.js' />"></script>
		<!-- <script src="https://js.tosspayments.com/v1/payment"></script> -->
	    <!-- <script>
	    	var clientKey = 'test_ck_GKNbdOvk5rkzyxNv7eyVn07xlzmj'
	    	var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
	    	function requestPay1() {
	    	tossPayments.requestPayment('카드', { // 결제 수단 파라미터
	    		  // 결제 정보 파라미터
	    		  amount: ${sum},
	    		  orderId: 'Jt_eh3xXsy2r2ED5HciV9',
	    		  orderName: '${ordName }',
	    		  customerName: '${userVo.userName}',
	    		  successUrl: 'http://localhost:8080/success',
	    		  failUrl: 'http://localhost:8080/fail',
	    		})
	    		.catch(function (error) {
	    		  if (error.code === 'USER_CANCEL') {
	    		    // 결제 고객이 결제창을 닫았을 때 에러 처리
	    		  } else if (error.code === 'INVALID_CARD_COMPANY') {
	    		    // 유효하지 않은 카드 코드에 대한 에러 처리
	    		  }
	    		})
	    	}
	  	</script> -->
	  	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	    <script>
	        var IMP = window.IMP; 
	        IMP.init("imp67011510"); 
	      
	        var today = new Date();   
	        var hours = today.getHours(); // 시
	        var minutes = today.getMinutes();  // 분
	        var seconds = today.getSeconds();  // 초
	        var milliseconds = today.getMilliseconds();
	        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	        
	
	        function requestPay() {
	            IMP.request_pay({
	                pg : 'kcp',
	                pay_method : 'card',
	                merchant_uid: "IMP"+makeMerchantUid, 
	                name : '${ordName }',
	                amount : ${sum},
	                buyer_email : '',
	                buyer_name : '${userVo.userName}',
	                buyer_tel : '${HP1 }-${HP2 }-${HP3 }',
	                buyer_addr : '${userVo.userAddress1}',
	                buyer_postcode : '123-456'
	            }, function (rsp) { // callback
	                if (rsp.success) {
	                	document.getElementById('payment').submit();
	                } else {
	                    console.log(rsp);
	                }
	            });
	        }
	    </script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<div id="wrap">
			<div class="spaceDiv"></div>
			<form action="<c:url value='/boxPayment'/>" method="post" id="payment">
				<div class="left_align">주문한 박스</div>
				<table id="ordered_boxTitle">
					<tr>
						<td class="top_row">박스명</td>
						<td class="top_row">수량</td>
						<td class="top_row">금액</td>
						
					</tr>
					<c:forEach var="box" items="${orderList}">
						<tr>
							<td class="bottom_row">
								<div>
									<div class="img_border"><img class="boxA_TypeImg" src="<c:url value='${box.boxImg }'/>"></div>
									<div>${box.boxName }</div>
								</div>
							</td>
							<td class="bottom_row">${box.boxQty }개</td>
							<td class="bottom_row">${box.boxPrice }원</td>
						</tr>
						<input type="hidden" name="boxType" value="${box.boxType }">
						<input type="hidden" name="boxQty" value="${box.boxQty }">
						<input type="hidden" name="selPrice" value="${box.boxPrice }">
					</c:forEach>
				</table>
				<div class="spaceDiv"></div>
				<div class="left_align">배송지 정보 <button id="SI_change" type="button"> 배송지 변경</button></div>
				<table>
					<tr>
						<td class="left_col">
							수령인
						</td>
						<td class="right_col">
							<input type="text" id="shipping_name" name="shipName" class="shipping_info" value="${userVo.userName}" readonly>
						</td>
					</tr>
					<tr>
						<td class="left_col">
							주소
						</td>
						<td colspan="2" class="right_col">
						<input type="text" id="shipping_address1" name="shipAddress1" class="shipping_info" value="${userVo.userAddress1}" readonly>
						<input type="text" id="shipping_address2" name="shipAddress2" class="shipping_info" value="${userVo.userAddress2}" readonly>
			           	</td>
					</tr>
					<tr>
						<td class="left_col">
							핸드폰 번호
						</td>
						<td class="right_col">
							<input type="text" id="shipping_phoneF" name="shipping_phoneF" class="shipping_info" value="${HP }" readonly>
							<input type="hidden" id="shipping_phoneB" name="shipPhone" class="shipping_info" value="${HP1 }${HP2 }${HP3 }" readonly>
						</td>
					</tr>
					<tr>
						<td class="left_col">
							요청사항
						<td class="right_col">
							<select id="shipping_option">
								<option value="">요청사항을 선택하세요</option>
								<option value="문 앞">문 앞</option>
	       		  		 		<option value="직접 받고 부재 시 문 앞">직접 받고 부재 시 문 앞</option>
	       		  		 		<option value="경비실">경비실</option>
	       		  		 		<option value="기타사항">기타사항</option>
							</select>
							<input type="text" name="shipHope" id="shipping_optionInput" value="">
						</td>
					</tr>
				</table>
				<div class="spaceDiv"></div>
				<div class="left_align">결제 금액</div>
				<table>
					<tr>
						<td class="left_col">주문금액</td>
						<td class="right_col"><fmt:formatNumber value="${price}" pattern="#,###" />원</td>
					</tr>
					<tr>
						<td class="left_col">배송비</td>
						<td class="right_col"><fmt:formatNumber value="3000" pattern="#,###" />원</td>
					</tr>
					<tr>
						<td class="left_col">총결제금액</td>
						<td class="right_col"><fmt:formatNumber value="${sum}" pattern="#,###" />원</td>
					</tr>
				</table>
				<input type="hidden" name="selPrice" value="${price}">
				<input type="hidden" name="totalPrice" value="${sum}">
				<input type="button" onclick="requestPay()" value="결제" id="paymentBtn"><br>
				<input type="submit" id="hiddenGo" value="결제X(시연용)">
			</form>
			<div style="height : 300px;"></div>
		</div>
	</body>
</html>