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
	
	  <c:if test="${result==1}">
		<script type="text/javascript">
		   alert("로그인 되었습니다!");
		</script>
	  </c:if>
	  
	  <c:if test="${session_id == null}">
		  <li><h3>로그인을 하셔야 합니다.</h3></li>
		  <li><a href="login.do">로그인</a></li>
		  <li>회원가입</li>
	  </c:if>
	  <c:if test="${session_id != null }">
		  <li><h3>${session_id} 님 환영합니다.</h3></li>
		  <li><a href="logout.do">로그아웃</a></li>
		  <li>회원정보수정</li>
		  <li>게시판</li>
		  <li>회원전체리스트</li>
	  </c:if>
	</ul>
	
	</body>
</html>