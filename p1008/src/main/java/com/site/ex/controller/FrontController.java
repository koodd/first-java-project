package com.site.ex.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.ko")
public class FrontController extends HttpServlet {
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
		String uri = request.getRequestURI();
		int con_Length = request.getContextPath().length();
		String fileName = uri.substring(con_Length);
		
		if(fileName.equals("/boardList.do")) {
			System.out.println("boardList.jsp페이지 호출");
		}else if(fileName.equals("/boardView.do")) {
			System.out.println("boardView.jsp페이지 호출");
		}else if(fileName.equals("/boardWrite.do")){
			System.out.println("boardWrite.jsp페이지 호출");
		}
	    
		
		
		
		
		
		
	    response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head></head>");
		writer.println("<body>");
		writer.println("<h2>Controller페이지입니다.</h2>");
		writer.println("<h2>호출한 파일명 :"+ fileName  +"</h2>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}
	
	//form method="get",url직접들어오면 doGet실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}

	//form method="post" doPost실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}
	

}
