<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상자 주문</title>
	<link rel="stylesheet" type="text/css" href='<c:url value="/css/boxList2.css"/>'>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="<c:url value='/js/searchZip.js' />"></script>
	<c:import url="/WEB-INF/views/layout/header.jsp"/>
	<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
	<script src="<c:url value="/js/boxList2.js"/>"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<div class="wrap">
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
	<div class="bodyWrap">
		<span class="pageInfo">마이페이지 → 박스구매</span>
		<h1 class="pageName">박스구매</h1>
		<div class="modifyinfoBox" style="margin:0 auto;" >
			<section id="section_selectBox"  >
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
													   data-boxName="${box.boxName}" data-boxPrice="${box.boxPrice}" data-boxStock="${box.boxStock}">
												<div class="box_left">${box.boxName} (${box.boxSize}) <span><i class="fa-solid fa-check"></i></span></div>
												<div class="box_right"><%-- <div class="stock">재고 : ${box.boxStock}</div> --%><div>${box.boxPrice}원</div></div>
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
													   data-boxName="${box.boxName}" data-boxPrice="${box.boxPrice}" data-boxStock="${box.boxStock}">
												<div class="box_left">${box.boxName} (${box.boxSize}) <span><i class="fa-solid fa-check"></i></span></div>
												<div class="box_right"><%-- <div class="stock">재고 : ${box.boxStock}</div> --%><div>${box.boxPrice}원</div></div>
											</label>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div id="box_selectedList">
					<div id="box_title" style="margin-bottom:50px;">이웃집 캐비닛 박스</div>
					<div style="padding : 0 30px; margin-left : 10px;">
						<button type="button" class="box_typeInfo" id="A_typeInfo">플라스틱</button>
						<button type="button" class="box_typeInfo" id="B_typeInfo">프리미엄</button>
						<span class="tooltip"><i class="fa-solid fa-circle-info"></i><span class="tooltip-content">원하시는 박스를 누르세요</span></span>
					</div>
					<hr style="border:solid 1px rgba(0, 219, 175, .3);">
					<div id="boxDis"><p style="font-size : 20px;"><span style="color:#00DBAF; font-weight: bold;">플라스틱</span> -<span style="color:grey; font-weight: lighter"> 기본 재사용 박스</span><br> <span style="color:#00DBAF; font-weight: bold;">프리미엄 </span>- <span style="color:grey; font-weight: lighter">높은 내구성, 자물쇠 기능 </span></p></div>
					<form action="<c:url value='/boxOrder'/>" method="post" id="orderPage">
						<ul id = "selectedUl" >

						</ul>
						<div style="width : 100%; text-align : center;">
							<div id="total_priceBox">
								<div>총 금액</div>
								<div><input id="total_priceVal" name="total_priceVal" type="text" value="0원" readonly></div>
							</div>
							<input id="purchaseBtn" type="submit" value="구매하기">
						</div>
					</form>
				</div>
			</section>
			<section id="sec_boxInfo">
				<table id="boxInfo">
					<tr>
						<td class="table_left">상품번호</td>
						<td class="table_right">AB0110</td>
						<td class="table_left">상품상태</td>
						<td class="table_right">신상품</td>
					</tr>
					<tr>
						<td class="table_left">제조사</td>
						<td class="table_right">이웃집캐비닛</td>
						<td class="table_left">브랜드</td>
						<td class="table_right">자체제작</td>
					</tr>
					<tr>
						<td class="table_left">모델명</td>
						<td class="table_right">물품보관용 박스</td>
						<td class="table_left">원산지</td>
						<td class="table_right">국산(경기도 고양시)</td>
					</tr>
				</table>
				<table id="boxInfo2">
					<tr>
						<td class="table_left">상품번호</td>
						<td class="table_right">AB0110</td>
					</tr>
					<tr>
						<td class="table_left">상품상태</td>
						<td class="table_right">신상품</td>
					</tr>
					<tr>
						<td class="table_left">제조사</td>
						<td class="table_right">이웃집캐비닛</td>
					</tr>
					<tr>
						<td class="table_left">브랜드</td>
						<td class="table_right">자체제작</td>
					</tr>
					<tr>
						<td class="table_left">모델명</td>
						<td class="table_right">물품보관용 박스</td>
					</tr>
					<tr>
						<td class="table_left">원산지</td>
						<td class="table_right">국산(경기도 고양시)</td>
					</tr>
				</table>
			</section>
			<div id="space"></div>
		</div>
	</div>
</div>
</body>
</html>