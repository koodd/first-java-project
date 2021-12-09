package com.site.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RestController : return을 데이터로 인식
public class MainController {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

}
