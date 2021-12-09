package com.hphfarm.www.service;

import org.springframework.stereotype.Service;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.io.BufferedReader;


@Service
public class WeatherServiceImpl implements WeatherService {
	private static final int i = 0;

	public String selectData(int pageNo) throws Exception {
		String page = pageNo+"";
		String[] arr1 = {"11B10101","11G00201"};
		
		String service_key="hfhfotoIRAP4c15Jlw2Orp%2FS08SagKpyCr9Yq6arU4JmVTL4My8rvzxjreV8KV9qkKOczKZAwE%2FLCbZdJ8jrbw%3D%3D";
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+service_key); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("5", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
		urlBuilder.append("&" + URLEncoder.encode("regId","UTF-8") + "=" + URLEncoder.encode(arr1[i], "UTF-8")); /*11A00101(백령도), 11B10101 (서울), 11B20201(인천) 등... 별첨 엑셀자료 참조(‘육상’ 구분 값 참고)*/
        /*
         서울 11B10101
		 인천 11B20201
		 경기도 11B10103
		 강원도 11D10302
		 충북 11C10303
		 충남 11C20502
		 대전 11C20401
		 세종 11C20404
		 광주 11F20501
		 전북 
		 전남
		 경북
		 경남
		 대구
		 부산
		 울산
		 제주 11G00201
		 
         */
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
		/* System.out.println("Response code: " + conn.getResponseCode()); */
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        return sb.toString();
    }

}
