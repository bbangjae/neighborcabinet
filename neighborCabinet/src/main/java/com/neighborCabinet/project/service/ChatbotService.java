package com.neighborCabinet.project.service;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Date;

@Service
public class ChatbotService {
    public String main(String voiceMessage) {
        String apiURL ="https://3wvzkgzao3.apigw.ntruss.com/custom/v1/9067/92bc92b16665d5a4302bebede61dab2a72d3621ee2097bdf6195981987251af4";
        String secretKey ="T1pKS1ZyQ2VvUHlIWmdFRU9Tb0lseGt0UHlLUVptU0E=";

        String chatbotMessage = ""; //응답 메시지

        try {
            //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

            URL url = new URL(apiURL);

            String message = getReqMessage(voiceMessage);
            System.out.println("##" + message);

            String encodeBase64String = makeSignature(message, secretKey);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage());

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString; //서버로부터 결과 받은 메시지 :chatbotMessage (응답메시지)
                }
                //chatbotMessage = decodedString;
                in.close();

                //응닫 메시지 출력
                System.out.println(chatbotMessage);// chatbotMessage : 서버에서 응답 받은 메시지 ( Json 형식의 문자열)
                //응답 메시지 JSON 파싱 메소드 호출
                chatbotMessage = jsonToString(chatbotMessage); // JSON 파싱 결과 추출된 답변 메시지
                //

            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return chatbotMessage;
    }
    //chatbot3 : 이미지/멀티링크 답변 처리하기 위해서
    // JSON 형식의 문자열을 파싱하지 않고 그대로 반환
    public  String chatbot3Main(String voiceMessage) {

        String apiURL = "https://3wvzkgzao3.apigw.ntruss.com/custom/v1/9067/92bc92b16665d5a4302bebede61dab2a72d3621ee2097bdf6195981987251af4";
        String secretKey = "T1pKS1ZyQ2VvUHlIWmdFRU9Tb0lseGt0UHlLUVptU0E=";

        String chatbotMessage = ""; // 응답 메시지

        try {
            //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

            URL url = new URL(apiURL);

            String message = getReqMessage(voiceMessage);
            System.out.println("##" + message); // 전송 메시지

            String encodeBase64String = makeSignature(message, secretKey);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage());

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString;   // 서버로부터 결과 받은 메시지 : chatbotMessage (응답 메시지)
                }
                //chatbotMessage = decodedString;
                in.close();

                // 응답 메시지 출력
                System.out.println("응답 메시지 : " + chatbotMessage);
                // chatbotMessage : 서버에서 응답 받은 메시지 (JSON 형식의 문자열)

                // JSON 형태 그대로 반환하기 위해 파싱 작업 처리하지 않음
                // 응답 메시지 JSON 파싱 메소드 호출
                // chatbotMessage = jsonToString(chatbotMessage);
                // JSON 파싱 결과 추출된 답변 메시지

            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return chatbotMessage;
    }


    public String makeSignature(String message, String secretKey) {

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
          //  encodeBase64String = Base64.encodeToString(rawHmac, Base64.NO_WRAP);
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

            return encodeBase64String;

        } catch (Exception e){
            System.out.println(e);
        }

        return encodeBase64String;

    }

    public String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {

            JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();

            System.out.println("##"+timestamp);

            obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
//=> userId is a unique code for each chat user, not a fixed value, recommend use UUID. use different id for each user could help you to split chat history for users.

            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();

            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.put(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            //obj.put("event", "send");
            // event 값을 "send" 로 설정해서 보내면 서버는 질문으로 인식하고 답변 반환
            // 월컴 메시지 출력하기 ( 서버가 웰컴 메시지로 인식할 수 있도록 event 를 "opne" 으로 설정
            // 보내는 메시지가 없으면 " open" 있으면 "send" 로 출력
            if(voiceMessage == "") {
                obj.put("event", "open");
            }else {
                obj.put("event","send"); // 질문 메시지
            }

            requestBody = obj.toString();

        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }

        return requestBody;

    }
    // 응답 메시지 결과 JSON 파싱
    public String jsonToString(String jsonResultStr) throws JSONException {

        JSONArray bubbleArray = new JSONObject(jsonResultStr).getJSONArray("bubbles");
        String result = bubbleArray.getJSONObject(0).getJSONObject("data").getString("description");

        return result;
    }

}
