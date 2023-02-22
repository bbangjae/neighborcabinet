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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<html>
<head>
    <title>챗봇</title>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

    <%--
        <script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
    --%>
<%--
    <script src="<c:url value='/js/chatbot.js'/>"></script>
--%>

<style>

        #chat-circle {
            position: fixed;
            bottom: 50px;
            right: 50px;
            background: #00DBAF;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            color: white;
            padding: 28px;
            cursor: pointer;
            box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
        }

        #chat-overlay {
            background: rgba(255,255,255,0.1);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 50%;
            display: none;
        }


        .chat-box {
            display:none;
            background: #efefef;
            position:fixed;
            right:30px;
            bottom:50px;
            width:350px;
            max-width: 85vw;
            max-height:100vh;
            border-radius:5px;
            /*   box-shadow: 0px 5px 35px 9px #464a92; */
            box-shadow: 0px 5px 35px 9px #ccc;
        }
        .chat-box-toggle {
            float:right;
            margin-right:15px;
            cursor:pointer;
        }
        .chat-box-header {
            background: #00DBAF;
            height:50px;
            border-top-left-radius:5px;
            border-top-right-radius:5px;
            color:white;
            text-align:center;
            font-size:20px;
            padding-top:15px;
        }
        .chat-box-body {
            position: relative;
            height:370px;
            height:auto;
            border:1px solid #ccc;
            overflow: hidden;
        }
        .chat-box-body:after {
            content: "";
            opacity: 0.1;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            height:100%;
            position: absolute;
            z-index: -1;
        }
        #message {
            background: #f4f7f9;
            width:100%;
            position:relative;
            height:47px;
            padding: 10px 50px 10px 15px;
            border:none;
            resize:none;
            outline:none;
            border:1px solid #ccc;
            color:#888;
            border-top:none;
            border-bottom-right-radius:5px;
            border-bottom-left-radius:5px;
            overflow:hidden;
        }
        .chat-input > form {
            margin-bottom: 0;
        }
        #message::-webkit-input-placeholder {
            color: #ccc;
        }
        .chat-submit {
            position:absolute;
            bottom:3px;
            right:10px;
            background: transparent;
            box-shadow:none;
            border:none;
            border-radius:50%;
            color:#00DBAF;
            width:35px;
            height:35px;
        }
        .chat-logs {
            padding:15px;
            height:370px;
            overflow-y:scroll;
        }

        .chat-logs::-webkit-scrollbar-track
        {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #F5F5F5;
        }

        .chat-logs::-webkit-scrollbar
        {
            width: 5px;
            background-color: #F5F5F5;
        }

        .chat-logs::-webkit-scrollbar-thumb
        {
            background-color: #00DBAF;
        }

        @media only screen and (max-width: 500px) {
            .chat-logs {
                height:40vh;
            }
        }


        /*
        .msgBox span {
            background:white;
            padding:10px 15px 10px 15px;
            color:#666;
            max-width:100px;
            margin-left:10px;
            margin-bottom:20px;
            border-radius:30px;
            word-break:break-all; display:block
        }
        */

        .msgBox.send span {
            background:#00DBAF;
            padding:10px 15px 10px 15px;
            color:#ffffff;
            max-width:75%;
            float:right;
            margin-left:10px;
            position:relative;
            margin-bottom:20px;
            border-radius:20px;
            height: 44px;
        }
        .msgBox.receive #in{
            max-width: 300px;
        }
        .msgBox.receive  span {
            background:white;
            padding:10px 15px 10px 15px;
            color:#666;
            max-width:75%;
            float:left;
            margin-left:10px;
            margin-right: 100px;
            position:relative;
            margin-bottom:10px;
            border-radius:30px;
        }


</style>
</head>
<body>
    <div id="chat-circle" class="btn btn-raised">
        <div id="chat-overlay"></div>
        <i class="material-icons">chat</i>
    </div>
    <div class="chat-box">
        <div class="chat-box-header">
            <span class="material-icons">android</span>
            <span class="chat-box-toggle"><i class="material-icons">close</i></span>
        </div>
        <div class="chat-box-body">
            <div class="chat-box-overlay">
            </div>
            <div class="chat-logs ">
                <div id="chatBox"></div>
            </div><!--chat-log -->
        </div>
        <div class="chat-input">
            <form id = "chatbotForm">
                <input type="text" id="message" placeholder="궁금한 점을 질문하세요..."/>
                <button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">send</i></button>
            </form>
        </div>
    </div>
