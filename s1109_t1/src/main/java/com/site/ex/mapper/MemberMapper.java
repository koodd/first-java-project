package com.site.ex.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.site.ex.dto.MemberDto;

@Mapper
public interface MemberMapper {

	//로그인 체크
	MemberDto selectLogin(MemberDto memberDto);

}
