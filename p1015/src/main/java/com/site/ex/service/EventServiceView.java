package com.site.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.EventDao;
import com.site.ex.dto.EventDto;

public class EventServiceView implements EventService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDao eventDao = new EventDao();
		int eid =Integer.parseInt(request.getParameter("eid"));
		EventDto eDto = eventDao.selectEventView(eid,1);
		EventDto nextDto = eventDao.selectEventView(eid,2);
		EventDto preDto = eventDao.selectEventView(eid,3);
		request.setAttribute("eDto", eDto);
		request.setAttribute("nextDto", nextDto);
		request.setAttribute("preDto", preDto);

	}

}
