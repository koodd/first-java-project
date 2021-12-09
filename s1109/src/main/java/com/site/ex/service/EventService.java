package com.site.ex.service;

import java.util.List;
import java.util.Map;

import com.site.ex.dto.CommentDto;
import com.site.ex.dto.EventDto;

public interface EventService {

	// event게시글에 해당되는 하단댓글 가져오기
	List<CommentDto> commmentList(int bid);

	//댓글추가
	Map<String,Object> commentWrite(CommentDto commentDto);

	//댓글삭제
	int commentDelete(int cno);

	//댓글수정저장
	CommentDto commentSave(CommentDto commentDto);

	//eventBoard 전체 게시글 가져오기
	List<EventDto> eventBoardList();

	//eventBoard 1개 게시글 가져오기
	EventDto event_view(int eventNo);

}
