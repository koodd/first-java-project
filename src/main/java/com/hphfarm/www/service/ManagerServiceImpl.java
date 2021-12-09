package com.hphfarm.www.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.CancelDto;
import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.ManagerDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.PPPCDto;
import com.hphfarm.www.dto.ProductDto;
import com.hphfarm.www.mapper.ManagerMapper;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	ManagerMapper managerMapper;

	// =========================== 최건호 ==============================
	// 체험 관리자
		// 관리자 페이지 : 승인하기위한 체험 프로그램 승인 하기
		@Override
		public int expRegiApprUpdate(int e_no) {
			int result = managerMapper.BoardExpRegiApprUpdate(e_no);
			return result;
		}

		// 관리자 페이지 : 승인하기위한 체험 프로그램 반려 하기
		@Override
		public int expRegiDelete(int e_no) {
			int result = managerMapper.BoardExpRegiDelete(e_no);
			return result;
		}

		// 관리자 페이지 : 승인하기위한 체험 프로그램 자세히 보기
		@Override
		public Map<String, Object> man_exp_viewBoardOne(int e_no) {
			Map<String, Object> map = new HashMap<String, Object>();
			ExpDto eDto = managerMapper.selectMan_exp_viewBoardOne(e_no);
			map.put("eDto", eDto);

			return map;
		}

		// 관리자페이지 : 체험 목록 확인하기 >> 체험 게시글 전체 가져오기
		@Override
		public Map<String, Object> man_exp_list(NumberDto numberDto) {
			Map<String, Object> map = new HashMap<String, Object>();
			// 넘버링 메소드 호출함
			NumberDto nDto = numbering(numberDto, 10);
			if (nDto.getSearchword() == null)
				System.out.println("관리자 페이지 체험프로그램의 searchword : " + nDto.getSearchword());
			else
				System.out.println("관리자 페이지 체험프로그램의 searchword No : " + nDto.getSearchword());
			// 게시글 가져오기
			List<ExpDto> list = managerMapper.man_exp_selectList(nDto.getStartrow(), nDto.getEndrow(), nDto.getCategory(),
					nDto.getSearchword());
			map.put("list", list);
			map.put("nDto", nDto);

			return map;
		}

		// 관리자페이지 : 농장주가 수정/등록한 체험 승인여부 확인하기
		@Override
		public Map<String, Object> man_exp_regi_list(NumberDto numberDto) {
			Map<String, Object> map = new HashMap<String, Object>();
			// 넘버링 메소드 호출함
			NumberDto nDto = numbering(numberDto, 10);
			if (nDto.getSearchword() == null)
				System.out.println("관리자 페이지 체험프로그램 신청의 searchword : " + nDto.getSearchword());
			else
				System.out.println("관리자 페이지 체험프로그램 신청의 searchword No : " + nDto.getSearchword());
			// 게시글 가져오기
			List<ExpDto> list = managerMapper.man_exp_regiSelectList(nDto.getStartrow(), nDto.getEndrow(),
					nDto.getCategory(), nDto.getSearchword());
			map.put("list", list);
			map.put("nDto", nDto);

			return map;
		}
		
		// 관리자 페이지 : 유저가 예약한 현황 보기
		@Override
		public Map<String, Object> man_exp_book(NumberDto numberDto) {
			Map<String, Object> map = new HashMap<String, Object>();
			// 넘버링 메소드 호출함
			NumberDto nDto = numbering(numberDto, 10);
			if (nDto.getSearchword() == null)
				System.out.println("관리자 페이지 체험프로그램의 searchword : " + nDto.getSearchword());
			else
				System.out.println("관리자 페이지 체험프로그램의 searchword No : " + nDto.getSearchword());
			// 게시글 가져오기
			List<ExpDto> list = managerMapper.man_exp_bookSelect(nDto.getStartrow(), nDto.getEndrow(), nDto.getCategory(),
					nDto.getSearchword());
			map.put("list", list);
			map.put("nDto", nDto);

			return map;
		}

		// 관리자페이지 체험 프로그램 하단 넘버링하기 - 총 게시글 수
		public NumberDto numbering(NumberDto numberDto, int li) {
			int page = 0;
			if (numberDto.getPage() == 0)
				page = 1;
			else
				page = numberDto.getPage();

			String category = numberDto.getCategory();
			System.out.println("관리자페이지 체험프로그램 목록 category : " + category);
			String searchword = numberDto.getSearchword();
			System.out.println("관리자페이지 체험프로그램 목록 searchword : " + searchword);
			// 1페이지에 나오는 게시글수 >> 체험등록 페이지는 1페이지에 3개의 게시글만 나오면 되므로 3개로 해준다.
			int limit = li;
			// 하단 넘버링 개수
			int numlimit = 10;
			// 총 게시글 수
			int listcount = managerMapper.man_exp_selectListCount(category, searchword);
			// 최대페이지
			int maxpage = (int) Math.ceil((double) listcount / limit);
			// 하단넘버링 처음수
			int startpage = (((int) (Math.ceil((double) page / numlimit) - 1))) * numlimit + 1;
			// 하단넘버링 마지막수
			int endpage = startpage + numlimit - 1;
			// 최대페이지가 마지막 페이지보다 작으면 최대페이지까지만 출력
			if (endpage > maxpage)
				endpage = maxpage;
			// 가져올 첫번째 수
			int startrow = (page - 1) * limit + 1;
			// 가져올 마지막 수
			int endrow = startrow + limit - 1;

			NumberDto nDto = new NumberDto(page, numlimit, limit, listcount, maxpage, startpage, endpage, startrow, endrow,
					category, searchword);

			return nDto;
		}

	// =========================== 황선필 ===========================

		// 주문취소관리
		@Override
		public List<PPPCDto> selectCancel() {
			List<PPPCDto> pppclist = managerMapper.selectCancel();

			return pppclist;
		}

		// 결제정보 불러오기
		@Override
		public PPPCDto selectPayList(int py_no) {
			PPPCDto pppcpydto = managerMapper.selectPayList(py_no);

			return pppcpydto;
		}

		// 구매내역부분 불러오기
		@Override
		public List<PPPCDto> selectPurchaseList(int py_no) {
			List<PPPCDto> pllist = managerMapper.selectPurchaseList(py_no);

			return pllist;
		}

		// 물품정보부분 불러오기
		@Override
		public PPPCDto selectProductList(int p_no) {
			PPPCDto ppppdto = managerMapper.selectProductList(p_no);

			return ppppdto;
		}

		// 상품 승인
		@Override
		public int manappr(CancelDto cancelDto) {
			int result = managerMapper.manappr(cancelDto);

			return result;
		}

		// 상품 승인 후 해당 유저의 거래 내역 처리완료로 바꾸기
		@Override
		public void upadatePurchaseList(int c_no) {
			managerMapper.upadatePurchaseList(c_no);

		}
		
		// 상품 승인 후 해당 유저의 결제 내역 false로 바꾸기
		@Override
		public void upadatePay(int c_no) {
			managerMapper.upadatePay(c_no);
		}
		

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
			list = managerMapper.productList(numberDto2);
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
			int c1 = managerMapper.productCategory1();
			return c1;
		}

		// 씨앗
		@Override
		public int productCategory2() {
			int c2 = managerMapper.productCategory2();
			return c2;
		}

		// 모종
		@Override
		public int productCategory3() {
			int c3 = managerMapper.productCategory3();
			return c3;
		}

		// 기타
		@Override
		public int productCategory4() {
			int c4 = managerMapper.productCategory4();
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
			int listCount = managerMapper.selectListCount(numberDto);
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

		// 상품등록
		@Override
		public int insertProduct(ProductDto productDto) {
			int result = managerMapper.insertProduct(productDto);

			return result;
		}// 상품등록

		// 업로드 이미지 포맷
		@Override
		public ProductDto formatFiles(ProductDto productDto, MultipartFile file, MultipartFile files1, MultipartFile files2,
				MultipartFile files3, MultipartFile files4, MultipartFile files5) {

			String newFileName = "";

			if (file.getSize() != 0) {
				String originFileName = file.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s", time, originFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl + newFileName);
				productDto.setP_pic(newFileName);
				try {
					file.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				productDto.setP_pic("blank.png");
			}

			if (files1.getSize() != 0) {
				String originFileName = files1.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s", time, originFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl + newFileName);
				productDto.setP_picd(newFileName);
				try {
					files1.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				productDto.setP_picd("blank.png");
			}

			if (files2.getSize() != 0) {
				String originFileName = files2.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s", time, originFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl + newFileName);
				productDto.setP_picd2(newFileName);
				try {
					files2.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				productDto.setP_picd2("blank.png");
			}

			if (files3.getSize() != 0) {
				String originFileName = files3.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s", time, originFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl + newFileName);
				productDto.setP_picd3(newFileName);
				try {
					files3.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				productDto.setP_picd3("blank.png");
			}

			if (files4.getSize() != 0) {
				String originFileName = files4.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s", time, originFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl + newFileName);
				productDto.setP_picd4(newFileName);
				try {
					files4.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				productDto.setP_picd4("blank.png");
			}

			if (files5.getSize() != 0) {
				String originFileName = files5.getOriginalFilename();
				long time = System.currentTimeMillis();
				newFileName = String.format("%d_%s", time, originFileName);
				String fileSaveUrl = "C:/fileSave/";
				File f = new File(fileSaveUrl + newFileName);
				productDto.setP_picd5(newFileName);
				try {
					files5.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				productDto.setP_picd5("blank.png");
			}

			return productDto;
		}// 업로드 이미지 포맷

		// 상품 1개 삭제
		@Override
		public int deleteProduct(ProductDto productDto) {

			int result = managerMapper.deleteProduct(productDto);

			return result;
		}

	// =========================== 한희태 ===========================
	
	// 매니저 인덱스 데이터
	@Override
	public Map<String, Object> mainData() {
		Map<String, Object> map = new HashMap<String, Object>();
		ManagerDto mDto = managerMapper.mainData();
		mDto.setTotal(managerMapper.payTotal());
		List<ManagerDto> list = managerMapper.monthStatistics();
		ManagerDto manaDto = managerMapper.sumPay();
		List<Integer> fList = new ArrayList<Integer>();
				
			for(int i=0; i<list.size(); i++) { 
				 fList.add(list.get(i).getCnt()/1000);
			}
		map.put("mDto", mDto);
		map.put("fList", fList);
		map.put("manaDto", manaDto);
		return map;
	}

	// 1:1문의 목록
	@Override
	public List<MemberDto> inquiryList() {
		List<MemberDto> list = managerMapper.inquiryList();
		return list;
	}

	// 1:1문의 확인
	@Override
	public MemberDto inquiryView(int ci_no) {
		MemberDto mDto = managerMapper.inquiryView(ci_no);
		return mDto;
	}

	@Autowired
	JavaMailSender javaMailSender;
	// 1:1 문의 답장 보내기
	@Override
	public void sendReply(ManagerDto mDto) {
		MimeMessage mail = javaMailSender.createMimeMessage();
		MimeMessageHelper message;
		try {
			message = new MimeMessageHelper(mail, true, "utf-8");
			//보내는 주소
			message.setTo(mDto.getU_email().replace(",","@"));
			//보내는 사람
			message.setFrom("cnksncks0411@gmail.com");
			//메일제목
			message.setSubject("[해피홀팜]"+mDto.getU_name()+"님의 1:1 문의에 대한 답장 안내");
			//메일 전송 내용
			String emailTxt = mailContent(mDto.getIr_content());
			message.setText(emailTxt,true);
			//메일전송
			javaMailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private String mailContent(String ir_content) {
		StringBuffer emailTxt = new StringBuffer();
		emailTxt.append("<!DOCTYPE html>");
        emailTxt.append("<html>");
        emailTxt.append("<head>");
        emailTxt.append("</head>");
        emailTxt.append("<body>");
        emailTxt.append(
				"<div style=\"font-family:'Apple SD Gothic Neo', 'sans-serif' !important; width: 500px; height: 600px; border-top: 4px solid #02b875; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"+ 
				"<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"																															+ 
				"<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">해피홀팜</span><br />"																													+ 
				"<span style=\"color: #02b875\">1:1문의</span> 답장 드립니다."																																				+ 
				"</h1>"																																																+ 
				"<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"																													+ 
				ir_content+"</p>"																																																	+ 
				"<div style=\"text-align:center;\">"	+
				"</div>"																																																	+
				"<div style=\"border-top: 4px solid #DDD; padding: 5px;\"></div>"+
				"</div>"
		);
        emailTxt.append("</body>");
        emailTxt.append("</html>");
		
		return emailTxt.toString();
	}

	// 1:1 문의 답장 데이터 넣기
	@Override
	public int insertSendReply(ManagerDto mDto) {
		int result = managerMapper.insertSendReply(mDto);
		managerMapper.updateInquiry(mDto);
		return result;
	}

}
