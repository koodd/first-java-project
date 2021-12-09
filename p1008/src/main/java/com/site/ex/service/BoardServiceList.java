package com.site.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.BoardDao;
import com.site.ex.dto.BoardDto;

public class BoardServiceList implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BoardServiceList 호출");
		//request에 ArrayList를 담아주면 됨.
		BoardDao bDao = new BoardDao();
		ArrayList<BoardDto> list = bDao.selectBoardAll();
		request.setAttribute("list", list);

	}

}
