<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		   table,th,td{border:1px solid black;  border-collapse: collapse;}
		</style>
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8");
		   String[] hobby = request.getParameterValues("hobby");
		   String hobbys="";
		   for(int i=0;i<hobby.length;i++){
			   //golf,game,run
			   if(i==0){
			     hobbys = hobbys+hobby[i];
			   }else{
     			 hobbys = hobbys+","+hobby[i];
			   }
		   }
		%>
	  <h2>회원가입 완료</h2>
	  <table>
	    <tr>
	      <td>아이디</td>
	      <td><%=request.getParameter("id") %></td>
	    </tr>
	    <tr>
	      <td>패스워드</td>
	      <td><%=request.getParameter("pw") %></td>
	    </tr>
	    <tr>
	      <td>이름</td>
	      <td><%=request.getParameter("name") %></td>
	    </tr>
	    <tr>
	      <td>취미</td>
	      <td><%= hobbys %></td>
	    </tr>
	    <tr>
	      <td>성별</td>
	      <td><%=request.getParameter("gender") %></td>
	    </tr>
	  
	  </table>
	  <form action="./modify.jsp" method="post" >
	    <input type="hidden" name="id" value='<%=request.getParameter("id") %>'>
	    <input type="hidden" name="pw" value='<%=request.getParameter("pw") %>'>
	    <input type="hidden" name="name" value='<%=request.getParameter("name") %>'>
	    <input type="hidden" name="hobby" value='<%= hobbys %>'>
	    <input type="hidden" name="gender" value='<%=request.getParameter("gender") %>'>
	    <input type="submit" value="수정">
	  </form>
	
	</body>
</html>