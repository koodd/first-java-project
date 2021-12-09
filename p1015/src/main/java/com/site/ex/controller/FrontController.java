package com.site.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.service.EventService;
import com.site.ex.service.EventServiceList;
import com.site.ex.service.EventServiceUpdate;
import com.site.ex.service.EventServiceView;
import com.site.ex.service.EventServiceWrite;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();  //p1015/index.do
		System.out.println("uri : "+uri);
		int cPath = request.getContextPath().length(); //p1015 - 5
		String fileName = uri.substring(cPath); // /main.do
		System.out.println("fileName : "+fileName);
		String page="";
		int flag=0;
		EventService eventService=null;
		if(fileName.equals("/main.do")) {
			page="main.jsp";
		}else if(fileName.equals("/eventList.do")) {
			eventService = new EventServiceList();
			eventService.execute(request, response);
			page="eventList.jsp";
		}else if(fileName.equals("/eventWrite.do")) {
			page="eventWrite.jsp";
		}else if(fileName.equals("/doEventWrite.do")) {
			eventService = new EventServiceWrite();
			eventService.execute(request, response);
			page="doEventWrite.jsp";
		}else if(fileName.equals("/eventView.do")) {
			eventService = new EventServiceView();
			eventService.execute(request, response);
			page="eventView.jsp";
		}else if(fileName.equals("/eventUpdate.do")) {
			eventService = new EventServiceView();
			eventService.execute(request, response);
			page="eventUpdate.jsp";
		}else if(fileName.equals("/doEventUpdate.do")) {
			eventService = new EventServiceUpdate();
			eventService.execute(request, response);
			page="eventUpdate.jsp";
		}
		
		// 페이지 forward기능이 있음. sendRedirect-request,response신규리턴,dispatcher-기존request,response를 그대로 리턴
		//response.sendRedirect("index.jsp");
		if(flag==0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
		
	}//doAction
	
	
	
	
	//-----------------
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
