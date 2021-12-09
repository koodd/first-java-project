package com.hphfarm.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.CartDto;
import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.PCDto;
import com.hphfarm.www.dto.PPPDto;

public interface MemberService {

	// =========================== 회원 ===========================

	// =========================== 황선필 ===========================

	// 로그인 체크
		MemberDto login(MemberDto memberDto);
		
		//29
		// 회원 탈퇴를 위한 회원 정보 불러오기 기능
		MemberDto deleteSelectOne(int u_no);
		
		//30
		//로그인 uno 통한 정보 얻기.
		MemberDto selectUserOne(int sessionuno);
		
		//새로운 거래번호 //30
		int selectPy_no();
		

		// 해당 로그인 유저의 장바구니 물품들 불러오기
		List<PCDto> selectCart(int sessionuno);

		// 장바구니 삭제버튼
		int cartdel(int ct_no);

		// 디비 장바구니에 추가.
		int insertCartProduct(int pno1, int ct_num, int sessionuno, int cttp);

		// 결제내역부분 불러오기
		List<PPPDto> selectPayList(int u_no);

		// 구매내역부분 불러오기
		List<PPPDto> selectPurchaseList(int py_no);

		// 물품정보부분 불러오기
		PPPDto selectProductList(int p_no);

		// 상품 취소 실행
		int insertCancel1(CancelDto cancelDto);

		// 상품 반품 실행
		int insertCancel2(CancelDto cancelDto);

		// 상품 교환 실행
		int insertCancel3(CancelDto cancelDto);

		// 주문 취소,반품,교환 신청후 구매내역 상태 처리중으로 전환
		void updatePurchaseListPlStatus(int py_no);

		// pclist에 물품 정보 입력할 물품 정보 불러오기
		PCDto selectProductList2(int p_no);

		// 장바구니 update
		int cartupdate(CartDto cartDto);
		
		//30
		//구매 성공시, 구매내역으로 인서트
		int insertPurchaseList(int pl_num, String pl_delivery, int py_no, int p_no);
		
		//30
		//구매 성공시, //결제내역에 인서트
		int insertPay(int u_no, int py_price, int py_no);
		
		//01
		//상품 목록에서 수량 빼기
		int minusProduct(int pl_num, int p_no);
		
		
		//30
		//구매 성공시, //장바구니 삭제
		int AfterBuySuccessDeleteCart(int u_no);
		
		
		//01
		// 회원 탈퇴 기능2
		int deleteUserOne(int u_no);

	// =========================== 한희태 ===========================

	// 마이페이지 메인 유저 정보 불러오기
	MemberDto my_info(int u_no);

	// 마이페이지 농장 예약 내역
	Map<String, Object> myReserList(int uno);

	// 마이페이지 농장 수정 페이지
	FarmDto my_farm_update(int uno);

	// 농장 정보 수정
	void farmUpdet(FarmDto fDto);
	
	// 농장 예약 회원 정보
	MemberDto reserUserinfo(int u_no);
	
	// 마이페이지 농장 예약 취소
	void farm_res_cancel(int py_no);
	
	// 마이페이지 농장 예약 현황
	FarmDto my_farm_reser_now(int u_no);
	
	// 마이페이지 농장주 농장 예약 현황 정보 보기
	Map<String, Object> detailReserView(FarmDto fDto);

	// 1:1 문의 보내기
	int insert_inquiry(MemberDto mDto);
	
	// =========================== 최건호 ===========================

	// 유저회원 회원가입하기
		int userReg(MemberDto memberDto);

		// 농장주회원 회원가입하기
		int farmerReg(MemberDto memberDto);

		// 아이디 중복체크
		int idChk(MemberDto mDto) throws Exception;

		// 닉네임 중복 체크
		int nicChk(MemberDto mDto) throws Exception;
		
		// 닉네임 중복 체크
		int nicChk2(MemberDto mDto) throws Exception;

		// 마이페이지 : 농장주 회원 체험프로그램 수정하기 위한 게시글 가져오기
		Map<String, Object> regModifyBoardOne(int u_no);

		// 마이페이지 : 농장주 회원 체험프로그램 수정하기
		int exp_modify(ExpDto expDto);

		// 마이페이지 : 나의 회원정보 수정하기
		int infoUpdet(MemberDto memberDto);

		// 마이페이지 : 마이페이지 들어갈때 비밀번호 한번더 확인하기
		MemberDto checkPw(MemberDto memberDto);
		
		// 마이페이지 : 나(유저)의 체험 신청 내역 보기
		Map<String, Object> myBookList(int u_no);
		
		// 마이페이지 : (농장주)가 보는 유저의 신청내역 보기
		Map<String, Object> myExpBookList(int u_no);
		
		// 마이페이지 : 마이페이지에서 나의 체험 예약 취소하기
		int cancelExpReser(int eno, int uno);

	
}
