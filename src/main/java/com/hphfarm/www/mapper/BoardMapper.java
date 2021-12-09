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
	BoardDto BoardNoticeOne(int bn_no);
		//공지 사항 이전글
	BoardDto BoardNoticeOnePre(int bn_no);
		//공지 사항다음글
	BoardDto BoardNoticeOneNext(int bn_no);
		// 조회수 증가
	void UpdateBoardHit(int bn_no);
		//공지 게시글 삭제하기,정보 게시글 삭제 
	int Delete_man_public_board(int bn_no);
		//관리자 공지사항 글쓰기
	int insertWrite(BoardDto boardDto);
		//관리자 공지사항 글쓰기
	int Insert_board_public_Write(BoardDto boardDto);
		//관리자 공지사항 수정,정보 게시글 수정 
	int Update_board_public_modify(BoardDto boardDto);

	//정보 게시판 리스트
		List<BoardDto> selectInfoBoardList(int startrow, int endrow, String category, String searchword, int bc_no);
	//정보 게시글 수	
		int selectInfoListCount(String category, String searchword);
	//정보 게시글 1개 가져오기	
		BoardDto BoardInfoOne(int bn_no);
	//정보 게시판 이전글	
		BoardDto BoardInfoOnePre(int bn_no);
	//정보 게시판 다음글	
		BoardDto BoardInfoOneNext(int bn_no);
	//정보 게시글 작성	
		int Insert_board_info_Write(BoardDto boardDto);
		
/////////////////////////////////////////////////////////////////////////		
		// 유저 게시판 글작성
		int Insert_board_User_Write(BoardDto boardDto);
		
		
	





}
