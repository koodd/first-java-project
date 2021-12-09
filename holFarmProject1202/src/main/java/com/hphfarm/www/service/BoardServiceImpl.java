package com.hphfarm.www.service;

import java.io.ObjectOutputStream.PutField;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hphfarm.www.dto.BoardTotalDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.controller.BoardController;
import com.hphfarm.www.dto.BoardDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.mapper.BoardTotalMapper;
import com.hphfarm.www.mapper.BoardMapper;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardTotalMapper boardTotalMapper;
	
	@Autowired
	BoardMapper boardMapper;
		
///////////////////////공지사항 ////////////////
	
	@Override //공지 전체게시글 가져오기
	public Map<String, Object> list(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출
		NumberDto nDto = numberling(numberDto);
		//게시글 가져오기
		List<BoardDto> list = boardMapper.selectNoticeBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getBc_no());

		map.put("list", list);
		map.put("nDto", nDto);
		return map;
	}

		//공지 게시판 넘버링
	public NumberDto numberling(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page = numberDto.getPage();
		
		String category = numberDto.getCategory();
		String searchWord = numberDto.getSearchword();
		int limit=15; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
		
		//공지 총게시글 수
		int listCount = boardMapper.selectPublicListCount(category,searchWord);
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/limit);
		//하단넘버링 처음수
		int startPage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		//하단넘버링 마지막수
		int endPage = startPage+numLimit-1;
		//최대페이지가 마지막페이지보다 작으면 최대페이지까지만 출력 
		if(endPage>maxPage) endPage=maxPage;
		//가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		//가져올 마지막 수
		int endrow = startrow+limit-1;
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,searchWord);
		return nDto;
	}
		//게시글 1개 출력
	@Override
	public Map<String, Object> boardNoticeOne(int bn_no) {
		Map<String, Object> map = new HashMap<String, Object>();
			
			boardMapper.updateBoardHit(bn_no);
			BoardDto bDto = boardMapper.boardNoticeOne(bn_no);
			BoardDto preDto = boardMapper.boardNoticeOnePre(bn_no);
			BoardDto nextDto = boardMapper.boardNoticeOneNext(bn_no);
			
			map.put("bDto", bDto);
			map.put("preDto", preDto);
			map.put("nextDto", nextDto);
			return map;
	}
		//공지 게시물 삭제
	@Override
	public int delete_board_notice(int bn_no) {
		int result = 0;
		result = boardMapper.delete_man_public_board(bn_no);
		return result;
	}
		//공지 게시물 작성
	@Override
	public int board_Public_Write(BoardDto boardDto) {
		int result = boardMapper.insert_board_public_Write(boardDto);
		return result;
	}
	//공지 업데이트 수정
	@Override
	public int board_public_modify(BoardDto boardDto) {
		int result = boardMapper.update_board_public_modify(boardDto);
		
		return result;
	}
