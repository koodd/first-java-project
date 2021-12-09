package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.dto.ProductReviewDto;

@Mapper
public interface ProductMapper {

	// =========================== 상품 ===========================
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

	// 그 상품의 모든 댓글들
	List<ProductReviewDto> selectPRAll(ProductDto productDto);

	// 전체 댓글 수
	int selectPRlistCount(ProductDto productDto);

	// 전체 댓글 평점
	int selectPRstarAvg(ProductDto productDto);

	// 댓글 1개 디비에 입력
	void ProductReviewWrite(ProductReviewDto productReviewDto);

	// prno에 해당되는 댓글 1개 정보 가져오기
	ProductReviewDto selectProductReviewOne(int pr_no);

	// 해당 사용자의 모든 거래 물품 번호
	List<Integer> selectPno1(int sessionuno);
	
	//새로운 거래번호 //30
	int selectPy_no();
	
	//30
	//로그인 uno 통한 정보 얻기.
	MemberDto selectUserOne(int sessionuno);
	
	//30
	//결제내역에 인서트
	int insertPay(int u_no, int py_price, int py_no);

	//30
	//농장예약한 유저가 어디 농장 예약했는지 받아오는 메소드
	FarmDto selectFarmRegDto(int u_no);
	
	//30
	//구매 성공시, 구매내역으로 인서트
	int insertPurchaseList(int pl_num, String pl_delivery, int py_no, int p_no);

	//01
	//메인 페이지(상품 리스트 나열 추가)
	List<ProductDto> selectMainProducts();

	//01
	//상품 목록에서 수량 빼기
	int minusProduct(int pl_num, int p_no);
	

}
