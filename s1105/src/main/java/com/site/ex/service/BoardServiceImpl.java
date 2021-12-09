package com.site.ex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.ex.dto.BoardDto;
import com.site.ex.dto.NumberDto;
import com.site.ex.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	@Override //전체게시글 가져오기
	public Map<String, Object> list(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		//넘버링 메소드 호출
		NumberDto nDto = numberling(numberDto);
		if(nDto.getSearchWord() ==null)
		    System.out.println("searchWord : "+nDto.getSearchWord());
		else
			System.out.println("searchWord no : "+nDto.getSearchWord());
		//게시글 가져오기
		List<BoardDto> list = boardMapper.selectList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchWord());
		System.out.println("nDto.getListCount(): "+nDto.getListCount());
		System.out.println("nDto.getPage(): "+nDto.getPage());
		System.out.println("nDto.getPage(): "+nDto.getPage());
		map.put("list", list);
		map.put("nDto", nDto);
		return map;
	}
	
	@Override //게시글 1개 가져오기
	public Map<String, Object> boardOne(int bid) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 조회수 1증가
		boardMapper.updateBhit(bid);
		BoardDto bDto = boardMapper.selectBoardOne(bid);
		//게시글 1개 가져오기(preview)
		BoardDto preDto = boardMapper.selectBoardOnePre(bid);
		//게시글 1개 가져오기(next)
		BoardDto nextDto = boardMapper.selectBoardOneNext(bid);
		map.put("bDto", bDto);
		map.put("preDto", preDto);
		map.put("nextDto", nextDto);
		return map;
	}

	@Override //게시글 1개 삭제하기
	public int delete(int bid) {
		System.out.println("serviceImpl bid : "+bid);
		int result = 0;
		result = boardMapper.boardDelete(bid);
		return result;
	}

	@Override //게시글 1개 저장
	public int modify(BoardDto boardDto) {
		int result = boardMapper.updateModify(boardDto);
		return result;
	}

	@Override //게시글 1개 저장:insert
	public int write(BoardDto boardDto) {
		int result = boardMapper.insertWrite(boardDto);
		return result;
	}

	@Override //게시글 1개 저장 : 답변달기
	public int reply(BoardDto boardDto) {
		//부모게시글 아래 있는 답변글에 1씩 증가
		boardMapper.updateReplyPlus(boardDto);
		//게시글 1개 저장 : 답변달기
		int result = boardMapper.insertReply(boardDto);
		return result;
	}
	
	// 넘버링 데이터 넣기
	public NumberDto numberling(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page = numberDto.getPage();
		
		String category = numberDto.getCategory();
		System.out.println("category : "+category);
		String searchWord = numberDto.getSearchWord();
		
		int limit=10; // 1페이지에 나오는 게시글 수
		int numLimit=10; // 하단 넘버링 개수
		//총게시글 수
		int listCount = boardMapper.selectListCount(category,searchWord);
		
		System.out.println("listCount : "+listCount);
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


}//class
