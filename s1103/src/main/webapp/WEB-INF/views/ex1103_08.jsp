<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리턴 값</title>
		<style type="text/css">
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	  <h2>form에서 데이터 받음</h2>
	  <table>
	    <tr>
	      <td>변수</td>
	      <td>값</td>
	    </tr>
	    <tr>
	      <td>아이디</td>
	      <td>${member.id}</td>
	    </tr>
	    <tr>
	      <td>패스워드</td>
	      <td>${member.pw}</td>
	    </tr>
	    <tr>
	      <td>이름</td>
	      <td>${member.name}</td>
	    </tr>
	    <tr>
	      <td>이메일</td>
	      <td>${member.email}</td>
	    </tr>
	    <tr>
	      <td>취미</td>
	      <td>${member.hobby}</td>
	    </tr>
	  </table>
	
	</body>
</html>