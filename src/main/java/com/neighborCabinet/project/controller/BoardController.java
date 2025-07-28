package com.neighborCabinet.project.controller;

import com.neighborCabinet.project.CommonUtility;
import com.neighborCabinet.project.model.NboardVO;
import com.neighborCabinet.project.model.boardCommentVO;
import com.neighborCabinet.project.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    int boardCountInPage = 10; //한 페이지에 보여줄 글 개수

    @RequestMapping("/board/noticeboardlist")
    private String noticeboardlist(@RequestParam(required = false) String pageNum, Model model){

        int numberPageNum = CommonUtility.getPageNumber(pageNum); //전달받은 pageNum의 값의 유효성 확인 후 숫자로 변환
        int startBoardNum = (numberPageNum-1)*boardCountInPage; // 선택된 페이지에 보여줄 글 시작점
        System.out.println(startBoardNum);
        System.out.println(pageNum);
        List<NboardVO> nboardVOList = boardService.boardList(startBoardNum, boardCountInPage); // pagenum에 해당하는 Board 보여줄 리스트 구하기
        model.addAttribute("boardList",nboardVOList);

        int boardTotalCount = boardService.boardTotalCount(); // 페이징 처리 중 , 존재 가능한 페이지 번호를 구하기 위한, 글의 total count 구하기
        model.addAttribute("pageCount", Math.ceil(((double) boardTotalCount)/((double)boardCountInPage)));

        return "board/noticeboardlist";
    }
    @RequestMapping("board/inquiryboardlist")
    private String inquiryboardlist(@RequestParam(required = false) String pageNum, Model model){

        int numberPageNum = CommonUtility.getPageNumber(pageNum); //전달받은 pageNum의 값의 유효성 확인 후 숫자로 변환
        int startBoardNum = (numberPageNum-1)*boardCountInPage; // 선택된 페이지에 보여줄 글 시작점
        List<NboardVO> nboardVOList = boardService.boardList2(startBoardNum, boardCountInPage); // pagenum에 해당하는 Board 보여줄 리스트 구하기
        model.addAttribute("boardList",nboardVOList);

        int boardTotalCount = boardService.boardTotalCount2(); // 페이징 처리 중 , 존재 가능한 페이지 번호를 구하기 위한, 글의 total count 구하기
        model.addAttribute("pageCount", Math.ceil(((double) boardTotalCount)/((double)boardCountInPage)));

        return "board/inquiryboardlist";
    }

    @RequestMapping("/board/noticeregister")
    private String noticeregister(){

        return "board/noticeboardregister";
    }
    @RequestMapping("/board/inquiryregister")
    private String inquiryregister(){

        return "board/inquiryboardregister";
    }

    @RequestMapping("/board/Nregister")
    private String Nregister(NboardVO nboardVO, HttpSession httpSession){

        nboardVO.setBoWriter((String)httpSession.getAttribute("sid"));
        nboardVO.setBoNickname((String)httpSession.getAttribute("nickname"));
        boardService.boardRegister(nboardVO);

        return "redirect:/board/noticeboardlist";
    }
    @RequestMapping("/board/Iregister")
    private String Iregister(NboardVO nboardVO, HttpSession httpSession){

        nboardVO.setBoWriter((String)httpSession.getAttribute("sid"));
        nboardVO.setBoNickname((String)httpSession.getAttribute("nickname"));
        boardService.boardRegister(nboardVO);

        return "redirect:/board/inquiryboardlist";
    }

    @RequestMapping("board/{boNo}")
    private String noticedetail(@PathVariable int boNo, Model model){

        model.addAttribute("board",boardService.boardDetail(boNo)); //글 정보
        model.addAttribute("comment",boardService.list(boNo)); // 댓글 정보


        return "board/noticedetail";
    }

    @RequestMapping("/board/delete/{boNo}")
    private String deleteboard (@PathVariable int boNo,NboardVO nboardVO){
        if(nboardVO.getBoNo()>0){
            boardService.boardDelete(boNo);
        }
        return "redirect:/board/inquiryboardlist";
    }
    @RequestMapping("/comment/write")
    public String commentwrite(boardCommentVO vo,HttpSession httpSession){

        vo.setcWriter((String)httpSession.getAttribute("nickname"));
        boardService.write(vo);

        return "redirect:/board/"+vo.getBoNo();
    }

}

