<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	  <h2>섹션 다시 읽어오기 : 섹션 모두 삭제</h2>
	  <%
	     
	     if(session.getAttribute("session_flag")==null){
	    	 out.println("session_flag는 존재하지 않습니다.<br>");
	     }else{
	    	out.println("session_flag 값 : "+session.getAttribute("session_flag").toString()); 
	    	 out.println("<br>");
	     }
	     
	     //섹션모두삭제
	     session.invalidate();
	   
	  %>
	  
	  <a href="./sessionDelete.jsp">섹션 모두삭제</a>
	
	</body>
</html>