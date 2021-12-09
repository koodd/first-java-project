<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="studentVo" class="com.site.bean.StudentVo" scope="page" /> 
<jsp:setProperty name="studentVo" property="*" />   
<%-- <jsp:setProperty name="studentVo" property="name" value='<%=request.getParameter("name") %>' /> --%>   
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
	    <td>학생이름</td>
	    <td><%=studentVo.getName() %></td>
	  </tr>
	  <tr>
	    <td>학생나이</td>
	    <td><%=studentVo.getAge() %></td>
	  </tr>
	  <tr>
	    <td>학년</td>
	    <td><%=studentVo.getGrade() %></td>
	  </tr>
	  <tr>
	    <td>학번</td>
	    <td><%=studentVo.getStudentNum() %></td>
	  </tr>
	</table>
	</body>
</html>