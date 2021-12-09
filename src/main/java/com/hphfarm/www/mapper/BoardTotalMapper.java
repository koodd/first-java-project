package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.BoardTotalDto;

@Mapper
public interface BoardTotalMapper {

		//유저 게시판 리스트
	List<BoardTotalDto> SelectUserBoardList(int startrow, int endrow, String category, String searchword, int bc_no);
		//유저 게시판 리스트 수
	int selectUserListCount(String category, String searchword, int bc_no);
		//유저 게시판 조회수 증가
	void UpdateUserHit(BoardDto boardDto);
		//유저 게시글 1개 가져오기
	BoardTotalDto BoardUserOne(BoardDto boardDto);
		//유저 게시글 이전글 가져오기
	BoardTotalDto BoardUserOnePre(BoardDto boardDto);
		//유저 게시글 다음글 가져오기
	BoardTotalDto BoardUserOneNext(BoardDto boardDto);
	
		//신고수 증가
	int Update_Board_Report(BoardDto boardDto);
		//유저 댓글 리스트 
	List<BoardTotalDto> BoardCommList(BoardDto boardDto);

		//유저 댓글 작성
	void Insert_Comm_Write(BoardDto boardDto);
		//유저 댓글 1개 가져오기
	BoardTotalDto SelectCommOne(BoardDto boardDto);
		//유저 댓글 수정
	void Update_Board_Comm(BoardDto boardDto);
		//유저 댓글 삭제
	int Delete_Baord_Comm(BoardDto boardDto);
	
	//유저 마이페이지에서 자신의 게시글 리스트 가져오기
	List<BoardTotalDto> SelectMyBoardList(int startrow, int endrow, String category, String searchword, int u_no);
	//유저 마이페이지에서 자신의 게시글 수 가져오기
	int selectMyListCount(String category, String searchword,int u_no);
				

	//게시글 신고수
	int selectReportListCount(String category, String searchword);
	//게시글 신고 리스트
	List<BoardTotalDto> SelectReportBoardList(int startrow, int endrow, String category, String searchword);
	//게시글 신고받은 글 1개 가져오기
	BoardTotalDto BoardReportOne(BoardDto boardDto);
	//게시글 신고받은 글 이전글 가져오기
	BoardTotalDto BoardReportOnePre(BoardDto boardDto);
	//게시글 신고받은 글 다음글 가져오기
	BoardTotalDto BoardReportOneNext(BoardDto boardDto);
	//게시글 신고받은 글의 댓글 가져오기
	List<BoardTotalDto> BoardReportCommList(BoardDto boardDto);
	//게시글 신고받은 글의 댓글 삭제,커뮤니티 댓글 삭제 
	int Delete_Report_Comm(BoardDto boardDto);
	//관리자 커뮤니티 관리에서 유저 게시글 삭제
	int Delete_User_Board(BoardDto boardDto);
	//관리자 커뮤니티 관리에서 모든 게시글 수 
	int selectManListCount(String category, String searchword);
	//관리자 커뮤니티 관리에서 모든 게시글 리스트
	List<BoardTotalDto> SelectManBoardList(int startrow, int endrow, String category, String searchword);
	//관리자 커뮤니티 관리에서 1개 가져오기
	BoardTotalDto BoardManListOne(BoardDto boardDto);
	//관리자 커뮤니티 관리에서 댓글 리스트 가져오기
	List<BoardTotalDto> BoardManListCommList(BoardDto boardDto);


	
}
