package com.site.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.ex.dto.CommentDto;
import com.site.ex.dto.EventDto;
import com.site.ex.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventMapper eventMapper;
	
	@Override // event게시글에 해당되는 하단댓글 가져오기
	public List<CommentDto> commmentList(int bid) {
		//댓글가져오기
		List<CommentDto> clist = eventMapper.selectCommmentList(bid);
		//댓글개수
		return clist;
	}

	@Override //댓글추가
	public Map<String,Object> commentWrite(CommentDto commentDto) {
		Map<String,Object> map = new HashMap<String,Object>();
		//댓글저장
		eventMapper.insertCommentWrite(commentDto);
		System.out.println("commentDto cno : "+commentDto.getCno());
		//댓글1개 가져오기
		CommentDto cDto = eventMapper.selectCommentOne(commentDto.getCno());
		//댓글 개수
		int cCount = eventMapper.selectCount(commentDto);
		map.put("cDto", cDto);
		map.put("cCount", cCount);
		return map;
	}

	@Override //댓글삭제
	public int commentDelete(int cno) {
		int result = eventMapper.deleteComment(cno);
		return result;
	}

	@Override //댓글수정저장
	public CommentDto commentSave(CommentDto commentDto) {
		//댓글 수정저장
		eventMapper.updateComment(commentDto);
		//댓글1개 가져오기
		CommentDto cDto = eventMapper.selectCommentOne(commentDto.getCno());
		return cDto;
	}

	@Override //eventBoard 전체 게시글 가져오기
	public List<EventDto> eventBoardList() {
		List<EventDto> list = eventMapper.selectEventBoard();
		return list;
	}

	@Override //eventBoard 1개 게시글 가져오기
	public EventDto event_view(int eventNo) {
		EventDto eDto = eventMapper.selectEventOne(eventNo);
		return eDto;
	}

}
