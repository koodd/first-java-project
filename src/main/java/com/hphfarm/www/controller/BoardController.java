package com.hphfarm.www.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.BoardTotalDto;
import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.service.BoardService;
import com.hphfarm.www.service.MemberService;


@RequestMapping("/board")
@Controller
public class BoardController {

	// =========================== 김영환 ===========================
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;

	//유저 댓글 있는 view

	@RequestMapping("/board_comm")
	public String board_comm(Model model,NumberDto nDto,BoardDto boardDto) 
	{
	
		Map<String, Object> map = boardService.boardUserOne(boardDto);
		model.addAttribute("nDto", nDto);
		model.addAttribute("map", map);
		return "board/board_comm";
	}
		//유저 댓글 있는 view에서 목록으로 돌아가기
	@RequestMapping("/board_comm_back")
	public String board_comm(@RequestParam int bc_no,Model model) 
	{
		
		model.addAttribute("bc_no", bc_no);
	
	
		if(bc_no==1) {
			return "redirect:./board_free?bc_no=1";}
		else if(bc_no==3) { 
			return "redirect:./board_farm?bc_no=3";}
		else if(bc_no==4){ 
			return "redirect:./board_trade?bc_no=4";}	
		else {
			return "redirect:./board_user?bc_no=2";
		}
	}
	// 유저 게시판 view 신고수 증가 
	@RequestMapping("/content_btn_report")
	public String board_report_add(NumberDto nDto,BoardDto boardDto,Model model) 
	{
		
		int result=boardService.board_Report_Update(boardDto);
		int bc_no = boardDto.getBc_no();
		
		model.addAttribute("result", result);
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("nDto", nDto);
		
		if(bc_no==1) {
			return "redirect:./board_free?bc_no=1";}
		else if(bc_no==3) { 
			return "redirect:./board_farm?bc_no=3";}
		else if(bc_no==4){ 
			return "redirect:./board_trade?bc_no=4";}	
		else {
			return "redirect:./board_user?bc_no=2";
		}
	
	}
			//유저 view 댓글 추가
		@ResponseBody 
		@RequestMapping("/commentWrite")
		public Map<String,Object> commentWrite(HttpServletRequest request,  BoardDto boardDto){
			
			Map<String, Object> map=  boardService.board_Comm_write(boardDto);
		
			return map;
		}
			//유저 댓글 저장
		@ResponseBody
		@RequestMapping("/commentSave")
		public BoardTotalDto commentSave(BoardDto boardDto) {		
			BoardTotalDto cDto  = boardService.board_Comm_Save(boardDto);
		return cDto;
		}
		
		//유저 댓글 삭제
		@ResponseBody //댓글삭제
		@RequestMapping("/commentDelete")
		public int commentDelete(BoardDto boardDto) {
	
			int result = boardService.board_Comm_Delete(boardDto);
			return result;
		}
		//유저 게시글 삭제
		@RequestMapping("/board_user_Delete")
		public String board_user_Delete(BoardDto boardDto) {
			
		int result =boardService.board_user_delete(boardDto);
			int bc_no = boardDto.getBc_no();
			System.out.println(bc_no);
			if(bc_no==1) {
				return "redirect:./board_free?bc_no=1";}
			else if(bc_no==3) { 
				return "redirect:./board_farm?bc_no=3";}
			else if(bc_no==4){ 
				return "redirect:./board_trade?bc_no=4";}	
			else {
				return "redirect:./board_user?bc_no=2";
			}
		}
		
		
	//농장주 게시판
	@RequestMapping("/board_farm")
	public String board_farrm(NumberDto numberDto, Model model) {
		
		if(numberDto.getCategory()=="") 
		{ numberDto.setCategory("bt_title");
		}
		if(numberDto.getSearchword()=="") 
		{ numberDto.setSearchword(null);}


		Map<String,Object> map = boardService.boardUserlist(numberDto);

	
		model.addAttribute("map", map);

		return "board/board_farm";
	}

	//자유게시판
	@RequestMapping("/board_free") 
	public String board_free(NumberDto numberDto, Model model) {
		
		if(numberDto.getCategory()=="") 
		{ numberDto.setCategory("bt_title");
		}
		if(numberDto.getSearchword()=="") 
		{ numberDto.setSearchword(null);}


		Map<String,Object> map = boardService.boardUserlist(numberDto);

	
		model.addAttribute("map", map);

		return "board/board_free"; 
	}

