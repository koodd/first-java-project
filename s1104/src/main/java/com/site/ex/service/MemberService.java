package com.site.ex.service;

import java.util.List;

import com.site.ex.vo.Member;

public interface MemberService {

	//전체회원정보 메소드
	List<Member> memberList();

	//로그인 확인
	Member login(String id, String pw);

}
