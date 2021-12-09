<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <h2>form</h2>
	  <form action="doForm" method="post">
	    <label>id</label>
	    <input type="text" name="id" value="${id}"><br>
	    <label>pw</label>
	    <input type="text" name="pw" value="${pw}"><br>
	    <input type="submit" value="전송">
	  </form>
	
	</body>
</html>