<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기</title>
	</head>
	<body>
	  <h2>카페 글쓰기</h2>
	  <hr>
	  <form action="./boardOk.jsp" method="post">
	  <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>" >
	  <table>
	    <tr>
	      <td><input type="text" name="title" placeholder="제목을 입력해 주세요." > </td>
	    </tr>
	    <tr>
	      <td><input type="text" name="content" placeholder="내용을 입력하세요." ></td>
	    </tr>
	  </table>
	    <input type="submit" value="등록" >
	  </form>
	
	</body>
</html>