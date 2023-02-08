package com.neighborCabinet.project.controller;

import com.fasterxml.jackson.core.JsonParser;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewVO;
import com.neighborCabinet.project.service.MapAddressChangeService;
import com.neighborCabinet.project.service.PlaceInfoService;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

@Controller
public class PlaceController {
    @Autowired
    private PlaceInfoService service;

    @Autowired
    private MapAddressChangeService macService;
    @RequestMapping("/place/placeDetailView/{pNo}")
    public String rentalDetail(@PathVariable String pNo,
                               Model model) throws ParseException {

        PlaceInfoVO pi=service.detailViewPlace(pNo);
        String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
        pi.setpHp(pi.getpHp().replaceAll(regEx, "$1-$2-$3"));

        ArrayList<QaVO> qaList=service.showViewQA(pNo);
        ArrayList<ReviewVO> reviewList=service.showViewReview(pNo);
        int r_cnt=0;
        double r_sum=0;
        double r_mean=0;
        for(int i=0; i<reviewList.size();i++){
            double rate=Integer.parseInt(reviewList.get(i).getReviewGrade());
            int max=5;
            String percent= (100*rate/max)+"%";
            reviewList.get(i).setReviewGrade(percent);
            r_cnt+=1;
            r_sum+=rate;
        }
        r_mean=r_sum/r_cnt;
        model.addAttribute("pi",pi);
        model.addAttribute("qaList",qaList);
        model.addAttribute("reviewList",reviewList);
        model.addAttribute("r_cnt",r_cnt);
        model.addAttribute("r_mean",r_mean);


        HashMap<String,Object> boxtype=service.showBoxtype(pNo);

        JSONParser parser = new JSONParser();
        JSONObject boxId = (JSONObject) parser.parse(boxtype.get("boxId").toString());
        JSONObject boxPrice = (JSONObject) parser.parse(boxtype.get("boxPrice").toString());
        LinkedHashMap<String, ArrayList> idmap = new LinkedHashMap<>();
        ArrayList<Integer> pl =new ArrayList<>();
        ArrayList<Integer> ql = new ArrayList<>();
        //데이터 정제
        for(int i=0;i<boxId.size();i++){

            String str = boxId.get((i + 1) + "호").toString();
            str = str.replaceAll("\"", "");
            str = str.replaceAll("\\[", "");
            str = str.replaceAll("\\]", "");



            // 리스트에 넣기
            ArrayList<String> al = new ArrayList<>();

            StringTokenizer st = new StringTokenizer(str);
            
            while (st.hasMoreTokens()) {
                al.add(st.nextToken(","));
            }
            //map 에 해당 호에 맞는 리스트 넣기
            idmap.put((i+1)+"호", al);
            pl.add(Integer.parseInt(boxPrice.get((i+1)+"호").toString()));
            ql.add(al.size()-1);
        }
        HashMap<String,Object> addressMap= macService.addToxy(pi.getpAddress1());
        model.addAttribute("im",idmap);
        model.addAttribute("pl",pl);
        model.addAttribute("ql",ql);
        model.addAttribute("aX",Double.parseDouble(addressMap.get("x").toString()));
        model.addAttribute("aY",Double.parseDouble(addressMap.get("y").toString()));
        model.addAttribute("aM",addressMap);





        return "place_b/placeDetailView";
    }
    @ResponseBody
    @RequestMapping("/place/placeDetailView/QA")
    public int insertQA(@RequestParam("text")String text,
                        @RequestParam("pNo")String pNo,
                        QaVO vo,
                        HttpSession session) {
        int result=0;

        String userId=(String)session.getAttribute("sid");

        if(!(text.equals(""))) {
            vo.setUserId(userId);
            vo.setQaContent(text);
            vo.setpNo(pNo);
            service.insertQa(vo);
            result = 1;
        }
        else
            result=-1;

        return result;
    }
    @ResponseBody
    @RequestMapping("/place/placeDetailView/Reserve")
    public int reserve(
                       @RequestParam("pNo")int pNo,
                       @RequestParam("date_text")String d_t,
                       @RequestParam("total_price")String t_p,
                       @RequestParam("date_click")String d_c,
                       @RequestParam("selectedFirstTime")int selectedFirstTime,
                       @RequestParam("selectedFinalTime")int selectedFinalTime,
                       @RequestParam("hours")String hours,
                       @RequestParam("bt")String bt,
                       ReserveVo vo,
                       HttpSession session){
        int result=0;
        int t_p2=Integer.parseInt(t_p.replaceAll("[^0-9]",""));
        System.out.print(t_p2);
        String userId=(String)session.getAttribute("sid");
        if(!(d_t.equals(""))){
            vo.setpNo(pNo);
            vo.setReserveDate(d_t);
            vo.setReservePrice(t_p2);
            vo.setUserId(userId);
            service.reserve(vo);
            result=1;
        }
        System.out.println(bt);
        // 예약 날짜 수정
        StringBuilder sb =new StringBuilder(hours);
        for(int i=selectedFirstTime;i<=selectedFinalTime;i++){
            sb.setCharAt(i,'1');
        }
        hours=sb.toString();


        HashMap<String,Object> map = new HashMap<>();
        String str="$.\""+d_c+"\"";
        map.put("reserveDate",str);
        map.put("pNo",pNo);

        map.put("bt",bt);
        map.put("hours",hours);
        service.updateDate(map);

        return result;
    }
    //시간 예약 여부 확인
    @ResponseBody
    @RequestMapping("/place/placeDetailView/showDate")
    public HashMap<String,Object> showDate(@RequestParam("pNo")int pNo,
                                           @RequestParam("date_click")String d_c,
                                           @RequestParam("boxtype")String bt) {


        HashMap<String,Object> map = new HashMap<String,Object>();
        String str="$.\""+d_c+"\"";

        map.put("reserveDate",str);
        map.put("pNo",pNo);
        map.put("bt",bt);
        HashMap<String,Object> map2= service.showDate(map);
        map2.put("hours",map2.get("hours").toString().replaceAll("\"",""));

        return map2;
    }
    //시간 저장으로 바뀜
//    @ResponseBody
//    @RequestMapping("/place/placeDetailView/reserveDate"){
//        public String reserveDate(){
//
//            return result;
//        }
//    }
    @RequestMapping("/testb")
    public String test(){
        return "testB";
    }
    @RequestMapping("/testb2")
    public String test2(){
        return "testB2";
    }

}
