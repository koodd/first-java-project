<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>성공</title>
	</head>
	<body>
	   <h2>당신의 이름 : <%=request.getParameter("name") %></h2>
	   <h2>당신의 나이 : <%=request.getParameter("age") %></h2>
	   <h2>주류 판매가 가능합니다.</h2>
	
	</body>
</html>