package com.site.ex.service;

import com.site.ex.dto.MemberDto;

public interface MemberService {

	//로그인 체크
	MemberDto login(MemberDto memberDto);

}
