<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>formOk</title>
	</head>
	<body>
	  <h2>formOk</h2>
	  <h3>id : <%=request.getParameter("id") %></h3>
	  <h3>pw : <%=request.getParameter("pw") %></h3>
	  <h3>r_id : <%=request.getAttribute("r_id") %></h3>
	  <h3>r_pw : <%=request.getAttribute("r_pw") %></h3>
	  
	
	</body>
</html>