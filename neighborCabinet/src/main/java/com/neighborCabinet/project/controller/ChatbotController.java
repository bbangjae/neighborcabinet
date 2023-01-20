package com.neighborCabinet.project.controller;

import com.neighborCabinet.project.service.ChatbotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatbotController {
    //챗봇
    private ChatbotService chatbotService;
    @Autowired
    public ChatbotController(ChatbotService chatbotService){
        this.chatbotService = chatbotService;
    }
    // 임의의 메시지 전달하고 응답 메시지 콘솔에 출력

 /*   @RequestMapping("/chatbot")
    public void chatbot(){
        //ChatbotService 의 main() 메소드가 static 이므로 클래스명으로 호출
        String result = chatbotService.main("넌누구니");
        System.out.println(result);
    }*/
    @RequestMapping("member/chat")
    public String chat(){
        return "member/chat";
    }

    @RequestMapping("member/chat2")
    public String chat2(){
        return "member/chat2";
    }

}
