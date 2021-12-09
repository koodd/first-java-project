package com.hphfarm.www.service;

import java.util.List;
import java.util.Map;

import com.hphfarm.www.dto.BoardTotalDto;

import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.NumberDto;

public interface BoardService {
	//공지//////
	Map<String, Object> list(NumberDto numberDto);

	Map<String, Object> boardNoticeOne(int bn_no);

	int delete_board_notice(int bn_no);

	int board_Public_Write(BoardDto boardDto);

	int board_public_modify(BoardDto boardDto);
	
	///////////////////
	//////////유저//////
	
	Map<String, Object> boardUserlist(NumberDto numberDto);


	int board_User_Write(BoardDto boardDto);

	Map<String, Object> boardUserOne(BoardDto boardDto);

	int board_Report_Update(BoardDto boardDto);

	Map<String, Object> board_Comm_write(BoardDto boardDto);

	BoardTotalDto board_Comm_Save(BoardDto boardDto);

	int board_Comm_Delete(BoardDto boardDto);

	Map<String, Object> board_Report_list(NumberDto numberDto);

	Map<String, Object> boardReportOne(BoardDto boardDto);

	int board_Report_Comm_Delete(BoardDto boardDto);

	int board_user_delete(BoardDto boardDto);

	Map<String, Object> board_Man_BoardList(NumberDto numberDto);

	Map<String, Object> boardManListOne(BoardDto boardDto);

	Map<String, Object> board_My_List(NumberDto numberDto);



	
	
}
