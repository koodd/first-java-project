<%@page import="com.site.ex.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.site.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <% 
	       MemberDao mDao = new MemberDao();
	       ArrayList<MemberDto> list = mDao.memberList();
	    %>
		<meta charset="UTF-8">
		<title>회원전체리스트</title>
		<style type="text/css">
		  h2,table{width:1000px; margin:30px auto; text-align: center; }
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	  <h2>회원 전체리스트</h2>
	  <table>
	    <tr>
	      <th>아이디</th>
	      <th>패스워드</th>
	      <th>이름</th>
	      <th>이메일</th>
	      <th>취미</th>
	    </tr>
	    <% for(MemberDto dto:list){ %>   	
		    <tr>
		      <td><a href="modify.jsp?id=<%=dto.getId()%>"><%=dto.getId() %></a></td>
		      <td><a href="pwModify.jsp?id=<%=dto.getId()%>"><%=dto.getPw() %></a></td>
		      <td><%=dto.getName() %></td>
		      <td><%=dto.getEmail() %></td>
		      <td><%=dto.getHobby() %></td>
		    </tr>
	    <%}%>
	  </table>
	  <button><a href="index.jsp">home</a></button>
	
	</body>
</html>