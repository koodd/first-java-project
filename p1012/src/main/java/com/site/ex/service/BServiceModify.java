package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.BoardDao;
import com.site.ex.dto.BoardDto;

public class BServiceModify implements BService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1.dao 객체선언
		BoardDao bDao = new BoardDao();
		//request파리미터로 넘어온 데이터 변수저장
		int bid = Integer.parseInt(request.getParameter("bid"));
		//게시글수정 위한 1개 데이터 가져오는 메소드호출 - BoardDto
		BoardDto bDto = bDao.selectBoardView(bid,1);
		request.setAttribute("bDto", bDto);

	}

}
