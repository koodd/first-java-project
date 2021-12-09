package com.hphfarm.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hphfarm.www.service.WeatherService;

@Controller
public class MainController {

	// =========================== 한희태 ===========================

	// 고객센터 1:1문의
	@RequestMapping("/customer/inquiry")
	public String inquiry() {
		return "customer/inquiry";
	}

	// 고객센터 faq
	@RequestMapping("/customer/faq")
	public String faq() {
		return "customer/faq";
	}

	// =========================== 황선필 ===========================

	// =========================== 최건호 ===========================

	@Autowired
	WeatherService weatherservice;

	// 메인 페이지
	@RequestMapping("/main")
	public String main() {

		return "main";
	}

	// 날씨 API
	@ResponseBody
	@RequestMapping("/weatherApi")
	public String weatherApi(@RequestParam int pageNo) throws Exception {
		// 날씨데이터 가져오기
		String data = weatherservice.selectData(pageNo);
		return data;
	}
}
