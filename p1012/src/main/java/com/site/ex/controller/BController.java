package com.site.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.site.ex.service.BService;
import com.site.ex.service.BServiceDelete;
import com.site.ex.service.BServiceDoModify;
import com.site.ex.service.BServiceDoReply;
import com.site.ex.service.BServiceList;
import com.site.ex.service.BServiceModify;
import com.site.ex.service.BServiceReply;
import com.site.ex.service.BServiceView;
import com.site.ex.service.BServiceWrite;
import com.site.ex.service.MService;
import com.site.ex.service.MServiceList;
import com.site.ex.service.MServiceLogin;
import com.site.ex.service.MServiceWrite;


@WebServlet("*.do")
public class BController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("doAction");
		//파일이름을 찾아야 함. - p1012/index.do
		String uri = request.getRequestURI();  //p1012/index.do
		System.out.println("uri : "+uri);
		int cPath = request.getContextPath().length(); //p1012 - 5
		String fileName = uri.substring(cPath); // /index.do
		System.out.println("fileName : "+fileName);
		String page="";
		int flag=0;
		BService bService=null;
		MService mService=null;
		if(fileName.equals("/index.do")) {
			page="index.jsp";
		}else if(fileName.equals("/boardList.do")) {
			//dao -> 전체게시판글을 가져와야 함.
			// 객체선언  MVC - Service,Model
			bService = new BServiceList();
			// request에 list가 담겨짐.
			bService.execute(request, response);
			page="boardList.jsp";
		}else if(fileName.equals("/boardView.do")) {
			bService = new BServiceView();
			bService.execute(request, response);
			page="boardView.jsp";
		}else if(fileName.equals("/boardWrite.do")) {
		    page="boardWrite.jsp";	
		}else if(fileName.equals("/doBoardWrite.do")) {
			//bService객체선언
			bService = new BServiceWrite();
			//request 파리미터 데이터 값이 db저장됨.
			bService.execute(request, response);
			page="doBoardWrite.jsp";
		}else if(fileName.equals("/boardDelete.do")) {
			System.out.println("controller : "+ request.getParameter("bid"));
			//bService객체선언
			bService = new BServiceDelete();
			//request 파리미터 데이터 값이 db저장됨.
			bService.execute(request, response);
			page="boardList.do";
		}else if(fileName.equals("/boardModify.do")) {
			bService = new BServiceModify();
			//request 파리미터 데이터 값이 db저장됨.
			bService.execute(request, response);
			page="boardModify.jsp";
		}else if(fileName.equals("/doBoardModify.do")) {
			int bid = Integer.parseInt(request.getParameter("bid"));
			bService = new BServiceDoModify();
			//request 파라미터 데이터 값이 db저장됨
			bService.execute(request, response);
			page="boardView.do?bid="+bid;
		}else if(fileName.equals("/boardReply.do")) {  //답변글
			//bService객체선언
			bService = new BServiceReply();
			//request 파라미터 데이터 값이 db저장됨
			bService.execute(request, response);
			page="boardReply.jsp";
		}else if(fileName.equals("/doBoardReply.do")) { //답변글저장
			//bService객체선언
			bService = new BServiceDoReply();
			//request 파리미터 데이터 값이 db저장됨.
			bService.execute(request, response);
			flag=1;
			response.sendRedirect("boardList.do");
			//page="boardList.do";
		}else if(fileName.equals("/search.do")) {
			bService = new BServiceList();
			bService.execute(request, response);
			page="boardList.do";
		}else if(fileName.equals("/login.do")){
			page="login.html";
		}else if(fileName.equals("/doLogin.do")){
			mService = new MServiceLogin();
			mService.execute(request, response);
			page="doLogin.jsp";
		}else if(fileName.equals("/logout.do")){
			HttpSession session = request.getSession();
			session.invalidate();
			page="doLogout.jsp";
		}else if(fileName.equals("/membership.do")){
			page="membership.jsp";
		}else if(fileName.equals("/doMembership.do")){
			mService = new MServiceWrite();
			mService.execute(request, response);
			page="step04.html";
		}else if(fileName.equals("/memberList.do")){
			mService = new MServiceList();
			mService.execute(request, response);
			page="memberList.jsp";
		}
			
		
		//----------
		// 페이지 forward기능이 있음. sendRedirect-request,response신규리턴,dispatcher-기존request,response를 그대로 리턴
		//response.sendRedirect("index.jsp");
		if(flag==0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(page);
			dispatcher.forward(request, response);
		}
	
	}//doAction
	
	
	//--------------------------
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}
	
	

}
