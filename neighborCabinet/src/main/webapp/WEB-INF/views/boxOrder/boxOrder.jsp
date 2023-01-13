<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상자 주문</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/boxOrder.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/boxOrder.js"/>"></script>
	</head>
	<body>
		<div id="wrap">
			<c:import url="/WEB-INF/views/layout/header.jsp" />
			<div id="box_TypeImg"></div>
			<div id="box_OrderBox">
				<div id="box_selectBox">
					<hr>A타입<hr>
					<div id="box_type">
						<c:forEach var="box" items="${type_A}">
							<label for="${box.boxType}"><input type="checkbox" id="${box.boxType}" class="select_checkBox" data-boxType="${box.boxType}" style="display:none">
								<table class="boxInfo">
									<tr>
										<td>${box.boxName}</td>
									</tr>
									<tr>
										<td>가격 : ${box.boxPrice}</td>
									</tr>
									<tr>
										<td>재고 : ${box.boxStock}</td>
									</tr>
									<tr>
										<td>사이즈 : ${box.boxSize}</td>
									</tr>
								</table>
							</label>
						</c:forEach>
					</div>
					<hr>B타입<hr>
					<div id="box_type">
						<c:forEach var="box" items="${type_B}">
							<label for="${box.boxType}"><input type="checkBox" id="${box.boxType}" class="select_checkBox" data-boxType="${box.boxType}" style="display:none">
								<table class="boxInfo">
									<tr>
										<td>${box.boxName}</td>
									</tr>
									<tr>
										<td>가격 : ${box.boxPrice}</td>
									</tr>
									<tr>
										<td>재고 : ${box.boxStock}</td>
									</tr>
									<tr>
										<td>사이즈 : ${box.boxSize}</td>
									</tr>
								</table>
							</label>
						</c:forEach>
					</div>
				</div>
				<div id="orderQty_space"></div>
				<div id="box_QtyBox"></div>
			</div>
		</div>
	</body>
</html>