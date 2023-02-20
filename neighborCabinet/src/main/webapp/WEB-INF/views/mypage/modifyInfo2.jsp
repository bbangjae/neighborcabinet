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
							<a href="/lenderPage" class="navListlink" id="boxLink">
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
				<span class="pageInfo">개인정보 → 정보수정</span>
				<h1 class="pageName">정보수정</h1>
			<div class="modifyinfoBox">
			<form id="modifyForm" action="/modifyInfo!" method="post">
				<div class="userName" style="display:none;">
               		<span class="modifySpan">아이디</span>
                    <input type="text" class="modifySpan2" name="userId" id="userId" value="<c:out value='${sessionScope.sid}'></c:out>">
                </div>       	
			
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">실명</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userName" name="userName" value="<c:out value='${memberInfo.userName }'></c:out>">
						</div><hr class="miHr" color="#00DBAF" size="0.7px">
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">닉네임</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userNickname" name="userNickname" value="<c:out value='${memberInfo.userNickname }'></c:out>">	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				
				<%-- <div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">비밀번호</span>
					</div>
						<div class="currentName">
							<input type="password" class="modifySpan2" id="userPw" name="userPw" value="<c:out value='${memberInfo.userPw }'></c:out>">
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div> --%>
				
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">이메일</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userEmail" name="userEmail" value="<c:out value='${memberInfo.userEmail }'></c:out>" >	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">전화번호</span>
					</div>
						<div class="currentName">
							<input type="text" class="modifySpan2" id="userHp" name ="userHp"  value="<c:out value='${memberInfo.userHp }'></c:out>">	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				
				<div class="userName">
					<div class="inputbtnBox">
						<span class="modifySpan">주소</span>
					</div>
						<div class="currentName">
							<input type="text" id="user_Zipcode" name="userZipcode" size="5" value="<c:out value='${memberInfo.userZipcode }'></c:out>" >
							<input type="text" class="modifySpan2" id="userAddress1" name="userAddress1" value="<c:out value='${memberInfo.userAddress1 }'></c:out>" >
							<input type="text" class="modifySpan2" id="userAddress2" name="userAddress2" value="<c:out value='${memberInfo.userAddress2 }'></c:out>" >	
						</div><hr class="miHr" color="#00DBAF" size="1px">
				</div>
				<div class="inputbtnBox">
					<button class="modifyButton" id="modifyBtn">
						<img src="/image/gear.png" class="btnImage">
					</button>
				</div>
				</form>
				<form id="moveForm" method="get">
                	<input type="hidden" name="userId" value='<c:out value="${sessionScope.sid }"/>'>
                </form>
			</div>
		</div>
	</div>
	<script>
	let modifyForm = $("#modifyForm");
	let moveForm = $("#moveForm");
	
	$("#modifyBtn").on("click", function(e){		
		if ( !confirm("수정 하시겠습니까?")) {
			 alert("취소를 누르셨습니다.");
			 return false;
		} else {
			 alert("확인을 누르셨습니다."); 
			    e.preventDefault();
				modifyForm.submit(); 
			
		}
		
		
	});
	</script>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
</html>