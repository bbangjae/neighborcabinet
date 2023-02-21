<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR 코드 인증</title>
<script src="<c:url value="/js/jquery-3.6.1.min.js" />"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href=/css/modifyInfo.css/> 
<link rel ="stylesheet" type="text/css" href="<c:url value='/css/rental.css'/>">
<link rel="stylesheet" type="text/css" href=/css/modifyInfo.css/>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script src="<c:url value="/js/mod.js" />"></script>
<script src="<c:url value='/js/searchZip.js' />"></script>
<script src="<c:url value='/js/qrConfirm.js' />"></script>
</head>
<body>
<div class="wrap">
			<div class="navBlock">
				<nav class="infoNav">
					<ul class="allNav"> 
					<li class="navList"> 
							<a href="/mypage" class="navListlink" id="mypageLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/mypage.png">
									</figure>
								</div>
								<div class="listObject">마이페이지</div>
							</a>
						</li>
						<li class="navList">
							<a href="/modifyInfo" class="navListlink" id="myinfoLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/profile2.png">
									</figure>
								</div>
								<div class="listObject" id="modifyInfoList">개인정보</div>
							</a>
						</li>
						<li class="navList">
							<a href="/rentHistory" class="navListlink" id="payLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/customer.png">
									</figure>
								</div>
								<div class="listObject">거래/대여</div>
							</a>
						</li>
						<li class="navList">
							<a href="/rentHistory" class="navListlink" id="reviewLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/review2.png">
									</figure>
								</div>
								<div class="listObject">리뷰관리</div>
							</a>
						</li>
						<li class="navList">
							<a href="/lenderPage" class="navListlink" id="lenderLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/lender.png">
									</figure>
								</div>
								<div class="listObject">공급자페이지</div>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			
			<div class="bodyWrap">
				<span class="pageInfo">거래현황 → 본인확인</span>
				<h1 class="pageName">본인 확인</h1>
		  <form method="post" action="/qrConfirm" class="update_form">
			<div class="modifyinfoBox">
				<div class="userName">
					<span class="modifySpan">아이디</span>
					<div class="currentName">
						<input type="text" class="modifySpan2" id="userId" name="sender">
					</div>
					<hr class="miHr" color="#00DBAF" size="0.7px">
				</div>
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">전화번호</span>
					</div>
					<div class="currentName">
						<input type="text" class="modifySpan2" id="senderPhone" name="senderPhone">	
					</div>
					<hr class="miHr" color="#00DBAF" size="1px">
					
				</div>
				<div class="userName"> <!--  style="display: flex;" -->
					<button id="qrBtn" class="bt1" name="bt1">본인 인증하기</button>
					<!-- style="margin-left: 35%;" 주면 가운데로 가능하나 더 어색함 -->
				</div>
				
			</div>
			
		  </form>
		  <!-- <div class="qr"> -->
			      
		    <!-- </div> -->
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>