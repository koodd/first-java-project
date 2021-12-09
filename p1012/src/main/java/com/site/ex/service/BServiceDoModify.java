package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.BoardDao;

public class BServiceDoModify implements BService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1.dao 객체선언
		BoardDao bDao = new BoardDao();
		//request파리미터로 넘어온 데이터 변수저장
		int bid =Integer.parseInt(request.getParameter("bid"));
		String btitle = request.getParameter("btitle");
		String bname = request.getParameter("bname");
		String bcontent = request.getParameter("bcontent");
		//게시글 저장 메소드호출
		bDao.updateBoardModify(bid,btitle,bcontent);

	}

}
