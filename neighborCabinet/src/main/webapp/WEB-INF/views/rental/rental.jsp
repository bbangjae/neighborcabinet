<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대여 페이지</title>
		<link rel ="stylesheet" type="text/css" href="<c:url value='/css/rental.css'/>">
		<!-- 반응형을 위해 아래의 가로폭 조정 코드 필요 -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
	</head>
	<body>
	<div id="wrap">
  	  <div class="box-wrapper">
      <!-- 추후 대여중인 박스가 있으면 해당 내용 제공, 없으면 대여중인 박스가 없습니다 보이기 -->
      <div class="box-title">내 거래 현황</div>
      <div class="box-alert">
        <img src="<c:url value='/image/exclamation.jpg'/>"> 대여 종료 시 해당 내역은 자동 삭제됩니다.
      </div>
      <div class="boxType" id="rent">
        <div class="infoContainer">
          <div class="boxInfo">
            <div id="topContainer">
              <div id="date">2023/01/15 <span id="time">17:30</span>까지</div>
              <div id="more"><a id="moreBtn">상세보기</a></div>
            </div>
            <div id="rentContainer">
              <div id="rentImg"></div>
              <div id="rentText">임시임시임시</div>
            </div>
            <div id="bottomContainer"></div>
          </div>
          <div class="boxInfo">


          </div>
          <div class="boxInfo">


          </div>
        </div>
      </div>
    </div>

    <div class="box-wrapper">
      <div class="box-title">
        <div>내 대여 내역</div>
        <div class="detail" id="setting">
          <a href="#">
            <img src="<c:url value='/image/setting.jpg'/>">
          </a>
        </div>
      </div>
      <div class="btn-wrapper">
        <button class="dealBtn" id="before">대여 전</button>
        <div class="goImg">
          <img src="<c:url value='/image/go.jpg'/>"><img src="<c:url value='/image/go.jpg'/>"><img src="<c:url value='/image/go.jpg'/>">
        </div>
        <button class="dealBtn" id="after">진행 중</button>
        <div class="goImg">
          <img src="<c:url value='/image/go.jpg'/>"><img src="<c:url value='/image/go.jpg'/>"><img src="<c:url value='/image/go.jpg'/>">
        </div>
        <button class="dealBtn" id="all">전체 조회</button>
      </div>
      <div class="boxType" id="deal">
        <div class="infoContainer" id="dealContainer">
          내용 임시
        </div>
      </div>
    </div>
    <div class="box-wrapper">
      <!-- 이미 생성된 코드가 있으면 해당 내용 제공, 없으면 QR코드 생성 버튼 보이기 -->
      <div class="box-title">
        QR 코드 생성
        <a id="re"><img src="<c:url value='/image/re2.jpg'/>"></a>
      </div>
      <div class="boxType" id="qr">
        <div class="infoContainer" id="qrContainer"></div>

      </div>
      <div class="qr">
        <a id="qrBtn" href="#">개인 인증 코드 만들기</a>
      </div>
    </div>

  </div>
	</body>
</html>