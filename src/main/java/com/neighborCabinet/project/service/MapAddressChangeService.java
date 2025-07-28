package com.neighborCabinet.project.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

@Service
public class MapAddressChangeService {
    // 네이버 지도 좌표 수정 요청
    public static HashMap<String,Object> addToxy(String str){
        // 주소 입력 -> 위도, 경도 좌표 추출.
        BufferedReader io = new BufferedReader(new InputStreamReader(System.in));
        String clientId = System.getenv("NAVER_MAP_CLIENT_ID");
        String clientSecret = System.getenv("NAVER_MAP_CLIENT_SECRET");

        try {

            String address = str;
            String addr = URLEncoder.encode(address, "UTF-8");

            // Geocoding 개요에 나와있는 API URL 입력.
            String apiURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + addr;	// JSON

            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");

            // Geocoding 개요에 나와있는 요청 헤더 입력.
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

            // 요청 결과 확인. 정상 호출인 경우 200
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;

            StringBuffer response = new StringBuffer();

            while((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }

            br.close();

            JSONTokener tokener = new JSONTokener(response.toString());
            JSONObject object = new JSONObject(tokener);
            JSONArray arr = object.getJSONArray("addresses");
            JSONObject temp = (JSONObject) arr.get(0);
            HashMap<String,Object> jsonMap = new ObjectMapper().readValue(temp.toString(), HashMap.class);
//            for (int i = 0; i < arr.length(); i++) {
//
//
//
//               System.out.println("address : " + temp.get("roadAddress"));
//               System.out.println("jibunAddress : " + temp.get("jibunAddress"));
//               System.out.println("위도 : " + temp.get("y"));
//               System.out.println("경도 : " + temp.get("x"));
//            }
            return jsonMap;
            // JSON.simple 사용한 경우 아래와 같이 진행.
			/*JSONParser jpr = new JSONParser();
			JSONObject jarr = (JSONObject) jpr.parse(response.toString());
			JSONArray arr2 = (JSONArray) jarr.get("addresses");

			for (int i = 0; i < arr2.length(); i++) {
				JSONObject temp = (JSONObject) arr.get(i);
				System.out.println("address : " + temp.get("roadAddress"));
				System.out.println("jibunAddress : " + temp.get("jibunAddress"));
				System.out.println("위도 : " + temp.get("y"));
				System.out.println("경도 : " + temp.get("x"));
			}*/

        } catch (Exception  e) {
            System.out.println(e);
            return null;
        }
}}
