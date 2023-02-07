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
        h3{
            font-weight: bold;
        }

    </style>
<%--
    <style> @import url('https://fonts.googleapis.com/css2?family=Bakbak+One&family=Jua&family=Oswald:wght@700&family=Rowdies:wght@300&display=swap');
    body * {
        font-family: "Jua", sans-serif;
    }
    </style>
--%>

</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div id="container">
    <!--top.jsp  -->
    <!--  로그인 폼  -->
    <section>
        <h3 class="h1 mb-3 fw-normal" align = "center">이웃집캐비닛</h3>
        <form id="loginForm" name="loginForm">
            <table>
                <tr><th>아이디</th><td><input type="text" id="id" name="id" /></td></tr>
                <tr><th>비밀번호 </th><td><input type="password" id="pwd" name="pwd"/></td></tr>
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
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>

<script>
    $(document).ready(function(){
        $('#loginForm').on('submit', function(){
            //폼이 submit 되지 않도록 기본 기능 중단
            event.preventDefault();

            // 서버에 전송하고 결과 받아서 처리
            $.ajax({
                type:"post",
                url:"/member/login",
                data: {"id":$('#id').val(),
                    "pwd":$('#pwd').val()},
                dataType:'text',
                success:function(result){
                    if(result == "success"){
                        location.href="/";
                    }else{
                        alert("아이디 또는 비밀번호가 일치하지 않습니다.");
                    }

                },
                error:function(){
                    alert("실패");
                }
            }); // ajax 종료
        });// submit 종료
    });

</script>
</body>
</html>
