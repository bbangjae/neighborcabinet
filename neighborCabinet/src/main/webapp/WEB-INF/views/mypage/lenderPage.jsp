<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery-3.6.1.min.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/lenderPage.css' />">
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/lenderPage2.css'/>">
		
		<link rel="stylesheet" type="text/css" href=/css/modifyInfo.css/> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<script src="<c:url value='/js/searchZip.js' />"></script>
		<script src="<c:url value='/js/lenderPage.js' />"></script>
		<script src="<c:url value='/js/rentHistory.js' />"></script>
		<style>
			#lenderLink{
				background:#D7FFF1;
				margin-bottom:60%;
			}
			#lenderList{
				color:gray;
			}
		</style>
		
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
							<a href="/rentHistory" class="navListlink" id="reviewLink">
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
								<div class="listObject" id="lenderList">공급자</div>
							</a>
						</li>
						<li class="navList" id="boxodrderNav">
							<a href="/lenderPage" id="boxorderLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/tracking.png">
									</figure>
								</div>
								<div class="listObject" id="boxorderList">박스구매내역</div>
							</a>
						</li>
						<div class="boxFtitle">박스 수량 수정</div>
						<li class="boxF" id="boxF">
							<div class="normalBox">
								<a href="#" id="viewaboxTable" onclick="return false;">
									<figure>
										<img class="boxFimg1" src="/image/normal.png">
										<div class="boxT1">Nbox</div>
									</figure>
								</a>
							</div>
							<div class="premiumBox">
								<a href="#" id="viewbboxTable" onclick="return false;">
									<figure>
										<img class="boxFimg2" src="/image/premium.png">
										<div class="boxT2">Pbox</div>
									</figure>
								</a>	
							</div>
						</li>
						
						<table class="aboxModify" id="aboxModify" style="display:none;">
							<tr>
								<th>타입</th>
								<th>크기</th>
								<th class="pmth" id="pmth" style="display:none;"></th>
								<th>수량</th>
								<th class="pmth" id="pmth" style="display:none;"></th>
							</tr>
							<tr>
								<th>A01</th>
								<th>100x100x100</th>
								<form>
								<th class="pmth" id="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1" id="m1">-</button></th>
								<th><input type="text" class="thValue" name="pop_out" value="0" readonly="readonly"/></th>
								<th class="pmth" id="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1" id="p1">+</button></th>
								</form>
							</tr>
							<tr>
								<th>A02</th>
								<th>200x200x200</th>
								<th class="pmth" id="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1" id="m1">-</button></th>
								<th><input type="text" class="thValue" name="pop_out" value="0" readonly="readonly"/></th>
								<th class="pmth" id="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1" id="p1">+</button></th>
							</tr>
							<tr>
								<th>A03</th>
								<th>300x300x300</th>
								<th class="pmth" id="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1" id="m1">-</button></th>
								<th><input type="text" class="thValue" name="pop_out" value="0" readonly="readonly"/></th>
								<th class="pmth" id="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1" id="p1">+</button></th>
							</tr>
							
						</table>
								<button class="saveBtn1" id="saveBtn1" style="display:none;">저장</button>
								<button class="modifyBtn1" id="modifyBtn1" style="display:none;">수정</button>
								
								
						<table class="bboxModify" id="bboxModify" style="display:none;">
							<tr>
								<th>타입</th>
								<th>크기</th>
								<th class="pmth1" id="pmth" style="display:none;"></th>
								<th>수량</th>
								<th class="pmth1" id="pmth" style="display:none;"></th>
							</tr>
							<tr>
								<th>B01</th>
								<th>100x100x100</th>
								<th class="pmth1" id="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1" id="m1">-</button></th>
								<th><input type="text" class="thValue" name="pop_out" value="0" readonly="readonly"/></th>
								<th class="pmth1" id="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1" id="p1">+</button></th>
							</tr>
							<tr>
								<th>B02</th>
								<th>200x200x200</th>
								<th class="pmth1" id="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1" id="m1">-</button></th>
								<th><input type="text" class="thValue" name="pop_out" value="0" readonly="readonly"/></th>
								<th class="pmth1" id="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1" id="p1">+</button></th>
							</tr>
							<tr>
								<th>B03</th>
								<th>300x300x300</th>
								<th class="pmth1" id="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1" id="m1">-</button></th>
								<th><input type="text" class="thValue" name="pop_out" value="0" readonly="readonly"/></th>
								<th class="pmth1" id="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1" id="p1">+</button></th>
							</tr>
						</table>
								<button class="saveBtn2" id="saveBtn2" style="display:none;">저장</button>
								<button class="modifyBtn2" id="modifyBtn2" style="display:none;">수정</button>
								
					</ul>
				</nav>
			</div>
			
			<div class="wrap3">
		   	   <div class="box-wrapper">
			      <!-- 추후 대여중인 박스가 있으면 해당 내용 제공, 없으면 대여중인 박스가 없습니다 보이기 -->
			      <div class="box-title">내 거래 현황</div>
			      <div class="box-alert">
			        <img src="<c:url value='/image/exclamation.jpg'/>"> 대여 종료 시 해당 내역은 자동 삭제됩니다.
			      </div>
			      <div class="boxType" id="rent">
			        <div class="infoContainer" id="rentContainer">
			        <!-- 거래 내역 -->
			         <c:forEach var="deal" items="${dealAllHistory}">
			          <div class="boxInfo">
			            <div id="topContainer">
			              <div id="date"><fmt:formatDate value='${deal.receiptDate}' dateStyle="full"/><span id="time"> <fmt:formatDate value='${deal.receiptDate}' type="time" timeStyle="short"/></span>까지</div>
			              <div id="more"><a id="moreBtn">상세보기</a></div>
			            </div>
			            <div id="middleContainer">
			              <div id="rentImg">
			               <c:if test="${deal.pickup eq 'O' }">
			                <div id="pickup"></div>
			               </c:if>
			                <img src="<c:url value='/image/${deal.dealObject}.jpg'/>" alt="이미지가 없습니다">
			              </div>
			              <div id="rentText">
			                <div id="address">
			                  <span>${deal.dealPlace}</span>
			                  <a id="map"><img src="<c:url value='/image/map.jpg'/>"></a>
			                </div>
			                <div id="rentTime">${deal.dealStart}<span>~</span>${deal.dealEnd}<span>,</span> ${deal.userName}</div>
			              </div>
			            </div>
			            <div id="bottomContainer">
			              <a id="messenger"><img src="<c:url value='/image/messenger.jpg'/>"></a>
			    <%--           <a><img src="<c:url value='/image/messenger.jpg'/>"></a> --%>
			            </div>
			          </div>
			         </c:forEach>
			         <!-- 거래 내역 끝 -->
			        </div>
			      </div>
			    </div>
			    
						     <!-- 대여  내역 시작 -->    
			    <div class="box-wrapper">
			      <div class="box-title">
			        <div>내 대여 내역</div>
			        <div class="detail" id="setting">
			          <%-- <a href="#">
			            <img src="<c:url value='/image/setting.jpg'/>">
			          </a> --%>
			        </div>
			      </div>
			      <div class="btn-wrapper">
			        <ul class="btns">
			          <li class="dealBtn current" id="before" data-tab="before-tr">
			            대여 전
			          </li>
			          <li class="line">
			            <img src="<c:url value='/image/go.jpg'/>">
			            <img src="<c:url value='/image/go.jpg'/>">
			            <img src="<c:url value='/image/go.jpg'/>">
			          </li>
			          <li class="dealBtn" id="cur" data-tab="current-tr">
			            진행 중
			          </li>
			          <li class="line">
			            <img src="<c:url value='/image/go.jpg'/>">
			            <img src="<c:url value='/image/go.jpg'/>">
			            <img src="<c:url value='/image/go.jpg'/>">
			          </li>
			          <li class="dealBtn" id="all" data-tab="all-tr">
			            전체 조회
			          </li>        
			        </ul>
			      </div>
			
			  
			      <div class="boxType" id="deal">
			        <div class="infoContainer" id="dealContainer">
			          <table class="tab-content current" id="before-tr">
			          <tr>
			            <th>번호</th>
			            <th>장소</th>
			            <th>수령일</th>
			            <th>사용자</th>
			            <th>시간</th>
			            <th>상태</th>
			            <th>픽업</th>
			           </tr>
			           <c:forEach var="before" items="${rentAllHistory}">
			            <!-- 대여 전 -->
			            <c:if test="${before.rentState eq '대여전' }">
			            <tr>
			              <td>${before.rentNo}</td>
			              <td>${before.rentPlace}</td>
			              <!-- 시간대 재조정 -->
			              <td><fmt:formatDate value='${before.receiptDate}' pattern="yyyy-MM-dd hh:mm"/></td>
			              <td>${before.userName}</td> <!-- 길어지면 감춰지도록 조정 -->
			              <td>${before.rentTime}</td>
			              <td style="color:blue;">${before.rentState}</td>
			              <td>${before.pickup}</td>
			            </tr>
			             </c:if>
			           </c:forEach>
			          </table>
			          <!-- 대여 전 끝 -->
			          
			          <!-- 대여 중 -->
			          <table class="tab-content" id="current-tr">
			          <tr>
			            <th>번호</th>
			            <th>장소</th>
			            <th>수령일</th>
			            <th>사용자</th>
			            <th>시간</th>
			            <th>상태</th>
			            <th>픽업</th>
			            </tr>
			           <c:forEach var="cur" items="${rentAllHistory}">
			            <c:if test="${cur.rentState eq '대여중' }">
			            <tr>
			              <td>${cur.rentNo}</td>
			              <td>${cur.rentPlace}</td>
			              <!-- 시간대 재조정 -->
			              <td><fmt:formatDate value='${cur.receiptDate}' pattern="yyyy-MM-dd hh:mm"/></td>
			              <td>${cur.userName}</td> <!-- 길어지면 감춰지도록 조정 -->
			              <td>${cur.rentTime}</td>
			              <td style="color:red;">${cur.rentState}</td>
			              <td>${cur.pickup}</td>
			            </tr>
			            </c:if>
			           </c:forEach>
			          </table>
			         <!-- 대여 중 끝 -->
			        </div>
			      </div>
			    </div>
			<!-- 대여 내역 끝 -->
			
			 <div class="box-wrapper">
			   <!-- 이미 생성된 코드가 있으면 해당 내용 제공, 없으면 QR코드 생성 버튼 보이기 -->
			    <div class="box-title">
			        QR 코드 생성
			        <a id="re"><img src="<c:url value='/image/re2.jpg'/>"></a>
			      </div>
			      <div class="boxType" id="qr">
			        <div class="infoContainer" id="qrContainer">
			        <div class="notice"><img src="<c:url value='/image/exclamation.jpg'/>">생성된 QR 코드가 없습니다.</div>
			         <%-- <c:if test="${empty }">
			         </c:if> --%>
			        </div>
			
			      </div>
			      <div class="qr">
			        <a id="qrBtn" href="#">개인 인증 코드 만들기</a>
			      </div>
			    </div>
			
				<!-- 모달 창 -->
		<div class="modal">
		  <div class="modal_content" title="">
		   <div class="modal_close"><img src="<c:url value='/image/close.jpg'/>"></div>
		   <div class="bar">
		     <form id="searchForm" name="searchForm">
		       <input type="search" name="searchText" id="searchText" placeholder="사용자명을 입력하세요" autocomplete="on" onfocus="this.placeholder=''" onblur="this.placeholder='사용자명을 입력하세요'" required>
		       <input type="image" src="<c:url value='/image/search.jpg'/>" id="searchBtn">
		       <input type="date" name="searchDate" id="searchDate" value="2023-01-20" min="2023-01-20" max="2099-12-31">
		     </form>
		   </div>
		    <!-- 대여완료 -->
          <table class="tab-content" id="all-tr">
          <tr>
            <th>번호</th>
            <th>장소</th>
            <th>수령일</th>
            <th>사용자</th>
            <th>시간</th>
            <th>상태</th>
            <th>픽업</th>
            </tr>
           <c:forEach var="all" items="${rentAllHistory}">
            <c:if test="${all.rentState eq '대여완료' }">
            <tr>
              <td>${all.rentNo}</td>
              <td>${all.rentPlace}</td>
              <!-- 시간대 재조정 -->
              <td><fmt:formatDate value='${all.receiptDate}' pattern="yyyy-MM-dd hh:mm"/></td>
              <td>${all.userName}</td> <!-- 길어지면 감춰지도록 조정 -->
              <td>${all.rentTime}</td>
              <td style="color:grey;">${all.rentState}</td>
              <td>${all.pickup}</td>
            </tr>
            </c:if>
           </c:forEach>
          </table>
         <!-- 대여완료 끝 -->   
		  </div>
		</div>
	  
	  <!-- 모달 창 끝 -->
    
			
			    <c:import url="/WEB-INF/views/layout/footer.jsp"/>
			</div>
		</div>
		</body>
</html>