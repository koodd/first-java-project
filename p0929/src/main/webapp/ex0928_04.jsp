<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <table>
	     <tr>
	       <th>아이디</th>
	       <th>이름</th>
	       <th>성별</th>
	     </tr>
	     <tr>
	       <td><%=request.getParameter("id") %></td>
	       <td><%=request.getParameter("name") %></td>
	       <td><%=request.getParameter("gender") %></td>
	     </tr>
	  
	  </table>
	
	</body>
</html>