<%@page import="java.net.URLDecoder"%>
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
	     String name = URLDecoder.decode(request.getParameter("name"),"utf-8");
	     String age = request.getParameter("age");
	     out.println("당신의 이름 : "+name+"<br>");
	     out.println("당신의 태어난 년도 : "+age);
	  %>
	
	</body>
</html>