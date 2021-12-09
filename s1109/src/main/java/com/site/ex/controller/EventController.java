package com.site.ex.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.ex.dto.CommentDto;
import com.site.ex.dto.EventDto;
import com.site.ex.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/event")
	public String event(Model model) {
		//eventBoard 전체 게시글 가져오기
		List<EventDto> list = eventService.eventBoardList();
		model.addAttribute("list",list);
		System.out.println("eventBoard list : "+list.get(0).getEventNo());
		return "event/event";
	}
	
	@RequestMapping("/event_view")
	public String event_view(@RequestParam(defaultValue = "1") int eventNo,Model model) {
		System.out.println("ip : "+request.getRemoteAddr());
		System.out.println("eventNo : "+eventNo);
		//eventBoard 1개 게시글 가져오기
		EventDto eDto = eventService.event_view(eventNo);
		// event게시글에 해당되는 하단댓글 가져오기
		List<CommentDto> clist = eventService.commmentList(eventNo);
		//System.out.println("clist id : "+ clist.get(0).getCcontent());
		model.addAttribute("eDto",eDto);
		model.addAttribute("clist",clist);
		model.addAttribute("clistCount",clist.size());
		return "event/event_view";
	}
	
	@ResponseBody //댓글추가
	@RequestMapping("/commentWrite")
	public Map<String,Object> commentWrite(CommentDto commentDto) {
		System.out.println("commentDto bid :"+commentDto.getBid());
		Map<String,Object> map = eventService.commentWrite(commentDto);
		return map;
	}
	
	@ResponseBody //댓글수정저장
	@RequestMapping("/commentSave")
	public CommentDto commentSave(CommentDto commentDto) {
		System.out.println("commentSave bid :"+commentDto.getBid());
		CommentDto cDto = eventService.commentSave(commentDto);
		return cDto;
	}
	
	@ResponseBody //댓글삭제
	@RequestMapping("/commentDelete")
	public int commentDelete(@RequestParam int cno) {
		System.out.println("cno :"+cno);
		int result = eventService.commentDelete(cno);
		return result;
	}
	
	

}
