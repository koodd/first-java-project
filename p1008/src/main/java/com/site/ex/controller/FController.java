package com.site.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.site.ex.service.BoardService;
import com.site.ex.service.BoardServiceList;


@WebServlet("*.do")
public class FController extends HttpServlet {
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
	
		String uri = request.getRequestURI();
		int cPath = request.getContextPath().length();
		//파일호출url /list.do
		String fileName = uri.substring(cPath);
		BoardService boardService=null;
		
		
		if(fileName.equals("/boardList.do")) {
			//service 호출
			System.out.println("boardList.do호출");
			boardService = new BoardServiceList();
			//request에 ArrayList담겨서 넘어옴.
			boardService.execute(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("boardList.jsp");
			dispatcher.forward(request, response);
		}else if(fileName.equals("/memberList.do")) {
			//MemberService 호출
			
			
			
		}
	
	
	
	
	}
	
	//form -> method=get,url링크로 들어오면 doGet실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}
	//form -> method=post 들어오면 doPost실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}

}
