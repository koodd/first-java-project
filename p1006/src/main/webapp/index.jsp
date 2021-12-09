<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
	  <h2>메인페이지</h2>
	  <ul>
	    <% if(session.getAttribute("session_id")==null){
	    	//로그인이 되어 있으면(섹션이 있으면)
	    %>	   
	       <li><h3>로그인을 하셔야 이용이 가능합니다.</h3></li>
		   <li><a href="login.html">로그인</a></li>
		   <li><a href="join.html">회원가입</a></li>
	    <%}else{//로그인이 안되어 있으면(섹션이 없으면)%>  	
	       <li><h3><%=session.getAttribute("session_id")%>님 환영합니다.</h3></li>
		   <li><a href="logout.jsp">로그아웃</a></li>
		   <li><a href="modify.jsp?id=<%=session.getAttribute("session_id")%>">회원정보수정</a></li>
		   <li><a href="memberList.jsp">회원전체리스트</a></li>
	    <%}%>
	  
	    
	    
	  </ul>
	
	</body>
</html>