<%--
<h3> 챗봇</h3>
<div id = "chatBox"></div>

<form id = "chatbotForm">
    <input type="text" id="message" name="message" size="30" placeholder="질문입력">
    <input type="submit" value="전송">
</form>
--%>

<script>
        $("#chat-circle").click(function() {
            $("#chat-circle").toggle('scale');
            $(".chat-box").toggle('scale');
        })
        $(".chat-box-toggle").click(function() {
            $("#chat-circle").toggle('scale');
            $(".chat-box").toggle('scale');
        })

</script>
    <script>
        $(document).ready(function(){

        // 웰컴 메시지ㅣ 받기 위해 message 입력 받기 전에
        // 빈 값으로 서버에 전송하고 결과 받음
        callAjax(); // 빈 값의 message가 서버로 전송

        $('#chatbotForm').on('submit', function(){
        //폼이 submit 되지 않도록 기본 기능 중단
        event.preventDefault();

        //message가 빈값인 경우 확인 메시지 출력
        if($('#message').val() == ""){
        alert("질문 입력하세요");
        $('#message').focus();
        return false;
        }

        // 챗봇 창에 보낸 메시지 추가
        $('#chatBox').append('<div class="msgBox send"><span id="in"><pre style="white-space: pre-wrap;">' +
            $('#message').val() + '</pre></span></div><br>');

    callAjax();

    $('#message').val(''); // 입력란 비우기
    });// submit 종료

    function callAjax() {
    // 서버에 전송하고 결과 받아서 처리
    $.ajax({
    type:"post",
    url:"/chatbot3",
    data: {"message": $('#message').val()},
        dataType:'json',
    success:function(result){
        //JSON 형식 그대로 반환 받음
        var bubbles = result.bubbles;
        for(var b in bubbles){
            if(bubbles[b].type == 'text'){ // 기본 답변인 경우
                /* chatBox에 받은 메시지 추가 */
                $('#chatBox').append('<div class="msgBox receive"><span id="in"><pre style="white-space: pre-wrap;">' +
                    bubbles[b].data.description +'</pre></span></div>');

            }	else if(bubbles[b].type == 'template'){//이미지 답변 또는 멀티링크 답변 시작
                if(bubbles[b].data.cover.type=="image"){//이미지 이면
                    $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
                        "' alt='이미지 없음' width='200' height='150'>");
                    if(bubbles[b].data.contentTable == null){
                        $("#chatBox").append
                        ("<a href='"+bubbles[b].data.cover.data.action.data.url+"' target='_blank'>" +
                            bubbles[b].data.cover.data.action.data.url+ "</a><br><br>");
                    } else {
                        $("#chatBox").append("<div class='msgBox receive'>< id='in'>" + bubbles[b].data.cover.data.description+ "</span></div>");
                    }
                } 	else if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
                    $("#chatBox").append("<div class='msgBox receive'><span id='in'><pre style='white-space: pre-wrap;'>" + bubbles[b].data.cover.data.description+ "</pre></span></div>");
                }

                // 이미지 / 멀티링크 답변 공통 (contentTable 포함)
                for(var ct in bubbles[b].data.contentTable){
                    var ct_data = bubbles[b].data.contentTable[ct];
                    for(var ct_d in ct_data){
                        $("#chatBox").append
                        ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'> <div class='msgBox receive'><span id='in'>" +
                            ct_data[ct_d].data['title'] + "</span></div></a>");
                    }
                }// contentTable for문 끝
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
            }//template 끝
        }//bubbles for문 종료

    // 스크롤해서 올리기 : 스크롤 높이 값로 scrollTop 설정
        $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);

    },
    error:function(){
    alert("실패");
    }
    }); // ajax 종료
    }
    });
    </script>
</body>

</html>
