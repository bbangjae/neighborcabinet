<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div class="modifyinfoBox">
				<div class="userName" >
               		<span class="modifySpan">아이디</span>
               		<div class="currentName">
                    	<input type="text" class="modifySpan2" name="userId" id="userId" value="<c:out value='${sessionScope.sid}'></c:out>">
                	</div>
                	<hr class="miHr" color="#00DBAF" size="0.7px">
                </div>       	
				<div class="userName">
					<span class="modifySpan">성명</span>
					<div class="currentName">
						<input type="text" class="modifySpan2" id="userName" name="userName" value="<c:out value='${memberInfo.userName }'></c:out>">
					</div>
					<hr class="miHr" color="#00DBAF" size="0.7px">
				</div>
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">전화번호</span>
					</div>
					<div class="currentName">
						<input type="text" class="modifySpan2" id="userHp" name ="userHp" value="<c:out value='${memberInfo.userHp }'></c:out>">	
					</div>
					<hr class="miHr" color="#00DBAF" size="1px">
				</div>
				<div class="qr">
			      <a id="qrBtn" href="#">본인 인증하기</a>
			    </div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>