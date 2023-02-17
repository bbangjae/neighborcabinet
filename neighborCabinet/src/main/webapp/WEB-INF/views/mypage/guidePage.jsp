<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-02-11
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!DOCTYPE html>
<html>
	<meta charset="UTF-8">
	<script src="js/jquery-3.6.1.min.js"></script>
	<head>
	<link rel ="stylesheet" type="text/css" href="<c:url value='/css/guidePage.css'/>">
	<script src="<c:url value='/js/guidePage.js' />"></script>
    <title> 가이드페이지 </title>
    <c:import url="/WEB-INF/views/layout/header.jsp"/>
	</head>
	<body>
	<div class="container">
    	<div class ="heading mt-5">
        	<h3> 이용방법 </h3>
       		<hr>
  		</div>
		<div class="btnGroup">
			<button class="Type1" id="TypeA">사용자 안내</button>
			<button class="Type1" id="TypeB">공급자 안내</button>
			<button class="Type1" id="TypeC">이용요금 안내</button>
		</div>
    	<div class="Type1Guide">
    		<h5> 간편한 대여 방법으로 이웃집 캐비넷 서비스를 이용할 수 있습니다.</h5>
    		<div class="Type1GuideTop">
    			<div class="T1BW">
	    			<a class="T1B" href="#T1B">
	    				<span>01</span>
	    				<div>회원가입</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T2B">
	    				<span>02</span>
	    				<div>지도 확인</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T3B">
	    				<span>03</span>
	    				<div>공간 예약</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T4B">
	    				<span>04</span>
	    				<div>장소 협의</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" id="T1B" href="#T5B">
	    				<span>05</span>
	    				<div>물건 회수</div>
	    			</a>
	    		</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T2B">
    			<div class="sequenceL">
    				<img src="/image/Gjoin.JPG" class="sequenceImg">
    			</div>
    			<div class="sequenceR">
    				<div class="sequenceText">
	    				<h4>01</h4>
	    				<h4>회원가입</h4>
	    				<span>상단 우측 메뉴를 통해</span>
	    				<div>양식에 맞게 기입 후 가입</div>
	    			</div>
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T3B">
    			<div class="sequenceL">
    				<div class="sequenceText2">
	    				<h4>02</h4>
	    				<h4>지도 확인</h4>
	    				<span>로그인 후 상단 우측 메뉴의 지도를 통해</span>
	    				<div>주변 맡길 공간을 선택</div>
	    			</div>
    			</div>
    			<div class="sequenceR">
    				<img src="/image/GMap.JPG" class="sequenceImg2">
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T4B">
    			<div class="sequenceL">
    				<img src="/image/GRentalreg.JPG" class="sequenceImg">
    			</div>
    			<div class="sequenceR">
    				<div class="sequenceText">
	    				<h4>03</h4>
	    				<h4>공간 예약</h4>
	    				<span>지도를 통해 선택한 장소에</span>
	    				<div>양식에 맞게 기입 후 예약 신청</div>
	    			</div>
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T5B">
    			<div class="sequenceL">
    				<div class="sequenceText2">
	    				<h4>04</h4>
	    				<h4>장소 협의</h4>
	    				<span>거래 수락을 통해</span>
	    				<div>거래를 진행하는 공급자와 합의를 통해 물건 전달</div>
	    			</div>
    			</div>
    			<div class="sequenceR">
    				<img src="/image/GRentalreg.JPG" class="sequenceImg2">
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox">
    			<div class="sequenceL">
    				<img src="/image/giving.png" class="sequenceImg">
    			</div>
    			<div class="sequenceR">
    				<div class="sequenceText">
	    				<h4>05</h4>
	    				<h4>물건 회수</h4>
	    				<span>공급자와 합의를 통해</span>
	    				<div>물건을 돌려 받으며 거래 종료</div>
	    			</div>
    			</div>
    		</div>
    		<hr>
    		
    		<div class="secondBox">
    			<ul>
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/phone-camera.png"></span>
    						<h5>귀중품</h5>
    						<b>고가의 악세서리나 현금 등 귀중품은 소지를</b><br>
    						<b>권장드리며 불가피할 경우 내용물의 사진</b><br>
    						<b>촬영 후 서로 공유하는 것을 권장합니다</b> 
    					</div>
    				</li>
    				
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/calendar.png"></span>
    						<h5>예약시간 준수</h5>
    						<b>예약시간을 지켜주세요. 부득이하게 지연되는</b><br>
    						<b>경우 시간을 연장해주셔야 합니다. </b><br>
    						<b>다음 고객이 이미 예약한 경우에는 지연시간에</b><br>
    						<b>따라 패널티 비용이 부과됩니다.</b> 
    					</div>
    				</li>
    				
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/Gselect.png"></span>
    						<h5>품목 확인</h5>
    						<b>사용자와 공급자 모두 예약하는 품목을</b><br>
    						<b>한 번 더 확인하시고 예약을 진행해</b><br>
    						<b>주세요</b> 
    					</div>
    				</li>
    				
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/dog.png"></span>
    						<h5>반려동물</h5>
    						<b>현재 반려동물을 맡기는 부분에 있어서</b><br>
    						<b>권장하지 않고 있습니다.</b><br>
    					</div>
    				</li>
    				
    			</ul>
    		</div>
    		
    	</div>
    	
    	<div class="Type2Guide" style="display:none;">
    		<h5> 간편한 등록 방법으로 이웃집 캐비넷 서비스를 이용할 수 있습니다.</h5>
    		<div class="Type1GuideTop">
    			<div class="T1BW">
	    			<a class="T1B" href="#T6B">
	    				<span>01</span>
	    				<div>회원가입</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T7B">
	    				<span>02</span>
	    				<div>박스 구매</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T8B">
	    				<span>03</span>
	    				<div>공간 등록</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T9B">
	    				<span>04</span>
	    				<div>거래 수락</div>
	    			</a>
	    			<div class="sp">
	    			>
	    			</div>
	    			<a class="T1B" href="#T10B" id="T6B"> 
	    				<span>05</span>
	    				<div>물건 전달</div>
	    			</a>
	    		</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T7B">
    			<div class="sequenceL">
    				<img src="/image/Gjoin.JPG" class="sequenceImg">
    			</div>
    			<div class="sequenceR">
    				<div class="sequenceText">
	    				<h4>01</h4>
	    				<h4>회원가입</h4>
	    				<span>상단 우측 메뉴를 통해</span>
	    				<div>양식에 맞게 기입 후 가입</div>
	    			</div>
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T8B">
    			<div class="sequenceL">
    				<div class="sequenceText2">
	    				<h4>02</h4>
	    				<h4>박스 구매</h4>
	    				<span>로그인 후 상단 우측 메뉴를 통해</span>
	    				<div>박스 구매페이지로 이동 후 결제</div>
	    			</div>
    			</div>
    			<div class="sequenceR">
    				<img src="/image/GBox.JPG" class="sequenceImg2">
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T9B">
    			<div class="sequenceL">
    				<img src="/image/GRentalreg.JPG" class="sequenceImg">
    			</div>
    			<div class="sequenceR">
    				<div class="sequenceText">
	    				<h4>03</h4>
	    				<h4>공간 등록</h4>
	    				<span>로그인 후 상단 우측 메뉴를 통해</span>
	    				<div>양식에 맞게 기입 후 대여 공간 등록</div>
	    			</div>
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox" id="T10B">
    			<div class="sequenceL">
    				<div class="sequenceText2">
	    				<h4>04</h4>
	    				<h4>거래 수락</h4>
	    				<span>상단 우측 버튼을 통해</span>
	    				<div>거래 수락 여부 결정</div>
	    			</div>
    			</div>
    			<div class="sequenceR">
    				<img src="/image/GRentalreg.JPG" class="sequenceImg2">
    			</div>
    		</div>
    		<hr>
    		
    		<div class="sequenceBox">
    			<div class="sequenceL">
    				<img src="/image/giving.png" class="sequenceImg">
    			</div>
    			<div class="sequenceR">
    				<div class="sequenceText">
	    				<h4>05</h4>
	    				<h4>물건 전달</h4>
	    				<span>이용자와 합의를 통해</span>
	    				<div>물건을 돌려주며 거래 종료</div>
	    			</div>
    			</div>
    		</div> 
    		<hr>
    		
    		<div class="secondBox">
    			<ul>
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/phone-camera.png"></span>
    						<h5>귀중품</h5>
    						<b>고가의 악세서리나 현금 등 귀중품은 소지를</b><br>
    						<b>권장드리며 불가피할 경우 내용물의 사진</b><br>
    						<b>촬영 후 서로 공유하는 것을 권장합니다</b> 
    					</div>
    				</li>
    				
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/calendar.png"></span>
    						<h5>예약시간 준수</h5>
    						<b>예약시간을 지켜주세요. 부득이하게 지연되는</b><br>
    						<b>경우 시간을 연장해주셔야 합니다. </b><br>
    						<b>다음 고객이 이미 예약한 경우에는 지연시간에</b><br>
    						<b>따라 패널티 비용이 부과됩니다.</b> 
    					</div>
    				</li>
    				
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/Gselect.png"></span>
    						<h5>품목 확인</h5>
    						<b>사용자와 공급자 모두 예약하는 품목을</b><br>
    						<b>한 번 더 확인하시고 예약을 진행해</b><br>
    						<b>주세요</b> 
    					</div>
    				</li>
    				
    				<li>
    					<div>
    						<span class="sbImg"><img class="s1img" src="/image/dog.png"></span>
    						<h5>반려동물</h5>
    						<b>현재 반려동물을 맡기는 부분에 있어서</b><br>
    						<b>권장하지 않고 있습니다.</b><br>
    					</div>
    				</li>
    				
    			</ul>
    		</div>
    		
    	</div>
	</div>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</html>
