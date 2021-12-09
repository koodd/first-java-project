package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.PPPCDto;
import com.hphfarm.www.dto.ProductDto;

@Mapper
public interface ManagerMapper {

// =========================== 최건호 ===========================

	// 관리자페이지 : 체험 목록 확인하기 >> 체험 게시글 전체 가져오기
	List<ExpDto> man_exp_selectList(int startrow, int endrow, String category, String searchword);

	// 관리자페이지 : 체험 프로그램 하단 넘버링하기 - 총 게시글 수
	int man_exp_selectListCount(String category, String searchword);

	// 관리자페이지 : 농장주가 수정/등록한 체험 승인여부 확인하기
	List<ExpDto> man_exp_regiSelectList(int startrow, int endrow, String category, String searchword);

	// 관리자페이지 : 체험 프로그램 신청 하단 넘버링하기 - 총 게시글 수
	int man_exp_selectRegiListCount(String category, String searchword);

	// 관리자 페이지 : 승인하기위한 체험 프로그램 자세히 보기
	ExpDto selectMan_exp_viewBoardOne(int e_no);

	// 관리자 페이지 : 승인하기위한 체험 프로그램 반려 하기
	int BoardExpRegiDelete(int e_no);

	// 관리자 페이지 : 승인하기위한 체험 프로그램 승인 하기
	int BoardExpRegiApprUpdate(int e_no);

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

	// 상품 리스트
	List<ProductDto> productList(NumberDto numberDto2);

	// 농기구
	int productCategory1();

	// 씨앗
	int productCategory2();

	// 모종
	int productCategory3();

	// 기타
	int productCategory4();

	// 검색 결과 총 게시글 수
	int selectListCount(NumberDto numberDto);

	// 상품 등록
	int insertProduct(ProductDto productDto);

	// 상품 삭제
	int deleteProduct(ProductDto productDto);
}
