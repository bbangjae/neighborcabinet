<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/review.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/review.js"/>"></script>
		<style>
			#reviewLink{
				background:#D7FFF1;
			}
			
			#boxOrder{
				margin-bottom:60%;
			}
			
			#reviewList{
				color:gray;
			}
		</style>
		<c:import url="/WEB-INF/views/member/chat.jsp"/>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<div id="wrap">
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
								<div class="listObject" id="modifyInfoList" style="color:black;">개인정보</div>
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
								<div class="listObject" id="boxOrderList" >박스구매</div>
							</a>
						</li>

					</ul>
				</nav>
			</div>
			<div style="display:flex; flex-direction:column; width:100%;">
				<!-- <div id="top_space"></div> -->
				<div class="pageInfo">마이페이지 → 리뷰관리</div>
				<h1 class="pageName">리뷰관리</h1>
				<div id="sectionBox">
				
					<div style="width : 700px;"><div class="title_left">리뷰작성</div><hr></div>
					
					<ul id="section_1">
						<c:if test="${reviewCnt == 0}">
							<div style="margin : auto;">작성 가능한 리뷰가 없습니다.</div>
						</c:if>
						<c:forEach var="reviewO" items="${reviewO}">
							<li><table>
								<tr>
									<td rowspan="3" class="reviewImg">
										<img onerror="this.src='<c:url value='/images/${reviewO.imgsrc}'/>'" src="" class="reviewImg">
									</td>
									<td colspan="2" class="text_left">
										<a href="<c:url value='/place/placeDetailView/${reviewO.pNo }'/>">${reviewO.pWriteTitle }<br>
										${reviewO.pAddress1 }(${reviewO.pAddress2 })</a>
									</td>
								</tr>
								<tr>
									<td class="text_left">${reviewO.reviewEnd }까지</td>
									<td>
										<button type="button" class="reviewWrite" id="${reviewO.reserveNo }">리뷰 작성하기</button>
									</td>
								</tr>
							</table></li>
						</c:forEach>
					</ul>
					<div style="width : 700px;"><div class="title_left">작성한 리뷰</div><hr></div>
					<div id="myReviewBox">
						<ul id="section_2">
							<c:if test="${myreviewCnt == 0}">
								<div style="margin : auto;">작성한 리뷰가 없습니다.</div>
							</c:if>
							<c:forEach var="review" items="${myReview}">
								<li><div class="review_title">
									<div><a class="detail_Go" href="<c:url value='/place/placeDetailView/${review.pNo }'/>">${review.pWriteTitle}</a></div>
									<div><a class="myReview_delete" id="${review.reviewNo }">삭제하기</a></div>
								</div>
									<div class="review_address">
										<a class="detail_Go" href="<c:url value='/place/placeDetailView/${review.pNo }'/>">
											${review.pAddress1}(${review.pAddress2})
										</a>
									</div>
									<div id="writer" style="text-align : left; margin-left : 20px; font-size : 15px;"><fmt:formatDate value="${review.reviewDate}"  pattern="yyyy-MM-dd" /></div>
									<input type="hidden" name="pNo" id="pNo" value="1">
									<input type="hidden" class="myReview" value="${review.reviewGrade }">
									<fieldset>
										<input type="radio" name="${review.reviewNo }" value="5" id="${review.reviewNo }_05" onclick="return(false)"
											<c:if test="${review.reviewGrade eq '5'}">checked</c:if>><label for="${review.reviewNo }_05">★</label>
										<input type="radio" name="${review.reviewNo }" value="4" id="${review.reviewNo }_04" onclick="return(false)"
											<c:if test="${review.reviewGrade eq '4'}">checked</c:if>><label for="${review.reviewNo }_04">★</label>
										<input type="radio" name="${review.reviewNo }" value="3" id="${review.reviewNo }_03" onclick="return(false)"
											<c:if test="${review.reviewGrade eq '3'}">checked</c:if>><label for="${review.reviewNo }_03">★</label>
										<input type="radio" name="${review.reviewNo }" value="2" id="${review.reviewNo }_02" onclick="return(false)"
											<c:if test="${review.reviewGrade eq '2'}">checked</c:if>><label for="${review.reviewNo }_02">★</label>
										<input type="radio" name="${review.reviewNo }" value="1" id="${review.reviewNo }_01" onclick="return(false)"
											<c:if test="${review.reviewGrade eq '1'}">checked</c:if>><label for="${review.reviewNo }_01">★</label>
									</fieldset>
									<div>
										<textarea name="reviewContent" id="reviewContent" readonly>${review.reviewContent }</textarea>
								</div></li>
							</c:forEach>
						</ul>
						<div id="pageNumBox">
							<c:forEach var="pageNum" items="${pageNum}" varStatus="status">
								<c:if test="${nowNum eq status.count}"><span>${pageNum}</span></c:if>
								<c:if test="${nowNum != status.count}"><a id="${pageNum}" class="paging" href="javascript:;">${pageNum}</a></c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</html>