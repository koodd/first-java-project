package com.site.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.ex.dto.ChartDto;
import com.site.ex.dto.TotalDto;
import com.site.ex.mapper.ChartMapper;

@Service
public class ChartServiceImpl implements ChartService {
	@Autowired
	ChartMapper chartMapper;
	
	@Override //차트 전체데이터 가져오기
	public List<ChartDto> selectChartIncome() {
		List<ChartDto> list = chartMapper.selectChartIncome();
		return list;
	}

	@Override //2개 테이블 조인
	public List<TotalDto> selectTestList() {
		List<TotalDto> list = chartMapper.selectTestList();
		return list;
	}
}
