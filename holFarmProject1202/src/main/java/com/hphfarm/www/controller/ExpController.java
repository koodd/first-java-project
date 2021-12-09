package com.hphfarm.www.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.ExpDto;
import com.hphfarm.www.dto.FarmRegDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.dto.TotalDto;
import com.hphfarm.www.service.ExpService;

@Controller
@RequestMapping("/exp")
public class ExpController {

	// =========================== 최건호 ===========================

	@Autowired
	ExpService expService;

	// 체험프로그램 전체 리스트 가져오기
	@RequestMapping("/exp_List")
	public String exp_List(NumberDto numberDto, Model model) {
		Map<String, Object> map = expService.exp_List(numberDto);
		model.addAttribute("map", map);

		return "exp/exp_List";
	}

	// (농장주)체험등록 폼 가져오기
	@RequestMapping("/exp_Reg")
	public String exp_Reg() {

		return "exp/exp_Reg";
	}

	// (농장주)체험등록 글쓰기

	@RequestMapping("/exp_RegWrite")
	public String exp_RegWrite(ExpDto expDto, MemberDto memberDto, @RequestPart MultipartFile file,
			HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		int u_no = (int) session.getAttribute("session_uno");

		expDto.setU_no(u_no);
		System.out.println("session_uno : " + u_no);
		System.out.println("EXP Controller u_no : " + expDto.getU_no());
		String newFileName = "";
		if (file.getSize() != 0) {
			// 파일 이름 가져오기
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis();
			// 중복 방지 파일이름 생성 : originFileName , time 합쳐서 문자열 만들어 주기 "%d_%s" 사용
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

		model.addAttribute("u_no", u_no);
		// 파일이름 expDto에 저장
		expDto.setE_thumb(newFileName);

		int result = expService.exp_RegWrite(expDto);

		System.out.println("체험프로그램 등록 결과 : " + result);
		return "redirect:./exp_List";
	}

	// 체험 상세보기 뷰

	@RequestMapping("/exp_View")
	public String exp_View(@RequestParam int e_no, NumberDto nDto, Model model) {
		Map<String, Object> map = expService.boardOne(e_no);
		model.addAttribute("map", map);

		map.put("map", map);
		map.put("nDto", nDto);
		System.out.println("체험 상세보기 컨트롤러의 map : " + map);

		return "exp/exp_View";
	}

	/*
	 * // 테이블 조인
	 * 
	 * @RequestMapping("/exp_View") public String exp_View(Model model) {
	 * List<TotalDto> list = expService.selectExpView(); System.out.println("개수 : "
	 * + list.size()); System.out.println("total : " + list.get(1));
	 * System.out.println("controller1 : " +list.get(0).getExpDto().getU_no());
	 * System.out.println(list.get(0)); model.addAttribute("list",list);
	 * 
	 * 
	 * return "exp/exp_View"; }
	 */
}
