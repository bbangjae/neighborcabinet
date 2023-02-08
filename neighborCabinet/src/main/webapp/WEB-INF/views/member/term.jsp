<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-01-11
  Time: 오후 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<head>
    <title>약관</title>
    <style>
        #chatbot {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 350px;
            height: 450px;
            background-color: white;
            border-radius: 50px;
            box-shadow: 0px 0px 10px grey;
            display: none;
        }

        #chatbot-header {
            height: 50px;
            background-color: #0d47a1;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            border-top-left-radius: 50px;
            border-top-right-radius: 50px;
        }

        #chatbot-body {
            height: 400px;
            overflow-y: scroll;
            padding: 10px;
        }

        #chatbot-form {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
        }

        #chatbot-input {
            width: 70%;
            padding: 10px;
            border-radius: 20px;
            border: none;
        }

        button[type="submit"] {
            width: 20%;
            padding: 10px;
            background-color: #0d47a1;
            color: white;
            border-radius: 20px;
            border: none;
        }

    </style>
</head>
<body>
<div id="chatbot">
    <div id="chatbot-header">
        <p>Chatbot</p>
    </div>
    <div id="chatbot-body">
        <div id="chatbot-messages">
            <!-- Dynamic messages will be inserted here -->
        </div>
        <form id="chatbot-form">
            <input type="text" id="chatbot-input" placeholder="Type your message here...">
            <button type="submit">Send</button>
        </form>
    </div>
</div>
</body>
<script>
    const chatbot = document.getElementById("chatbot");
    const chatbotHeader = document.getElementById("chatbot-header");
    const chatbotMessages = document.getElementById("chatbot-messages");
    const chatbotForm = document.getElementById("chatbot-form");
    const chatbotInput = document.getElementById("chatbot-input");

    chatbotHeader.addEventListener("click", () => {
        if (chatbot.style.display === "none") {
            chatbot.style.display = "block";
        } else {
            chatbot.style.display = "none";
        }
    });

    chatbotForm.addEventListener("submit", (event) => {
        event.preventDefault();

        const message = document.createElement("p");
        message.innerText = chatbotInput.value;
        chatbotMessages.appendChild(message);
        chatbotInput.value = "";
    });


</script>
</html>
