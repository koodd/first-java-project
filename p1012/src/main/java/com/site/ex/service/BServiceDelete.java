package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.BoardDao;

public class BServiceDelete implements BService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1.dao 객체선언
		BoardDao bDao = new BoardDao();
		//request파리미터로 넘어온 데이터 변수저장
		int bid = Integer.parseInt(request.getParameter("bid"));
		//게시글 삭제 메소드호출
		bDao.deleteBoard(bid);

	}

}
