package com.hphfarm.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
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

	//29
	// 댓글추가
	@Override
	public ProductReviewDto ProductReviewWrite(ProductReviewDto productReviewDto) {
		// 댓글저장
		productMapper.ProductReviewWrite(productReviewDto);
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
	
	//새로운 거래번호 //30
	@Override
	public int selectPy_no() {
		int py_no = productMapper.selectPy_no();
		return py_no;
	}
	
	//30
	//로그인 uno 통한 정보 얻기.
	@Override
	public MemberDto selectUserOne(int sessionuno) {
		MemberDto mDto = productMapper.selectUserOne(sessionuno);
		return mDto;
	}
	
	//30
	//결제내역에 인서트
	@Override
	public int insertPay(int u_no, int py_price, int py_no) {
		
		int result1 = 0;
		result1 = productMapper.insertPay(u_no,py_price,py_no);
		return result1;
	}

	//30
	//농장예약한 유저가 어디 농장 예약했는지 받아오는 메소드
	@Override
	public FarmDto selectFarmRegDto(int u_no) {
		
		FarmDto farmRegDto = productMapper.selectFarmRegDto(u_no);
		
		return farmRegDto;
	}
	
	//30
	//구매 성공시, 구매내역으로 인서트
	@Override
	public int insertPurchaseList(int pl_num, String pl_delivery, int py_no, int p_no) {
		int result = 0;
		result = productMapper.insertPurchaseList(pl_num,pl_delivery,py_no,p_no);
		
		return result;
	}

	//01
	//메인 페이지(상품 리스트 나열 추가)
	@Override
	public List<ProductDto> selectMainProducts() {
		List<ProductDto> plist = productMapper.selectMainProducts();
		return plist;
	}

	//01
	//상품 목록에서 수량 빼기
	@Override
	public int minusProduct(int pl_num, int p_no) {
		int resultd = 0;
		resultd = productMapper.minusProduct(pl_num,p_no);
		return resultd;
	}
	
}
