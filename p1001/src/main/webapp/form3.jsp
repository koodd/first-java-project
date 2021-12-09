<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form</title>
	</head>
	<body>
	  <h2>학생성적 입력</h2>
	  <form action="./ex1001_08.jsp" method="post">
		  <label>학생이름</label>
		  <input type="text" name="stuname"><br>
		  <label>국어점수</label>
		  <input type="text" name="kor"><br>
		  <label>영어점수</label>
		  <input type="text" name="eng"><br>
		  <label>수학점수</label>
		  <input type="text" name="math"><br>
		  <input type="submit" value="성적저장">
		  <input type="reset" value="취소">
	  </form>
	</body>
</html>