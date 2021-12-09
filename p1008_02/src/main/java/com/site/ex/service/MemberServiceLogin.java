package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.MemberDao;
import com.site.ex.dto.MemberDto;

public class MemberServiceLogin implements MemberService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//Dao연결
		int result=0;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDao mDao = new MemberDao();
		MemberDto mDto = mDao.selectMemberLogin(id, pw);
		if(mDto!=null) {
			result=1;
		}
		
		request.setAttribute("result", result);
		request.setAttribute("mDto", mDto);

	}

}
