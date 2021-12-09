package com.hphfarm.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.BoardTotalDto;

@Mapper
public interface BoardTotalMapper {


	List<BoardTotalDto> selectUserBoardList(int startrow, int endrow, String category, String searchword, int bc_no);

	int selectUserListCount(String category, String searchword, int bc_no);

	void updateUserHit(BoardDto boardDto);

	BoardTotalDto boardUserOne(BoardDto boardDto);

	BoardTotalDto boardUserOnePre(BoardDto boardDto);

	BoardTotalDto boardUserOneNext(BoardDto boardDto);

	int update_Board_Report(BoardDto boardDto);

	List<BoardTotalDto> boardCommList(BoardDto boardDto);

	
	void insert_Comm_Write(BoardDto boardDto);

	BoardTotalDto selectCommOne(BoardDto boardDto);

	void update_Board_Comm(BoardDto boardDto);

	int delete_Baord_Comm(BoardDto boardDto);

	int selectReportListCount(String category, String searchword);

	List<BoardTotalDto> selectReportBoardList(int startrow, int endrow, String category, String searchword);

	BoardTotalDto boardReportOne(BoardDto boardDto);

	BoardTotalDto boardReportOnePre(BoardDto boardDto);

	BoardTotalDto boardReportOneNext(BoardDto boardDto);

	List<BoardTotalDto> boardReportCommList(BoardDto boardDto);

	int delete_Report_Comm(BoardDto boardDto);

	int delete_User_Board(BoardDto boardDto);

	int selectManListCount(String category, String searchword);

	List<BoardTotalDto> selectManBoardList(int startrow, int endrow, String category, String searchword);

	BoardTotalDto boardManListOne(BoardDto boardDto);

	List<BoardTotalDto> boardManListCommList(BoardDto boardDto);

	List<BoardTotalDto> selectMyBoardList(int startrow, int endrow, String category, String searchword, int u_no);

	int selectMyListCount(String category, String searchword,int u_no);


	

	
	
}
