<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>거래/대여 현황</title>
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/rental.css'/>">
		<link rel="stylesheet" type="text/css" href=/css/modifyInfo.css/>
		<script src="<c:url value='/js/jquery-3.6.1.min.js' />"></script>
		<script src="<c:url value='/js/rentHistory.js' />"></script>
		<script src="<c:url value='/js/pagination.js' />" ></script>
		<!-- 반응형을 위해 아래의 가로폭 조정 코드 필요 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<script src="<c:url value="/js/mod.js" />"></script>
		<script src="<c:url value='/js/searchZip.js' />"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- <script type="text/javascript">
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
		</script> -->
	</head>
	<body>
	<div id="wrap">
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
		<div style="height:100%; margin-top: 60px;">
    <div class="box-wrapper">
      <!-- 추후 대여중인 박스가 있으면 해당 내용 제공, 없으면 대여중인 박스가 없습니다 보이기 -->
      <div class="box-title">내 거래 현황</div>
      <div class="box-alert">
        <img src="<c:url value='/image/exclamation.jpg'/>"> 대여 종료 시 해당 내역은 공급자에 의해 삭제됩니다.
      </div>
      <div class="boxType" id="rent">
        <div class="infoContainer" id="rentContainer">
        <!-- 거래 내역 -->
         <c:forEach var="rent" items="${rentAllHistory}">
          <c:if test="${empty rent.reserveNo}">
         	<div class="notice">
         		진행 중인 거래가 없습니다.
         	</div>
         </c:if>
         <c:if test="${not empty rent.reserveNo}">
          <c:if test="${rent.resState eq 2 }">
          <div class="boxInfo">
            <div id="topContainer">
              <div id="date">${rent.reserveDate.substring(0, 12)}<span id="time"> ${rent.endTime}</span>까지</div>
             <%-- 	<input type="hidden" class="modifySpan2" name="reserveNo" id="reserveNo" value="${rent.reserveNo}">
       			<input type="hidden" class="modifySpan2" name="userId" id="userId" value="<c:out value='${sessionScope.sid}'></c:out>"> --%>
              <div id="more"><a id="moreBtn">상세보기</a></div>
            </div>
            <div id="middleContainer">
              <div id="rentImg">
               <c:if test="${rent.pickup eq 1 }">
                <div id="pickup"></div>
               </c:if>
                <img src="<c:url value='/image/1.jpg'/>" alt="이미지가 없습니다">
              </div>
              <div id="rentText">
                <div id="address">
                  <span>${rent.pAddress1}</span>
                  <a id="map"><img src="<c:url value='/image/map.jpg'/>"></a>
                </div>
                <div id="rentTime">${rent.startTime}<span>~</span>${rent.endTime}<span>,</span> ${rent.receiver}</div>
              </div>
            </div>
            <div id="bottomContainer">
              <a id="messenger"><img src="<c:url value='/image/messenger.jpg'/>"></a>
    <%--           <a><img src="<c:url value='/image/messenger.jpg'/>"></a> --%>
            </div>
          </div>
          </c:if>
          </c:if>
         </c:forEach>
      
         <!-- 거래 내역 끝 -->
        </div>
      </div>
    </div>
    
  <!-- 대여 내역에서 거래 내역으로 변경 -->    
    <div class="box-wrapper">
      <div class="box-title">
        <div>내 거래 내역</div>
        <div class="detail" id="setting">
          <%-- <a href="#">
            <img src="<c:url value='/image/setting.jpg'/>">
          </a> --%>
        </div>
      </div>
      <div class="btn-wrapper">
        <ul class="btns">
          <li class="dealBtn current" id="before" data-tab="before-tr">
            거래 전
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
            <th>공급자</th>
            <th>대여시간</th>
            <th>상태</th>
            <th>픽업</th>
           </tr>
           <c:forEach var="before" items="${rentAllHistory}">
            <!-- 거래 전 -->
            <c:if test="${before.resState eq '1' or '0' }">
            <tr>
              <td>${before.reserveNo}</td>
              <td>${before.pAddress1}</td>
              <!-- 시간대 재조정 -->
              <td>${before.reserveDate.substring(0, 12)}</td>
              <td>${before.receiver}</td> <!-- 길어지면 감춰지도록 조정 -->
              <td>${before.startTime}~${before.endTime}</td>
              <td style="color:blue;">대여전</td>
              <td>
              	<c:choose>
			         <c:when test="${before.pickup eq 0}">
			            X
			         </c:when>
			         <c:when test="${before.pickup eq 1}">
			            O
			         </c:when>
			         <c:otherwise>
			            null
			         </c:otherwise>
			    </c:choose>
              </td>
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
            <th>공급자</th>
            <th>대여시간</th>
            <th>상태</th>
            <th>픽업</th>
            </tr>
           <c:forEach var="cur" items="${rentAllHistory}">
            <c:if test="${cur.resState eq '2' }">
            <tr>
              <td>${cur.reserveNo}</td>
              <td>${cur.pAddress1}</td>
              <td>${cur.reserveDate.substring(0, 12)}</td>
              <!-- 시간대 재조정 -->
              <td>${cur.receiver}</td> <!-- 길어지면 감춰지도록 조정 -->
              <td>${cur.startTime}~${cur.endTime}</td>
              <td style="color:red;">대여중</td>
              <td>
              	<c:choose>
			         <c:when test="${cur.pickup eq 0}">
			            X
			         </c:when>
			         <c:when test="${cur.pickup eq 1}">
			            O
			         </c:when>
			         <c:otherwise>
			            null
			         </c:otherwise>
			    </c:choose>
              </td>
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
        <%-- <a id="re"><img src="<c:url value='/image/re2.jpg'/>"></a> --%>
      </div>
       <div class="boxType" id="qr">
        <div class="infoContainer" id="qrContainer">
        <div class="notice">
        <%-- <img src="<c:url value='/image/exclamation.jpg'/>">생성된 QR 코드가 없습니다. --%>
			<form action="/qrCode" method="post">
		      <input type="hidden" name="url" value="http://115.85.181.111:8080/qrConfirm/${sessionScope.sid }"/><button type="submit" id="qrBtn">개인 인증 코드 만들기</button>
		    </form>
        </div>
       </div>
      </div>
      <!-- <div class="qr">
        <a id="qrBtn" href="#">개인 인증 코드 만들기</a>
      </div> -->
    </div>
    
    <!-- 모달 창 -->
		<div class="modal">
		  <div class="modal_content" title="">
		   <div class="modal_close"><img src="<c:url value='/image/close.jpg'/>"></div>
		   <form id="searchForm" name="searchForm"> <!--  method="get" action="/rentHistorySearch"  -->
			<input type="hidden" id="pageIndex" name="pageIndex" value="${searchVO.pageIndex}">
			<!-- <input type="hidden" id="pageIndex" name="pageIndex" value=""> -->
		   <div class="bar">
		       <input type="text" name="searchKeyword" id="searchKeyword" value="${searchVO.searchKeyword}" placeholder="사용자명을 입력하세요" autocomplete="on" onfocus="this.placeholder=''" onblur="this.placeholder='사용자명을 입력하세요'" required>
		       <input type="image" id="searchBtn" src="<c:url value='/image/search.jpg'/>">
		       <input type="date" name="searchDate" id="searchDate" value="2023-01-20" min="2023-01-20" max="2099-12-31">
		   </div>
		    <!-- 기존 대여테이블 삽입 위치 --> 
		    <!-- 대여완료 -->
		    <span>총 게시물 ${totCnt} / 페이지 (${searchVO.pageIndex} / ${totalPageCnt})</span>
          <table class="tab-content" id="all-tr">
            <thead>
	          <tr>
	            <th>번호</th>
	            <th>장소</th>
	            <th>수령일</th>
	            <th>공급자</th>
	            <th>대여시간</th>
	            <th>상태</th>
	            <th>픽업</th>
	          </tr>
            </thead>
            <tbody class="listData">
            <c:set var="ii" value="${resultCnt - (searchVO.pageIndex -1) * paginationInfo.recordCountPerPage }" />
           	<c:forEach var="all" items="${rentAllHistory}" varStatus="sts">
            <%-- <c:if test="${all.rentState eq '대여완료' }"> --%>
            <tr class="rentHistory">
              <td class="t_c"><c:out value="${all.reserveNo}"/></td> <!-- ${ii} -->
              <td class="t_c">${all.pAddress1}</td>
              <!-- 시간대 재조정 -->
              <td class="t_c">${all.reserveDate.substring(0, 12)}</td>
              <td class="t_c">${all.receiver}</td> <!-- 길어지면 감춰지도록 조정 -->
              <td class="t_c">${all.startTime}~${all.endTime}</td>
              <c:choose>
		         <c:when test="${all.resState eq 0}">
		            <td class="t_c" style="color:#00f5b8;">대기중</td>
		         </c:when>
		         <c:when test="${all.resState eq 1}">
		            <td class="t_c" style="color:blue;">대여전</td>
		         </c:when>
		         <c:when test="${all.resState eq 2}">
		            <td class="t_c" style="color:red;">대여중</td>
		         </c:when>
		         <c:when test="${all.resState eq 3}">
		            <td class="t_c" style="color:grey;">대여완료</td>
		         </c:when>
		         <c:otherwise>
		            <td class="t_c" style="color:grey;">null</td>
		         </c:otherwise>
		      </c:choose>
              <td class="t_c">
            	<c:choose>
			         <c:when test="${all.pickup eq 0}">
			            X
			         </c:when>
			         <c:when test="${all.pickup eq 1}">
			            O
			         </c:when>
			         <c:otherwise>
			            null
			         </c:otherwise>
			    </c:choose>
              </td>
            </tr>
            <c:set var="ii" value="${ii - 1}"/>
            <%-- </c:if> --%>
           </c:forEach>
			 	<c:if test="${fn:length(rentAllHistory) == 0}">
					<tr>
					  <td colspan="7"  class="first last">조회 결과가 없습니다.</td> 
					</tr>
				</c:if>
			</tbody>
          </table>
         <!-- 대여완료 끝 -->   
       
         <!-- 페이징 버튼 구역 -->
         <div class="paginationBox">
         <!--   <div class="pageBtn"> -->
				<div class="board-list-paging fr">
				 <c:set var="pageIndex" value="1"/>
					<ol class="pagination" id="pagination">
					<c:if test="${searchVO.prev}">
						<li class="prev_end">
							<a href="javascript:void(0);" onclick="fn_go_page(1); return false;" ></a>
						</li>
						<li class="prev">
							<a href="javascript:void(0);"  onclick="fn_go_page('${searchVO.startDate - 1}'); return false;" ></a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${searchVO.startDate}" end="${searchVO.endDate}">
						<li>
							<a href="javascript:void(0);" onclick="fn_go_page(${num}); return false;" class="num ${pageIndex eq num ? 'on':'' }" title="${num}">${num}</a>
						</li>
					</c:forEach>  
					<c:if test="${searchVO.next}">
						<li class="next">
							<a href="javascript:void(0);"  onclick="fn_go_page(${searchVO.endDate + 1}); return false;" ></a>
						</li>
						<li class="next_end">
							<a href="javascript:void(0);" onclick="fn_go_page(${searchVO.realEnd }); return false;"></a>
						</li>
					</c:if>     
					</ol>
			 <!--  </div> -->
         	</div>
         </div>
        	 </form>
		  </div>
		</div>
		
	  
	  <!-- 모달 창 끝 -->
    </div>
    
  </div> <!-- wrap으로 감싼 부분 끝 -->
  <c:import url="/WEB-INF/views/layout/footer.jsp" />
	</body>
</html>