package com.site.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController {
	
	
	
	@RequestMapping("/chart01")
	public String chart01() {	
		return "/chart01";
	
	}
		
}
