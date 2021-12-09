package com.hphfarm.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hphfarm.www.dto.NumberDto;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	// =========================== 황선필 ===========================
	
	@GetMapping("/cart")
	public String cart(NumberDto numberDto, Model model) {
		


		return "pay/cart";
	}
	
	@GetMapping("/purchaselist")
	public String purchaselist(NumberDto numberDto, Model model) {
		
		
		
		return "pay/purchaselist";
	}

	
	

	
	

}
