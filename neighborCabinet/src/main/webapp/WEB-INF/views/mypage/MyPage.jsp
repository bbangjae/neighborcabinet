<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css' />">
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<title>마이페이지</title>
	</head>
	<body>
	<%-- <%
	String id = (String) session.getAttribute("userId");
	if(id == null) response.sendRedirect("/mypage2");
	%> --%>
		<main>
			<section>
				<h1 class="myPageH1">마이페이지</h1> 
				<label class="hello1">${sessionScope.sid}님 환영합니다.</label>
			</section>
			<hr color="#00DBAF" width="60%"size="1px"> 
					 
			<div class="wrap">
				<div class="ObjectBox">
					<div class="OjectS">
						<div class="pageObject" id="Object1">
							<a href="/modifyInfo" class="ObjectLink"></a>
							<span>개인 정보</span>
						</div>
						<div class="pageObject" id="Object2">
							<a href="/rentHistory" class="ObjectLink"></a>
							<span>거래/대여</span>
						</div>
						<div class="pageObject" id="Object3">
							<a href="/mypage/review" class="ObjectLink"></a>
							<span>리뷰 관리</span>
						</div>
						<div class="pageObject" id="Object4">
							<a href="/lenderPage" class="ObjectLink"></a>
							<span>공급자</span>
						</div>
					</div>
				</div>
			</div>
		</main>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
</html>