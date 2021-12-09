package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.site.ex.dao.MemberDao;
import com.site.ex.dto.MemberDto;

public class MServiceLogin implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao mDao = new MemberDao();
		int checkLogin = 0; //로그인성공여부 확인변수
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// id,pw검색시 데이터가 있으면 가져오기 - session에 저장하기 위해
		MemberDto mDto = mDao.selectLogin(id,pw);
		
		if(mDto!=null) {
			//로그인성공시
			checkLogin=1;
			HttpSession session = request.getSession();
			session.setAttribute("session_id", id);
		}
		
		request.setAttribute("checkLogin", checkLogin); //로그인성공:1, 실패:0

	}

}
