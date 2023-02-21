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
			}
			
			#boxOrder{
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
								<div class="listObject">개인정보</div>
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
							<a href="/mypage/review" class="navListlink" id="reviewLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/review2.png">
									</figure>
								</div>
								<div class="listObject" id="modifyInfoList">리뷰관리</div>
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
					
							<!-- <li class="navList" id="boxodrderNav">
							<button id="boxorderLink1" onClick="/dealNotice">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/check.png">
									</figure>
								</div>
								<div class="listObject" id="boxorderList">거래 알림</div>
							</button>
						</li> -->
						<li class="navList" id="boxodrderNav">
							<button id="boxorderLink">
								<div class="figureBox">
									<figure>
										<img class="modifyInfo" src="/image/tracking1.png">
									</figure>
								</div>
								<div class="listObject" id="boxorderList">박스구매내역</div>
							</button>
						</li>
						<li class="navList" id="boxodrderNav1" onclick="location.href='/rental/placelist/${sid}'">
							<button id="boxorderLink1">
								<div class="figureBox">
									<figure>
										<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
											<path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
											<path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
										</svg>
									</figure>
								</div>
								<div class="listObject" id="boxorderList1">공간등록내역</div>
							</button>
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
						
						</ul>
				</nav>
						<form action="/modifyBox" method="post" id="modifyABoxForm">
						<table class="aboxModify" id="aboxModify" style="display:none;">
							<tr>
								
								<th>타입</th>
								<th>크기</th>
								<th class="pmth" style="display:none;"></th>
								<th>수량</th>
								<th class="pmth" style="display:none;"></th>
							</tr>
							<tr>
								<th>A01</th>
								<th>100x100x100</th>
								<th class="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="a01" name="a01" value="${boxStock.a01}"   readonly="readonly"/></th>
								<th class="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr>
							<tr>
								<th>A02</th>
								<th>200x200x200</th>
								<th class="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="a02" name="a02" value="${boxStock.a02 }" readonly="readonly"/></th>
								<th class="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr>
							<tr>
								<th>A03</th>
								<th>300x300x300</th>
								<th class="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="a03" name="a03" value="${boxStock.a03 }" readonly="readonly"/></th>
								<th class="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr>
							<%-- <tr>
								<th>A04</th>
								<th>400x400x400</th>
								<th class="pmth" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="a04" name="a04" value="${boxStock.a04 }" readonly="readonly"/></th>
								<th class="pmth" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr> --%>
							
						</table>
						</form>
								<button class="saveBtn1" id="saveBtn1" style="display:none;">저장</button>
								<button class="modifyBtn1" id="modifyBtn1" style="display:none;">수정</button>
						<form action="/modifyBox2" method="post" id="modifyBBoxForm">			
						<table class="bboxModify" id="bboxModify" style="display:none;">
							<tr>
								<th>타입</th>
								<th>크기</th>
								<th class="pmth1" style="display:none;"></th>
								<th>수량</th>
								<th class="pmth1" style="display:none;"></th>
							</tr>
							<tr>
								<th>B01</th>
								<th>100x100x100</th>
								<th class="pmth1" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="b01" name="b01" value="${boxStock.b01 }" readonly="readonly"/></th>
								<th class="pmth1" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr>
							<tr>
								<th>B02</th>
								<th>200x200x200</th>
								<th class="pmth1" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="b02" name="b02" value="${boxStock.b02 }" readonly="readonly"/></th>
								<th class="pmth1" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr>
							<tr>
								<th>B03</th>
								<th>300x300x300</th>
								<th class="pmth1" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="b03" name="b03" value="${boxStock.b03 }" readonly="readonly"/></th>
								<th class="pmth1" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr>
							<%-- <tr>
								<th>B04</th>
								<th>400x400x400</th>
								<th class="pmth1" style="display:none;"><button type ="button" onclick="fnCalCount('m',this);" class="m1">-</button></th>
								<th><input class="thValue" id="b04" name="b04" value="${boxStock.b04 }" readonly="readonly"/></th>
								<th class="pmth1" style="display:none;"><button type="button" onclick="fnCalCount('p', this);" class="p1">+</button></th>
							</tr> --%>
						</table>
						</form>
								<button class="saveBtn2" id="saveBtn2" style="display:none;">저장</button>
								<button class="modifyBtn2" id="modifyBtn2" style="display:none;">수정</button>
								
					</ul>
				</nav>
			</div>
			
			<div class="wrap3">
			<div class="modal1">
				<div class="modal_body">
					<div class="modal_close1"><img src="<c:url value='/image/close.jpg'/>"></div>
					<div class="title-l">박스구매내역</div>
					<table class="boxTable">
						<tr>
							<th>번호</th>
							<th style="width:25%">주문번호</th>
							<th style="width:25%">주문날짜</th>
							<th>박스종류</th>
							<th>박스수량</th>
							<th>가격</th>
						</tr>
					<c:forEach var="bh" items="${boxAllHistory}">
			            <tr>
			              <td>${bh.ordDNo}</td>
			              <td>${bh.ordNo}</td>
			              <td>${bh.ordDate}</td>
			              <td>${bh.boxType}</td>
			              <td>${bh.boxQty}</td>
			              <td>${bh.selPrice}</td>
			            </tr>
			           </c:forEach>
					</table>
				</div>
			</div>
		   	   <div class="box-wrapper">
			      <!-- 추후 대여중인 박스가 있으면 해당 내용 제공, 없으면 대여중인 박스가 없습니다 보이기 -->
			      <div class="box-title">내 거래 현황</div>
			      <div class="box-alert">
			        <img src="<c:url value='/image/exclamation.jpg'/>"> 대여 종료 시 해당 내역은 자동 삭제됩니다.
			      </div>
			      <div class="boxType" id="rent">
			        <div class="infoContainer" id="rentContainer">
			        <!-- 거래 내역 -->
			        
			         <c:forEach var="ldeal" items="${LdealAllHistory}" varStatus="status"> 
			         <c:if test="${ldeal.resState eq '2' }">
			          <div class="boxInfo">
			            <div id="topContainer">
			              <div id="date"><%-- <fmt:formatDate value='${ldeal.reserveDate}' dateStyle="full"/><span id="time"> <fmt:formatDate value='${ldeal.reserveDate}' type="time" timeStyle="short"/></span> --%>
			              ${ldeal.reserveDate.substring(0,12)}<span id="time"> ${ldeal.startTime}<span> ~ </span>${ldeal.endTime} </span>까지</div>
			              <!-- <form method="post" class="update_form"> -->
			          		<input type="hidden" class="modifySpan2" name="reserveNo" id="reserveNo" value="${ldeal.reserveNo}">
			          		<input type="hidden" class="modifySpan2" name="userId" id="userId" value="<c:out value='${sessionScope.sid}'></c:out>">
			              <!-- </form> -->
			              <div id="more"><button class="moreBtn">거래종료</button></div>
			            </div>
			            <div id="middleContainer">
			              <div id="rentImg">
			              <c:if test="${ldeal.pickup eq '1' }">
			                <div id="pickup"></div>
			               </c:if>
			                <img src="<c:url value='/image/${ldeal.storList}.jpg'/>" alt="이미지가 없습니다">
			              </div>
			              <div id="rentText">
			                <div id="address">
			                  <span id="HP">${ldeal.senderPhone.substring(0,3)} - ${ldeal.senderPhone.substring(3,7)} - ${ldeal.senderPhone.substring(7,11)}</span>
			                  <a id="Pn"><img src="<c:url value='/image/phone1.png'/>"></a>
			                </div>
			                <div id="rentTime">${ldeal.startTime}<span>~</span>${ldeal.endTime}<span>,</span> ${ldeal.senderName}<span style="font-size: 12px; color: #888888;">(${ldeal.sender})</span></div>
			              </div>
			            </div>
			            <div id="bottomContainer">
			              <a id="messenger"><img src="<c:url value='/image/messenger.jpg'/>"></a>
			    <%-- <a><img src="<c:url value='/image/messenger.jpg'/>"></a> --%>
			            </div>
			          </div>
			          </c:if>
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
			            <th>대여자 전화번호</th>
			            <th>수령일</th>
			            <th>대여자</th>
			            <th>대여시간</th>
			            <th>상태</th>
			            <th>픽업</th>
			           </tr>
			           <c:forEach var="before" items="${LdealAllHistory}">
			            <!-- 대여 전 -->
			            <c:if test="${before.resState eq '0' }">
				            <tr>
				              <td>${before.reserveNo}</td>
				              <td>${before.senderPhone.substring(0,3)} - ${before.senderPhone.substring(3,7)} - ${before.senderPhone.substring(7,11)}</td>
				              <!-- 시간대 재조정 -->
				              <td>${before.reserveDate.substring(0,12)}</td>
				              <td>${before.senderName}<span style="font-size: 12px; color: #888888;">(${before.sender})</span></td> <!-- 길어지면 감춰지도록 조정 -->
				              <td>${before.startTime} ~ ${before.endTime}</td>
				              <td style="color:blue;">대여전</td>
				               	<c:if test="${before.pickup eq '0' }">
			             	 		<td>O</td>
			              		</c:if>
			              		<c:if test="${before.pickup eq '1' }">
			             		 	<td>X</td>
			              		</c:if>
				            </tr>
			             </c:if>
			           </c:forEach>
			          </table>
			          <!-- 대여 전 끝 -->
			          
			          <!-- 대여 중 -->
			          <table class="tab-content" id="current-tr">
			          <tr>
			            <th>번호</th>
			            <th>대여자 전화번호</th>
			            <th>수령일</th>
			            <th>대여자</th>
			            <th>대여시간</th>
			            <th>상태</th>
			            <th>픽업</th>
			            </tr>
			           <c:forEach var="cur" items="${LdealAllHistory}">
			            <c:if test="${cur.resState eq '2' }">
			            <tr>
			              <td>${cur.reserveNo}</td>
			              <td>${cur.senderPhone.substring(0,3)} - ${cur.senderPhone.substring(3,7)} - ${cur.senderPhone.substring(7,11)}</td>
			              <!-- 시간대 재조정 -->
			              <td>${cur.reserveDate.substring(0,12)}</td>
			              <td>${cur.senderName}<span style="font-size: 12px; color: #888888;">(${cur.sender})</span></td>
			              <td>${cur.startTime} ~ ${cur.endTime}</td> <!-- 길어지면 감춰지도록 조정 -->
			              <td style="color:red;">대여중</td>
			              <c:if test="${cur.pickup eq '0' }">
			             	 <td>O</td>
			              </c:if>
			              <c:if test="${cur.pickup eq '1' }">
			             	 <td>X</td>
			              </c:if>
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
            <th>대여자 전화번호</th>
            <th>수령일</th>
            <th>대여자</th>
            <th>대여시간</th>
            <th>상태</th>
            <th>픽업</th>
            </tr>
           <c:forEach var="all" items="${LdealAllHistory}">
            <tr>
              <td>${all.reserveNo}</td>
              <td>${all.senderPhone.substring(0,3)} - ${all.senderPhone.substring(3,7)} - ${all.senderPhone.substring(7,11)}</td>
              <!-- 시간대 재조정 -->
              <td>${all.reserveDate.substring(0,12)}</td>
              <td>${all.senderName}<span style="font-size: 12px; color: #888888;">(${all.sender})</span></td> <!-- 길어지면 감춰지도록 조정 -->
              <td>${all.startTime} ~ ${all.endTime}</td>
              <c:if test="${all.resState eq '0' }">
              	<td style="color:blue;">대여전</td>
              </c:if>
              <c:if test="${all.resState eq '2' }">
              	<td style="color:red;">대여중</td>
              </c:if>
              <c:if test="${all.resState eq '3' }">
              	<td style="color:grey;">대여완료</td>
              </c:if>
              <c:if test="${all.pickup eq '0' }">
              	<td style="color:grey;">O</td>
              </c:if>
              <c:if test="${all.pickup eq '1' }">
              	<td style="color:grey;">X</td>
              </c:if>
            </tr>
           </c:forEach>
          </table>
         <!-- 대여완료 끝 -->   
		  </div>
		</div>
	  
	  <!-- 모달 창 끝 -->
    		<!-- 수량 조정 form -->
    		
			</div>
		</div>
        <%-- <form action="/modifyBox" method="post" id="modifyBoxForm">
			<input type="hidden" id="a01" name="a01" class="update_a01" value="${boxStock.a01}">
			<input type="hidden" id="a02" name="a02" class="update_a02" value="${boxStock.a02}">
			<input type="hidden" id="a03" name="a03" class="update_a03" value="${boxStock.a03}">
			<input type="hidden" id="a04" name="a04" class="update_a04" value="${boxStock.a04}">
			<input type="hidden" id="b01" name="b01" class="update_b01" value="${boxStock.b01}">
			<input type="hidden" id="b02" name="b02" class="update_b02" value="${boxStock.b02}">
			<input type="hidden" id="b03" name="b03" class="update_b03" value="${boxStock.b03}">
			<input type="hidden" id="b04" name="b04" class="update_b04" value="${boxStock.b04}">
		</form> --%>
		<script>

		    document.getElementById("Pn").onclick = function(){
		        // div 내부 텍스트 취득
		        const valOfspan = document.getElementById("HP").innerText;
		
		        // textarea 생성
		        const textArea = document.createElement('textarea');
		
		        // textarea 추가
		        document.body.appendChild(textArea);
		        
		        // textara의 value값으로 div내부 텍스트값 설정
		        textArea.value = valOfspan;
		
		        // textarea 선택 및 복사
		        textArea.select();
		        document.execCommand('copy');
		
		        // textarea 제거
		        document.body.removeChild(textArea);
		        alert("복사 완료"); 
		    }

		</script>
		<!-- <script>
		$(".moreBtn").on("click", function(e){	
			let update_form = $(".update_form");
			
			if ( !confirm("거래를 종료 하시겠습니까?")) {
					 alert("취소를 누르셨습니다.");
					 return false;
				} else {
					e.preventDefault();
					update_form.submit();
					alert("거래종료"); 
				}	
		});
		</script> -->
		
		
		<script>
		$(".moreBtn").on("click", function(){
			/* event.preventDefault(); */
			let reserveNo = $("#reserveNo").val();
			let userId = $("#userId").val();
			
			if ( !confirm("거래를 종료 하시겠습니까?")) {
					 alert("취소를 누르셨습니다.");
					 return false;
				} else {
					$.ajax({
			 			type:"post",
			 			url:"/dealFinish",
			 			data:{"reserveNo":reserveNo,"userId":userId},
			 			success:function(result){
			 				if(result=="success"){
			 					alert("거래종료");
			 					location.href="/lenderPage";
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
		<div class="fb"><c:import url="/WEB-INF/views/layout/footer.jsp"/></div>
</html>