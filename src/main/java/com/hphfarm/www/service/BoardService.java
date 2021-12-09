package com.hphfarm.www.service;

import java.util.Map;

import com.hphfarm.www.dto.BoardTotalDto;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.NumberDto;

public interface BoardService {
		//공지 게시글 리스트
	Map<String, Object> list(NumberDto numberDto);
		//공지 게시글 1개 가져오기
	Map<String, Object> boardNoticeOne(int bn_no);
		//공지 게시글 삭제,정보 게시글 삭제 
	int delete_board_notice(int bn_no);
		//공지 작성
	int board_Public_Write(BoardDto boardDto);
		//공지 게시글 수정, 정보 게시글 수정 
	int board_public_modify(BoardDto boardDto);
	
////////////////////////////////////////////////////////////	
	
	//유저 게시판 리스트 
	Map<String, Object> boardUserlist(NumberDto numberDto);
		// 유저 게시판 글작성
	int board_User_Write(BoardDto boardDto);
		//유저 게시글 1개 가져오기
	Map<String, Object> boardUserOne(BoardDto boardDto);
		//게시판 신고수 증가
	int board_Report_Update(BoardDto boardDto);
		//유저 댓글 작성
	Map<String, Object> board_Comm_write(BoardDto boardDto);
		//유저 댓글 수정
	BoardTotalDto board_Comm_Save(BoardDto boardDto);
		//유저 댓글 삭제
	int board_Comm_Delete(BoardDto boardDto);
	
	//관리자 신고 게시글 리스트
	Map<String, Object> board_Report_list(NumberDto numberDto);
		//관리자 신고 게시글 1개 자겨오기
	Map<String, Object> boardReportOne(BoardDto boardDto);
		//관리자 신고 댓글 삭제, 커뮤니티 댓글 삭제 
	int board_Report_Comm_Delete(BoardDto boardDto);
		//관리자 유저 게시글 삭제
	int board_user_delete(BoardDto boardDto);
		//관리자 커뮤니티
	Map<String, Object> board_Man_BoardList(NumberDto numberDto);
		//관리자 커뮤니티 게시글 리스트
	Map<String, Object> boardManListOne(BoardDto boardDto);
	
	//마이페이지 작성한 게시글 리스트	
	Map<String, Object> board_My_List(NumberDto numberDto);
		//마이페이지 작성한 게시글 1개 가져오기
	Map<String, Object> boardMyListOne(BoardDto boardDto);


	//유저 정보게시판 목록 뽑기
	Map<String, Object> board_info(NumberDto numberDto);
	//관리자 정보게시판 목록 뽑기
	Map<String, Object> infolist(NumberDto numberDto);
	//관리자 정보 게시글 1개 가져오기,유저 정보 게시글 1개 가져오기
	Map<String, Object> boardinfoOne(int bn_no);
	//관리자 정보 게시글 작성
	int board_info_Write(BoardDto boardDto);
	

	
	

	
	
	
}
