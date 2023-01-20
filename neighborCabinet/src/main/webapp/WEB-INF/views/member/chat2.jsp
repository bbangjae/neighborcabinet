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
  <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>  <style>
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
    #chat-input {
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
    #chat-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
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

    .chat-msg.user > .msg-avatar img {
      width:45px;
      height:45px;
      border-radius:50%;
      float:left;
      width:15%;
    }
    .chat-msg.self > .msg-avatar img {
      width:45px;
      height:45px;
      border-radius:50%;
      float:right;
      width:15%;
    }
    .cm-msg-text {
      background:white;
      padding:10px 15px 10px 15px;
      color:#666;
      max-width:75%;
      float:left;
      margin-left:10px;
      position:relative;
      margin-bottom:20px;
      border-radius:30px;
    }
    .chat-msg {
      clear:both;
    }
    .chat-msg.self > .cm-msg-text {
      float:right;
      margin-right:10px;
      background: #00DBAF;
      color:white;
    }
    .cm-msg-button>ul>li {
      list-style:none;
      float:left;
      width:50%;
    }
    .cm-msg-button {
      clear: both;
      margin-bottom: 70px;
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

    </div><!--chat-log -->
  </div>
  <div class="chat-input">
    <form>
      <input type="text" id="chat-input" placeholder="궁금한 점을 질문하세요..."/>
      <button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">send</i></button>
    </form>
  </div>
</div>

<script>
  $(function() {
    var INDEX = 0;
    $("#chat-submit").click(function(e) {
      e.preventDefault();
      var msg = $("#chat-input").val();
      if(msg.trim() == ''){
        return false;
      }
      generate_message(msg, 'self');
      var buttons = [
        {
          name: 'Existing User',
          value: 'existing'
        },
        {
          name: 'New User',
          value: 'new'
        }
      ];
      setTimeout(function() {
        generate_message(msg, 'user');
      }, 1000)

    })

    function generate_message(msg, type) {
      INDEX++;
      var str="";
      str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
      str += "          <span class=\"msg-avatar\">";
      str += "            <img src=\"https://www.pngarts.com/files/10/Default-Profile-Picture-PNG-Download-Image.png\">";
      str += "          <\/span>";
      str += "          <div class=\"cm-msg-text\">";
      str += msg;
      str += "          <\/div>";
      str += "        <\/div>";
      $(".chat-logs").append(str);
      $("#cm-msg-"+INDEX).hide().fadeIn(300);
      if(type == 'self'){ //
        $("#chat-input").val('');
      }
      $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
    }

    $("#chat-circle").click(function() {
      $("#chat-circle").toggle('scale');
      $(".chat-box").toggle('scale');
    })

    $(".chat-box-toggle").click(function() {
      $("#chat-circle").toggle('scale');
      $(".chat-box").toggle('scale');
    })

  })
</script>
</body>

</html>
