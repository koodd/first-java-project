package com.site.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.BoardDao;
import com.site.ex.dto.BoardDto;

public class BServiceList implements BService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bDao = new BoardDao();
		int listCount=0;
		int page=1; 
		int limit=10;     //1페이지에 최대 게시글수 10개
		int numLimit=10;  //하단넘버링 개수 1,2,3***9,10   
		int maxpage = 0;  //하단넘버링 최대페이지 수
		int startpage=0;  //하단넘버링 시작페이지
		int endpage=0;    //하단넘버링 끝페이지
		int startrow=0;   //데이터 시작번호
		int endrow=0;     //데이터 끝번호
		String category="";   //검색카테고리
		String searchWord=""; //검색단어
		
		//검색을 통해들어왔는지,하단넘버링,게시판메뉴를 통해 들어왔는지 확인
		if(request.getParameter("category")!=null) {
			//검색을 클릭할때
			category = request.getParameter("category");
			searchWord = request.getParameter("searchWord");
		}
		
		//page 변수가 있을때
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		//게시글 전체 개수
		listCount = bDao.selectBoardCount(category,searchWord);
		System.out.println("listCount : "+listCount);
		//최대페이지,시작페이지,끝페이지
		//maxpage = (int)((double)listCount/limit+0.99);
		//startpage = (((int)((double)page/numLimit+0.99))-1)*numLimit+1;
		maxpage = (int) Math.ceil((double)listCount/limit);
		startpage = (((int)(Math.ceil((double)page/numLimit)-1)))*numLimit+1;
		endpage = startpage+numLimit-1;
		//끝페이지가 최대페이지보다 큰경우
		if(endpage>maxpage) endpage=maxpage;
		//데이터 시작번호, 끝번호 구하기
		startrow = (page-1)*limit+1;
		endrow = startrow+limit-1;
		System.out.println("startrow : "+startrow);
		System.out.println("endrow : "+endrow);
		//BoardDao의 selectBoardList호출 ->시작번호,끝번호를 매개변수로 넣어서 list가져옴.
		ArrayList<BoardDto> list = bDao.selectBoardList(startrow,endrow,category,searchWord);
		request.setAttribute("list", list);
		//하단넘버링에 필요한 변수
		request.setAttribute("listCount", listCount);
		request.setAttribute("page", page);  //요청한 현재페이지번호
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("category", category);
		request.setAttribute("searchWord", searchWord);

	}

}
