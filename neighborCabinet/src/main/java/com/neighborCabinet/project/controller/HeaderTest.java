package com.neighborCabinet.project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.MyReviewVO;
import com.neighborCabinet.project.model.ObjectVO;
import com.neighborCabinet.project.model.OrderListVO_y;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewOListVO_y;
import com.neighborCabinet.project.model.SentimentVO;
import com.neighborCabinet.project.model.ShippingVO_y;
import com.neighborCabinet.project.model.boxOrderVO_y;
import com.neighborCabinet.project.service.AIService_y;
import com.neighborCabinet.project.service.BoxOrderService_y;

@Controller
public class HeaderTest {
	
	@Autowired
	private BoxOrderService_y service;
	
	@Autowired
	private AIService_y AIService;
	
	@Value("${file.upload.path}")
    String uploadPath;
	
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
	@RequestMapping("/rental/payment/{reserveNo}")
	public String paymentpage(@PathVariable int reserveNo, HttpSession session, Model model) throws Exception {
		
		String userId = (String) session.getAttribute("sid");
		
		//예약 정보 가져오기
		int reserveCheck = service.reserveCnt(reserveNo, userId);
		if(reserveCheck ==0) {
			return "redirect:/";
		}
		ReserveVO_y reserveInfo = service.reserveInfo(reserveNo);
		model.addAttribute("reserveInfo", reserveInfo);
		String imgSrc = service.imgSrc(reserveInfo.getpNo());
		model.addAttribute("imgSrc", imgSrc);
		
		String reserve_day = reserveInfo.getReserveDate().substring(0, 4) +"."+ reserveInfo.getReserveDate().substring(6, 8)
				+"." + reserveInfo.getReserveDate().substring(9, 11);
		DateFormat fmt = new SimpleDateFormat("yyyy.MM.dd");
		Date date = fmt.parse(reserve_day);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
		String arr[] = {"","일","월","화","수","목","금","토"};
		
		// 날짜
		model.addAttribute("reserve_day", reserve_day);
		model.addAttribute("dayofweek", arr[dayofweek]);
		// 시간
		String all_time = reserveInfo.getReserveDate().substring(13);
		String[] start_time = all_time.split(":", 2);
		String[] back_time = all_time.split("~");
		String[] end_time = back_time[1].split(":");
		int reserve_time = Integer.parseInt(end_time[0]) - Integer.parseInt(start_time[0]);
		
		model.addAttribute("start_time", start_time[0]);
		model.addAttribute("end_time", end_time[0]);
		model.addAttribute("reserve_time", reserve_time);
		
		// 디테일 정보
		PlaceInfoVO place = service.placeInfo(reserveInfo.getpNo());
		model.addAttribute("place", place);
		
		// 예약자 정보
		MemberVO senderInfo = service.senderInfo(userId);
		
		if(senderInfo.getUserHp().length()==11) {
			String HP1 = senderInfo.getUserHp().substring(0, 3);
			String HP2 = senderInfo.getUserHp().substring(3, 7);
			String HP3 = senderInfo.getUserHp().substring(7);
			
			model.addAttribute("HP1", HP1);
			model.addAttribute("HP2", HP2);
			model.addAttribute("HP3", HP3);
		}
		model.addAttribute("userId", userId);
		model.addAttribute("senderInfo", senderInfo);
		
		//등록자 정보
		place.getUserId();
		MemberVO host = service.memberInfo(place.getUserId());
		if(host.getUserHp().length()==11) {
			String HP1 = host.getUserHp().substring(0, 3);
			String HP2 = host.getUserHp().substring(3, 7);
			String HP3 = host.getUserHp().substring(7);
			
			model.addAttribute("H_HP1", HP1);
			model.addAttribute("H_HP2", HP2);
			model.addAttribute("H_HP3", HP3);
		}
		
		model.addAttribute("host", host);
		return "/boxOrder/requestPage";
	}
	
	@RequestMapping("/payment/{reserveNo}")
	public String placePayment(@PathVariable int reserveNo, ReserveDetailVO_y reD,ReserveVO_y re,Model model, String senderPhone1,
								String senderPhone2, String senderPhone3){
		
		
		reD.setSenderPhone(senderPhone1 + senderPhone2 + senderPhone3);
		re.setReserveNo(reserveNo);
		
		service.insert_res(re);
		service.insert_resD(reD);
		
		return "redirect:/";
	}
	
	
	
