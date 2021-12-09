<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <h2>섹션설정 : 섹션3개 저장(session_id,session_nickName,session_flag)</h2>
	  <%
	      session.setAttribute("session_id", "aaa");
	      session.setAttribute("session_nickName", "happy");
	      session.setAttribute("session_flag", "success");
	  %>
	  
	  <a href="./sessionRead.jsp">섹션읽어오기</a>
	
	</body>
</html>