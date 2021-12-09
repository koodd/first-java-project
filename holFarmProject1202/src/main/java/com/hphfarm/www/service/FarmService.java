package com.hphfarm.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.FarmReviewDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;


public interface FarmService {

	// 농장 목록 가져오기
	Map<String, Object> farmlist(NumberDto nDto);

	// 농장 등록하기
	int farmRegi(FarmDto fDto);

	// 농장 등록 시 파일 업로드
	FarmDto farmRegiFile(FarmDto fDto, MultipartFile certi_file, MultipartFile thumb_file, MultipartFile subfile,
			MultipartFile subfile2, MultipartFile subfile3, MultipartFile subfile4);

	// 농장 상세보기
	Map<String, Object> farmview(int fr_no);

	// 농장 리뷰
	Map<String, Object> writeReview(FarmReviewDto rDto);

	// 농장 상세보기 리뷰 가져오기
	List<FarmReviewDto> farmreviewList(int fr_no);

	// 농장 예약
	FarmDto fReserview(int fr_no);
	
	// 관리자 농장 목록 가져오기
	Map<String, Object> man_farm_list(NumberDto nDto);

	// 관리자 농장 등록&수정 신청 목록
	Map<String, Object> man_farm_regi_list(NumberDto nDto);

	// 관리자 농장 등록&수정 신청 상세보기
	FarmDto man_farm_regi_view(int frno);

	// 관리자 농장 등록&수정 신청 반려
	int regi_delete(int frno);

	// 관리자 농장 등록&수정 신청 수락
	int regi_success(FarmDto fDto);

	// 관리자 농장 예약 내역
	Map<String, Object> man_freser_list(NumberDto nDto);
}
