package com.site.ex.service;

public interface DataService {

	//공공데이터 가져오기
	String selectData(String searchData) throws Exception;
	
	//공공데이터 검색으로 가져오기
	String selectSearchData(String category, String searchData) throws Exception;

}