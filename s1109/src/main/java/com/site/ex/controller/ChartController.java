package com.site.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.site.ex.dto.ChartDto;
import com.site.ex.dto.TotalDto;
import com.site.ex.service.ChartService;

@Controller
public class ChartController {
	
	@Autowired
	ChartService chartService; 
	
	@RequestMapping("/testList")
	public String testList(Model model) {
		//2개 테이블 조인
		List<TotalDto> list = chartService.selectTestList();
		System.out.println("개수 : "+list.size());
		System.out.println("controller1 : "+list.get(0).getBoardDto().getBid());
		model.addAttribute("list",list);
		return "testList";
	}
	
	@RequestMapping("/chart01")
	public String chart01() {
		return "chart01";
	}
	
	@RequestMapping("/chart01Send")
	@ResponseBody
	public List<ChartDto> chart01Send() {
		//차트 전체데이터 가져오기
		List<ChartDto> list = chartService.selectChartIncome();
		return list;
	}
	
	
	
	
	
	@RequestMapping("/chartHtml")
	public String chartHtml() {
		return "chartHtml";
	}
	@RequestMapping("/chartHtml2")
	public String chartHtml2() {
		return "chartHtml2";
	}
	@RequestMapping("/chartHtml3")
	public String chartHtml3() {
		return "chartHtml3";
	}
	
	@RequestMapping("/chartIncome")
	@ResponseBody
	public String chartIncome() {
		Gson gson = new Gson();
		//차트 전체데이터 가져오기
		List<ChartDto> list = chartService.selectChartIncome();
		return gson.toJson(list);
	}
	
	

}
