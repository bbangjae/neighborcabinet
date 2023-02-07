package com.neighborCabinet.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.MyReviewVO;
import com.neighborCabinet.project.model.OrderListVO_y;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.RentHistoryVO;
import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.ShippingVO_y;
import com.neighborCabinet.project.model.boxOrderVO_y;
import com.neighborCabinet.project.service.BoxOrderService_y;

@Controller
public class HeaderTest {
	
	@Autowired
	private BoxOrderService_y service;
	
	@RequestMapping("/header")
	public String head() {
		return "/layout/header";
	}
	
	@RequestMapping("/boxList")
	public String boxList(Model model) {
		
		ArrayList<BoxInfoVO_y> type_A = service.type_AList();
		ArrayList<BoxInfoVO_y> type_B = service.type_BList();
		model.addAttribute("type_A", type_A);
		model.addAttribute("type_B", type_B);
		
		return "/boxOrder/boxList";
	}
	
	@RequestMapping("/boxOrder")
	public String boxOrder(@RequestParam String[] Selected_boxName, 
							@RequestParam String[] Selected_boxType,
							@RequestParam int[] Selected_boxQty,
							@RequestParam int[] Selected_boxPrice,
							@RequestParam String total_priceVal, 
							HttpSession session, Model model) {
		
		
		// 선택 상품
		ArrayList<boxOrderVO_y> orderList = new ArrayList<>();
		
		String ordName;
		
		for(int i=0;i<Selected_boxName.length;i++) {
			boxOrderVO_y vo = new boxOrderVO_y();
			
			if(Selected_boxType[i].charAt(0) == 'A') {
				vo.setBoxImg("/image/A_type.png");
			} else {
				vo.setBoxImg("/image/B_type.png");
			}
			
			vo.setBoxPrice(Selected_boxPrice[i] * Selected_boxQty[i]);
			vo.setBoxName(Selected_boxName[i]);
			vo.setBoxQty(Selected_boxQty[i]);
			vo.setBoxType(Selected_boxType[i]);
			
			orderList.add(vo);
		}
		if(Selected_boxName.length>1) {
			ordName = Selected_boxName[0]+" 외 "+ (Selected_boxName.length-1) + " 건";
		}else {
			ordName = Selected_boxName[0];
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("ordName", ordName);
		
		// 기본 배송지 주소
		String userId = (String) session.getAttribute("sid");
		
		ShippingVO_y userVo = service.shippingInfo(userId);
		
		if(userVo.getUserHp().length()==11) {
			String HP1 = userVo.getUserHp().substring(0, 3);
			String HP2 = userVo.getUserHp().substring(3, 7);
			String HP3 = userVo.getUserHp().substring(7);
			
			String HP = HP1 + "-" + HP2 + "-" + HP3;
			model.addAttribute("HP", HP);
		}
		
		model.addAttribute("userVo", userVo);
		
		// 총 가격
		String numPrice = total_priceVal.replaceAll("원", "");
		numPrice = numPrice.replaceAll(",", "");
		int numPrice1 = Integer.parseInt(numPrice);
		int sum = Integer.parseInt(numPrice) + 3000;
		model.addAttribute("price", numPrice1);
		model.addAttribute("sum", sum);
		
		return "/boxOrder/boxOrder";
	}
	
	@RequestMapping("/boxOrder2")
	public String boxOrder2() {
		
		return "/boxOrder/boxOrder2";
	}
	
	@RequestMapping("/boxPayment")
	public String boxPayment(@RequestParam String[] boxType, 
						 	 @RequestParam int[] boxQty,
							 @RequestParam int[] selPrice,
							 OrderListVO_y vo, HttpSession session, Model model) {
		
		// 현재 아이디
		//String userId = (String) session.getAttribute("sid");
		String userId = "1234";
		
		vo.setUserId(userId);
		
		// 주문번호
		long timeNum = System.currentTimeMillis();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");
		String strTime = fmt.format(new Date(timeNum));
		
		String rNum = "";
		for(int i=1;i<=4; i++) {
			rNum += (int)(Math.random()*10);
		}

		String ordNo = strTime + "_" + rNum;
		
		vo.setOrdNo(ordNo);
		
		service.insert_OrdList(vo);
		
		//리스트 세부항목
		for(int i=0;i<boxType.length;i++) {
			OrderListVO_y vo1 = new OrderListVO_y();
			vo1.setBoxType(boxType[i]);
			vo1.setBoxQty(boxQty[i]);
			vo1.setSelPrice(selPrice[i]);
			vo1.setOrdNo(ordNo);
			vo1.setUserId(userId);
			service.insert_OrdDetail(vo1);
		}
		//주문번호와 주문일
		model.addAttribute("ordNo", ordNo);
		
		return "boxOrder/success";
	}
	
	
	
	// 예약 결제 페이지
	@RequestMapping("/rental/payment/{pNo}")
	public String paymentpage(@PathVariable String pNo, HttpSession session, Model model) {
		
		// 디테일 정보
		PlaceInfoVO place = service.placeInfo(pNo);
		model.addAttribute("place", place);
		
		// 예약자 정보
		String userId = (String) session.getAttribute("sid");
		
		MemberVO reserInfo = service.reserInfo(userId);
		
		if(reserInfo.getUserHp().length()==11) {
			String HP1 = reserInfo.getUserHp().substring(0, 3);
			String HP2 = reserInfo.getUserHp().substring(3, 7);
			String HP3 = reserInfo.getUserHp().substring(7);
			
			model.addAttribute("HP1", HP1);
			model.addAttribute("HP2", HP2);
			model.addAttribute("HP3", HP3);
		}
		model.addAttribute("userId", userId);
		model.addAttribute("res", reserInfo);
		
		//등록자 정보
		
		
		return "/boxOrder/requestPage";
	}
	
	@RequestMapping("/payment")
	public String placePayment(ReserveDetailVO_y reD,ReserveVO_y re,Model model, String senderPhone1,
								String senderPhone2, String senderPhone3){
		
		long timeNum = System.currentTimeMillis();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmss");
		String strTime = fmt.format(new Date(timeNum));
		
		String rNum = "";
		for(int i=1;i<=4; i++) {
			rNum += (int)(Math.random()*10);
		}

		String resNo = strTime + "_" + rNum;
		
		reD.setSenderPhone(senderPhone1 + senderPhone2 + senderPhone3);
		re.setResNo(resNo);
		reD.setResNo(resNo);
		
		service.insert_res(re);
		service.insert_resD(reD);
		
		return "redirect:/";
	}
	
	
	
	// 리뷰 페이지
	@RequestMapping("/mypage/review")
	public String review(HttpSession session, Model model){
		
		String userId = (String) session.getAttribute("sid");
		ArrayList <RentHistoryVO> RentCom = service.rentComplete(userId);
		
		model.addAttribute("RentCom", RentCom);
		
		// 나의 리뷰
		MemberVO myInfo = service.memberInfo(userId);
		model.addAttribute("myInfo", myInfo);
		
		ArrayList<MyReviewVO> myReview = service.myReview(userId, 0);
		model.addAttribute("myReview", myReview);
		
		// 페이지 개수
		int page = pageNum(service.myreviewCnt(userId), 4);
		
		ArrayList<Integer> pageNum = new ArrayList<>();
		for(int i = 1;i<=page;i++) {
			pageNum.add(i);
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nowNum", 1);
		
		return "/mypage/review";
	}
	
	@RequestMapping("/mypage/review/{pageNum}")
	public String reviewNum(@PathVariable int pageNum, HttpSession session, Model model){
		
		String userId = (String) session.getAttribute("sid");
		
		int start = 4*(pageNum-1);

		// 나의 리뷰
		MemberVO myInfo = service.memberInfo(userId);
		model.addAttribute("myInfo", myInfo);
		
		ArrayList<MyReviewVO> myReview = service.myReview(userId, start);
		model.addAttribute("myReview", myReview);
		
		int page = pageNum(service.myreviewCnt(userId), 4);
		
		ArrayList<Integer> pageNum1 = new ArrayList<>();
		for(int i = 1;i<=page;i++) {
			pageNum1.add(i);
		}
		int nowNum = pageNum;
		
		model.addAttribute("pageNum", pageNum1);
		model.addAttribute("nowNum", nowNum);
		return "/mypage/myReview";
	}
	

	@ResponseBody
	@RequestMapping("/mypage/reviewReg/regist")
	public String reviewreg(HttpSession session,
						@RequestParam HashMap<String, Object> param){
		
		String userId = (String) session.getAttribute("sid");
		param.put("userId", userId);
		service.reviewReg(param);

		return "success";
	}
	
	// 나의 리뷰 삭제
	@RequestMapping("/mypage/myReview/delete/{pNo}")
	public String reviewdelete(HttpSession session,
							@PathVariable String pNo){
		
		String userId = (String) session.getAttribute("sid");
		service.reviewdelete(userId, pNo);
		
		return "redirect:/mypage/review";
	}
	//리뷰작성페이지
	@RequestMapping("/mypage/reviewReg/{pNo}")
	public String reviewreg(@PathVariable String pNo, HttpSession session, Model model, @RequestParam String check){
		
			return "/mypage/reviewreg";
	}
	
	public int pageNum(int n, int a) {
		
		int result = 0;
		if(n%a == 0) {
			result = n/a;
		}else {
			result = n/a + 1;
		}
		
		return result;
	}
	
		
}
