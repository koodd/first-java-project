package com.site.ex.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller // return값이 jsp페이지
//@RestController  // return값이 데이터
public class MemberController {

	@RequestMapping("/member/login")
	public String login() {
		return "member/login";
	}
	
	
	@ResponseBody  //ajax사용시 데이터값을 넘길때 사용
	@RequestMapping("member/doLogin")
	public Map<String, Object> doLogin(@RequestParam String id,@RequestParam String pw ) {
		//id,pw가 DB로 보내져서 있는지 확인하는 메소드 호출
		// id=admin, pw=1111
		Map<String,Object> map = new HashMap<String,Object>();
		
		String nickName ="홍길스";
		System.out.println("id : "+id);
		String loginCheck = "false";
		if(id.equals("admin") && pw.equals("1111")) {
			loginCheck = "true";
		}
		map.put("nickName", nickName);
		map.put("loginCheck", loginCheck);
		return map;  //return 해줄것이 데이터가 되어야 함.
	}
	
}
