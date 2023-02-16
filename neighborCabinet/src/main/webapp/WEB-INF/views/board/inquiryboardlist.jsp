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
    <title>문의사항</title>
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
        <h3> 문의사항 </h3>
        <hr>
    </div>

    <table class="table table-hover">
        <colgroup>
            <col width="20%"/>
            <col width="*"/>
            <col width="20%"/>
            <col width="10%"/>
        </colgroup>
        <thead class="table table-light" <%--style="background: #00DBAF; color: #FFFFFF;"--%>>
        <tr>
            <th> </th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성 날짜</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
        <c:when test="${empty boardList}">
        <tr>
            <td colspan="3" style="text-align: center;">조회된 결과가 없습니다.</td>
        </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="list2" items="${boardList}">
        <tr onclick="location.href='/board/${list2.boNo}'"
            style="cursor: pointer">
            <td>[문의사항]</td>
            <td>${list2.boTitle}</td>
            <td>${list2.boWriter}</td>
            <td>${list2.boTime}</td>
        </tr>
        </c:forEach>
        </c:otherwise>
        </c:choose>
    </table>
    <div style="position: relative">
        <ul style="text-align: center;">
            <c:forEach var="i" begin="1" end="${pageCount}" step="1">
                <a href="/board/inquiryboardlist/?pageNum=${i}" style="padding:5px;" id="pageNum${i}"><c:out value="${i}" /></a>
            </c:forEach>
        </ul>
    </div>

    <a onclick="location.href='/board/inquiryregister'" class="btn m-3" style="background: #00DBAF; color: #Ffffff; float: right;" >문의 작성</a>

</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
<script>
        // 페이지 로딩 후, 현재 페이지 번호 스타일 변경 - 밑줄 + Bold
        window.onload = function(){
        var pageNum = window.location.search.substr(9); // 현제 페이지 번호
        if(pageNum == '')
        pageNum = 1; // 특별히 지정된 페이지 번호가 없으면 그냥 페이지 1이라고 간주

        document.getElementById('pageNum'+pageNum).style.textDecoration = 'underline'
        document.getElementById('pageNum'+pageNum).style.fontWeight = 'bold'
    }

</script>
<script>


</script>
</body>
</html>
