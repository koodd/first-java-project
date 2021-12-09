<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form</title>
	</head>
	<body>
	 <h2>회원가입</h2>
	 <form action="memberForm" method="post">
	   <label>아이디</label>
	   <input type="text" id="id" name="id"><br>
	   <label>패스워드</label>
	   <input type="text" id="pw" name="pw"><br>
	   <input type="submit" value="전송">
	   
	 </form>
	
	</body>
</html>