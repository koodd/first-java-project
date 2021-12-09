package com.hphfarm.www.service;

import java.util.List;
import java.util.Map;

import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.TotalDto;


public interface ExpService {

	// =========================== 체험 ===========================
	
	// 체험프로그램 전체 리스트 가져오기
	Map<String, Object> exp_List(NumberDto numberDto);
	// (농장주)체험등록 글쓰기
	int exp_RegWrite(ExpDto expDto);
    // 체험 상세보기 뷰
	 Map<String, Object> boardOne(int e_no);
    // 테이블 조인
	// List<TotalDto> selectExpView();

}
