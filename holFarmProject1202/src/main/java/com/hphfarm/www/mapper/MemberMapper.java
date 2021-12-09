package com.hphfarm.www.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.CartDto;
import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.PCDto;
import com.hphfarm.www.dto.PPPDto;

@Mapper
public interface MemberMapper {

	// =========================== 유저 ===========================

	// =========================== 황선필 ===========================

	// 로그인
	MemberDto selectLogin(MemberDto memberDto);

	// 해당 로그인 유저의 장바구니 물품들 불러오기
	List<PCDto> selectCart(int sessionuno);

	// 장바구니 삭제버튼
	int cartdel(int ct_no);

	// 디비 장바구니에 추가.
	int insertCartProduct(int p_no, int ct_num, int u_no, int ct_tp);

	// 결제부분 불러오기
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

	// =========================== 한희태 ===========================

	// 마이페이지 메인
	MemberDto selectMyInfo(int u_no);

	// 마이페이지 농장 예약 내역
	List<FarmDto> myReserList(int uno);

	// 마이페이지 농장 수정 페이지
	FarmDto myFarmUpdet(int uno);

	// 농장 수정 신청
	void farmUpdate(FarmDto fDto);

	// ========================== 최건호 =========================

	// 유저회원 회원가입하기
	int insertUserReg(MemberDto memberDto);

	// 농장주 회원 회원가입하기
	int insertFarmerReg(MemberDto memberDto);

	// 아이디 중복체크
	int idChk(MemberDto mDto) throws Exception;

	// 닉네임 중복체크
	int nicChk(MemberDto mDto);

	// 마이페이지 : 농장주 회원 체험프로그램 수정하기 위한 게시글 가져오기
	ExpDto selectRegModifyBoardOne(int u_no);

	// 마이페이지 : 농장주 회원 체험프로그램 수정하기
	int updateExp_modify(ExpDto expDto);

	// 마이페이지 : 나의 정보 수정하기
	int updateMyInfo(MemberDto memberDto);
}
