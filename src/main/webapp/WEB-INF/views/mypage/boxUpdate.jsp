<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/boxUpdate.css' />">
		<link rel="stylesheet" type="text/css" href=/css/modifyInfo.css/> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<c:import url="/WEB-INF/views/layout/header.jsp" />
	<title>박스 수량 수정 페이지</title>
	</head>
		<body>
		
		<div class="wrap">
			<div class="navBlock">
				<nav class="infoNav">
					<ul class="allNav">
					<li class="navList">
							<a href="/" class="navListlink" id="mypageLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/mypage.png">
									</figure>
								</div>
								<div class="listObject">마이페이지</div>
							</a>
						</li>
						<li class="navList">
							<a href="/modifyInfo.do" class="navListlink" id="myinfoLink">
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
							<a href="/" class="navListlink" id="boxLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/box2.png">
									</figure>
								</div>
								<div class="listObject">박스</div>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			
			<form action="/QRconfirm" method="post" class="update_form">
				<input id="sender" name="sender">
				<input id="senderPhone" name="senderPhone">
			</form>
			<button id="bt1" name="bt1"></button>
			</div>
		<script>
		$("#bt1").on("click", function(){	
			let sender = $("#sender").val();
			let senderPhone = $("#senderPhone").val();
			
			if ( !confirm("QR")) {
					 alert("취소를 누르셨습니다.");
					 return false;
				} else {
					$.ajax({
			 			type:"post",
			 			url:"/QRconfirm",
			 			data:{"senderPhone":senderPhone,"sender":sender},
			 			success:function(result){
			 				if(result=="success"){
			 					alert("거래종료");
			 					location.href="/boxUpdate";
			 				}
			 			
			 			},
			 			error:function(){
			 				alert("실패");
			 			},
			 		});
				}	
		});
		</script>
		</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</html>