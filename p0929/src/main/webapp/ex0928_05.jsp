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
	</head>
	<body>
	<!-- 1부터 100까지 합의 결과값 -->
	  <h2>더하기 결과값</h2>
	  <table>
	    <% int sum=0;
	       for(int i=1;i<=100;i++){
	        sum += i;
	    %>
	    <%--반복문 시작 --%>
	    <tr>
	      <td>1</td>
	      <td>부터</td>
	      <td><%=i %></td>
	      <td>까지</td>
	      <td><%=sum %></td>
	    </tr>
	    <%} %>
	   
	  </table>
	</body>
</html>