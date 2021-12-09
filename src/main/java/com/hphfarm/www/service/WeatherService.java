package com.hphfarm.www.service;

public interface WeatherService {
	// 날씨 공공데이터 가져오기
	String selectData(int pageNo) throws Exception;
}
