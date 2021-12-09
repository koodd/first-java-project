<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>el태그</title>
		<style>
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	  <h2>el태그</h2>
	  <table>
	    <tr>
	      <td>이름</td>
	      <td><%=request.getParameter("bname") %></td>
	    </tr>
	    <tr>
	      <td>이름</td>
	      <td>${param.bname }</td>
	    </tr>
	    <tr>
	      <td>제목</td>
	      <td><%=request.getParameter("btitle") %></td>
	    </tr>
	    <tr>
	      <td>제목</td>
	      <td>${param.btitle }</td>
	    </tr>
	    <tr>
	      <td>내용</td>
	      <td><%=request.getParameter("bcontent") %></td>
	    </tr>
	    <tr>
	      <td>내용</td>
	      <td>${param.bcontent }</td>
	    </tr>
	    <tr>
	      <td>jsp태그</td>
	      <td><%=10+5 %></td>
	    </tr>
	    <tr>
	      <td>el태그</td>
	      <td>${10+5 }</td>
	    </tr>
	    <tr>
	      <td>jsp태그</td>
	      <td><%=(10/2)>2?"참":"거짓" %></td>
	    </tr>
	    <tr>
	      <td>el태그</td>
	      <td>${(10/2)>2?"참":"거짓" }</td>
	    </tr>
	  </table>
	
	</body>
</html>