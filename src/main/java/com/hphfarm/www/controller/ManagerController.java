package com.hphfarm.www.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.ManagerDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.PPPCDto;
import com.hphfarm.www.dto.PayDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.service.BoardService;
import com.hphfarm.www.service.FarmService;
import com.hphfarm.www.service.ManagerService;
import com.hphfarm.www.service.ProductService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	ManagerService managerService;
	// =========================== 한희태 ===========================
	@Autowired
	FarmService farmService;

	// 관리자 메인
	@RequestMapping("/manager_index")
	public String index(Model model) {
		Map<String, Object> map = managerService.mainData();

		model.addAttribute("map", map);
		return "manager/manager_index";
	}

	// 관리자 농장 목록
	@RequestMapping("/man_farm_list")
	public String farmlist(NumberDto nDto, Model model) {
		Map<String, Object> map = farmService.man_farm_list(nDto);

		model.addAttribute("map", map);
		return "manager/man_farm_list";
	}

	// 관리자 농장 등록&수정 신청 목록
	@RequestMapping("/man_farm_regi_list")
	public String farmRegiList(NumberDto nDto, Model model) {
		Map<String, Object> map = farmService.man_farm_regi_list(nDto);

		model.addAttribute("map", map);

		return "manager/man_farm_regi_list";
	}

	// 관리자 농장 등록&수정 신청 상세보기
	@RequestMapping("/man_farm_regi_view")
	public String farmregiView(@RequestParam("fr_no") int frno, Model model) {
		FarmDto fDto = farmService.man_farm_regi_view(frno);

		model.addAttribute("fDto", fDto);
		return "manager/man_farm_regi_view";
	}

	// 관리자 농장 등록&수정 신청 반려
	@RequestMapping("/regi_delete")
	public String regiDelete(@RequestParam("fr_no") int frno) {
		int result = farmService.regi_delete(frno);
		return "redirect:./man_farm_regi_list";
	}

	// 관리자 농장 등록&수정 신청 수락
	@RequestMapping("/success_farm_regi")
	public String regiDelete(FarmDto fDto) {
		int result = farmService.regi_success(fDto);
		return "redirect:./man_farm_regi_list";
	}

	// 관리자 농장 예약 목록
	@RequestMapping("/man_farm_reser_list")
	public String farmReserList(NumberDto nDto, Model model) {
		Map<String, Object> map = farmService.man_freser_list(nDto);

		model.addAttribute("map", map);
		return "manager/man_farm_reser_list";
	}

	// 관리자 1:1문의 목록
	@RequestMapping("/man_user_inquiry")
	public String manuserinquiry(Model model) {
		List<MemberDto> list = managerService.inquiryList();
		model.addAttribute("list", list);
		return "manager/man_user_inquiry";
	}

	// 관리자 1:1문의 확인
	@RequestMapping("/man_inquiry_view")
	public String maninquiryView(@RequestParam("ci_no") int ci_no, Model model) {
		MemberDto mDto = managerService.inquiryView(ci_no);
		System.out.println(mDto);
		model.addAttribute("mDto", mDto);
		return "manager/man_inquiry_view";
	}

	// 관리자 1:1 문의 답장 메일
	@RequestMapping("/replyInquiry")
	public String replyInquiry(ManagerDto mDto, Model model) {
		managerService.sendReply(mDto);
		int result = managerService.insertSendReply(mDto);
		model.addAttribute(result);
		return "manager/man_user_inquiry";
	}

	// =========================== 황선필 ===========================

	// 관리자 상품 관리
	@GetMapping("/man_product_list")
	public String product(NumberDto numberDto, Model model) {
		Map<String, Object> map = null;
		map = managerService.productList(numberDto);

		int c1 = managerService.productCategory1();
		int c2 = managerService.productCategory2();
		int c3 = managerService.productCategory3();
		int c4 = managerService.productCategory4();

		model.addAttribute("map", map);
		model.addAttribute("c1", c1);
		model.addAttribute("c2", c2);
		model.addAttribute("c3", c3);
		model.addAttribute("c4", c4);

		return "manager/man_product_list";
	}// 관리자 상품 관리

	// 관리자 상품 등록 페이지
	@GetMapping("/man_product_reg")
	public String productreg(ProductDto productDto, Model model) {

		return "manager/man_product_reg";
	}// 관리자 상품 등록 페이지

	// 관리자 상품 등록 기능
	@RequestMapping("/do_man_product_reg")
	public String doproductreg(ProductDto productDto, MultipartFile file, MultipartFile files1, MultipartFile files2,
			MultipartFile files3, MultipartFile files4, MultipartFile files5, Model model) {
		ProductDto productDto2 = managerService.formatFiles(productDto, file, files1, files2, files3, files4, files5);
		int result = 0;
		result = managerService.insertProduct(productDto2);
		model.addAttribute("result", result);
		return "manager/man_product_reg";
	}// 관리자 상품 등록 기능

	// 주문취소관리
	@RequestMapping("/man_pur_list")
	public String purchaselist(Model model) {

		// pppclist의 주문취소
		List<PPPCDto> pppclist = managerService.selectCancel();

		// pppclist에 결제내역 정보 입력
		for (PPPCDto c : pppclist) {
			int py_no = c.getCancelDto().getPy_no();
			PPPCDto pppcpydto = managerService.selectPayList(py_no);
			PayDto pydto = pppcpydto.getPayDto();
			c.setPayDto(pydto);
		}

		// ppplist에 구매내역 정보 입력
		for (PPPCDto py : pppclist) {
			int py_no = py.getPayDto().getPy_no();
			List<PPPCDto> pldto = managerService.selectPurchaseList(py_no);
			py.setPppcDtos(pldto);
		}

		// ppplist에 물품 정보 입력
		for (PPPCDto p1 : pppclist) {

			for (PPPCDto p2 : p1.getPppcDtos()) {
				int p_no = p2.getPurchaseListDto().getP_no();
				PPPCDto pppcpdto = managerService.selectProductList(p_no);
				ProductDto pdto = pppcpdto.getProductDto();
				p2.setProductDto(pdto);

			}
		}

		model.addAttribute("pppclist", pppclist);

		return "manager/man_pur_list";

	}// 주문취소관리

	// 상품 삭제
	@RequestMapping("/man_product_del")
	public String man_product_del(ProductDto productDto, Model model) {
		int result = managerService.deleteProduct(productDto);
		model.addAttribute("result", result);
		return "manager/man_product_del";
	}

	// 30
	// 상품 승인
	@RequestMapping("/man_product_appr")
	public String man_product_appr(CancelDto cancelDto, Model model) {
		// cno만 받아온다.
		int c_no = cancelDto.getC_no();

		// appr만 canceldto 부분에서 y로 승인한다.
		int result1 = managerService.manappr(cancelDto);
		if (result1 != 0) {
			// 관련 거래의 결제 내역과, 구매내역의 상태를 변화.//30
			managerService.upadatePay(c_no);
			managerService.upadatePurchaseList(c_no);
		}

		return "redirect:man_pur_list";
	}

	// =========================== 김영환 ===========================

	// 11/26 수정
	@Autowired
	BoardService boardService;
	// 관리자 확인

	// 커뮤니티 게시판 view
	@RequestMapping("/man_board_comm")
	public String man_board_comm(Model model, BoardDto boardDto, NumberDto nDto) {
		Map<String, Object> map = boardService.boardManListOne(boardDto);
		
		model.addAttribute("nDto", nDto);
		model.addAttribute("map", map);
		
		
	return "manager/man_board_comm";
	}

	  @ResponseBody //관리자 커뮤니티 댓글삭제
	  @RequestMapping("/man_board_View_comm_delete") 
	  public int man_board_View_comm_delete(BoardDto boardDto) {
	  
	  int result = boardService.board_Report_Comm_Delete(boardDto); 
	  return result;
	  }
	  
	  // 관리자 커뮤니티 게시글 삭제
	  
	  @RequestMapping("/man_board_View_delete") public String
	  man_board_View_delete(BoardDto boardDto) {
	  
	  int result =boardService.board_user_delete(boardDto);
	  
	  return "redirect:./man_board_list";
	  
	 
	  }
	 



	// 커뮤니티 게시판 list
	@RequestMapping("/man_board_list")
	public String man_board_list(NumberDto numberDto, Model model) {
		

			
			if(numberDto.getCategory()=="") 
			{ numberDto.setCategory("bt_title");
			}
			if(numberDto.getSearchword()=="") 
			{ numberDto.setSearchword(null);}


			Map<String,Object> map = boardService.board_Man_BoardList(numberDto);

		
			model.addAttribute("map", map);
		
		
		
	return "manager/man_board_list";
	}
	
	//관리자 공지 게시글 작성
	@RequestMapping("/man_public_board_write")
	public String man_public_board_write(HttpServletRequest request , Model model) {
	//게시글 쓰기
	//request.getSession("")

	return "manager/man_public_board_write";
	}

	// 관리자 공지 게시글 저장
	@RequestMapping("/man_public_write")
	public String man_public_write(BoardDto boardDto,
		@RequestPart MultipartFile file) {
	//게시글 1개 저장:insert
	//파일이름 가져오기

	String newFileName="";
	if(file.getSize() !=0) {
		String originFileName = file.getOriginalFilename();
		long time = System.currentTimeMillis();
		//중복방지 파일이름 생성
		newFileName = String.format("%d_%s", time,originFileName);
		//파일 저장 위치
		String fileSaveUrl="C:/fileSave/";
		//파일생성 c:/fileSave/1.jpg
		File f = new File(fileSaveUrl+newFileName);
		//파일 업로드
		try {
			file.transferTo(f);	
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//파일이름 dto저장
	boardDto.setBn_upload(newFileName);
	int result = boardService.board_Public_Write(boardDto);
	return "redirect:./man_public_board_list"; 


	}
	//공지 게시글 불러오기(수정)
	@RequestMapping("/man_public_modify_view")
	public String man_public_modify_view(@RequestParam int bn_no,Model model){
	Map<String, Object> map = boardService.boardNoticeOne(bn_no); 
	model.addAttribute("map", map);
	return "manager/man_public_modify_view";
	}

	//공지 게시글 수정
	@RequestMapping("/man_public_modify")
	public String man_public_modify(BoardDto boardDto,@RequestPart MultipartFile file) {
	String newFileName="";
	if(file.getSize()!=0) {
		String orginFileName = file.getOriginalFilename();
		long time = System.currentTimeMillis();
		newFileName = String.format("%d_%s",time,orginFileName);
		String fileSaveUrl = "C:/fileSave/";
		File f = new File(fileSaveUrl+newFileName);
		boardDto.setBn_upload(newFileName);
		try {
			file.transferTo(f);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	int result = boardService.board_public_modify(boardDto);
	return "redirect:./man_public_board_view?bn_no="+boardDto.getBn_no();
	}

		
	
	
	// 공지사항 리스트 22
	@RequestMapping("/man_public_board_list")
	public String man_public_board_list(NumberDto numberDto,Model model) 
	 {
			if(numberDto.getCategory()=="") {
				numberDto.setCategory("bn_title");
				
			}
			if(numberDto.getSearchword()=="") {
				numberDto.setSearchword(null);
		
			}
			  
			  Map<String, Object> map = boardService.list(numberDto);
				model.addAttribute("map",map);

	  
	return "manager/man_public_board_list";
	}
	
		//공지사항 삭제
	@RequestMapping("/delete_board_notice")
	public String delete(@RequestParam int bn_no) {
	int result = boardService.delete_board_notice(bn_no);
	return "redirect:./man_public_board_list";
	}

	// 공지사항 view
	@RequestMapping("/man_public_board_view")
	public String man_public_board_view(@RequestParam int bn_no,
		NumberDto nDto, Model model) {
	Map<String, Object> map = boardService.boardNoticeOne(bn_no);
	model.addAttribute("map",map);
	model.addAttribute("nDto",nDto);	
	return "manager/man_public_board_view";
	}
	
	

	// 신고 게시글 list
	@RequestMapping("/man_board_report_list")
	public String man_board_report_list(Model model, NumberDto numberDto,BoardDto boardDto) {
		if(numberDto.getCategory()=="") 
		{ numberDto.setCategory("bt_title");
		}
		if(numberDto.getSearchword()=="") 
		{ numberDto.setSearchword(null);}
		Map<String, Object> map = boardService.board_Report_list(numberDto);
		
		
		model.addAttribute("map", map);
	return "manager/man_board_report_list";
	}

	
	// 신고 게시글 view
	@RequestMapping("/man_board_report_comm")
	public String man_board_report_comm(Model model, BoardDto boardDto, NumberDto nDto) {
		
		Map<String, Object> map = boardService.boardReportOne(boardDto);
		
		model.addAttribute("nDto", nDto);
		model.addAttribute("map", map);

	return "manager/man_board_report_comm";
	}

		//신고 게시글 댓글 삭제
	@ResponseBody //댓글삭제
	@RequestMapping("/man_board_report_comm_delete")
	public int man_board_report_comm_delete(BoardDto boardDto) {
	
		int result = boardService.board_Report_Comm_Delete(boardDto);
		return result;
	}
	
	// 신고 게시글 삭제
	  @RequestMapping("/man_board_report_delete") 
	  public String man_board_report_delete(BoardDto boardDto) {
	  
	  	  int result =boardService.board_user_delete(boardDto);
	
	  	  return "redirect:./man_board_report_list";
	  
	
	 }
	
		/////////////////////////////////////////////////
		// 정보 게시판 리스트
	  	
		@RequestMapping("/man_info_board_list")
		public String man_info_board_list(NumberDto numberDto,Model model) {
			if(numberDto.getCategory()=="") {
				numberDto.setCategory("bn_title");
				
			}
			if(numberDto.getSearchword()=="") {
				numberDto.setSearchword(null);
				
			}
			
			Map<String, Object> map = boardService.infolist(numberDto);
			model.addAttribute("map",map);
			
			
			return "manager/man_info_board_list";
		}
		
		// 	정보 게시판 view
		@RequestMapping("/man_info_board_view")
		public String man_info_board_view(@RequestParam int bn_no,
				NumberDto nDto, Model model) {
			Map<String, Object> map = boardService.boardinfoOne(bn_no);
			model.addAttribute("map",map);
			model.addAttribute("nDto",nDto);	
			return "manager/man_info_board_view";
		}
		
		// 정보 게시글 삭제
		@RequestMapping("/delete_board_info")
		public String delete_board_info(@RequestParam int bn_no) {
			int result = boardService.delete_board_notice(bn_no);
			return "redirect:./man_info_board_list";
		}
		
		
		//정보 게시글 불러오기(수정)
		@RequestMapping("/man_info_modify_view")
		public String man_info_modify_view(@RequestParam int bn_no,Model model){
			Map<String, Object> map = boardService.boardinfoOne(bn_no); 
			model.addAttribute("map", map);
			return "manager/man_info_modify_view";
		}
		
		
		
		//정보 게시글 수정
		@RequestMapping("/man_info_modify")
		public String man_info_modify(BoardDto boardDto,@RequestPart MultipartFile file) {
			String newFileName="";
			if(file.getSize()!=0) {
				String orginFileName = file.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s",time,orginFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl+newFileName);
				boardDto.setBn_upload(newFileName);
				try {
					file.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			int result = boardService.board_public_modify(boardDto);
			return "redirect:./man_info_board_view?bn_no="+boardDto.getBn_no();
		}
		
		
		
		// 관리자 수정 게시글 저장
		@RequestMapping("/man_info_write")
		public String man_info_write(BoardDto boardDto,
				@RequestPart MultipartFile file) {
			//게시글 1개 저장:insert
			//파일이름 가져오기
			
			String newFileName="";
			if(file.getSize() !=0) {
				String originFileName = file.getOriginalFilename();
				long time = System.currentTimeMillis();
				//중복방지 파일이름 생성
				newFileName = String.format("%d_%s", time,originFileName);
				//파일 저장 위치
				String fileSaveUrl="C:/fileSave/";
				//파일생성 c:/fileSave/1.jpg
				File f = new File(fileSaveUrl+newFileName);
				//파일 업로드
				try {
					file.transferTo(f);	
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			//파일이름 dto저장
			boardDto.setBn_upload(newFileName);
			int result = boardService.board_info_Write(boardDto);
			return "redirect:./man_info_board_list"; 					
		}
		
		//관리자 정 게시글 작성
		@RequestMapping("/man_info_board_write")
		public String man_info_board_write(HttpServletRequest request , Model model) {
			//게시글 쓰기
			//request.getSession("")
			
			return "manager/man_info_board_write";
		}
	
	  
			  


	// =========================== 최건호 ===========================

	// 체험 관리자

	// 관리자페이지 : 체험 목록 확인하기 >> 체험 게시글 전체 가져오기
	@RequestMapping("/man_exp_list")
	public String man_exp_list(NumberDto numberDto, Model model) {
		// 게시글 전체 가져오기
		Map<String, Object> map = managerService.man_exp_list(numberDto);
		model.addAttribute("map", map);
		System.out.println("관리자 체험 목록의 map : " + map);
		return "/manager/man_exp_list";
	}

	// 관리자페이지 : 농장주가 수정/등록한 체험 승인여부 확인하기
	@RequestMapping("/man_exp_regi_list")
	public String man_exp_regi_list(NumberDto numberDto, Model model) {
		// 게시글 전체 가져오기
		Map<String, Object> map = managerService.man_exp_regi_list(numberDto);
		model.addAttribute("map", map);
		System.out.println("관리자 체험 수청 신청 목록의 map : " + map);

		return "/manager/man_exp_regi_list";

	}

	// 관리자 페이지 : 승인하기위한 체험 프로그램 자세히 보기
	@RequestMapping("/man_exp_view")
	public String man_exp_view(@RequestParam int e_no, Model model) {
		System.out.println("관리자 컨트롤러에서 승인하기위한 가져올 체험 프로그램 u_no : " + e_no);
		Map<String, Object> map = managerService.man_exp_viewBoardOne(e_no);
		model.addAttribute("map", map);
		System.out.println("관리자 컨트롤러에서 승인하기위한 체험 프로그램 map : " + map);
		return "/manager/man_exp_view";
	}

	// 관리자 페이지 : 승인하기위한 체험 프로그램 반려 하기
	@RequestMapping("/expRegiDelete")
	public String expRegiDelete(@RequestParam int e_no) {
		System.out.println("체험 프로그램을 반려하기위한 e_no" + e_no);
		int result = managerService.expRegiDelete(e_no);
		System.out.println("체험 프로그램 반려 결과 : " + result);

		return "redirect:./man_exp_regi_list";
	}

	// 관리자 페이지 : 승인하기위한 체험 프로그램 승인 하기
	@RequestMapping("/expRegiApprUpdate")
	public String expRegiApprUpdate(@RequestParam int e_no) {
		System.out.println("체험 프로그램을 반려하기위한 e_no" + e_no);
		int result = managerService.expRegiApprUpdate(e_no);
		System.out.println("체험 프로그램 승인 결과 : " + result);

		return "redirect:./man_exp_regi_list";
	}

	// 유저가 예약한 현황 보기
	@RequestMapping("/man_exp_book")
	public String man_exp_book(NumberDto numberDto, Model model) {
		// 게시글 전체 가져오기
		Map<String, Object> map = managerService.man_exp_book(numberDto);
		model.addAttribute("map", map);
		System.out.println("관리자 체험 수청 신청 목록의 map : " + map);

		return "/manager/man_exp_book";
	}
}
