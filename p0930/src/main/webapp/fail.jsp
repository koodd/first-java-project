<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>실패</title>
		<style type="text/css">
		  h2{color:red;}
		</style>
	</head>
	<body>
	   <h2>당신의 이름 : <%=request.getParameter("name") %></h2>
	   <h2>당신의 나이 : <%=request.getParameter("age") %></h2>
	   <h2>주류 판매가 불가능합니다.</h2>
	
	</body>
</html>