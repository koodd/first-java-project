package com.site.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.ex.dto.ChartDto;
import com.site.ex.dto.TotalDto;

@Mapper
public interface ChartMapper {
	//차트 전체데이터 가져오기
	List<ChartDto> selectChartIncome();

	//2개 테이블 조인
	List<TotalDto> selectTestList();
}
