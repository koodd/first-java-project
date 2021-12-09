package com.site.ex.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.ex.beans.Member;

@Controller
public class MainController {
	
	
	
	@RequestMapping("/board/write_view")
	public String write_view(Member member) {
		
		return "board/write_view";
	}
	
	@GetMapping("/member/memberForm")
	public String memberForm() {
		return "member/memberForm";
	}
	
	@PostMapping("/member/memberForm")
	public String doMemberForm(HttpServletRequest request) {
		System.out.println("id : " + request.getParameter("id"));
		System.out.println("pw : " + request.getParameter("pw"));
		return "member/doMemberForm";
	}
	
	
	//RequstMapping(value="/index",method=RequestMethod.POST)
	@RequestMapping(value="/index")
	public String index() {
		return "index";
	}
	
	//@PostMapping("/login") post방식으로 들어오는 페이지 연결
	@GetMapping("member/login") // get방식으로 들어오는 페이지 연결
	public String login() {
		return "member/login";
	}
	
	// 게시판
	@GetMapping("/board/board")
	public String board() {
		return "board/board";
	}

}