///////////////////////////////공지사항//////////////////////////////////////////
	//유저 게시판 전체 게시글 출력

		// 유저게시판 전체 리스트 가져오기
	@Override
	public Map<String, Object> boardUserlist(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		NumberDto nDto = numberling2(numberDto);
		List<BoardTotalDto> list = boardTotalMapper.selectUserBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getBc_no());
	
		map.put("list", list);
		map.put("nDto", nDto);

		return map;
	}
	
			//유저 전체 리스트 넘버링
	public NumberDto numberling2(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page = numberDto.getPage();
		 
		 
		String category = numberDto.getCategory();
		String searchWord = numberDto.getSearchword();
		
		int limit=15; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
		int bc_no=numberDto.getBc_no();
		//총게시글 수
		int listCount = boardTotalMapper.selectUserListCount(category,searchWord,bc_no);
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/limit);
		//하단넘버링 처음수
		int startPage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		//하단넘버링 마지막수
		int endPage = startPage+numLimit-1;
		//최대페이지가 마지막페이지보다 작으면 최대페이지까지만 출력 
		if(endPage>maxPage) endPage=maxPage;
		//가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		//가져올 마지막 수
		int endrow = startrow+limit-1;
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,searchWord,bc_no);
		return nDto;
	}
	
	public int board_User_Write(BoardDto boardDto) {
		int result = boardMapper.insert_board_User_Write(boardDto);
		
		return result;
	}

	//유저 게시판 1개 게시물 가져오기
	@Override
	public Map<String, Object> boardUserOne(BoardDto boardDto) {
	
		Map<String, Object> map = new HashMap<String, Object>();
			boardTotalMapper.updateUserHit(boardDto);
			
			BoardTotalDto  bDto = boardTotalMapper.boardUserOne(boardDto);
			BoardTotalDto preDto = boardTotalMapper.boardUserOnePre(boardDto);
			BoardTotalDto nextDto = boardTotalMapper.boardUserOneNext(boardDto);
			List<BoardTotalDto> comm = boardTotalMapper.boardCommList(boardDto);

			 map.put("comm", comm);
			 map.put("bDto", bDto);
			 map.put("preDto", preDto);
			 map.put("nextDto", nextDto);
			
		return map;
	}


	@Override		//유저 게시판 신고 횟수 증가
	public int board_Report_Update(BoardDto boardDto) {
		
		int result= boardTotalMapper.update_Board_Report(boardDto);
		
		return result;
	}


	@Override	//유저 게시판 댓글 작성
	public Map<String, Object> board_Comm_write(BoardDto boardDto) {
		Map<String,Object> map = new HashMap<String,Object>();
		//댓글저장
		boardTotalMapper.insert_Comm_Write(boardDto);
		
		BoardTotalDto cDto = boardTotalMapper.selectCommOne(boardDto);
		map.put("cDto", cDto);
		return map;
	}

			
	@Override	// 유저 댓글 저장
	public BoardTotalDto board_Comm_Save(BoardDto boardDto) {
	
		boardTotalMapper.update_Board_Comm(boardDto);
		
		BoardTotalDto cDto = boardTotalMapper.selectCommOne(boardDto);
		return cDto;
	}
	
	@Override //  유저 댓글삭제
	public int board_Comm_Delete(BoardDto boardDto) {
		
		int result = boardTotalMapper.delete_Baord_Comm(boardDto);
		return result;
	}

	//관리자 신고 게시글 list
	@Override
	public Map<String, Object> board_Report_list(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출	
		NumberDto nDto = numberling3(numberDto);	
		//게시글 가져오기								
		List<BoardTotalDto> list = boardTotalMapper.selectReportBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword());
		
		map.put("list", list);
		map.put("nDto", nDto);

		return map;
		
	}


			//관리자 신고 게시글 list 넘버링 
	public NumberDto numberling3(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page = numberDto.getPage();
		  
		String category = numberDto.getCategory();
		String searchWord = numberDto.getSearchword();
		
		int limit=15; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
		//총게시글 수
		int listCount = boardTotalMapper.selectReportListCount(category,searchWord);
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/limit);
		//하단넘버링 처음수
		int startPage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		//하단넘버링 마지막수
		int endPage = startPage+numLimit-1;
		//최대페이지가 마지막페이지보다 작으면 최대페이지까지만 출력 
		if(endPage>maxPage) endPage=maxPage;
		//가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		//가져올 마지막 수
		int endrow = startrow+limit-1;
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,searchWord);
		return nDto;
	}
			//신고글 view
	@Override
	public Map<String, Object> boardReportOne(BoardDto boardDto) {

		Map<String, Object> map = new HashMap<String, Object>();
	
			BoardTotalDto  bDto = boardTotalMapper.boardReportOne(boardDto);
			/**/
			List<BoardTotalDto> comm = boardTotalMapper.boardReportCommList(boardDto);
	    
			 map.put("comm", comm);
			 map.put("bDto", bDto);
			 
			
		return map;
	}

	
	//매니저 신고글 댓글 삭제
	@Override
	public int board_Report_Comm_Delete(BoardDto boardDto) {
		
		int result = boardTotalMapper.delete_Report_Comm(boardDto);
		
		return result;
	
	}
					//유저 게시글 삭제
	@Override
	public int board_user_delete(BoardDto boardDto) {
			
			int result = 0;
			result = boardTotalMapper.delete_User_Board(boardDto);
			return result;
	}
		//관리자 커뮤니티 리스트 
	@Override
	public Map<String, Object> board_Man_BoardList(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출
		
		NumberDto nDto = numberling4(numberDto);
		
		//게시글 가져오기								
		List<BoardTotalDto> list = boardTotalMapper.selectManBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword());
		
		map.put("list", list);
		map.put("nDto", nDto);

		return map;
	}

	public NumberDto numberling4(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page = numberDto.getPage();
		 
		 
		String category = numberDto.getCategory();
		String searchWord = numberDto.getSearchword();
		
		int limit=15; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
	
		//총게시글 수
		int listCount = boardTotalMapper.selectManListCount(category,searchWord);
		
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/limit);
		//하단넘버링 처음수
		int startPage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		//하단넘버링 마지막수
		int endPage = startPage+numLimit-1;
		//최대페이지가 마지막페이지보다 작으면 최대페이지까지만 출력 
		if(endPage>maxPage) endPage=maxPage;
		//가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		//가져올 마지막 수
		int endrow = startrow+limit-1;
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,searchWord);
		return nDto;
	}

		//관리자 커뮤니티 관리 1개 게시물 가져오기
	@Override
	public Map<String, Object> boardManListOne(BoardDto boardDto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		BoardTotalDto  bDto = boardTotalMapper.boardManListOne(boardDto);
		
		List<BoardTotalDto> comm = boardTotalMapper.boardManListCommList(boardDto);
	    
		 map.put("comm", comm);
		 map.put("bDto", bDto);
		 
		
	return map;
	}
		//마이페이지 리스트 불러오기
	@Override
	public Map<String, Object> board_My_List(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출
		
		NumberDto nDto = numberling5(numberDto);
		
		//게시글 가져오기								
		List<BoardTotalDto> list = boardTotalMapper.selectMyBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getU_no());
		
		map.put("list", list);
		map.put("nDto", nDto);

		return map;
	}
	//마이페이지 리스트 넘버링
	public NumberDto numberling5(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page = numberDto.getPage();
		
		int u_no = numberDto.getU_no();
		
		String category = numberDto.getCategory();
		String searchWord = numberDto.getSearchword();
		
		int limit=15; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
		//총게시글 수
		int listCount = boardTotalMapper.selectMyListCount(category,searchWord,u_no);
		
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/limit);
		//하단넘버링 처음수
		int startPage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		//하단넘버링 마지막수
		int endPage = startPage+numLimit-1;
		//최대페이지가 마지막페이지보다 작으면 최대페이지까지만 출력 
		if(endPage>maxPage) endPage=maxPage;
		//가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		//가져올 마지막 수
		int endrow = startrow+limit-1;
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,searchWord,u_no);
		return nDto;
	}




}
