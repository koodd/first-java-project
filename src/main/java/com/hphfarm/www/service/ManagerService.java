package com.hphfarm.www.service;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.ManagerDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.PPPCDto;
import com.hphfarm.www.dto.ProductDto;

public interface ManagerService {
	// =========================== 최건호 ===========================
	// 체험 관리자

		// 관리자페이지 : 체험 목록 확인하기 >> 체험 게시글 전체 가져오기
		Map<String, Object> man_exp_list(NumberDto numberDto);

		// 관리자페이지 : 농장주가 수정/등록한 체험 승인여부 확인하기
		Map<String, Object> man_exp_regi_list(NumberDto numberDto);

		// 관리자 페이지 : 승인하기위한 체험 프로그램 자세히 보기
		Map<String, Object> man_exp_viewBoardOne(int e_no);

		// 관리자 페이지 : 승인하기위한 체험 프로그램 반려 하기
		int expRegiDelete(int e_no);

		// 관리자 페이지 : 승인하기위한 체험 프로그램 승인 하기
		int expRegiApprUpdate(int e_no);
		
		// 관리자 페이지 : 유저가 예약한 현황 보기
		Map<String, Object> man_exp_book(NumberDto numberDto);

	// =========================== 황선필 ===========================

		// 주문취소관리
		List<PPPCDto> selectCancel();

		// 결제정보 불러오기
		PPPCDto selectPayList(int py_no);

		// 구매내역부분 불러오기
		List<PPPCDto> selectPurchaseList(int py_no);

		// 물품정보부분 불러오기
		PPPCDto selectProductList(int p_no);

		// 상품 승인
		int manappr(CancelDto cancelDto);

		// 상품 승인 후 해당 유저의 거래 내역 처리완료로 바꾸기
		void upadatePurchaseList(int c_no);
		
		// 상품 승인 후 해당 유저의 결제 내역 false로 바꾸기
		void upadatePay(int c_no);

		// 상품 리스트
		Map<String, Object> productList(NumberDto numberDto);

		// 농기구
		int productCategory1();

		// 씨앗
		int productCategory2();

		// 모종
		int productCategory3();

		// 기타
		int productCategory4();

		// 상품등록
		int insertProduct(ProductDto productDto);

		// 업로드 이미지 포맷
		ProductDto formatFiles(ProductDto productDto, MultipartFile file, MultipartFile files1, MultipartFile files2,
				MultipartFile files3, MultipartFile files4, MultipartFile files5);

		// 상품 1개 삭제
		int deleteProduct(ProductDto productDto);
	
	// =========================== 한희태 ===========================
	
	// 매니저 인덱스 데이터
	Map<String, Object> mainData();

	// 1:1 문의 목록
	List<MemberDto> inquiryList();

	// 1:1 문의 확인
	MemberDto inquiryView(int ci_no);

	// 1:1 문의 답장 메일
	void sendReply(ManagerDto mDto);

	// 1:1 문의 답장 데이터 넣기
	int insertSendReply(ManagerDto mDto);
}