	// 리뷰 페이지
	@RequestMapping("/mypage/review")
	public String review(HttpSession session, Model model) throws Exception{
		
		String userId = (String) session.getAttribute("sid");
		
		// 작성 가능한 리뷰 가져오기
		ArrayList <ReviewOListVO_y> reviewO = service.reviewOList(userId);
		
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		int nowDate = Integer.parseInt(dtFormat.format(cal.getTime()));
		for(int i = 0;i<reviewO.size();i++) {
			String imgSrc = service.imgSrc(reviewO.get(i).getpNo());
			reviewO.get(i).setImgsrc(imgSrc);
		}
		for(int i = 0;i<reviewO.size();i++) {
			
			String date = reviewO.get(i).getReviewEnd();
			Date dt = dtFormat.parse(date);
			cal.setTime(dt);
			cal.add(Calendar.MONTH, 1);
			int endDate = Integer.parseInt(dtFormat.format(cal.getTime()));
			if(endDate<=nowDate) {
				reviewO.remove(i);
				i--;
			}else {
				String end = String.valueOf(endDate);
				reviewO.get(i).setReviewEnd(end.substring(0, 4) + "-" + end.substring(4, 6) + "-" + end.substring(6, 8));
			}
		}
		model.addAttribute("reviewCnt", reviewO.size());
		model.addAttribute("reviewO", reviewO);
		
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
		model.addAttribute("myreviewCnt", service.myreviewCnt(userId));
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
	@RequestMapping("/mypage/myReview/delete/{reviewNo}")
	public String reviewdelete(HttpSession session,
							@PathVariable int reviewNo){
		
		String userId = (String) session.getAttribute("sid");
		service.reviewdelete(userId, reviewNo);
		
		return "redirect:/mypage/review";
	}
	//리뷰작성페이지
	@RequestMapping("/mypage/reviewReg/{reserveNo}")
	public String reviewreg(@PathVariable int reserveNo, HttpSession session, Model model){
		
		String userId = (String) session.getAttribute("sid");
		 int check = service.reviewCheck(userId, reserveNo);
		
		if(check==0) {
			return "redirect:/mypage/review";
		}
		else {
			int pNo = service.reviewpNo(reserveNo);
			MemberVO userInfo = service.memberInfo(userId);
			PlaceInfoVO place = service.placeInfo(pNo);
			model.addAttribute("reserveNo", reserveNo);
			model.addAttribute("userInfo", userInfo);
			model.addAttribute("place", place);
			
			return "/mypage/reviewreg";
		}
	}
	
	@ResponseBody
	@RequestMapping("/stt")
	public String stt(@RequestParam("uploadFile") MultipartFile file,
			  Model model) throws IOException {
		
		File folder = new File(System.getProperty("user.dir")+ uploadPath);
        if (!folder.exists()) {
            folder.mkdir();
        }
		
		// 1. 파일 저장 경로 설정 : C:/springWorkspace/upload/
		// 마지막에 / 있어야 함
		//String uploadPath = "C:/springWorkspace/upload/";
		
		// 2. 원본 파일 이름 저장
		//String originalFileName = file.getOriginalFilename();
		//String filePathName = uploadPath + originalFileName; 
		
		// 3. 파일 (객체) 생성
		File sendFile = new File(System.getProperty("user.dir")+ uploadPath + "stt");
		Path filePath = Paths.get(System.getProperty("user.dir")+ uploadPath + "stt");
		// 4. 서버로 전송
		file.transferTo(sendFile);
		
		String result = AIService.stt(System.getProperty("user.dir")+ uploadPath + "stt");
		
		Files.delete(filePath);
		
		return result;
	}
	@ResponseBody
	@RequestMapping("/sentiment")
	public SentimentVO sentiment(@RequestParam String content) throws IOException {
		
		SentimentVO senti = AIService.sentiment(content);
		
		
		return senti;
		
	}
	
	@ResponseBody
	@RequestMapping("/objectDetect")
	public ArrayList<ObjectVO> objectDetection(@RequestParam("uploadFile") MultipartFile file) throws IOException {
		
		File folder = new File(System.getProperty("user.dir")+ uploadPath);
        if (!folder.exists()) {
            folder.mkdir();
        }
//		String uploadPath = "C:/springWorkspace/upload/";
//		
//		String originalFileName = file.getOriginalFilename();
//		String filePathName = uploadPath + originalFileName; 
//		
//		File sendFile = new File(filePathName);
//		Path filePath = Paths.get(filePathName);
//		file.transferTo(sendFile);
		
		File sendFile = new File(System.getProperty("user.dir")+ uploadPath + "objectDetect");
		Path filePath = Paths.get(System.getProperty("user.dir")+ uploadPath + "objectDetect");
		file.transferTo(sendFile);
		
		ArrayList<ObjectVO> objList = AIService.objectDetect(System.getProperty("user.dir")+ uploadPath + "objectDetect");
		
		for(int i = 0; i < objList.size(); i++) {
			objList.get(i).setNumber(i);
		}
		
		Files.delete(filePath);
		
		return objList;
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
