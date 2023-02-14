package com.neighborCabinet.project.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.model.ObjectVO;
import com.neighborCabinet.project.model.SentimentVO;

@Service
public class AIService_y {
	public String stt(String filePathName) {
		
		String result="";
		String clientId = "2wp8nsh8wo"; // Application Client ID";
		String clientSecret = "eMcdSoeB8aScQU00Jvb1iTKzvE8usBraVRZBxLBf"; // Application Client Secret";

		try {
			String imgFile = filePathName;
			File voiceFile = new File(imgFile);

			String language = "Kor"; // 언어 코드 ( Kor, Jpn, Eng, Chn )
			String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
			URL url = new URL(apiURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setUseCaches(false);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setRequestProperty("Content-Type", "application/octet-stream");
			conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

			OutputStream outputStream = conn.getOutputStream();
			FileInputStream inputStream = new FileInputStream(voiceFile);
			byte[] buffer = new byte[4096];
			int bytesRead = -1;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			outputStream.flush();
			inputStream.close();
			BufferedReader br = null;
			int responseCode = conn.getResponseCode();
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else { // 오류 발생
				System.out.println("error!!!!!!! responseCode= " + responseCode);
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			}
			String inputLine;

			if (br != null) {
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				result = jsonToString1(response.toString());
			} else {
				System.out.println("error !!!");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	private String jsonToString1(String jsonResultStr) {

		String result = new JSONObject(jsonResultStr).getString("text");
		
		return result;
	}
	
	public SentimentVO sentiment(String text) {
		
		SentimentVO senti = new SentimentVO();
		
		String clientId = "2wp8nsh8wo";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "eMcdSoeB8aScQU00Jvb1iTKzvE8usBraVRZBxLBf";//애플리케이션 클라이언트 시크릿값";
        try {
        	String content = text;
            String apiURL = "https://naveropenapi.apigw.ntruss.com/sentiment-analysis/v1/analyze";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            con.setRequestProperty("Content-Type", "application/json");
            // post request
            JSONObject json = new JSONObject();
            json.put("content", content);
            con.setDoOutput(true);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
            
            bw.write(json.toString());
            bw.flush();
            bw.close();
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            br.close();
            System.out.println(response.toString());
            
            senti = jsonToString2(response.toString());
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return senti;
	}
	private SentimentVO jsonToString2(String jsonResultStr) {
		
		SentimentVO senti = new SentimentVO();
		
		JSONObject result = new JSONObject(jsonResultStr).getJSONObject("document").getJSONObject("confidence");
		int positive = result.getInt("positive");
		int negative = result.getInt("negative");
		int neutral = result.getInt("neutral");
		
		senti.setNegative(negative);
		senti.setNeutral(neutral);
		senti.setPositive(positive);
		//String result2 = new JSONObject(jsonResultStr).getJSONObject("message").getJSONObject("result").getString("translatedText");
		
		return senti;
	}
	
	public ArrayList<ObjectVO> objectDetect(String filePathName) {
		ArrayList<ObjectVO> objList = new ArrayList<ObjectVO>();
		
		String clientId = "2wp8nsh8wo";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "eMcdSoeB8aScQU00Jvb1iTKzvE8usBraVRZBxLBf";//애플리케이션 클라이언트 시크릿값";
        
        try {
            String paramName = "image"; // 파라미터명은 image로 지정
            String imgFile = filePathName;
            File uploadFile = new File(imgFile);
            String apiURL = "https://naveropenapi.apigw.ntruss.com/vision-obj/v1/detect"; // 객체 인식
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            // multipart request
            String boundary = "---" + System.currentTimeMillis() + "---";
            con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            OutputStream outputStream = con.getOutputStream();
            PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true);
            String LINE_FEED = "\r\n";
            // file 추가
            String fileName = uploadFile.getName();
            writer.append("--" + boundary).append(LINE_FEED);
            writer.append("Content-Disposition: form-data; name=\"" + paramName + "\"; filename=\"" + fileName + "\"").append(LINE_FEED);
            writer.append("Content-Type: "  + URLConnection.guessContentTypeFromName(fileName)).append(LINE_FEED);
            writer.append(LINE_FEED);
            writer.flush();
            FileInputStream inputStream = new FileInputStream(uploadFile);
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            writer.append(LINE_FEED).flush();
            writer.append("--" + boundary + "--").append(LINE_FEED);
            writer.close();
            BufferedReader br = null;
            int responseCode = con.getResponseCode();
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            }
            String inputLine;
            if(br != null) {
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString()); // 결과 출력
                
                objList = jsonToVOList(response.toString());
            } else {
                System.out.println("error !!!");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return objList;
	}
	
	// JSON 파싱 메소드
	private ArrayList<ObjectVO> jsonToVOList(String jsonResultStr){
		// 객체 이름과 x1, y1, x2, y2 좌표 값 추출해서 VO 리스트에 추가
		ArrayList<ObjectVO> objList = new ArrayList<ObjectVO>();
		
		JSONObject obj0 = new JSONObject(jsonResultStr).getJSONArray("predictions").getJSONObject(0);
		
		JSONArray nameArray = obj0.getJSONArray("detection_names");
		if(nameArray.length() != 0) {
			for(int i=0; i<nameArray.length(); i++) {
				
				// String name = nameArray.getString(i);
				// 객체명 한글로 번역하는 함수 호출하고 결과 받아오기
				String name = translateToKor(nameArray.getString(i));
				
				ObjectVO vo = new ObjectVO();
				vo.setName(name);
				
				objList.add(vo);
			}
		} else {
			ObjectVO vo = new ObjectVO();
			
			vo.setName("");
			
			objList.add(vo);
		}
		return objList;
	}
	
	// 객체명 한글로 번역하는 메소드 : 영문 이름 받아서 한글 이름으로 번역하고
	// 한글 이름 반환
	public String translateToKor(String name) {
		// Papago Translation API 여기에 복사
		String clientId = "nzkn92k0f8";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "gDtX4DFQCxD9WQ8iISey51BY0edm8cTcmtoRXwfB";//애플리케이션 클라이언트 시크릿값";
        
        String result = "";
        try {
            String text = URLEncoder.encode(name, "UTF-8");
            String apiURL = "https://naveropenapi.apigw.ntruss.com/nmt/v1/translation";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
            // post request
            String postParams = "source=en&target=ko&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 오류 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            //System.out.println(response.toString());
            // 파파고 번역 결과 JSON을 JSON 파싱 메소드 호출하면 전달하고 결과 받아옴
            // result : 한글 객체명
            result = jsonToString3(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
        
		return result;
	}
	
	// 파파고 번역 결과 JSON 파싱 메소드
	public String jsonToString3(String jsonResultStr) {
		String result = new JSONObject(jsonResultStr).getJSONObject("message").getJSONObject("result").getString("translatedText");
		
		
		return result;
	}
	
}
