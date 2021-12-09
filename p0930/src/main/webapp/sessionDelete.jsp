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
	  <%
		  Enumeration enumeration = session.getAttributeNames();
	      int i=1;
	      while(enumeration.hasMoreElements()){
	    	 String eName =(String) enumeration.nextElement();
	    	 String eValue = (String)session.getAttribute(eName);
	    	 out.println(i+"번째"+eName +" 의 값 : "+eValue+"<br>");
	    	 i++; 
	      }
	      
	      if(i == 1){
	    	  out.println("섹션의 값이 없습니다.!<br>");
	      }
	  %>
	  
	  <a href="./ex0930_04.jsp">섹션저장</a>
	
	
	</body>
</html>