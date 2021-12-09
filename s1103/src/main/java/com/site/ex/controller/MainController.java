package com.site.ex.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.ex.beans.Member;

@Controller
public class MainController {
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	//------------------------------------
	// 객체받는 형태
	@RequestMapping("/ex1103_07")
	public String ex1103_07() {
		return "ex1103_07";
	}
	
	@RequestMapping("/ex1103_08")
	public String ex1103_08(Member member,Model model) {
		System.out.println("member id : "+ member.getId());
		System.out.println("member pw : "+ member.getPw());
		System.out.println("member name : "+ member.getName());
		System.out.println("member email : "+ member.getEmail());
		System.out.println("member hobby : "+ member.getHobby());
		model.addAttribute("member",member);
		return "ex1103_08";
	}
	
	
	
	
	//------------------------------------
	// @ReqeustParam - List 배열을 받음
	@RequestMapping("/ex1103_05")
	public String ex1103_05() {
		return "ex1103_05";
	}
	
	@RequestMapping("/ex1103_06")
	public String ex1103_06(@RequestParam String id,
			@RequestParam String pw,
			@RequestParam List<String> hobby,
			Model model) {
		
		System.out.println("id3 : "+id);
		System.out.println("pw3 : "+pw);
		System.out.println("hobby3 : "+hobby);
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		model.addAttribute("hobby",hobby);
		return "ex1103_06";
	}
	
	
	
	//-------------------------------------
	// @RequestParam
	@RequestMapping("/ex1103_03")
	public String ex1103_03() {
		return "ex1103_03";
	}
	
	@RequestMapping("/ex1103_04")
	public String ex1103_04(@RequestParam("id") int id,
			@RequestParam String pw,HttpServletRequest request,
			Model model) {
		String[] hobbys = request.getParameterValues("hobby");
		String hobby="";
		for(int i=0;i<hobbys.length;i++) {
			if(i==0) hobby +=hobbys[i];
			else hobby +=","+hobbys[i];
		}
		System.out.println("hobby : "+ hobby);
		System.out.println("id2 : "+id);
		System.out.println("pw2 : "+pw);
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		model.addAttribute("hobby",hobby);
		return "ex1103_04";
	}
	//------------------------------------------------------
	// request로 데이터를 받음.
	@GetMapping("/ex1103_01")
	public String ex1103_01() {
		return "ex1103_01";
	}
	
	@PostMapping("/ex1103_02")
	public String ex1103_02(HttpServletRequest request,Model model) {
		//String id = request.getParameter("id");
		int id = Integer.parseInt(request.getParameter("id"));
		String pw = request.getParameter("pw");
		System.out.println("id : "+id);
		System.out.println("pw : "+pw);
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		
		return "ex1103_02";
	}

}
