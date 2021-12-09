package com.site.ex.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.dao.EventDao;
import com.site.ex.dto.EventDto;

public class EventServiceList implements EventService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDao eventDao = new EventDao();
		ArrayList<EventDto> list = eventDao.selectEventList();
		request.setAttribute("list", list);
		

	}

}
