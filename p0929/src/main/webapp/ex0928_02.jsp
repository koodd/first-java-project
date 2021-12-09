<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		   table,td{border:1px solid black;  border-collapse: collapse;}
		</style>
	</head>
	<body>
	<h2>구구단</h2>
	   <table>
	     <% for(int j=1;j<=9;j++){ %>   	
		     <% for(int i=1;i<=9;i++){ %>   	
			     <tr>
			       <td><%=j %></td>
			       <td>*</td>
			       <td><%=i%></td>
			       <td>=</td>
			       <td><%=j*i %></td>
			     </tr>
		     <%}%>
	     <%}%>
	   </table>
	
	</body>
</html>