	//정보게시판 list
		@RequestMapping("/board_info") 
		public String board_info(NumberDto numberDto, Model model) {
			if(numberDto.getCategory()=="") 
			{ numberDto.setCategory("bt_title");
			}
			if(numberDto.getSearchword()=="") 
			{ numberDto.setSearchword(null);}


			Map<String,Object> map = boardService.board_info(numberDto);

		
			model.addAttribute("map", map);
			return "board/board_info";
		}

		//정보 게시판 view  
		@RequestMapping("/board_info_view") 
		public String board_info_view(@RequestParam int bn_no,
				NumberDto nDto, Model model) {
			
			Map<String, Object> map = boardService.boardinfoOne(bn_no);
			model.addAttribute("map",map);
			model.addAttribute("nDto",nDto);	

			return "board/board_info_view"; 
		}
		
		
	//공지 게시판 view  
	@RequestMapping("/board_public_view") 
	public String board_public_view(@RequestParam int bn_no,
			NumberDto nDto, Model model) {
		
		Map<String, Object> map = boardService.boardNoticeOne(bn_no);
		model.addAttribute("map",map);
		model.addAttribute("nDto",nDto);	

		return "board/board_public_view"; 
	}




	//공지 게시판 
	@RequestMapping("/board_public") 
	public String board_public(NumberDto numberDto,Model model) {

		if(numberDto.getCategory()=="") {
			numberDto.setCategory("bn_title");

		}
		if(numberDto.getSearchword()=="") {
			numberDto.setSearchword(null);

		}

		Map<String, Object> map = boardService.list(numberDto);
		model.addAttribute("map",map);

		return "board/board_public"; }


	//거래 게시판
	@RequestMapping("/board_trade") 
	public String board_trade(NumberDto numberDto, Model model) {
		
		if(numberDto.getCategory()=="") 
		{ numberDto.setCategory("bt_title");
		}
		if(numberDto.getSearchword()=="") 
		{ numberDto.setSearchword(null);}


		Map<String,Object> map = boardService.boardUserlist(numberDto);

	
		model.addAttribute("map", map);

		return "board/board_trade"; 
	}

	//유저 게시판 
	@RequestMapping("/board_user") 
	public String board_user(NumberDto numberDto, Model model) {
		
		if(numberDto.getCategory()=="") 
		{ numberDto.setCategory("bt_title");
		}
		if(numberDto.getSearchword()=="") 
		{ numberDto.setSearchword(null);}


		Map<String,Object> map = boardService.boardUserlist(numberDto);

	
		model.addAttribute("map", map);
		
		 return "/board/board_user"; 
	}


	//유저 글 작성게시판 이동

	@RequestMapping("/board_write") 
	public String board_write(@RequestParam(value="bc_no", required=false) Integer bcno,Model model) {
				
		model.addAttribute("bcno",bcno);
		return"board/board_write";
	}
			//유저 게시글 1개 저장:insert
	@RequestMapping("/board_wirte_do")
	public String board_wirte_do(BoardDto boardDto,
			@RequestParam("bc_no") int bc_no,@RequestPart MultipartFile file,HttpServletRequest request,
			Model model){
			
		HttpSession session = request.getSession();
		int u_no = (int) session.getAttribute("session_uno");
		boardDto.setU_no(u_no);
		
		
		String newFileName="";
		if(file.getSize() !=0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName);
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			try {
				file.transferTo(f);	
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		//파일이름 dto저장
		boardDto.setBt_upload(newFileName);
		int result = boardService.board_User_Write(boardDto);
		model.addAttribute("u_no", u_no);
		model.addAttribute("bc_no", bc_no);
			
		if(bc_no==1) {
			return "redirect:./board_free?bc_no=1";}
		else if(bc_no==3) { 
			return "redirect:./board_farm?bc_no=3";}
		else if(bc_no==4){ 
			return "redirect:./board_trade?bc_no=4";}	
		else {
			return "redirect:./board_user?bc_no=2";
		}
	}

}
