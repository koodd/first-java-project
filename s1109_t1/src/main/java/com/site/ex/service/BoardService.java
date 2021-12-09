package com.site.ex.service;

import java.util.List;
import java.util.Map;

import com.site.ex.dto.BoardDto;
import com.site.ex.dto.NumberDto;

public interface BoardService {

	//전체게시글 가져오기
	Map<String, Object> list(NumberDto numberDto);

	//게시글 1개 가져오기
	Map<String, Object> boardOne(int bid);

	//게시글 1개 삭제하기
	int delete(int bid);

	//게시글 1개 저장
	int modify(BoardDto boardDto);

	//게시글 1개 저장:insert
	int write(BoardDto boardDto);

	//게시글 1개 저장 : 답변달기
	int reply(BoardDto boardDto);

	

}
