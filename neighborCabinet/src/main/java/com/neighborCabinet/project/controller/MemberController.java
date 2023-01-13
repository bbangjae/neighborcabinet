package com.neighborCabinet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
    @RequestMapping("/member/join")
    public String joinForm() {
        return "member/join";
    }

    @RequestMapping("/member/join2")
    public String join(){
        return "member/join2";
    }

    @RequestMapping("/member/join3")
    public String join2() {
        return "member/join3";
    }

    @RequestMapping("member/join4")
    public String join3() {
        return "member/join4";
    }

    @RequestMapping("member/term")
    public String term() {
        return "member/term";
    }
    @RequestMapping("member/login")
    public String login(){
        return "member/login";
    }

}
