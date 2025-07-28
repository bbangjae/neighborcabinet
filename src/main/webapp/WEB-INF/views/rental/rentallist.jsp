<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-02-11
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
  <title>등록공간목록</title>
  <STYLE>
    hr{
      width: 100%;
      height: 2px;
      background: #00DBAF;
      border: 0;
    }

  </STYLE>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<div class=" container">
  <div class ="heading mt-5">
    <h3> 내 등록 공간 </h3>
    <hr>
  </div>

  <table class="table  table-hover ">
    <colgroup>
      <col width="*"/>
      <col width="5px"/>
      <col width="5px"/>
    </colgroup>
    <thead class="table table-light" <%--style="background: #00DBAF; color: #FFFFFF;"--%>>
    <tr style="width: 100%;">
      <th colspan="3" style="font-weight: bold; "><h5>공간명</h5></th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
    <c:when test="${empty placelist}">
    <tr>
      <td colspan="2" style="text-align: center;">조회된 결과가 없습니다.</td>
    </tr>
    </c:when>
    <c:otherwise>
    <c:forEach var="list" items="${placelist}">
    <tr style="cursor: pointer">
      <td onclick="location.href='/place/placeDetailView/${list.pNo}'"><h5>${list.pPlaceTitle}</h5></td>
      <td><a onclick="location.href='/rental/rentalmodi/${list.pNo}'" class="btn btn-sm m-3" style="background: #00DBAF; color: #Ffffff;  border-radius: 0px;">수정</a></td>
      <td><a onclick="if (confirm('삭제 하시겠습니까?')) {location.href='/rental/rentaldelete/${list.pNo}';}" class="btn btn-sm m-3" style="background: #888888; color: #Ffffff;  border-radius: 0px;">삭제</a></td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
  </table>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
</html>
