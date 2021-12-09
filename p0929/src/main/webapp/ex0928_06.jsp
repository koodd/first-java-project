<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <!-- request,response객체 -->
	  <%
	     out.println("ContextPath : "+request.getContextPath()+"<br>");
	     out.println("url : "+request.getRequestURL()+"<br>");
	     out.println("uri : "+request.getRequestURI()+"<br>");
	     out.println("ip : "+request.getRemoteAddr()+ "<br>");
	     String cPath = request.getContextPath();
	     String uri = request.getRequestURI();
	     //접속요청을 한 파일을 알아내는 방법
	     out.println("파일명을 출력 : "+ uri.substring(cPath.length()));
	  %>
	
	</body>
</html>