package com.hphfarm.www.controller;

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

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.dto.ProductReviewDto;
import com.hphfarm.www.dto.PurchaseListDto;
import com.hphfarm.www.service.ProductService;


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

	//30
	// 상품 상세페이지
	@GetMapping("/product_view")
	public String product_view(ProductDto productDto, HttpServletRequest request, Model model) {
		
		//새로운 거래번호 //30
		int py_no = productService.selectPy_no();
		
		int sessionuno = 0;

		// 세션에서 로그인한 사용자의 uno 받아오기.
		HttpSession session = request.getSession();
		if (session.getAttribute("session_uno") != null) {

			sessionuno = (int) session.getAttribute("session_uno");
		}
		//30
		//로그인 uno 통한 정보 얻기.
		MemberDto mDto = productService.selectUserOne(sessionuno);
		// 로그인한 사용자의 구매 내역 안 물품번호 리스트
		List<Integer> list1 = productService.selectPno1(sessionuno);
		// 현 페이지의 상품 번호
		int pno1 = productDto.getP_no();
		// 구매내역 체크 변수
		int purchasecheck = 0;

		for (int i : list1) {
			if (i == pno1) {
				purchasecheck = 1;
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
		model.addAttribute("u_no", sessionuno);
		model.addAttribute("py_no", py_no);
		model.addAttribute("mDto", mDto);

		return "product/product_view";
	}

	//30
	// 상품 구매하기(상품 뷰 통해거)
	@RequestMapping("/my_pur_do2")
	public String my_pur_do2(PurchaseListDto purchaseListDto, @RequestParam int totalcost, @RequestParam int u_no, @RequestParam int py_no) {
		
		int pl_num = purchaseListDto.getPl_num();
		String pl_delivery = purchaseListDto.getPl_delivery();
		int p_no = purchaseListDto.getP_no();
		MemberDto mDto = productService.selectUserOne(u_no);
		//농장예약한 유저가 어디 농장 예약했는지 받아오는 메소드
		FarmDto farmRegDto = productService.selectFarmRegDto(u_no);
		//유저가 예약한 농장 주소
		
		//결제내역에 인서트
		int result1 = 0;
		result1 = productService.insertPay(u_no,totalcost,py_no);
		
		//01
		//상품 목록에서 수량 빼기
		int resultd = 0;
		resultd = productService.minusProduct(pl_num,p_no);
		System.out.println("상품목록에서 상품 수량 빼기:"+resultd);
		
		int result2 = 0;
		//1일시 나의 집으로 보낸다.
		if(pl_delivery.equals("1")) {
			String pld1 = mDto.getU_addr();

			//구매내역에 인서트
			result2 = productService.insertPurchaseList(pl_num,pld1,py_no,p_no);
			//2일시, 예약 농장으로 보낸다.
		}else if(pl_delivery.equals("2")){
			
			String pld2 = farmRegDto.getFr_addr();
			//구매내역에 인서트
			result2 = productService.insertPurchaseList(pl_num,pld2,py_no,p_no);
		}
		return "redirect:../member/my_pur_list";
	}

	//29
	@ResponseBody // 댓글추가
	@RequestMapping("/ProductReviewWrite")
	public ProductReviewDto ProductReviewWrite(ProductReviewDto productReviewDto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionnickname = (String) session.getAttribute("session_nickname");
		productReviewDto.setPr_nickname(sessionnickname);
		ProductReviewDto prDto = productService.ProductReviewWrite(productReviewDto);
		return prDto;
	}

}
