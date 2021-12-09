package com.hphfarm.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.dto.ProductReviewDto;

public interface ProductService {

	// =========================== 상품 ===========================

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

	// 그 상품의 모든 댓글들
	List<ProductReviewDto> selectPRAll(ProductDto productDto);

	// 전체 댓글 수
	int selectPRlistCount(ProductDto productDto);

	// 전체 댓글 평점
	int selectPRstarAvg(ProductDto productDto);

	// 댓글추가
	ProductReviewDto ProductReviewWrite(ProductReviewDto productReviewDto);

	// 해당 사용자의 모든 거래 물품 번호
	List<Integer> selectPno1(int sessionuno);

}
