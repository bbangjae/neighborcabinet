package com.neighborCabinet.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.OrderListVO_y;
import com.neighborCabinet.project.model.Reserve_VO;
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
		
		String HP1 = userVo.getUserHp().substring(0, 3);
		String HP2 = userVo.getUserHp().substring(3, 7);
		String HP3 = userVo.getUserHp().substring(7);
		
		model.addAttribute("HP1", HP1);
		model.addAttribute("HP2", HP2);
		model.addAttribute("HP3", HP3);
		
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
	@RequestMapping("/rental/payment/{ordDNo}")
	public String paymentpage(@PathVariable String ordDNo, HttpSession session, Model model) {
		
		// 예약자 정보
		String userId = (String) session.getAttribute("sid");
		
		MemberVO reserInfo = service.reserInfo(userId);
		
		String HP2 = reserInfo.getUserHp().substring(3, 7);
		String HP3 = reserInfo.getUserHp().substring(7);
		
		model.addAttribute("HP2", HP2);
		model.addAttribute("HP3", HP3);
		
		model.addAttribute("res", reserInfo);
		
		//등록자 정보
		
		return "/boxOrder/requestPage";
	}
	
	@RequestMapping("/payment")
	public String payment2(){
		
		
		
		return "boxOrder/success2";
	}
}
