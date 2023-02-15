<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-02-14
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<html>
<head>
    <title>공지사항 글</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<div class="container">
    <div class ="heading mt-5">
        <h3 style="font-weight: bold;"> ${board.boTitle}</h3>
        ${board.boTime}
        <hr>
    </div>
<div class="Content m-5 p-3" style="font-size: 20px; border: 1px solid black;">
<%--
    <textarea rows="50" style="width: 100%;" readonly>${board.boContent}</textarea>
--%>
    <pre style="white-space: pre-wrap">${board.boContent}</pre>
</div>
    <div class="row">
    <div class = "list m-5 "  style=" width: 1000px">
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-90deg-left" viewBox="0 0 16 16" style="cursor: pointer;" onclick="location.href='/board/noticeboardlist'">
        <path fill-rule="evenodd" d="M1.146 4.854a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 4H12.5A2.5 2.5 0 0 1 15 6.5v8a.5.5 0 0 1-1 0v-8A1.5 1.5 0 0 0 12.5 5H2.707l3.147 3.146a.5.5 0 1 1-.708.708l-4-4z"/>
    </svg>
    <a onclick="location.href='javascript:history.back(-1)'"  style="cursor: pointer;">목록으로</a>
    </div>
    <c:if test="${sid == 'admin'}">
    <div class = "X m-5"  style=" width: 100px; float: right;">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" style="cursor: pointer;">
            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
        </svg>
        <a id = "delete" style="cursor: pointer;">글 삭제</a>
    </div>
    </c:if>
    </div>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
<script>
    $(document).ready(function() {
        $('.X').click(function() {
            var answer = confirm("삭제 하시겠습니까?");
            if(answer){
                const boNo = '${board.boNo}';
                const intBoNo = parseInt(boNo);
                location.href="/board/delete/"+intBoNo;
            }

        });
    });

</script>
</html>
