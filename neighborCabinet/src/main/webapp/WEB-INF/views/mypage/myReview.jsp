<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/review.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/review.js"/>"></script>
	</head>
	<body>
		<ul id="section_2">
			<c:forEach var="review" items="${myReview}">
				<li><div class="review_title">
					<div><a class="detail_Go" href="<c:url value='/place/placeDetailView/${review.pNo }'/>">${review.pWriteTitle}</a></div>
					<div><a class="myReview_delete" id="${review.pNo }">삭제하기</a></div>
				</div>
					<div class="review_address"><a class="detail_Go" href="<c:url value='/place/placeDetailView/${review.pNo }'/>">${review.pAddress1}(${review.pAddress2})</a></div>
					<div id="writer">${review.reviewDate}</div>
					<input type="hidden" name="pNo" id="pNo" value="1">
					<input type="hidden" class="myReview" value="${review.reviewGrade }">
					<fieldset>
						<input type="radio" name="${review.pNo }" value="5" id="${review.pNo }_05" onclick="return(false)"
							<c:if test="${review.reviewGrade eq '5'}">checked</c:if>><label for="${review.pNo }_05">★</label>
						<input type="radio" name="${review.pNo }" value="4" id="${review.pNo }_04" onclick="return(false)"
							<c:if test="${review.reviewGrade eq '4'}">checked</c:if>><label for="${review.pNo }_04">★</label>
						<input type="radio" name="${review.pNo }" value="3" id="${review.pNo }_03" onclick="return(false)"
							<c:if test="${review.reviewGrade eq '3'}">checked</c:if>><label for="${review.pNo }_03">★</label>
						<input type="radio" name="${review.pNo }" value="2" id="${review.pNo }_02" onclick="return(false)"
							<c:if test="${review.reviewGrade eq '2'}">checked</c:if>><label for="${review.pNo }_02">★</label>
						<input type="radio" name="${review.pNo }" value="1" id="${review.pNo }_01" onclick="return(false)"
							<c:if test="${review.reviewGrade eq '1'}">checked</c:if>><label for="${review.pNo }_01">★</label>
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
	</body>
</html>