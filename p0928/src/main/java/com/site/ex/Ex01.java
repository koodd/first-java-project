package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	
	//get방식 들어오면 여기를 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet방식으로 들어온페이지를 오픈합니다.");
		doAction(request, response);
	}

	//post방식으로 들어오면 여기를 실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost방식으로 들어온페이지를 오픈합니다.");
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글처리
		request.setCharacterEncoding("utf-8");
		System.out.println("id : "+request.getParameter("id"));
		System.out.println("name : "+request.getParameter("name"));
		System.out.println("doAction방식으로 들어온페이지를 오픈합니다.");
		// contentType을 html로 응답
		response.setContentType("text/html; charset=utf-8");
		//writer객체 생성 
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>servlet html</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 html코드를 입력합니다.</h2>");
		writer.println("<h2>아이디 :"+ request.getParameter("id")  +"</h2>");
		writer.println("<h2>이름 :"+ request.getParameter("name")  +"</h2>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
	}
	
	
	// 리턴값이 여러개 일때 map을 사용
	public Map<String,Object> aaa(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "aaa");
		map.put("name", "홍길동");
		map.put("pw", "1234");

		return map;
	}
	

}
