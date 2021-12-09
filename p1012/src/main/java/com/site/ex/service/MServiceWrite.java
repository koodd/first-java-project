package com.site.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.MemberDao;
import com.site.ex.dto.MemberDto;

public class MServiceWrite implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao mDao = new MemberDao();
		//입력데이터 가져오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String[] hobbys = request.getParameterValues("hobby");
		String hobby="";
		for(int i=0;i<hobbys.length;i++) {
			if(i==0) {
				hobby += hobbys[i];
			}else {
				hobby +=","+hobbys[i];
			}
		}
		MemberDto mDto = new MemberDto(id, pw, name, email, hobby);
		//db에 저장
		mDao.insertMember(mDto);

	}

}
