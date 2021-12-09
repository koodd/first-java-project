package com.site.ex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.ex.service.BoardService;
import com.site.ex.vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/list")
	public String list(Model model) {
		//전체게시판
		List<BoardVo> list = boardService.list();
		model.addAttribute("list",list);
		System.out.println("date : "+list.get(0).getBdate());
		return "board/list";
	}

}
