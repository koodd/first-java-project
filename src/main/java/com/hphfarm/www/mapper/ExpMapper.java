package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.FarmRegDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.TotalDto;


@Mapper
public interface ExpMapper {
	
	// =========================== 체험 ===========================
	
	// 체험 프로그램 하단 넘버링하기 - 총 게시글 수
	int selectExpListCount(String category, String searchword);
	// 전체게시글 가져오기
	List<NumberDto> selectExpList(int startrow, int endrow, String category, String searchword);
	// (농장주)체험등록 글쓰기
	int insertExp_RegWrite(ExpDto expDto);
    // 체험 상세보기 뷰
	ExpDto selectBoardOne(int e_no);
	// 체험등록 1개이상 등록 불가 아이디당 1개
	int SelectExpRegCheck(int u_no);
	// 체험 프로그램 예약 결제
	void insertPayExp(ExpDto eDto);
	// 체험 프로그램 예약 테이블 입력
	void insertExpReser(ExpDto eDto);


}
