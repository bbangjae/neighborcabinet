<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
	<head>
		<meta charset="UTF-8">
		<script src="<c:url value="/js/jquery-3.6.1.min.js" />"></script>
		<script src="<c:url value="/js/mod.js" />"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href=/css/modifyInfo.css/> 
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js' />"></script>
		<%-- <c:import url="/WEB-INF/views/layout/top.jsp" /> --%>
		
		<title>개인정보</title>
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
							<a href="/" class="navListlink" id="myinfoLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/profile2.png">
									</figure>
								</div>
								<div class="listObject" id="modifyInfoList">개인정보</div>
							</a>
						</li>
						<li class="navList">
							<a href="/" class="navListlink" id="payLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/pay.png">
									</figure>
								</div>
								<div class="listObject">결제</div>
							</a>
						</li>
						<li class="navList">
							<a href="/" class="navListlink" id="reviewLink">
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
			<div class="bodyWrap">
				<span class="pageInfo">마이페이지 → 개인정보</span>
				<h1 class="pageName">개인정보</h1>
			<div class="modifyinfoBox">
			<c:if test="${loginCheck==null }">
			
				<div class="userName" style="display:none;">
               		<span class="modifySpan">아이디</span>
                    <input type="text" class="modifySpan2" name="userId" id="userId" value="${dao.userId}">
                </div>       	
			
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">실명</span>
							<button class="modifyButton" onClick='toggleform1()'>
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userName" name="userName" value="최정" readonly>
						</div><hr class="miHr" color="#00DBAF" size="0.7px">
					<form class="showForm">
						<div class="formBox" id="formBox1">
							<div class="formInput">
								<!-- <input class="inputText" id="inputText1"> -->
								<button class="saveBtn" id="saveBtn1" onClick='saveForm1()'>저장</button>
							</div>
						</div>
					</form>
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">닉네임</span>
							<button class="modifyButton" onClick='toggleform2()'>
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userNickname" name="userNickname" value="정원" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
					<form class="showForm">
						<div class="formBox" id="formBox2">
							<div class="formInput">
								<!-- <input class="inputText"> -->
								<button class="saveBtn" id="saveBtn2" onClick='saveForm2()'>저장</button>
							</div>
						</div>
					</form>
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">비밀번호</span>
							<button class="modifyButton" onClick='toggleform3()'>
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="password" class="modifySpan2" id="userPw" name="userPw" readonly>
						</div><hr class="miHr" color="#00DBAF" size="1px">
					<form class="showForm">
						<div class="formBox" id="formBox3">
							<div class="formInput">
								<!-- <input class="inputText" id="fixPw" name="fixPw" value="비밀번호입력">
								<input class="inputText" id="fixPwchk" name="fixPwchk" value="비밀번호확인"> -->
								<button class="saveBtn" id="saveBtn3" onClick='saveForm3()'>저장</button>
							</div>
						</div>
					</form>
				</div>
				
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">이메일</span>
							<button class="modifyButton" onClick='toggleform4()'>
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userEmail" name="userEmail" value="aa@a.com" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
					<form class="showForm">
						<div class="formBox" id="formBox4">
							<div class="formInput">
								<!-- <input class="inputText"> -->
								<button class="saveBtn" id="saveBtn4" onClick='saveForm4()'>저장</button>
							</div>
						</div>
					</form>
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">전화번호</span>
							<button class="modifyButton" onClick='toggleform5()'>
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userHp" name ="userHp" value="01012123333" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
					<form class="showForm">
						<div class="formBox" id="formBox5">
							<div class="formInput">
								<!-- <input class="inputText"> -->
								<button class="saveBtn" id="saveBtn5" onClick='saveForm5()'>저장</button>
							</div>
						</div>
					</form>
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">주소</span>
							<button class="modifyButton" onClick='toggleform6()' id="searchZipBtn" name="searchZipBtn">
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="text" id="user_Zipcode" name="userZipcode" size="5" value="12345" readonly>
							<input type="text" class="modifySpan2" id="userAddress1" name="userAddress1" value="부산광역시 해운대구 APEC로" readonly>
							<input type="text" class="modifySpan2" id="userAddress2" name="userAddress2" value="122" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
					<form class="showForm">
						<div class="formBox" id="formBox6">
							<div class="formInput">
								<!-- <input type="text" class="inputText" id="memAddress3" name="memAddress3" value="상세주소"> -->
								<button class="saveBtn" id="saveBtn6" onClick='saveForm6()'>저장</button>
							</div>
						</div>
					</form>
				</div>
				<div class="deleteInfo">
					<button class="deleteBtn"><img src="/image/deleteInfo.png" class="deleteImage"><span class="deleteM">회원탈퇴</span></button>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
</html>