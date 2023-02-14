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
        body {
            line-height: 1.5;
            margin: 0;
            min-block-size: 100vh;
            padding: 5vmin;

        }

        h2 {
            font-size: 1.75rem;
        }

        input {
            background-image: none;
            border: none;
            font: inherit;
            margin: 0;
            padding: 0;
            transition: all 0.3s;
        }

        svg {
            height: auto;
            max-width: 100%;
            vertical-align: middle;
        }

        /* ---------- ALIGN ---------- */
        .align {
            display: grid;
            place-items: center;
        }

        /* ---------- BUTTON ---------- */

        .button {
            background-color: #00DBAF;
            color: #fff;
            padding: 0.25em 1.5em;
        }

        .button:focus,
        .button:hover {
            background-color: #00DBAF;
        }

        /* ---------- ICONS ---------- */
        .icons {
            display: none;
        }

        .icon {
            fill: currentcolor;
            display: inline-block;
            height: 1em;
            width: 1em;
        }

        /* ---------- LOGIN ---------- */
        .login {
            width: 400px;
            height: 500px;
            margin: 0 auto;
            margin-top: 100px;
            margin-bottom: 100px;

        }

        .login__header {
            background-color: #00DBAF;
            border-top-left-radius: 1.25em;
            border-top-right-radius: 1.25em;
            color: #fff;
            padding: 1.25em 1.625em;
        }

        .login__header :first-child {
            margin-top: 0;
        }

        .login__header :last-child {
            margin-bottom: 0;
        }

        .login h2 .icon {
            margin-right: 14px;
        }

        .login__form {
            background-color: #e5e3e3;
            border-bottom-left-radius: 1.25em;
            border-bottom-right-radius: 1.25em;
            display: grid;
            gap: 0.875em;
            padding: 1.25em 1.625em;
        }

        .login input {
            border-radius: 0.1875em;
        }

        .login input[type="text"],
        .login input[type="password"] {
            background-color: #eee;
            color: #777;
            padding: 0.25em 0.625em;
            width: 100%;
        }

        .login input[type="submit"] {
            display: block;
            margin: 0 auto;
        }    </style>

</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div class="container">
<div class="login">
    <header class="login__header">
        <h2><svg class="icon">
            <use xlink:href="#icon-lock" />
        </svg>이웃집 캐비닛</h2>
    </header>
    <form class="login__form" id= "loginForm">

        <div>
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" placeholder="아이디">
        </div>

        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" placeholder="비밀번호">
        </div>

        <div>
            <input class="button" type="submit" value="로그인">
        </div>

    </form>
</div>
<svg xmlns="http://www.w3.org/2000/svg" class="icons">
    <symbol id="icon-lock" viewBox="0 0 448 512">
        <path d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" />
    </symbol>
</svg>

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
