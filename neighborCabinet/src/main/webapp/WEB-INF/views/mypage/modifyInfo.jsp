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
		<c:import url="/WEB-INF/views/layout/header.jsp"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js' />"></script>
		<%-- <c:import url="/WEB-INF/views/layout/top.jsp" /> --%>
		<style>
			#myinfoLink{
				background:#D7FFF1;
			}
			#modifyInfoList	{
				color:gray;
			}
		</style>
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
								<div class="listObject" id="mypageList">마이페이지</div>
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
								<div class="listObject" id="payLinkList">거래/대여</div>
							</a>
						</li>
						<li class="navList">
							<a href="/mypage/review" class="navListlink" id="reviewLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/review2.png">
									</figure>
								</div>
								<div class="listObject" id="reviewList">리뷰관리</div>
							</a>
						</li>
						<li class="navList">
							<a href="/lenderPage" class="navListlink" id="lenderLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/lender.png">
									</figure>
								</div>
								<div class="listObject" id="lenderList">공급자페이지</div>
							</a>
						</li>
						
						<li class="navList">
							<a href="/boxList" class="navListlink" id="boxOrder">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/buybox.png">
									</figure>
								</div>
								<div class="listObject" id="boxOrderList">박스구매</div>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="bodyWrap">
				<span class="pageInfo">마이페이지 → 개인정보</span>
				<h1 class="pageName">개인정보</h1>
			<div class="modifyinfoBox">
				<div class="userName" >
               		<span class="modifySpan">유저아이디</span>
                    <input type="text" class="modifySpan2" name="userId" id="userId" value="<c:out value='${sessionScope.sid}'></c:out>">
                </div>       	
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">실명</span>
							<button class="modifyButton" id="modifyBtn">
								<img src="/image/gear.png" class="btnImage">
							</button>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userName" name="userName" value="<c:out value='${memberInfo.userName }'></c:out>" readonly>
						</div><hr class="miHr" color="#00DBAF" size="0.7px">
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">닉네임</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userNickname" name="userNickname" value="<c:out value='${memberInfo.userNickname }'></c:out>" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				
				<!-- <div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">비밀번호</span>
					</div>
						<div class="currentName">
							<input type="password" class="modifySpan2" id="userPw" name="userPw" readonly>
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div> -->
				
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">이메일</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userEmail" name="userEmail" value="<c:out value='${memberInfo.userEmail }'></c:out>" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">전화번호</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userHp" name ="userHp" value="<c:out value='${memberInfo.userHp }'></c:out>" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">주소</span>
					</div>
						<div class="currentName">
							<input type="text" id="user_Zipcode" name="userZipcode" size="5" value="<c:out value='${memberInfo.userZipcode }'></c:out>" readonly>
							<input type="text" class="modifySpan2" id="userAddress1" name="userAddress1" value="<c:out value='${memberInfo.userAddress1 }'></c:out>" readonly>
							<input type="text" class="modifySpan2" id="userAddress2" name="userAddress2" value="<c:out value='${memberInfo.userAddress2 }'></c:out>" readonly>	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				<div class="deleteInfo">
					<button class="deleteBtn" id="deleteBtn"><img src="/image/deleteInfo.png" class="deleteImage"><span class="deleteM">회원탈퇴</span></button>
				</div>
				 <form id="moveForm" method="get">
                	<input type="hidden" name="userId" value='<c:out value="${sessionScope.sid}"/>'>
                </form>
			</div>
		</div>
	</div>
	<script>
		let moveForm = $("#moveForm");
		
		$("#deleteBtn").on("click", function(e){
			
			if ( !confirm("회원탈퇴 하시겠습니까?") ) {
				alert("취소를 누르셨습니다.");
				return false;
			} else {
				alert("확인을 누르셨습니다."); 
			    e.preventDefault();
			    moveForm.find("input").remove();
				moveForm.append('<input type="hidden" name="userId" value="${sessionScope.sid}">');
				moveForm.attr("action", "/deleteInfo");
				moveForm.attr("method", "post");
				moveForm.submit();// 확인 클릭시 true 가 리턴 되어 실행
			}
		});	
		
		$("#modifyBtn").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.attr("action", "/modifyInfo2");
			moveForm.submit();
			
		});
	</script>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
</html>