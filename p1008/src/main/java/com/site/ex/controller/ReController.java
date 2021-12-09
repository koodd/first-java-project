package com.site.ex.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.ro")
public class ReController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		System.out.println("form1 id데이터 : "+ request.getParameter("id"));
		System.out.println("form1 pw데이터 : "+ request.getParameter("pw"));
		String uri = request.getRequestURI();
		int cPath = request.getContextPath().length();
		String fileName = uri.substring(cPath);
		
		if(fileName.equals("/doForm.ro")) {
			//jsp페이지에서는 session 내부객체, servlet페이지에서는 객체선언후 사용가능
			//HttpSession session = request.getSession();
			//session.setAttribute("session_id","aaa");
			request.setAttribute("r_id", "admin");
			request.setAttribute("r_pw", "1111");
			//response.sendRedirect("formOk.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/formOk.jsp");
			dispatcher.forward(request, response);
			
		}else if(fileName.equals("/form1.ro")) {
			response.sendRedirect("form1.jsp");
		}
		
		
		
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}
	

}
