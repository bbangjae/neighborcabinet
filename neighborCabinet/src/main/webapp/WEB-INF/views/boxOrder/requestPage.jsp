<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예약페이지</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/requestPage.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value='/js/requestPage.js' />"></script>
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
	        	
	        	var count = 0;
	    		
	    		$('input[name*="req"]').each(function(){
	    		
	    			if($(this).val() == ''){
	    				count = 1;
	    			}
	    			
	    		});
	    		
	    		if(count == 1){
	    			event.preventDefault();
	    			alert("빈값 체크");
	    			return false;
	    		}
	        	
	            IMP.request_pay({
	                pg : 'kcp',
	                pay_method : 'card',
	                merchant_uid: "IMP"+makeMerchantUid, 
	                name : '${res.userNickname }',
	                amount : 1,
	                buyer_email : '',
	                buyer_name : '아임포트',
	                buyer_tel : '010-1234-5678',
	                buyer_addr : '서울',
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
			<div><h1>예약하기</h1></div>
			<article>
				<form action="<c:url value='/payment'/>" method="post" id="payment">
					<div id="left_article">
						<section id="s1">
							<div class="sec_title">예약 공간</div>
							<div id="fixedInfo_1">
								<div id="fixedInfo_1_1">
									<div>
										<img id="spaceImg" src="<c:url value="/image/A_type.png"/>">
									</div>
									<div id="spaceDis">
										<div>글의 제목</div>
										<p>글에 대한 설명
										</p>
									</div>
								</div>
								<div id="fixedInfo_1_2">
									<div><div>선택한 박스</div><div>~~~~~~~~~</div></div>
									<div><div>모든 개수</div><div>1개</div></div>
								</div>
							</div>
						</section>
						<section id="s2">
							<div class="sec_title">예약정보</div>
							<div id="fixedInfo_2">
								<div id="fixedInfo_2bobo"><span>예약날짜</span><span>2023.01.25 (수) 10시 ~ 12시</span></div>
								<div><span>예약박스</span><span>플라스틱 3호</span></div>
							</div>
						</section>	
						<section id="s3">
							<div class="sec_title">예약자 정보</div>
							<div id="fixedInfo_3">
								<div><div>예약자</div><input type="text" name="reqName"></div>
								<div><div>연락처</div><input type="text" name="reqPhone"></div>
								<div><div>이메일</div><input type="text" name="reqEmail"></div>
								<div><div>보관물품</div><input type="text" name="reqObject"></div>
								<div><div>요청사항</div><textarea name="reqDis"></textarea></div>
								<input type="hidden" name="ordDNo" value="${ordDNo }">
								<!-- 예약자 아이디나 userNo, 여기 글No -->
							</div>
						</section>
						<section id="s4">
							<div class="sec_title2">호스트 정보</div>
							<div id="fixedInfo_4">
								<div><div>공간상호</div><div>모임공간 르씨엘</div></div>
								<div><div>대표자명</div><div>김지선</div></div>
								<div><div>소재지</div><div>서울 관악구~~~~</div></div>
								<div><div>사업자번호</div><div>649824</div></div>
								<div>
									<div>연락처</div>
									<div id="PAndE"><div>010-1348-1564</div><div>abc@abc.com</div></div>
									</div>
							</div>
						</section>
					</div>
					<div id="right_article">
						<section id="s5">
							<div class="sec_title">결제 예정금액</div>
							<div id="fixedInfo_5">
								<div id="fixedInfo_5_1">
									<div id="fixedInfo_5_1_1">
										<div>예약날짜<span>2023.01.27 (금)</span></div>
										<div>예약시간<span>11시 ~18시, 7시간</span></div>
										<div>예약박스<span>3개</span></div>
									</div>
									<div>
										<div>9000</div>
									</div>
								</div>
								<div id="fixedInfo_5_2">
									70,000
								</div>
							</div>
							<input type="button" onclick="requestPay()" value="결제하기" id="paymentBtn"><br>
							<input type="submit" id="hiddenGo" value="결제X(시연용)">
						</section>
					</div>
				</form>
			</article>
		</div>
	
		<div>${res.userName }
			<input type="text" value="${res.userNickname }">
			<div>예약자<input type="text" value="${res.userNickname }"></div>
			<div>연락처<input type="text" value="010"> - <input type="text" value="${HP2 }"> - <input type="text" value="${HP3 }"></div>
			<div>이메일<input type="text" value="${res.userEmail }"></div>
			<div>보관 물품<input type="text" value=""></div>
			<div>요청 사항<input type="text" value=""></div>
		</div>
		
		${regist.userNickname }, ${regist.userName },
		${regist.userHp }, ${regist.userEmail }, ${regist.userAddress1 }, ${regist.userAddress2 }
	</body>
</html>