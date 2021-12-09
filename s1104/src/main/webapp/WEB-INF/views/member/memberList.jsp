<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
		<table>
		  <tr>
		    <td>아이디</td>
		    <td>패스워드</td>
		    <td>이름</td>
		    <td>이메일</td>
		    <td>취미</td>
		  </tr>
		  <c:forEach items="${list}" var="memberVo">
		  <tr>
		    <td>${memberVo.id}</td>
		    <td>${memberVo.pw}</td>
		    <td>${memberVo.name}</td>
		    <td>${memberVo.email}</td>
		    <td>${memberVo.hobby}</td>
		  </tr>
		  </c:forEach>
		</table>
	
	</body>
</html>