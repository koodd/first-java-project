<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전체회원 리스트</title>
		<style type="text/css">
		  h2,table{width:1000px; margin:30px auto; text-align: center; }
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	  <a href="index.do"><h2>전체회원 리스트</h2></a>
	<table>
	    <tr>
	      <th>아이디</th>
	      <th>패스워드</th>
	      <th>이름</th>
	      <th>이메일</th>
	      <th>취미</th>
	    </tr>
	    <c:forEach items="${list}" var="mDto">
		    <tr>
		      <td>${mDto.id}</td>
		      <td>${mDto.pw}</td>
		      <td>${mDto.name}</td>
		      <td>${mDto.email}</td>
		      <td>${mDto.hobby}</td>
		    </tr>
	    </c:forEach>
	    
	</table>  
	
	</body>
</html>