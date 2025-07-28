package com.neighborCabinet.project.controller;

import org.springframework.stereotype.Controller;

import com.neighborCabinet.project.model.Pagination;

@Controller
public class PageController {
//	//페이징 RequestMapping 어디로 할지
//	Pagination pagination = new Pagination();
	
//	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
//	public String list(@ModelAttribute("searchVO") boardVO searchVO, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
//	    
//	    Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
//	    if(null != inputFlashMap) {
//	        
//	        model.addAttribute("msg",(String) inputFlashMap.get("msg"));
//	        
//	    }
//	    
//	    //페이징[s]
//	    Pagination pagination = new Pagination();
//	    pagination.setCurrentPageNo(searchVO.getPageIndex());
//	    pagination.setRecordCountPerPage(searchVO.getPageUnit());
//	    pagination.setPageSize(searchVO.getPageSize());
//	    
//	    searchVO.setFirstIndex(pagination.getFirstRecordIndex());
//	    searchVO.setRecordCountPerPage(pagination.getRecordCountPerPage());
//	    
//	    List<boardVO> boardList = boardService.getList(searchVO);
//	    int totCnt = boardService.getListCnt(searchVO);
//	    
//	    pagination.setTotalRecordCount(totCnt);
//	    
//	    searchVO.setEndDate(pagination.getLastPageNoOnPageList());
//	    searchVO.setStartDate(pagination.getFirstPageNoOnPageList());
//	    searchVO.setPrev(pagination.getXprev());
//	    searchVO.setNext(pagination.getXnext());
//	    
//	    model.addAttribute("boardList",boardList);
//	    model.addAttribute("totCnt",totCnt);
//	    model.addAttribute("totalPageCnt",(int)Math.ceil(totCnt / (double)searchVO.getPageUnit()));
//	    model.addAttribute("pagination",pagination);
//	    //페이징[e]
//	    
//	    searchVO.setQustr();
//	    
//	    return "/board/list";
//	}
	
	
}
