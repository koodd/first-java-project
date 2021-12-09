<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form</title>
	</head>
	<body>
	   <form action="./ex0928_04.jsp" name="form1" method="get">
	      <label>아이디</label>
	      <input type="text" name="id" ><br>
	      <label>이름</label>
	      <input type="text" name="name" ><br>
	      <label>성별</label>
	      <input type="radio" name="gender" id="male" value="남자"><label for="male">남자</label>
	      <input type="radio" name="gender" id="female" value="여자"><label for="female">여자</label><br>
	      <br>
	      <input type="submit" value="전송">
	   </form>
	
	</body>
</html>