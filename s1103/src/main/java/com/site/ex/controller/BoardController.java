package com.site.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@RequestMapping("/boardIndex")
	public String boardIndex() {
		return "/boardIndex";
	}
	
	@RequestMapping("/boardList")
	public String boardList() {
		return "board/boardList";
	}
	
	@RequestMapping("/boardView")
	public String boardView() {
		return "board/boardView";
	}
	
	@RequestMapping("/boardDelete")
	public String boardDelete(@RequestParam int bid,Model model) {
		System.out.println("bid : "+ bid);
		model.addAttribute("bid",bid);
		return "board/boardDelete";
	}
	
	@RequestMapping("/delete/{bid}")
	public String delete(@PathVariable int bid,Model model) {
		System.out.println("Path bid : "+ bid);
		model.addAttribute("bid",bid);
		return "board/boardDelete";
	}

}
