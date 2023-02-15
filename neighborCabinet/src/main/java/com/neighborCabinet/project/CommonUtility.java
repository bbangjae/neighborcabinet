package com.neighborCabinet.project;

public class CommonUtility {

    //board controller에서 board list 페이징 처리를 위해 , String 값을 페이지 번호로 번형해서 리턴
    public static int getPageNumber(String strNum){
        int number;
        try{
            number = Integer.parseInt(strNum.trim());
            if (number <= 0)
                return 1; // 0 보다 작은 숫자면 기본적으로 1 반환
        } catch (Exception ex){
            return 1;
        }
        return number;
    }
}
