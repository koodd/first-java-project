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
import com.hphfarm.www.mapper.FarmMapper;
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

		//29
		// 회원 탈퇴를 위한 회원 정보 불러오기 기능
		@Override
		public MemberDto deleteSelectOne(int uno) {
			MemberDto mDto = memberMapper.deleteSelectOne(uno);
			
			return mDto;
		}
		
		//30
		//로그인 uno 통한 정보 얻기.
		@Override
		public MemberDto selectUserOne(int sessionuno) {
			MemberDto mDto = memberMapper.selectUserOne(sessionuno);
			return mDto;
		}
		
		//새로운 거래번호 //30
		@Override
		public int selectPy_no() {
			int py_no = memberMapper.selectPy_no();
			return py_no;
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
		
		//30
		//구매 성공시, 구매내역으로 인서트
		@Override
		public int insertPurchaseList(int pl_num, String pl_delivery, int py_no, int p_no) {
			int result = 0;
			result = memberMapper.insertPurchaseList(pl_num,pl_delivery,py_no,p_no);
			
			
			return result;
		}
		
		//01
		//상품 목록에서 수량 빼기
		@Override
		public int minusProduct(int pl_num, int p_no) {
			int resultd = 0;
			resultd = memberMapper.minusProduct(pl_num,p_no);
			return resultd;
		}
		
		
		//30
		//결제내역에 인서트
		@Override
		public int insertPay(int u_no, int py_price, int py_no) {
			
			int result1 = 0;
			result1 = memberMapper.insertPay(u_no,py_price,py_no);
			return result1;
		}
		
		//30
		//구매 성공시, //장바구니 삭제
		@Override
		public int AfterBuySuccessDeleteCart(int u_no) {
			int result3 =0;
			result3 = memberMapper.AfterBuySuccessDeleteCart(u_no);
			return result3;
		}
		
		//01
		// 회원 탈퇴 기능2
		@Override
		public int deleteUserOne(int u_no) {
			int result = 0;
			result = memberMapper.deleteUserOne(u_no);
			
			return result;
		}

	// =========================== 한희태 ===========================
	
	@Autowired
	FarmMapper farmMapper;
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
	
	// 마이페이지 농장 예약 취소
	@Override
	public void farm_res_cancel(int py_no) {
		memberMapper.res_farm_cancel(py_no);	// 농장 예약 목록 테이블 delete
		memberMapper.farm_pay_cancel(py_no);	// 결제 테이블 delete
	}

	// 마이페이지 농장 수정 페이지
	@Override
	public FarmDto my_farm_update(int uno) {
		FarmDto fDto = memberMapper.myFarmUpdet(uno);
		return fDto;
	}

	// 마이페이지 농장 수정
	@Override
	public void farmUpdet(FarmDto fDto) {
		memberMapper.farmUpdate(fDto);

	}
	
	// 농장 예약 회원 정보
	@Override
	public MemberDto reserUserinfo(int u_no) {
		MemberDto mDto = memberMapper.userInfoReser(u_no);
		return mDto;
	}

	// 마이페이지 농장 예약 현황
	@Override
	public FarmDto my_farm_reser_now(int u_no) {
		int fr_no = memberMapper.findMyFarm(u_no);
		FarmDto fDto = farmMapper.selectReserInfo(fr_no);
		String result = farmMapper.OneAccount(fr_no);
		fDto.setFrs_account(result);
		int gujwa = memberMapper.finishFarmReser(fDto.getFr_no());
		int totalPrice = gujwa*fDto.getFr_price();
		int benefit = (int) (totalPrice*0.8);
		fDto.setGujwa(gujwa);
		fDto.setTotalPrice(totalPrice);
		fDto.setBenefit(benefit);
		return fDto;
	}

	// 마이페이지 농장주 농장 예약 현황 정보 보기
	@Override
	public Map<String, Object> detailReserView(FarmDto farmDto) {
		Map<String, Object> map = new HashMap<String,Object>();
		FarmDto fDto = farmMapper.detalReserView(farmDto);
		map.put("fDto", fDto);
		return map;
	}
	
	// 1:1 문의 보내기
	@Override
	public int insert_inquiry(MemberDto mDto) {
		int result = memberMapper.insert_inquiry(mDto);
		return result;
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
		
		// 닉네임 중복체크
		@Override
		public int nicChk2(MemberDto mDto) throws Exception {
			int result = memberMapper.nicChk2(mDto);
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

		// 마이페이지 : 마이페이지 들어갈때 비밀번호 한번더 확인하기
		@Override
		public MemberDto checkPw(MemberDto memberDto) {
			MemberDto mDto = memberMapper.checkPw(memberDto);
			return mDto;
		}
		// 마이페이지 : 나(유저)의 체험 신청 내역 보기
		@Override
		public Map<String, Object> myBookList(int u_no) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<ExpDto> list = memberMapper.myBookList(u_no);
			map.put("list", list);
			return map;
		}
		// 마이페이지 : (농장주)가 보는 유저의 신청내역 보기
		@Override
		public Map<String, Object> myExpBookList(int u_no) {
			Map<String, Object> map = new HashMap<String, Object>();
			// 마이페이지 : (농장주)가 보는 유저의 신청내역 보기 에 필요한 e_no 뽑기	
			int e_no = memberMapper.findMyEno(u_no);
			// 마이페이지 : (농장주)가 보는 유저의 신청내역 보기 에서 총 결제 합 뽑기
			ExpDto eDto = memberMapper.selectMyReceiveMoney(u_no);
			/* System.out.println("멤버서비스 임플의 eDto :" + eDto); */
			List<ExpDto> list = memberMapper.myExpBookList(u_no,e_no);
			eDto.setExpBenefit((int)(eDto.getTotalPrice()*0.8));
			map.put("list", list);
			map.put("eDto", eDto);
			/* System.out.println("멤버서비스임플 의 map : " + map); */
			
			return map;
		}
		// 마이페이지 : 마이페이지에서 나의 체험 예약 취소하기
		@Override
		public int cancelExpReser(int eno, int uno) {
			int result = memberMapper.updateCancelExpReser(eno, uno);
			return result;
		}





	

}
