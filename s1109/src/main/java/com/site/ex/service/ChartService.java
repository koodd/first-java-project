package com.site.ex.service;

import java.util.List;

import com.site.ex.dto.ChartDto;
import com.site.ex.dto.TotalDto;

public interface ChartService {
	//차트 전체데이터 가져오기
	List<ChartDto> selectChartIncome();

	//2개 테이블 조인
	List<TotalDto> selectTestList();
}
