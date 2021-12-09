<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form</title>
	</head>
	<body>
	  <h2>학생데이터 입력</h2>
	  <form action="./ex1001_03.jsp" method="post">
		  <label>학생이름</label>
		  <input type="text" name="name"><br>
		  <label>학생나이</label>
		  <input type="text" name="age"><br>
		  <label>학년</label>
		  <input type="text" name="grade"><br>
		  <label>학번</label>
		  <input type="text" name="studentNum"><br>
		  <input type="submit" value="전송">
	  </form>
	</body>
</html>