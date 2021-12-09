package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FS")
public class FormSave extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		System.out.println("doAction");
		//프로그램 구현
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String pw = request.getParameter("pw");
		String rec = request.getParameter("rec");  //yes,no
		
		//servlet에서 html소스 코드 넣기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head></head>");
		writer.println("<body>");
		writer.println("<h3>email1 :"+ email1   +" </h3>");
		writer.println("<h3>email2 :"+ email2   +" </h3>");
		writer.println("<h3>pw :"+ pw   +" </h3>");
		writer.println("<h3>rec :"+ rec   +" </h3>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}

	
	//get방식
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	//post방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
