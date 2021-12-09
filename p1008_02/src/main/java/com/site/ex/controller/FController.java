package com.site.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.site.ex.service.MemberService;
import com.site.ex.service.MemberServiceLogin;


@WebServlet("*.do")
public class FController extends HttpServlet {
	
	//Controller구현
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session객체선언을 해야 사용가능
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		int cPath = request.getContextPath().length();
		//입력한 파일이름 가져오기
		String fileName = uri.substring(cPath);
		String page="";
		MemberService memberService=null;
		if(fileName.equals("/index.do")) {
			page="index.jsp";
			
		}else if(fileName.equals("/login.do")) {
			page="login.jsp";
		}else if(fileName.equals("/doLogin.do")) {
			//db연결해서 데이터를 가져와야 함.
			// MemberService,MemberServiceLogin,MemberDao
			memberService = new MemberServiceLogin();
			memberService.execute(request, response); //result,mDto 데이터 넘어옴.
			if((int)request.getAttribute("result")==1) {
				page="index.jsp";
				session.setAttribute("session_id", request.getParameter("id"));
			}else {
				//result=0 경우 실패
				page="login.jsp";
			}
		}else if(fileName.equals("/logout.do")) {
			session.invalidate();
			page="logout.jsp";
		}
		
		
		//공통으로 dispatcher 사용
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
	
	
	//------------------------------------------
	
	//get방식,post방식 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("");
		doAction(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("");
		doAction(request, response);
	}

}
