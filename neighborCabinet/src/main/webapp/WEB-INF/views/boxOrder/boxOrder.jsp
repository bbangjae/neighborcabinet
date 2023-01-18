<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문</title>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/boxOrder.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value='/js/boxOrder.js' />"></script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/header.jsp" />
		<div id="wrap">
			<div class="spaceDiv"></div>
			<table id="ordered_boxTitle">
				<tr>
					<td class="top_row">박스명</td>
					<td class="top_row">수량</td>
					<td class="top_row">금액</td>
				</tr>
				<tr>
					<td class="bottom_row">
						<div>
							<div class="img_border"><img class="boxA_TypeImg" src="<c:url value="/image/A_type.png"/>"></div>
							<div>이웃집 플라스틱 박스 1호</div>
						</div>
					</td>
					<td class="bottom_row">7</td>
					<td class="bottom_row">1321</td>
				</tr>
				<tr>
					<td class="bottom_row">
						<div>
							<div class="img_border"><img class="boxA_TypeImg" src="<c:url value="/image/A_type.png"/>"></div>
							<div>이웃집 플라스틱 박스 1호</div>
						</div>
					</td>
					<td class="bottom_row">7</td>
					<td class="bottom_row">1321</td>
				</tr>
			</table>
			<div class="spaceDiv"></div>
			<div class="left_align">배송지 정보 <button id="SI_change"> 배송지 변경</button></div>
			<table>
				<tr>
					<td class="left_col">
						수령인
					</td>
					<td class="right_col">
						유주현
					</td>
				</tr>
				<tr>
					<td class="left_col">
						주소
					</td>
					<td colspan="2" class="right_col">
						55573<br>
	            		전라북도 익산시 모현동 2가 대림빌리지 (101동 101호) 
		           	</td>
				</tr>
				<tr>
					<td class="left_col">
						핸드폰
					</td>
					<td class="right_col">
						010 - 1111 - 1111
					</td>
				</tr>
				<tr>
					<td class="left_col">
						요청사항
					<td class="right_col">
						<select id="shipping_option">
							<option value="">요청사항을 선택하세요</option>
							<option value="문 앞">문 앞</option>
       		  		 		<option value="직접 받고 부재 시 문 앞">직접 받고 부재 시 문 앞</option>
       		  		 		<option value="경비실">경비실</option>
       		  		 		<option value="기타사항">기타사항</option>
						</select>
						<input type="text" id="shipping_optionInput">
					</td>
				</tr>
			</table>
			<div class="spaceDiv"></div>
			<div class="left_align">결제 금액</div>
			<table>
				<tr>
					<td class="left_col">주문금액</td>
					<td class="right_col"><fmt:formatNumber value="27700" pattern="#,###" />원</td>
				</tr>
				<tr>
					<td class="left_col">배송비</td>
					<td class="right_col"><fmt:formatNumber value="3000" pattern="#,###" />원</td>
				</tr>
				<tr>
					<td class="left_col">총결제금액</td>
					<td class="right_col"><fmt:formatNumber value="30700" pattern="#,###" />원</td>
				</tr>
			</table>
			<div style="height : 300px;"></div>
		</div>
	</body>
</html>