package com.hphfarm.www.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.BoardDto;


@Mapper
public interface BoardMapper {
		//공지 게시글 리스트 가져오기
	List<BoardDto> selectNoticeBoardList(int startrow, int endrow, String category, String searchword, int bc_no);
		//공지 게시글 수
	int selectPublicListCount(String category, String searchword);
		//공지 게시글 1개 가져오기
	BoardDto boardNoticeOne(int bn_no);
		//공지 사항 이전글
	BoardDto boardNoticeOnePre(int bn_no);
		//공지 사항다음글
	BoardDto boardNoticeOneNext(int bn_no);
		//공지사항 조회수 증가
	void updateBoardHit(int bn_no);
			//공지 게시글 삭제하기
	int delete_man_public_board(int bn_no);
		//관리자 공지사항 글쓰기
	int insertWrite(BoardDto boardDto);
		//관리자 공지사항 글쓰기
	int insert_board_public_Write(BoardDto boardDto);
		//관리자 공지사항 수정
	int update_board_public_modify(BoardDto boardDto);

	/////////////////////////////////////////////////////////////////
	
		// 유저 게시판 글작성
	int insert_board_User_Write(BoardDto boardDto);
	
	
	





}
