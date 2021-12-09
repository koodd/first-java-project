package com.site.ex.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.site.ex.dto.BoardDto;
import com.site.ex.dto.NumberDto;
import com.site.ex.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list")
	public String list(NumberDto numberDto,Model model) {
		// 전체게시글 가져오기
		Map<String, Object> map = boardService.list(numberDto);
		model.addAttribute("map",map);
		return "board/list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(@RequestParam int bid,
			NumberDto nDto,Model model) {
		//게시글 1개 가져오기 : 뷰페이지
		System.out.println("content_view bid : "+bid);
		System.out.println("nDto bid : "+nDto.getCategory());
		System.out.println("nDto bid : "+nDto.getSearchWord());
		Map<String, Object> map = boardService.boardOne(bid);
		model.addAttribute("map",map);
		model.addAttribute("nDto",nDto);
		return "board/content_view";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int bid) {
		//게시글 1개 삭제하기
		System.out.println("delete bid : "+bid);
		int result = boardService.delete(bid);
		System.out.println("result : "+result);
		return "redirect:./list";
	}
	
	@RequestMapping("/write_view")
	public String write_view() {
		//게시글 쓰기
		return "board/write_view";
	}
	
	@RequestMapping("/summerUpload") //summernote파일 업로드
	@ResponseBody
	public String summerUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//파일이름 가져오기
		String newFileName="";
		
		// 업로드할 폴더 경로
		String realFolder = "C:/fileSave/";//저장될 외부 파일 경로

		// 업로드할 파일 이름
		String originFileName = file.getOriginalFilename();
		System.out.println("originFileName : " + originFileName);
		long time = System.currentTimeMillis();
		// 1개의 파일이름을 변형해서 다시 저장
		newFileName = String.format("%d_%s", time, originFileName);

		System.out.println("원본 파일명 : " + originFileName);
		System.out.println("저장할 파일명 : " + newFileName);

		String filepath = realFolder + "/" + newFileName;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		file.transferTo(f);
		System.out.println("/upload/"+newFileName);

		return "/upload/"+newFileName;
		
	}//summerUpload
	
	
	
	
	@RequestMapping("/write")
	public String write(BoardDto boardDto,
			@RequestPart MultipartFile file) {
		//게시글 1개 저장:insert
		//파일이름 가져오기
		String newFileName="";
		if(file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); //01241514545512
			//중복방지 파일이름생성
			newFileName = String.format("%d_%s", time,originFileName); 
			//
			//파일 저장 위치
			String fileSaveUrl="C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl+newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//파일이름 dto저장
		boardDto.setBupload(newFileName);
		int result = boardService.write(boardDto);
		System.out.println("write 결과 : "+result);
		return "redirect:./list";
	}
	
	@GetMapping("/modify_view")
	public String modify_view(@RequestParam int bid,Model model) {
		//게시글 1개 가져오기 : 수정하기
		System.out.println("modify_view bid : "+bid);
		Map<String, Object> map = boardService.boardOne(bid);
		model.addAttribute("map",map);
		return "board/modify_view";
	}
	
	@RequestMapping("/modify")
	public String modify(BoardDto boardDto,@RequestPart MultipartFile file) {
		//게시글 1개 저장:update
		//파일이름 가져오기
		String newFileName="";
		if(file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); //01241514545512
			//중복방지 파일이름생성
			newFileName = String.format("%d_%s", time,originFileName); 
			//파일 저장 위치
			String fileSaveUrl="C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl+newFileName);
			//파일이름 dto저장
			boardDto.setBupload(newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		int result = boardService.modify(boardDto);
		System.out.println("modify 결과 : "+result);
		return "redirect:./content_view?bid="+boardDto.getBid();
	}
	
	@RequestMapping("/reply_view")
	public String reply_view(@RequestParam int bid,Model model) {
		System.out.println("reply_view bid : "+bid);
		//게시글 1개 가져오기 : 답변달기페이지
		Map<String, Object> map = boardService.boardOne(bid);
		model.addAttribute("map",map);
		return "board/reply_view";
	}
	
	@RequestMapping("/reply")
	public String reply(BoardDto boardDto,@RequestPart MultipartFile file) {
		//게시글 1개 저장 : 답변달기
		//파일이름 가져오기
		String newFileName="";
		if(file.getSize() != 0) {
			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); //01241514545512
			//중복방지 파일이름생성
			newFileName = String.format("%d_%s", time,originFileName); 
			//파일 저장 위치
			String fileSaveUrl="C:/fileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl+newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//파일이름 dto저장
		boardDto.setBupload(newFileName);
		int result = boardService.reply(boardDto);
		return "redirect:./list";
	}
	
}