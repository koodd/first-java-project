<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <h2>forward param태그</h2>
	  <jsp:forward page="view1.jsp">
	    <jsp:param value='<%=URLEncoder.encode("이순신","utf-8") %>' name="name"/>
	    <jsp:param value="2002" name="age"/>
	  
	  </jsp:forward>
	
	</body>
</html>