<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main</title>
	</head>
	<body>
	  <h2>메인페이지</h2>
	  <ul>
		  <c:if test="${session_id == null }">
		    <h3>로그인을 해주세요.</h3>
		    <li><a href="/testList">2개 테이블 조인</a></li>
		    <li><a href="/chartHtml">Chart보기</a></li>
		    <li><a href="/memberEmail">회원가입_이메일인증</a></li>
		    <li><a href="/list">공공데이터</a></li>
		    <li><a href="member/login">로그인</a></li>
		    <li><a href="member/membership">회원가입</a></li>
		  </c:if>
		  <c:if test="${session_id != null }">
		    <h3>${session_name} 님 환영합니다.</h3>
		    <li><a href="member/logout">로그아웃</a></li>
		    <li><a href="board/list">게시판</a></li>
		    <li><a href="event/event">event</a></li>
		  </c:if>
	  </ul>
	
	</body>
</html>