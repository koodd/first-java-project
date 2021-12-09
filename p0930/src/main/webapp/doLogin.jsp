<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인확인</title>
	</head>
	<body>
	  <h2>로그인 확인</h2>
	  <%
	     String id = request.getParameter("id");
	     String pw = request.getParameter("pw");
	     
	     if(id.equals("aaa") && pw.equals("1111")){
	    	 //일치하면
	    	 session.setAttribute("session_id", id);
	    	 session.setAttribute("session_nickName", "happy행복");
	    	 session.setAttribute("session_email", "aaa@naver.com");
	    	 response.sendRedirect("./main01.jsp");
	     }else{
	    	 //일치하지 않으면
	    	 response.sendRedirect("./login.html");
	     }
	  %>
	
	</body>
</html>