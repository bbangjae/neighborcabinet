package com.neighborCabinet.project.controller;


import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.neighborCabinet.project.model.DealHistoryVO;
import com.neighborCabinet.project.model.PageVO;
import com.neighborCabinet.project.model.Pagination;
import com.neighborCabinet.project.model.RentHistoryVO;
import com.neighborCabinet.project.service.DealHistoryService;
import com.neighborCabinet.project.service.RentHistoryService;

@Controller
public class RentHistoryController {
	//의존성 주입 부분 변경하기
	@Autowired
	RentHistoryService service;
	
	@Autowired
	DealHistoryService dealService;
	
	
	//할일: 대여 상태 바뀌면 전체조회로 데이터 넘어가야 함
	
	//여기 searchVO 제거 고려
	@RequestMapping("/rentHistory")
	public String rent(@ModelAttribute("searchVO") RentHistoryVO searchVO, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		//거래 내역
		ArrayList<DealHistoryVO> dealAllHistory = dealService.listAllDeal();
		model.addAttribute("dealAllHistory", dealAllHistory);
		
		
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
	    if(null != inputFlashMap) {
	        model.addAttribute("msg",(String) inputFlashMap.get("msg"));
	    }
	    
		//대여 내역
		//ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory(searchVO);
		//model.addAttribute("rentAllHistory", rentAllHistory);
		
		//페이징[s]
	    Pagination pagination = new Pagination();
	    pagination.setCurrentPageNo(searchVO.getPageIndex());
	    pagination.setRecordCountPerPage(searchVO.getPageUnit());
	    pagination.setPageSize(searchVO.getPageSize());
	    
	    searchVO.setFirstIndex(pagination.getFirstRecordIndex());
	    searchVO.setRecordCountPerPage(pagination.getRecordCountPerPage());
	    
	    ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory(searchVO);
	    int totCnt = service.getListCnt(searchVO);
	    
	    pagination.setTotalRecordCount(totCnt);
	    
	    searchVO.setEndDate(pagination.getLastPageNoOnPageList());
	    searchVO.setStartDate(pagination.getFirstPageNoOnPageList());
	    searchVO.setPrev(pagination.getXprev());
	    searchVO.setNext(pagination.getXnext());
	    
	    model.addAttribute("rentAllHistory", rentAllHistory);
	    model.addAttribute("totCnt", totCnt);
	    model.addAttribute("totalPageCnt", (int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
	    model.addAttribute("pagination", pagination);
	    //페이징[e]
	    
		//searchVO.setQustr(); //미사용
		
		return "rentHistory/rentHistory";
	}
	
	@ResponseBody
	@RequestMapping("/rentHistorySearch") //주소 임시
	public ArrayList<RentHistoryVO> searchList(@ModelAttribute("searchVO") RentHistoryVO searchVO, Model model) {
		//대여내역 - 전체조회 검색
		ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory(searchVO);
		//int totCnt = service.getListCnt(searchVO);
		model.addAttribute("rentAllHistory", rentAllHistory);
		//model.addAttribute("totCnt", totCnt);
		
		return service.listAllHistory(searchVO);
	}
	
	@ResponseBody
	@RequestMapping("/rentHistory/list")
	public JSONObject select_snb03_ajax(@RequestBody String filterJSON, HttpServletResponse response, ModelMap model) throws Exception {
		JSONObject obj = new JSONObject();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		 
		try{            
		  ObjectMapper mapper = new ObjectMapper();
		  PageVO searchVO = (PageVO)mapper.readValue(filterJSON, new TypeReference<PageVO>(){ });
		  
			//searchVO.setSite_code(loginService.getSiteCode());
		 
		  /* 페이징 시작 */
		    Pagination paginationInfo = new Pagination();
		    paginationInfo.setCurrentPageNo(searchVO.getPageIndex());        //현재 페이지 번호
		    paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());    //한 페이지에 게시되는 게시물 건수
		    paginationInfo.setPageSize(searchVO.getPageSize());                //페이징 리스트의 사이즈
		 
		    searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		    searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		 
			/* Map<String, Object> map = gnb01Service.getAearMemberList(searchVO); */
		    Map<String, Object> map = service.listAllHistory(searchVO);
		    int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		    
		    paginationInfo.setTotalRecordCount(totCnt);
		    
		    searchVO.setEndDate(paginationInfo.getLastPageNoOnPageList());
		    searchVO.setStartDate(paginationInfo.getFirstPageNoOnPageList());
		    searchVO.setPrev(paginationInfo.getXprev());
		    searchVO.setNext(paginationInfo.getXnext());
		    searchVO.setRealEnd(paginationInfo.getRealEnd());
		    
		    /* 페이징 끝 */
		    
		    obj.put("resultList", map.get("resultList"));
		    obj.put("resultCnt", map.get("resultCnt"));
		    obj.put("totalPageCnt", (int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
		    obj.put("searchVO", searchVO);
		  
		}catch(Exception e){
		  System.out.println(e.toString());
		  obj.put("res", "error");
		  
		  }
		 
		out.print(obj);
		return null;
	}

	
	
}
