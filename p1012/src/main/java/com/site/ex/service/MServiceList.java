package com.site.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.MemberDao;
import com.site.ex.dto.BoardDto;
import com.site.ex.dto.MemberDto;

public class MServiceList implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao mDao = new MemberDao();
		//BoardDao의 selectBoardList호출 ->시작번호,끝번호를 매개변수로 넣어서 list가져옴.
		ArrayList<MemberDto> list = mDao.selectMemberList();
		request.setAttribute("list", list);
	}

}
