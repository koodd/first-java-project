package com.site.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	@RequestMapping("/form1")
	public String form1() {
		return "form1";
	}
	
	@RequestMapping("/doForm")
	//required = false null허용, defaultValue = "admin" 데이터가 빈공백이었을 경우 admin주입
	public String doForm(@RequestParam(required = false,defaultValue = "admin") String id,@RequestParam String pw
			,Model model) {
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		return "doForm";
	}
}
