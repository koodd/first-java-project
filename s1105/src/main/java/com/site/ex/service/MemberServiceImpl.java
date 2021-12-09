package com.site.ex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.ex.dto.MemberDto;
import com.site.ex.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override  //로그인 체크
	public MemberDto login(MemberDto memberDto) {
		MemberDto mDto = memberMapper.selectLogin(memberDto);
		return mDto;
	}

}
