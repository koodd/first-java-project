package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.FarmReviewDto;
import com.hphfarm.www.dto.FviewDto;

@Mapper
public interface FarmMapper {

	// 농장 목록 가져오기
	List<FarmDto> selectList(int startrow, int endrow, String searchword, String category, String region);

	// 전체 농장 수
	int listCount(String searchword, String category, String region);

	// 농장 등록
	int farmregi(FarmDto fDto);

	// 농장 등록 여부 확인
	int farmCheckRegi(int uno);
	
	// 농장 상세보기
	FarmDto selectFarmView(int fr_no);

	// 리뷰 추가
	void insertFarmReview(FarmReviewDto rvDto);

	// 리뷰 1개 가져오기
	FarmReviewDto selectFReviewOne(int frv_no);

	// 해당 농장 리뷰 전체 가져오기
	List<FarmReviewDto> selectFReviewList(int fr_no);

	// 농장 예약 뷰
	FarmDto selectReserInfo(int fr_no);

	// 농장 예약 결제
	void insertPayFarm(int py_price, int u_no);
	
	// 농장 예약 테이블 입력
	void insertFarmReser(int u_no, int fr_no, String frs_startdate, String frs_account);
	
	// 관리자 농장 등록&수정 신청 목록
	List<FarmDto> man_farm_regi_list(int startrow, int endrow, String searchword);

	// 관리자 농장 등록&수정 신청 상세보기
	FarmDto man_farm_fegi_view(int frno);

	// 관리자 농장 등록&수정 신청 반려
	int regi_delete(int frno);
	
	// 관리자 농장 등록&수정 신청 수락
	int regi_success(FarmDto fDto);

	// 관리자 농장 예약 내역
	List<FarmDto> fReserList(int startrow, int endrow, String searchword);

	// 마이페이지 농장주 농장 예약 현황 정보 보기
	FarmDto detalReserView(FarmDto farmDto);

	// 예약된 구좌만 가져오기
	String OneAccount(int fr_no);

	// 메인페이지 하단 인기있는 농장 TOP 7
	List<FarmDto> farmTopList();

}
