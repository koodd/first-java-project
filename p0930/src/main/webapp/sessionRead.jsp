<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <h2>모든섹션 읽어오기 : 섹션1개를 삭제</h2>
	  <%
	      //1개섹션 읽어오기
	      out.println("<h3>1개섹션 읽어오기</h3><br>");
	      String id = (String)session.getAttribute("session_id");
	      out.println("id : "+id+"<br>");
	      
	      out.println("<hr>");
	      // 섹션 모든이름 가져오기
	      out.println("<h3>모든섹션 읽어오기</h3><br>");
	      Enumeration enumeration = session.getAttributeNames();
	      int i=1;
	      while(enumeration.hasMoreElements()){
	    	 String eName =(String) enumeration.nextElement();
	    	 String eValue = (String)session.getAttribute(eName);
	    	 out.println(i+"번째"+eName +" 의 값 : "+eValue+"<br>");
	    	 i++; 
	      }
	      
	      out.println("<hr>");
	      // 섹션 1개 삭제
	      out.println("<h3>섹션 1개 삭제</h3><br>");
	      session.removeAttribute("session_flag");
	      
	  %>
	  
	  <a href="./sessionReroad.jsp">섹션 다시읽어오기</a>
	  
	
	</body>
</html>