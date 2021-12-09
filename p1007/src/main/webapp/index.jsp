<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
	</head>
	<body>
	  <h2>메인페이지</h2>
	  <ul>
	    <c:if test="${session_id==null}">
	       <li>로그인을 하세요.</li>
		   <li><a href="login.html">로그인</a></li>
		   <li><a href="write.jsp">게시판글쓰기</a></li>
	    </c:if>
	    <c:if test="${session_id != null }">
		   <li>${session_id} 님 환영합니다.</li>
		   <li><a href="logout.jsp">로그아웃</a></li>
		   <li><a href="memberList.jsp">회원 전체리스트</a></li>
	    </c:if>
	  </ul>
	
	</body>
</html>