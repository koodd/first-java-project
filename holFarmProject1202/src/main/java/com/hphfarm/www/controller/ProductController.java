package com.hphfarm.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.dto.ProductReviewDto;
import com.hphfarm.www.dto.PurchaseListDto;
import com.hphfarm.www.service.ProductService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
@RequestMapping("/product")
public class ProductController {

	// =========================== 황선필 ===========================

	@Autowired
	ProductService productService;

	// 상품 리스트
	@GetMapping("/product_list")
	public String product(NumberDto numberDto, Model model) {
		Map<String, Object> map = null;

		map = productService.productList(numberDto);

		int c1 = productService.productCategory1();
		int c2 = productService.productCategory2();
		int c3 = productService.productCategory3();
		int c4 = productService.productCategory4();

		model.addAttribute("map", map);
		model.addAttribute("c1", c1);
		model.addAttribute("c2", c2);
		model.addAttribute("c3", c3);
		model.addAttribute("c4", c4);

		return "product/product_list";

	}

	// 상품 상세페이지
	@GetMapping("/product_view")
	public String product_view(ProductDto productDto, HttpServletRequest request, Model model) {
		// 세션에서 로그인한 사용자의 uno 받아오기.
		int sessionuno = 0;

		HttpSession session = request.getSession();
		if (session.getAttribute("session_uno") != null) {

			sessionuno = (int) session.getAttribute("session_uno");
		}
		System.out.println("sessionuno값:" + sessionuno);// 로그인한 사람의 유저번호
		// 로그인한 사용자의 구매 내역 안 물품번호 리스트
		List<Integer> list1 = productService.selectPno1(sessionuno);
		System.out.println("list:" + list1);
		// 현 페이지의 상품 번호
		int pno1 = productDto.getP_no();
		// 구매내역 체크 변수
		int purchasecheck = 0;

		for (int i : list1) {
			System.out.println("list1에 있는 숫자 값들:" + i);
			if (i == pno1) {
				System.out.println("일치한다!");
				purchasecheck = 1;
			} else {
				System.out.println("일치 안한다!");
			}

		}

		// 전체 댓글 불로오는 메소드 추가.
		List<ProductReviewDto> list = productService.selectPRAll(productDto);
		// 전체 댓글 수
		int listCount = productService.selectPRlistCount(productDto);
		// 전체 댓글 평점
		int starCount = 0;

		if (listCount != 0) {
			// 별 평점
			starCount = productService.selectPRstarAvg(productDto);
		}

		model.addAttribute("starCount", starCount);
		model.addAttribute("prlistCount", listCount);
		model.addAttribute("pDto", productDto);
		model.addAttribute("prlist", list);
		model.addAttribute("pcheck", purchasecheck);

		return "product/product_view";
	}

	// 상품 구매하기(상품 뷰 통해거)
	@RequestMapping("/my_pur_do2")
	public String my_pur_do2(PurchaseListDto purchaseListDto, @RequestParam int totalcost, Model model) {
		// 구매내역에 받아올 totalcost, pl_delivery,pl_num,p_no 출력 성공.
		System.out.println("totalcost:" + totalcost);
		System.out.println("pldelivery:" + purchaseListDto.getPl_delivery());
		System.out.println("plnum:" + purchaseListDto.getPl_num());
		System.out.println("pno:" + purchaseListDto.getP_no());

		return "./member/my_pur_list";
	}

	@ResponseBody // 댓글추가
	@RequestMapping("/ProductReviewWrite")
	public ProductReviewDto ProductReviewWrite(ProductReviewDto productReviewDto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionnickname = (String) session.getAttribute("session_nickname");
		System.out.println("session :" + sessionnickname);
		productReviewDto.setPr_nickname(sessionnickname);
		ProductReviewDto prDto = productService.ProductReviewWrite(productReviewDto);
		return prDto;
	}

}
