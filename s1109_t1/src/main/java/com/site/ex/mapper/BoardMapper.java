package com.site.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.ex.dto.BoardDto;

@Mapper
public interface BoardMapper {

	//전체게시글 가져오기
	List<BoardDto> selectList(int startrow, int endrow, String category, String searchWord);

	//게시글 1개 가져오기
	BoardDto selectBoardOne(int bid);
	//게시글 1개 가져오기(preview)
	BoardDto selectBoardOnePre(int bid);
	//게시글 1개 가져오기(next)
	BoardDto selectBoardOneNext(int bid);
	// 조회수 1증가
	void updateBhit(int bid);

	//게시글 1개 삭제하기
	int boardDelete(int bid);

	//게시글 1개 저장
	int updateModify(BoardDto boardDto);

	//게시글 1개 저장:insert
	int insertWrite(BoardDto boardDto);

	//게시글 1개 저장 : 답변달기
	int insertReply(BoardDto boardDto);

	//부모게시글 아래 있는 답변글에 1씩 증가
	void updateReplyPlus(BoardDto boardDto);

	//총게시글 수
	int selectListCount(String category, String searchWord);

	



}
