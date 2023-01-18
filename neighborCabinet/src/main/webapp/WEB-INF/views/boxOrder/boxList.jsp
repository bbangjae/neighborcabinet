<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상자 주문</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/boxList.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value="/js/boxList.js"/>"></script>
	</head>
	<body>
		<div id="wrap">
			<c:import url="/WEB-INF/views/layout/header.jsp" />
			<div id="topspace"></div>
			<div id="pageTitle">~~~~~~~~~~~~~~</div>
			<hr>
			<section id="section_selectBox">
				<div id="box_selectBox">
					<div class="box_TypeBox" id="boxA_TypeBox">
						<div style="height:40px;"></div>
						<img class="box_TypeImg" src="<c:url value="/image/A_type.png"/>">
						<div class="box_sizeBox">
							<div class="box_sizeListBox" id="boxA_sizeListBox">
								<span>사이즈를 선택해주세요</span>
								<span><button type="button">▼</button></span>
							</div>
							<div class="box_type" id="boxA_type">
								<ul>
									<c:forEach var="box" items="${type_A}">
										<li class="selectedBox">
											<label for="${box.boxType}">
												<input type="checkbox" id="${box.boxType}" class="select_checkBox"
												value="${box.boxType}" style="display:none"
												data-boxName="${box.boxName}" data-boxPrice="${box.boxPrice}">
												<div class="box_left">${box.boxName} (${box.boxSize}) <span><i class="fa-solid fa-check"></i></span></div>
												<div class="box_right">${box.boxPrice}원</div>
											</label>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<div class="box_TypeBox" id="boxB_TypeBox">
						<div style="height:40px;"></div>
						<img class="box_TypeImg" src="<c:url value="/image/B_type.png"/>">
						<div class="box_sizeBox">
							<div class="box_sizeListBox" id="boxB_sizeListBox">
								<span>사이즈를 선택해주세요</span>
								<span><button type="button">▼</button></span>
							</div>
							<div class="box_type" id="boxB_type">
								<ul>
									<c:forEach var="box" items="${type_B}">
										<li class="selectedBox">
											<label for="${box.boxType}">
												<input type="checkbox" id="${box.boxType}" class="select_checkBox"
												value="${box.boxType}" style="display:none"
												data-boxName="${box.boxName}" data-boxPrice="${box.boxPrice}">
												<div class="box_left">${box.boxName} (${box.boxSize}) <span><i class="fa-solid fa-check"></i></span></div>
												<div class="box_right">${box.boxPrice}원</div>
											</label>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="box_selectedList">
					<div id="box_title">이웃집 캐비닛 박스</div>
					<div style="padding : 0 30px; margin-left : 10px;">
						<button type="button" class="box_typeInfo" id="A_typeInfo">플라스틱</button>
						<button type="button" class="box_typeInfo" id="B_typeInfo">프리미엄</button>
					</div>
					<hr>
					<div id="boxDis"><p style="font-size : 20px;">상품 설명, 상품 설명 상품 설명, 상품 설명 상품 설명, 상품 설명 상품 설명, 상품 설명 상품 설명, 상품 설명</p></div>
					<form>
						<ul id = "selectedUl">
							<%-- <li>
								<div>
									<p>박스명</p>
									<span class="selected_delete"><i class="fa-solid fa-xmark fa-2x"></i></span>
								</div>
								<div class="selectedBox_qty">
									<div class="font_size_zero">
										<button class="box_QtyBtn" value="1"><i class="fa-solid fa-minus"></i></button>
										<input class="input_number" type="number" value="1" min="1" max="20">
										<button class="box_QtyBtn" value="2"><i class="fa-solid fa-plus"></i></button>
									</div>
									<div>가격</div>
								</div>
							</li>
							<li>
								<div>
									<p>박스명</p>
									<span class="selected_delete"><i class="fa-solid fa-xmark fa-2x"></i></span>
								</div>
								<div class="selectedBox_qty">
									<div class="font_size_zero">
										<button class="box_QtyBtn" value="1"><i class="fa-solid fa-minus" ></i></button>
										<input class="input_number" type="number" value="1" min="1" max="20">
										<button class="box_QtyBtn" value="2"><i class="fa-solid fa-plus"></i></button>
									</div>
									<div><fmt:formatNumber value="27700" pattern="#,###" /></div>
								</div>
							</li> --%>
						</ul>
						<div style="width : 100%; text-align : center;">
							<div id="total_priceBox">
								<div>총 상자 금액</div>
								<div><input id="total_priceVal" type="text" value="0원" readonly></div>
							</div>
							<input id="purchaseBtn" type="submit" value="구매하기">
						</div>
					</form>
				</div>
			</section>
		</div>
	</body>
</html>