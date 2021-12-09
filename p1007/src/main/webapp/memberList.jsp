<%@page import="com.site.ex.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.site.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	  h2,table{width:1000px; margin:30px auto; text-align: center; }
	  table,th,td{border:1px solid black; border-collapse: collapse;}
	</style>
	</head>
	<body>
	<%
	   MemberDao mDao = new MemberDao();
	   ArrayList<MemberDto> list = mDao.selectMemberAll();
	   out.println("첫번째 데이터 id : "+list.get(0).getId());
	%>
	<c:set var="memberList" value="<%=list %>" />
	<h2>전체회원 리스트</h2>
	<table>
	    <tr>
	      <th>아이디</th>
	      <th>패스워드</th>
	      <th>이름</th>
	      <th>이메일</th>
	      <th>취미</th>
	    </tr>
	    <c:forEach items="${memberList}" var="mDto" >
	    <tr>
	      <td>${mDto.id }</td>
	      <td>${mDto.pw }</td>
	      <td>${mDto.name }</td>
	      <td>${mDto.email }</td>
	      <td>${mDto.hobby }</td>
	    </tr>
	    </c:forEach>
	</table>    
	
	</body>
</html>