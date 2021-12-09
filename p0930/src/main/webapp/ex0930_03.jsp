<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키</title>
	</head>
	<body>
	  <h2>쿠키를 cookie1 저장</h2>
	  <%
	     //쿠키객체 생성
	     Cookie cookie1 = new Cookie("c_id","aaa");
	     //쿠키저장
	     response.addCookie(cookie1);
	  
	  %>
	  <a href="./cookieRead.jsp">쿠키읽어오기</a>
	
	</body>
</html>