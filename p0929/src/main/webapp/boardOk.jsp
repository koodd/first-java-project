<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		   table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
		<% request.setCharacterEncoding("utf-8"); %>
	</head>
	<body>
	  <table>
	    <tr>
	      <td>게시글 제목</td>
	      <td><%=request.getParameter("title") %></td>
	    </tr>
	    <tr>
	      <td>게시글 내용</td>
	      <td><%=request.getParameter("content") %></td>
	    </tr>
	    <tr>
	      <td>ip</td>
	      <td><%=request.getParameter("ip") %></td>
	    </tr>
	  </table>
	
	</body>
</html>