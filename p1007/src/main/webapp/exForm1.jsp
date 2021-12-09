<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form</title>
	</head>
	<body>
	  <h2>form 데이터</h2>
	  <form action="ex1007_01.jsp" method="post">
	     <label>이름</label>
	     <input type="text" name="bname"><br>
	     <label>제목</label>
	     <input type="text" name="btitle"><br>
	     <label>내용</label>
	     <input type="text" name="bcontent"><br>
	     <input type="submit" value="전송">
	  </form>
	
	</body>
</html>