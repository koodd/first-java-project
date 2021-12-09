package com.hphfarm.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.CartDto;
import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.PCDto;
import com.hphfarm.www.dto.PPPDto;
import com.hphfarm.www.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	// =========================== 황선필 ===========================

	// 로그인
	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto mDto = memberMapper.selectLogin(memberDto);

		return mDto;
	}

	// 해당 로그인 유저의 장바구니 물품들 불러오기
	@Override
	public List<PCDto> selectCart(int sessionuno) {
		List<PCDto> cartno = memberMapper.selectCart(sessionuno);

		return cartno;
	}

	// 장바구니 삭제버튼
	@Override
	public int cartdel(int ct_no) {
		int result = 0;
		result = memberMapper.cartdel(ct_no);

		return result;
	}

	// 디비 장바구니에 추가.
	@Override
	public int insertCartProduct(int pno1, int ct_num, int sessionuno, int cttp) {
		int p_no = pno1;
		int u_no = sessionuno;
		int ct_tp = cttp;
		int result2 = 0;
		result2 = memberMapper.insertCartProduct(p_no, ct_num, u_no, ct_tp);

		return result2;
	}

	// 결제정보
	@Override
	public List<PPPDto> selectPayList(int u_no) {
		List<PPPDto> pylist = memberMapper.selectPayList(u_no);

		return pylist;
	}

	// 구매내역부분 불러오기
	@Override
	public List<PPPDto> selectPurchaseList(int py_no) {
		List<PPPDto> pllist = memberMapper.selectPurchaseList(py_no);

		return pllist;
	}

	// 물품정보부분 불러오기
	@Override
	public PPPDto selectProductList(int p_no) {
		PPPDto ppppdto = memberMapper.selectProductList(p_no);

		return ppppdto;
	}

	// 상품 취소 실행
	@Override
	public int insertCancel1(CancelDto cancelDto) {
		int result = 0;
		result = memberMapper.insertCancel1(cancelDto);

		return result;
	}

	// 상품 반품 실행
	@Override
	public int insertCancel2(CancelDto cancelDto) {
		int result = 0;
		result = memberMapper.insertCancel2(cancelDto);

		return result;
	}

	// 상품 교환 실행
	@Override
	public int insertCancel3(CancelDto cancelDto) {
		int result = 0;
		result = memberMapper.insertCancel3(cancelDto);

		return result;
	}

	// 주문 취소,반품,교환 신청후 구매내역 상태 처리중으로 전환
	@Override
	public void updatePurchaseListPlStatus(int py_no) {
		memberMapper.updatePurchaseListPlStatus(py_no);
	}

	// pclist에 물품 정보 입력할 물품 정보 불러오기
	@Override
	public PCDto selectProductList2(int p_no) {
		PCDto pcpdto = memberMapper.selectProductList2(p_no);

		return pcpdto;
	}

	// 장바구니 update
	@Override
	public int cartupdate(CartDto cartDto) {
		int result = 0;
		result = memberMapper.cartupdate(cartDto);
		
		return result;
	}

	// =========================== 한희태 ===========================

	// 마이페이지 메인
	@Override
	public MemberDto my_info(int u_no) {
		MemberDto mDto = memberMapper.selectMyInfo(u_no);
		return mDto;
	}

	// 마이페이지 농장 예약 내역
	@Override
	public Map<String, Object> myReserList(int uno) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<FarmDto> list = memberMapper.myReserList(uno);
		map.put("list", list);
		return map;
	}

	// 마이페이지 농장 수정 페이지
	@Override
	public FarmDto my_farm_update(int uno) {
		FarmDto fDto = memberMapper.myFarmUpdet(uno);
		return fDto;
	}

	//
	@Override
	public void farmUpdet(FarmDto fDto) {
		memberMapper.farmUpdate(fDto);

	}

	// =========================== 최건호 ===========================

	// 유저회원 회원가입하기
	@Override
	public int userReg(MemberDto memberDto) {
		int result = memberMapper.insertUserReg(memberDto);
		System.out.println("유저 회원가입 결과 : " + result);
		return result;
	}

	// 농장주 회원 회원가입하기
	@Override
	public int farmerReg(MemberDto memberDto) {
		int result = memberMapper.insertFarmerReg(memberDto);
		System.out.println("농장주 회원 가입 결과 : " + result);
		return result;
	}

	// 아이디 중복체크
	@Override
	public int idChk(MemberDto mDto) throws Exception {
		int result = memberMapper.idChk(mDto);
		return result;
	}

	// 닉네임 중복체크
	@Override
	public int nicChk(MemberDto mDto) throws Exception {
		int result = memberMapper.nicChk(mDto);
		return result;
	}

	// 마이페이지 : 농장주 회원 체험프로그램 수정하기 위한 게시글 가져오기
	@Override
	public Map<String, Object> regModifyBoardOne(int u_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		ExpDto eDto = memberMapper.selectRegModifyBoardOne(u_no);
		map.put("eDto", eDto);
		return map;
	}

	// 마이페이지 : 농장주 회원 체험프로그램 수정하기
	@Override
	public int exp_modify(ExpDto expDto) {
		int result = memberMapper.updateExp_modify(expDto);
		return result;
	}

	// 마이페이지 : 나의 회원정보 수정하기
	@Override
	public int infoUpdet(MemberDto memberDto) {
		int result = memberMapper.updateMyInfo(memberDto);
		System.out.println("나의정보수정 서비스임플 result : " + result);
		return result;
	}

}
