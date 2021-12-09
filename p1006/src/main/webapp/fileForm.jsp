<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일업로드</title>
	</head>
	<body>
	  <h2>파일 업로드</h2>
	  <form action="doFileForm.jsp" method="post" enctype="multipart/form-data" >
	    <label>제목</label>
	    <input type="text" id="title" name="title"><br>
	    <label>내용</label>
	    <input type="text" id="content" name="content"><br>
	    <label>파일첨부</label><br>
	    <input type="file" id="bfile" name="bfile"><br>
	    <!-- <input type="file" id="bfile2" name="bfile2"><br> -->
	    <input type="submit" value="저장">
	  </form>
	
	</body>
</html>