package com.hphfarm.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hphfarm.www.dto.BoardTotalDto;
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
		
		NumberDto nDto = numberling(numberDto);
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
		//공지 게시글 1개 출력
	@Override
	public Map<String, Object> boardNoticeOne(int bn_no) {
		Map<String, Object> map = new HashMap<String, Object>();
			
			boardMapper.UpdateBoardHit(bn_no);
			
			BoardDto bDto = boardMapper.BoardNoticeOne(bn_no);
			
			BoardDto preDto = boardMapper.BoardNoticeOnePre(bn_no);
								
			BoardDto nextDto = boardMapper.BoardNoticeOneNext(bn_no);
			
			map.put("bDto", bDto);
			map.put("preDto", preDto);
			map.put("nextDto", nextDto);
			return map;
	}
		//공지 게시물 삭제
	@Override
	public int delete_board_notice(int bn_no) {
		int result = 0;
		result = boardMapper.Delete_man_public_board(bn_no);
		return result;
	}
		//공지 게시물 작성
	@Override
	public int board_Public_Write(BoardDto boardDto) {
		int result = boardMapper.Insert_board_public_Write(boardDto);
		
		return result;
	}
	//공지 업데이트 수정
	@Override
	public int board_public_modify(BoardDto boardDto) {
		int result = boardMapper.Update_board_public_modify(boardDto);
		
		return result;
	}



		// 유저게시판 전체 리스트 가져오기
	@Override
	public Map<String, Object> boardUserlist(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
	
		NumberDto nDto = numberling2(numberDto);
	
		List<BoardTotalDto> list = boardTotalMapper.SelectUserBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getBc_no());
	
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
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,bc_no,searchWord);
		return nDto;
	}
	
		//유저 게시글 작성
	public int board_User_Write(BoardDto boardDto) {
	
		
		int result = boardMapper.Insert_board_User_Write(boardDto);
		
		return result;
	}

	//유저 게시판 1개 게시물 가져오기
	@Override
	public Map<String, Object> boardUserOne(BoardDto boardDto) {
	
		Map<String, Object> map = new HashMap<String, Object>();
			boardTotalMapper.UpdateUserHit(boardDto);
			
			//멤버쪽 하고 게시판 멤버:u_no,u_id,u_pw,u_name,u_nickname,u_phone,u_regno,u_email,
			//u_addr,u_infoway,u_account,u_bank,u_accountno,uc_no
			//게시판 : bt_no,bt_title,bt_content,bt_bt_date,bt_hit,bt_group,bt_indent,bt_replu,
			//bt_report,bt_upload,bc_no
			BoardTotalDto  bDto = boardTotalMapper.BoardUserOne(boardDto);
			BoardTotalDto preDto = boardTotalMapper.BoardUserOnePre(boardDto);
			BoardTotalDto nextDto = boardTotalMapper.BoardUserOneNext(boardDto);
			List<BoardTotalDto> comm = boardTotalMapper.BoardCommList(boardDto);

		    
			 map.put("comm", comm);
			 map.put("bDto", bDto);
			 map.put("preDto", preDto);
			 map.put("nextDto", nextDto);
			
		return map;
	}


	//유저 게시판 신고 횟수 증가
	@Override		
	public int board_Report_Update(BoardDto boardDto) {
		
		int result= boardTotalMapper.Update_Board_Report(boardDto);
		
		return result;
	}


	@Override	//유저 게시판 댓글 작성
	public Map<String, Object> board_Comm_write(BoardDto boardDto) {
		Map<String,Object> map = new HashMap<String,Object>();
		//댓글저장
		boardTotalMapper.Insert_Comm_Write(boardDto);
		
		BoardTotalDto cDto = boardTotalMapper.SelectCommOne(boardDto);
		map.put("cDto", cDto);
		return map;
	}

			
	@Override	// 유저 댓글 저장
	public BoardTotalDto board_Comm_Save(BoardDto boardDto) {
	
		boardTotalMapper.Update_Board_Comm(boardDto);
		
		BoardTotalDto cDto = boardTotalMapper.SelectCommOne(boardDto);
		return cDto;
	}
	
	@Override //  유저 댓글삭제
	public int board_Comm_Delete(BoardDto boardDto) {
		
		int result = boardTotalMapper.Delete_Baord_Comm(boardDto);
		return result;
	}

	//관리자 신고 게시글 list
	@Override
	public Map<String, Object> board_Report_list(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출
		
		NumberDto nDto = numberling3(numberDto);					
		List<BoardTotalDto> list = boardTotalMapper.SelectReportBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword());
		
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
			//관리자 신고글 view
	@Override
	public Map<String, Object> boardReportOne(BoardDto boardDto) {

		Map<String, Object> map = new HashMap<String, Object>();
	
			BoardTotalDto  bDto = boardTotalMapper.BoardReportOne(boardDto);
			/**/
			List<BoardTotalDto> comm = boardTotalMapper.BoardReportCommList(boardDto);

		    
			 map.put("comm", comm);
			 map.put("bDto", bDto);
			 
			
		return map;
	}

	
	//매니저 신고글 댓글 삭제
	@Override
	public int board_Report_Comm_Delete(BoardDto boardDto) {
		
		int result = boardTotalMapper.Delete_Report_Comm(boardDto);
		
		return result;
	
	}
	//유저 게시글 삭제
	@Override
	public int board_user_delete(BoardDto boardDto) {
		
			
			int result = 0;
			result = boardTotalMapper.Delete_User_Board(boardDto);
			return result;
	}
		//관리자 커뮤니티 리스트 
	@Override
	public Map<String, Object> board_Man_BoardList(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출
		
		NumberDto nDto = numberling4(numberDto);
		
		//게시글 가져오기								
		List<BoardTotalDto> list = boardTotalMapper.SelectManBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword());
		
		map.put("list", list);
		map.put("nDto", nDto);

		return map;
	}
	//관리자 커뮤니티 리스트 넘버링
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
		
		BoardTotalDto  bDto = boardTotalMapper.BoardManListOne(boardDto);
		/**/
		List<BoardTotalDto> comm = boardTotalMapper.BoardManListCommList(boardDto);

	    
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
		nDto.setU_no(numberDto.getU_no());
		//게시글 가져오기								
		List<BoardTotalDto> list = boardTotalMapper.SelectMyBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getU_no());
		
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
		NumberDto nDto=new NumberDto(page,limit,numLimit,listCount,maxPage,startPage,endPage,startrow,endrow,category,u_no,searchWord);
		return nDto;
	}

	//마이페이지 뷰 1개 게시물 가져오기

	@Override
	public Map<String, Object> boardMyListOne(BoardDto boardDto) {
			
		Map<String, Object> map = new HashMap<String, Object>();
		
		BoardTotalDto  bDto = boardTotalMapper.BoardManListOne(boardDto);
		/**/
		List<BoardTotalDto> comm = boardTotalMapper.BoardManListCommList(boardDto);
		
	    
		 map.put("comm", comm);
		 map.put("bDto", bDto);
		 
		
	return map;
	}

	// 유저 정보게시판 목록 뽑기
		@Override
		public Map<String, Object> board_info(NumberDto numberDto) {
			Map<String, Object> map = new HashMap<String, Object>();
			NumberDto nDto = numberling7(numberDto);
		
			List<BoardDto> list = boardMapper.selectInfoBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getBc_no());
			map.put("list", list);
			map.put("nDto", nDto);
			return map;
		}
		
			//유저 정보 게시판 list 넘버링
		public NumberDto numberling7(NumberDto numberDto) {
			int page=0;
			if(numberDto.getPage()==0) page=1;
			else page = numberDto.getPage();
			
			String category = numberDto.getCategory();
			String searchWord = numberDto.getSearchword();
			int limit=4; // 1페이지에 나오는 게시글 수
			int numLimit=10; // 하단 넘버링 개수
			
			//공지 총게시글 수
			int listCount = boardMapper.selectInfoListCount(category,searchWord);
			
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
		

		// 정보 게시판 리스트
		@Override
		public Map<String, Object> infolist(NumberDto numberDto) {
			Map<String, Object> map = new HashMap<String, Object>();
			//넘버링 메소드 호출
			NumberDto nDto = numberling6(numberDto);
				
			//게시글 가져오기
			List<BoardDto> list = boardMapper.selectInfoBoardList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword(),nDto.getBc_no());
			map.put("list", list);
			map.put("nDto", nDto);
			return map;

		}
		
		//관리자 정보 게시판 넘버링
		public NumberDto numberling6(NumberDto numberDto) {
			int page=0;
			if(numberDto.getPage()==0) page=1;
			else page = numberDto.getPage();
			
			String category = numberDto.getCategory();
			String searchWord = numberDto.getSearchword();
			int limit=15; // 1페이지에 나오는 게시글 수
			int numLimit=10; // 하단 넘버링 개수
			
			//공지 총게시글 수
			int listCount = boardMapper.selectInfoListCount(category,searchWord);
			
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

		
		//관리자 정보 게시글 1개 가져오기
		@Override
		public Map<String, Object> boardinfoOne(int bn_no) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			boardMapper.UpdateBoardHit(bn_no);
			
			BoardDto bDto = boardMapper.BoardInfoOne(bn_no);
			
			BoardDto preDto = boardMapper.BoardInfoOnePre(bn_no);
								
			BoardDto nextDto = boardMapper.BoardInfoOneNext(bn_no);
			
			map.put("bDto", bDto);
			map.put("preDto", preDto);
			map.put("nextDto", nextDto);
			return map;
		}

		//관리자 게시글 작성
				@Override
				public int board_info_Write(BoardDto boardDto) {
					int result = boardMapper.Insert_board_info_Write(boardDto);
					
					return result;
				}

	
		
	

	

}
