package com.site.ex.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.ex.dto.MemberDto;
import com.site.ex.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@ResponseBody
	@PostMapping("/login")
	public int login(MemberDto memberDto,Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("controller id : "+memberDto.getId());
		//로그인 체크 : id,pw를 db에서 확인
		MemberDto mDto = memberService.login(memberDto);
		int loginCheck=0;
		if(mDto != null) {
			loginCheck=1;
			session.setAttribute("session_id", mDto.getId());
			session.setAttribute("session_name", mDto.getName());
		}
		return loginCheck;
	}//login
	
	@GetMapping("/logout") //로그아웃
	public String logout() {
		return "member/logout";
	}
	
	
}
