package com.hphfarm.www.controller;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.CartDto;
import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.PCDto;
import com.hphfarm.www.dto.PPPDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.service.BoardService;
import com.hphfarm.www.service.EmailService;
import com.hphfarm.www.service.FarmService;
import com.hphfarm.www.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	EmailService emailService;

	@Autowired
	MemberService memberService;

	@Autowired
	FarmService farmService;
	
	@Autowired
	BoardService boardService;
	// =========================== 한희태 ===========================

	// 마이페이지 농장 예약 목록
	@RequestMapping("/my_farm_Reser_List")
	public String farmReserList(@RequestParam("u_no") int uno, Model model) {
		Map<String, Object> map = memberService.myReserList(uno);

		model.addAttribute("map", map);
		return "member/my_farm_Reser_List";
	}

	// 마이페이지 농장주 농장 예약 현황
	@RequestMapping("/my_farm_Reser_Now")
	public String farmReserNow() {
		return "member/my_farm_Reser_Now";
	}

	// 마이페이지 메인
	@RequestMapping("/my_index")
	public String my_index(@RequestParam("u_no") int u_no, Model model) {

		MemberDto mDto = memberService.my_info(u_no);

		model.addAttribute("mDto", mDto);
		return "member/my_index";
	}

	// 마이페이지 농장주 농장정보 수정 페이지
	@RequestMapping("/my_farm_Updet")
	public String myfarmReserUpdet(@RequestParam("s_uno") int uno, Model model) {
		FarmDto fDto = memberService.my_farm_update(uno);
		model.addAttribute("fDto", fDto);
		return "member/my_farm_Updet";
	}

	// 마이페이지 농장주 농장정보 수정 기능
	@RequestMapping("/farm_do_updet")
	public String farmUpdate(FarmDto fDto, MultipartFile certi_file, MultipartFile thumb_file, MultipartFile subfile,
			MultipartFile subfile2, MultipartFile subfile3, MultipartFile subfile4) {
		FarmDto fDtofile = farmService.farmRegiFile(fDto, certi_file, thumb_file, subfile, subfile2, subfile3,
				subfile4);
		memberService.farmUpdet(fDtofile);

		return "member/my_farm_Updet_ok";
	}

	// 마이페이지 회원정보 수정
	@RequestMapping("/my_info_updet")
	public String my_info_updet(@RequestParam int u_no, Model model) {
		MemberDto mDto = memberService.my_info(u_no);

		model.addAttribute("mDto", mDto);
		return "member/my_info_updet";
	}

	// =========================== 황선필 ===========================

	// 로그인 페이지 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	// 로그인 기능
	@ResponseBody
	@PostMapping("/login")
	public int login(MemberDto memberDto, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDto mDto = memberService.login(memberDto);
		int loginCheck = 0;
		if (mDto != null) {
			loginCheck = 1;
			session.setAttribute("session_id", mDto.getU_id());
			session.setAttribute("session_nickname", mDto.getU_nickname());
			session.setAttribute("session_ucno", mDto.getUc_no());
			session.setAttribute("session_uno", mDto.getU_no());
		}
		return loginCheck;
	}// login

	// 로그아웃 기능
	@GetMapping("/logout")
	public String logout() {
		return "member/logout";
	}// 로그아웃 기능

	// 장바구니
	@RequestMapping("/my_cart")
	public String cart(@RequestParam(required = false, defaultValue = "0") int totalprice,
			@RequestParam(required = false, defaultValue = "0") int selectamount,
			@RequestParam(required = false, defaultValue = "0") int place,
			@RequestParam(required = false, defaultValue = "0") int refreshchk, ProductDto productDto,
			HttpServletRequest request, Model model) {

		int sessionuno = 0;

		HttpSession session = request.getSession();
		if (session.getAttribute("session_uno") != null) {

			sessionuno = (int) session.getAttribute("session_uno");
		}

		System.out.println("장바구니 메소드 place:" + place);

		// 전 페이지의 상품 번호
		int pno1 = productDto.getP_no();

		// 전 페이지의 상품 가격
		int pprice1 = productDto.getP_price();

		// 구매내역 체크 변수

		int result2 = 0;

		// 상품번호를 전페이지에서 갖고 오는 한 장바구니에 입력.
		if (pno1 != 0) {

			int ct_num = 0;
			ct_num = selectamount;
			int cttp = ct_num * pprice1;
			result2 = memberService.insertCartProduct(pno1, ct_num, sessionuno, cttp);
		}

		// cart list 불로오는 메소드
		List<PCDto> pclist = memberService.selectCart(sessionuno);

		// pclist에 물품 정보 입력
		for (PCDto pc : pclist) {
			int p_no = pc.getCartDto().getP_no();
			PCDto pcpdto = memberService.selectProductList2(p_no);
			ProductDto productDto2 = pcpdto.getProductDto();
			pc.setProductDto(productDto2);
		}

		// 상품들 총가격들의 합
		int totalcttp = 0;
		for (PCDto i : pclist) {
			int cttp1 = i.getCartDto().getCt_tp();

			totalcttp += cttp1;
		}

		model.addAttribute("totalprice", totalprice);
		model.addAttribute("selectamount", selectamount);
		model.addAttribute("place", place);
		model.addAttribute("pclist", pclist);
		model.addAttribute("totalcttp", totalcttp);
		model.addAttribute("result2", result2);
		model.addAttribute("refreshchk", refreshchk);

		return "member/my_cart";
	}// 장바구니

	// 장바구니 update
	@RequestMapping("/cartupdate")
	@ResponseBody
	public int cartupdate(CartDto cartDto) {

		System.out.println("ctno:" + cartDto.getCt_no());
		System.out.println("ctnum:" + cartDto.getCt_num());
		System.out.println("cttp:" + cartDto.getCt_tp());
		int result = 0;

		result = memberService.cartupdate(cartDto);

		return result;
	}// 장바구니 cartupdate

	// 장바구니 삭제버튼
	@RequestMapping("/cartdel")
	@ResponseBody
	public int cartdel(@RequestParam int ct_no) {

		System.out.println("ct_no:" + ct_no);
		int result = 0;

		result = memberService.cartdel(ct_no);

		return result;
	}// 장바구니 삭제버튼

	// 상품 구매내역
	@RequestMapping("/my_pur_list")
	public String purchaselist(HttpServletRequest request, Model model) {

		int u_no = 0;
		// Date 예비용
		LocalDate today = LocalDate.now();
		Date now = Date.valueOf(today);
		System.out.println("koreatime:" + now);

		HttpSession session = request.getSession();
		if (session.getAttribute("session_uno") != null) {

			u_no = (int) session.getAttribute("session_uno");
		}

		// 결제 테이블 정보 뽑아내기
		List<PPPDto> ppplist = memberService.selectPayList(u_no);

		// ppplist에 구매내역 정보 입력
		for (PPPDto py : ppplist) {
			int py_no = py.getPayDto().getPy_no();
			List<PPPDto> pldto = memberService.selectPurchaseList(py_no);
			// test1
			for (PPPDto pl : pldto) {
				System.out.println("pldto pl num:" + pl.getPurchaseListDto().getPl_num());

			}
			py.setPppDtos(pldto);
		}
		
		// test2
		for (PPPDto pl : ppplist) {
			for (PPPDto l1 : pl.getPppDtos()) {
				System.out.println("pldto pl num:" + l1.getPurchaseListDto().getPl_num());

			}

		}

		// ppplist에 물품 정보 입력
		for (PPPDto p1 : ppplist) {
			for (PPPDto p2 : p1.getPppDtos()) {
				int p_no = p2.getPurchaseListDto().getP_no();
				PPPDto ppppdto = memberService.selectProductList(p_no);
				ProductDto pdto = ppppdto.getProductDto();
				p2.setProductDto(pdto);

			}
		}
		
		// test3
		for (PPPDto p1 : ppplist) {
			for (PPPDto p2 : p1.getPppDtos()) {
				System.out.println("p1 p2 pnum:" + p2.getProductDto().getP_name());

			}

		}
		model.addAttribute("ppplist", ppplist);

		return "member/my_pur_list";
	}// 상품 구매내역

	// 상품 구매하기(장바구니 통해서)
	@RequestMapping("/my_pur_do")
	public String my_pur_do(@RequestParam List<Integer> p_no, @RequestParam List<Integer> pl_num, Model model) {
		// 구매내역에 받아올 pno, plnum 리스트 출력 성공.
		for (int pno1 : p_no) {
			System.out.println("pnolist:" + pno1);
		}
		for (int pnum1 : pl_num) {
			System.out.println("pnumlist:" + pnum1);
		}

		return "member/my_pur_list";
	}

	// 상품 취소
	@RequestMapping("/my_pur_write")
	public String my_pur_write(@RequestParam int py_no, Model model) {

		System.out.println("pwrite:" + py_no);

		model.addAttribute("py_no", py_no);

		return "member/my_pur_write";
	}// 상품 취소

	// 상품 취소 실행
	@RequestMapping("/do_my_pur_write")
	public String do_my_pur_write(CancelDto cancelDto, MultipartFile file, Model model) {
		System.out.println("dopwrite:" + cancelDto.getPy_no());
		int py_no = cancelDto.getPy_no();

		// 이미지 파일 포맷
		String newFileName = "";
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); // 01241514545512
			// 중복방지 파일이름생성
			newFileName = String.format("%d_%s", time, originFileName);
			// 파일 저장 위치
			String fileSaveUrl = "C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl + newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 파일이름 dto저장
		cancelDto.setC_pic(newFileName);

		int result = 0;
		result = memberService.insertCancel1(cancelDto);
		System.out.println("result1:" + result);
		if (result != 0) {
			memberService.updatePurchaseListPlStatus(py_no);
		}

		return "redirect:my_pur_list";
	}// 상품 취소 실행

	// 상품 반품
	@RequestMapping("/my_pur_write2")
	public String my_pur_write2(@RequestParam int py_no, Model model) {

		System.out.println("pwrite2:" + py_no);

		model.addAttribute("py_no", py_no);

		return "member/my_pur_write2";
	}// 상품 반품

	// 상품 반품 실행
	@RequestMapping("/do_my_pur_write2")
	public String do_my_pur_write2(CancelDto cancelDto, MultipartFile file, Model model) {
		int py_no = cancelDto.getPy_no();
		System.out.println("dopwrite:" + cancelDto.getPy_no());

		// 이미지 파일 포맷
		String newFileName = "";
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); // 01241514545512
			// 중복방지 파일이름생성
			newFileName = String.format("%d_%s", time, originFileName);
			// 파일 저장 위치
			String fileSaveUrl = "C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl + newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 파일이름 dto저장
		cancelDto.setC_pic(newFileName);

		int result = 0;
		result = memberService.insertCancel2(cancelDto);
		System.out.println("result2:" + result);
		if (result != 0) {
			memberService.updatePurchaseListPlStatus(py_no);
		}

		return "redirect:my_pur_list";
	}// 상품 반품 실행

	// 상품 교환
	@RequestMapping("/my_pur_write3")
	public String my_pur_write3(@RequestParam int py_no, Model model) {

		System.out.println("pwrite3:" + py_no);

		model.addAttribute("py_no", py_no);

		return "member/my_pur_write3";
	}// 상품 교환

	// 상품 교환 실행
	@RequestMapping("/do_my_pur_write3")
	public String do_my_pur_write3(CancelDto cancelDto, MultipartFile file, Model model) {
		int py_no = cancelDto.getPy_no();
		System.out.println("dopwrite:" + cancelDto.getPy_no());

		// 이미지 파일 포맷
		String newFileName = "";
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); // 01241514545512
			// 중복방지 파일이름생성
			newFileName = String.format("%d_%s", time, originFileName);
			// 파일 저장 위치
			String fileSaveUrl = "C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl + newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 파일이름 dto저장
		cancelDto.setC_pic(newFileName);

		int result = 0;
		result = memberService.insertCancel3(cancelDto);
		System.out.println("result3:" + result);
		if (result != 0) {
			memberService.updatePurchaseListPlStatus(py_no);
		}

		return "redirect:my_pur_list";
	}// 상품 교환 실행

	// =========================== 김영환 ===========================

	// 아이디 찾기
	@RequestMapping("/my_findid")
	public String my_findid() {

		return "member/my_findid";
	}

	// 비밀번호 찾기
	@RequestMapping("/my_findpw")
	public String my_findpw() {

		return "member/my_findpw";
	}



	
	

	// =========================== 최건호 ===========================

	// 회원가입 1단계 들어가기
	@RequestMapping("/step01")
	public String step01() {
		return "member/step01";
	}

	// 회원 이메일 검증하기
	@ResponseBody
	@RequestMapping("/sendEmail")
	public String sendEmail(@RequestParam String u_id, @RequestParam String u_email, @RequestParam String u_email2)
			throws Exception {
		System.out.println("이메일 인증 u_id : " + u_id);
		System.out.println("이메일 인증 u_email : " + u_email);
		System.out.println("이메일 인증 u_email2 : " + u_email2);
		// 이메일 전송 메소드
		String emailPw = emailService.sendEmail(u_id, u_email, u_email2);

		return emailPw;
	}

	// 회원가입 2단계 들어가기 (유저)
	@RequestMapping("/step02user")
	public String step02user() {
		return "member/step02user";
	}

	// 유저회원 회원가입하기
	@RequestMapping("/userReg")
	public String userReg(MemberDto memberDto) {
		int result = memberService.userReg(memberDto);
		System.out.println("유저 회원 등록 결과 : " + result);
		return "/member/step03";
	}

	// 회원가입 2단계 들어가기 (농장주)
	@RequestMapping("/step02farmer")
	public String step02farmer() {
		return "member/step02farmer";
	}

	// 농장주 회원가입
	@RequestMapping("/farmerReg")
	public String farmerReg(MemberDto memberDto) {
		int result = memberService.farmerReg(memberDto);
		System.out.println("농장주 회원 등록 결과 : " + result);
		return "/member/step03";
	}

	// 회원가입 완료
	@RequestMapping("/step03")
	public String step03() {
		return "member/step03";
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberDto mDto) throws Exception {
		int result = memberService.idChk(mDto);

		return result;
	}

	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/nicChk", method = RequestMethod.POST)
	public int nicChk(MemberDto mDto) throws Exception {
		int result = memberService.nicChk(mDto);

		return result;
	}

	// 마이페이지 : 농장주 회원 체험프로그램 수정하기 위한 게시글 가져오기
	@RequestMapping("/my_exp_regmodify")
	public String my_exp_regmodify(@RequestParam int u_no, Model model) {

		System.out.println("멤버 컨트롤러 수정할 u_no: " + u_no);
		Map<String, Object> map = memberService.regModifyBoardOne(u_no);
		model.addAttribute("map", map);
		System.out.println("멤버 컨트롤러 마이페이지 map : " + map);
		return "member/my_exp_regmodify";

	}

	// 마이페이지 : 농장주 회원 체험프로그램 수정하기
	@RequestMapping("/exp_modify")
	public String modify(ExpDto expDto, @RequestPart MultipartFile file) {
		// 게시글 1개 저장:update
		// 파일이름 가져오기
		String newFileName = "";
		if (file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); // 01241514545512
			// 중복방지 파일이름생성
			newFileName = String.format("%d_%s", time, originFileName);
			// 파일 저장 위치
			String fileSaveUrl = "C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl + newFileName);
			// 파일이름 dto저장
			expDto.setE_thumb(newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		int result = memberService.exp_modify(expDto);
		System.out.println("체험 프로그램 수정 결과 : " + result);

		return "member/my_index";
	}

	// 마이페이지 : 나(유저)의 체험 신청 내역 보기
	@RequestMapping("/my_exp_book")
	public String my_exp_book() {
		return "member/my_exp_book";
	}

	// 마이페이지 : (농장주)가 보는 유저의 신청내역 보기
	@RequestMapping("/my_exp_myBook")
	public String my_exp_myBook() {
		return "member/my_exp_myBook";
	}

	// 마이페이지 : 나의 정보 수정하기
	@RequestMapping("/infoUpdet")
	public String myInFoUpdet(MemberDto memberDto) {
		int result = memberService.infoUpdet(memberDto);
		System.out.println("나의 정보 수정 결과 : " + result);
		return "main";
	}
}
