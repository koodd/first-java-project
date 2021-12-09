<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
	  <h3>메인페이지</h3>
	  <ul>
	    <%
	      if(session.getAttribute("session_id")==null){
	    %>	  
		    <li>로그인을 하시면 정보수정이 가능합니다.</li>
		    <li><a href="login.html">로그인</a></li>
		    <li><a href="login2.html">로그인2</a></li>
		    <li><a href="join.html">회원가입</a></li>
	    <%	  
	      }else{
	    %>
		    <li><%=session.getAttribute("session_id")%>님 환영합니다.</li>
		    <li><a href="logout.jsp">로그아웃</a></li>
		    <li><a href="modify.jsp">회원정보수정</a></li>
		    <li><a href="mList.jsp">회원전체리스트</a></li>
	    <%} %>
	  
	  </ul>
	
	</body>
</html>