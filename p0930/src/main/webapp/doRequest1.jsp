<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <%
	     //request.setCharacterEncoding("utf-8"); 
	     String name = URLEncoder.encode(request.getParameter("name"),"utf-8");
	     String age = request.getParameter("age");
	     //19세 이상에게만 주류판매 가능
	     int age1 = Integer.parseInt(age);
	     Calendar cal = Calendar.getInstance();
	     //Date d = new Date();
	     int year = cal.get(Calendar.YEAR);
	     int age2 = year-age1+1;
	     if(age2>=19){
	    	 response.sendRedirect("success.jsp?age="+age2+"&name="+name);
	     }else{
	    	 response.sendRedirect("fail.jsp?age="+age2+"&name="+name);
	     }
	  %>
	
	</body>
</html>