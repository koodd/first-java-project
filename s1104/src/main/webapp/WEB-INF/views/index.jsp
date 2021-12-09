<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <h2>메인페이지</h2>
	  <c:if test="${session_id != null }">
	    <h2>닉네임 : ${session_name}</h2>
	  </c:if>
	  <c:if test="${session_id == null }">
	    <h2>로그인을 해주세요.</h2>
	  </c:if>
	  <ul>
	    <li><a href="member/login">로그인</a></li>
	    <li>회원가입</li>
	    <li><a href="member/logout">로그아웃</a></li>
	    <li><a href="board/list">게시판</a></li>
	    <li><a href="member/memberList">전체회원정보</a></li>
	  </ul>
	
	</body>
</html>