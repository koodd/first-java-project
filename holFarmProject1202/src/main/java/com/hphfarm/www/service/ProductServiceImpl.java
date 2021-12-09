package com.hphfarm.www.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.dto.ProductReviewDto;
import com.hphfarm.www.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;

	// 상품 리스트
	@Override
	public Map<String, Object> productList(NumberDto numberDto) {
		if (numberDto.getCategory() == null) {
			numberDto.setCategory("all");
		}
		if (numberDto.getPage() == 0) {
			numberDto.setPage(1);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		NumberDto numberDto2 = numberling(numberDto);
		List<ProductDto> list = null;
		list = productMapper.productList(numberDto2);
		if (list != null) {
			map.put("list", list);
			map.put("nDto", numberDto2);
			return map;
		}
		return null;
	}// 상품 리스트

	// 농기구
	@Override
	public int productCategory1() {
		int c1 = productMapper.productCategory1();
		return c1;
	}

	// 씨앗
	@Override
	public int productCategory2() {
		int c2 = productMapper.productCategory2();
		return c2;
	}

	// 모종
	@Override
	public int productCategory3() {
		int c3 = productMapper.productCategory3();
		return c3;
	}

	// 기타
	@Override
	public int productCategory4() {
		int c4 = productMapper.productCategory4();
		return c4;
	}

	// 페이지 넘버링
	public NumberDto numberling(NumberDto numberDto) {
		int page = 0;
		if (numberDto.getPage() == 0) {
			page = 1;
		} else {
			page = numberDto.getPage();
		}

		String category = numberDto.getCategory();
		String searchWord = numberDto.getSearchword();

		int limit = 9;
		int numLimit = 4;
		int listCount = productMapper.selectListCount(numberDto);
		int maxPage = (int) Math.ceil((double) listCount / limit);
		int startPage = (((int) (Math.ceil((double) page / numLimit) - 1))) * numLimit + 1;
		int endPage = startPage + numLimit - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		int pc_no = numberDto.getPc_no();

		NumberDto nDto = new NumberDto(page, limit, numLimit, listCount, maxPage, startPage, endPage, startrow, endrow,
				category, searchWord, pc_no);

		return nDto;
	}

	// 그 상품의 모든 댓글들
	@Override
	public List<ProductReviewDto> selectPRAll(ProductDto productDto) {
		List<ProductReviewDto> list = productMapper.selectPRAll(productDto);

		return list;
	}

	// 전체 댓글 수
	@Override
	public int selectPRlistCount(ProductDto productDto) {
		int listCount = productMapper.selectPRlistCount(productDto);

		return listCount;
	}

	// 전체 댓글 평점
	@Override
	public int selectPRstarAvg(ProductDto productDto) {
		int starCount = 0;
		starCount = productMapper.selectPRstarAvg(productDto);

		return starCount;
	}

	// 댓글추가
	@Override
	public ProductReviewDto ProductReviewWrite(ProductReviewDto productReviewDto) {
		// 댓글저장
		productMapper.ProductReviewWrite(productReviewDto);
		System.out.println("ProductReviewDto pno : " + productReviewDto.getP_no());
		// 댓글1개 가져오기
		ProductReviewDto prDto = productMapper.selectProductReviewOne(productReviewDto.getPr_no());

		return prDto;
	}

	// 해당 사용자의 모든 거래 물품 번호
	@Override
	public List<Integer> selectPno1(int sessionuno) {
		List<Integer> list1 = productMapper.selectPno1(sessionuno);

		return list1;
	}
}
