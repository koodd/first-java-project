package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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

}
