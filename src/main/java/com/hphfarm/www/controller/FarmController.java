package com.hphfarm.www.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.FarmReviewDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.service.FarmService;
import com.hphfarm.www.service.MemberService;

@Controller
@RequestMapping("/farm")
public class FarmController {

	// =========================== 한희태 ===========================
	@Autowired
	FarmService farmService;
	@Autowired
	MemberService memberService;

	// 농장 목록 가져오기
	@RequestMapping("/farm_list")
	public String farmlist(NumberDto nDto, Model model) {
		Map<String, Object> map = farmService.farmlist(nDto);

		model.addAttribute("map", map);

		return "farm/farm_list";
	}

	// 농장 상세보기
	@RequestMapping("/farm_view")
	public String farmView(@RequestParam("fr_no") int fr_no, NumberDto nDto, Model model) {
		Map<String, Object> map = farmService.farmview(fr_no);
		// 농장 리뷰 전체 가져오기
		List<FarmReviewDto> rlist = farmService.farmreviewList(fr_no);

		model.addAttribute("map", map);
		model.addAttribute("nDto", nDto);
		model.addAttribute("rlist", rlist);
		model.addAttribute("rCount", rlist.size());

		return "farm/farm_view";
	}

	// 농장 리뷰 추가
	@ResponseBody
	@RequestMapping("/writeReview")
	public Map<String, Object> writeReview(FarmReviewDto rDto) {
		Map<String, Object> map = farmService.writeReview(rDto);
		return map;
	}

	// 농장 등록 페이지
	@RequestMapping("/farm_regi")
	public String farm_regi(@RequestParam("u_no") int uno, NumberDto nDto, Model model) {
		int result = farmService.farmRegiCheck(uno);
		if (result >=1) {
			model.addAttribute("result",result);
			return farmlist(nDto, model);
		}else {
			return "farm/farm_regi";
		}
		
	}

	// 농장 등록
	@RequestMapping("/farm_do_regi")
	public String farm_do_regi(FarmDto fDto, MultipartFile certi_file, MultipartFile thumb_file, MultipartFile subfile,
			MultipartFile subfile2, MultipartFile subfile3, MultipartFile subfile4) {

		FarmDto fDtofile = farmService.farmRegiFile(fDto, certi_file, thumb_file, subfile, subfile2, subfile3,
				subfile4);
		int result = farmService.farmRegi(fDtofile);

		return "farm/farm_regi_ok";
	}

	// 농장 예약
	@RequestMapping("/farm_reser")
	public String farmReser(@RequestParam("fr_no") int fr_no,@RequestParam("u_no") int u_no, Model model) {
		FarmDto fDto = farmService.fReserview(fr_no);
		MemberDto mDto = memberService.reserUserinfo(u_no);
		model.addAttribute("fDto", fDto);
		model.addAttribute("mDto", mDto);
		return "farm/farm_reser";
	}
	
	// 농장 예약 결제
	@RequestMapping("/farm_do_reser")
	public String farmReserDo(@RequestParam("fr_no") int fr_no, @RequestParam("u_no") int u_no, 
			@RequestParam("py_price") int py_price, @RequestParam("frs_startdate") String frs_startdate,
			@RequestParam("frs_account") String frs_account) {
		farmService.farmDoReser(py_price,u_no,fr_no, frs_startdate, frs_account);
		
		return "farm/farm_reser_ok";
	}

}
