package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.BoardDao;

public class BServiceDoReply implements BService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//1.dao 객체선언
		BoardDao bDao = new BoardDao();
		//request파리미터로 넘어온 데이터 변수저장
		int bid =Integer.parseInt(request.getParameter("bid"));
		String bname = request.getParameter("bname");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		int bgroup =Integer.parseInt(request.getParameter("bgroup"));
		int bstep =Integer.parseInt(request.getParameter("bstep"));
		int bindent =Integer.parseInt(request.getParameter("bindent"));
		//답변글 저장전, 부모bstep보다 큰수는 1씩증가후, 저장 메소드호출
		bDao.updateBoardStepUp(bgroup, bstep);
		bDao.insertBoardReply(bid,bname,btitle,bcontent,bgroup,bstep,bindent);

	}

}
