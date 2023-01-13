<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-01-12
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<html>
<head>
    <title>로그인</title>
    <script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
    <style>
        html, body {
            height: 70%;
            background: #ffffff;
        }

        #container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

    </style>
    <style> @import url('https://fonts.googleapis.com/css2?family=Bakbak+One&family=Jua&family=Oswald:wght@700&family=Rowdies:wght@300&display=swap');
    body * {
        font-family: "Jua", sans-serif;
    }
    </style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/head.jsp"/>

<div id="container">
    <!--top.jsp  -->
    <!--  로그인 폼  -->
    <section>
        <h1 class="h3 mb-3 fw-normal" align = "center">이웃집캐비닛</h1>
        <form id="loginForm" name="loginForm">
            <table>
                <tr><th> ID</th><td><input type="text" id="id" name="id" /></td></tr>
                <tr><th>비밀번호</th><td><input type="password" id="pwd" name="pwd"/></td></tr>
                <tr>
                    <td colspan="2" align="center" id="button" >
                        <br>
                        <input type="submit" value="로그인" class="w-100 btn btn-lg text-white" style="background: #00DBAF" >
                    </td>
                </tr>
            </table>
        </form>
    </section>
    <!--bottom  -->
    <c:import url="/WEB-INF/views/layout/bottom.jsp"/>
</div>

</body>
</html>
