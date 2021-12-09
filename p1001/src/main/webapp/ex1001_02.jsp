<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- StudentVo studentVo = new StudentVo(); -->
<jsp:useBean id="studentVo" class="com.site.bean.StudentVo" scope="page" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>bean</title>
		<style type="text/css">
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	  <jsp:setProperty name="studentVo" property="name" value="홍길동" />
	  <jsp:setProperty name="studentVo" property="age" value="20" />
	  <jsp:setProperty name="studentVo" property="grade" value="3" />
	  <jsp:setProperty name="studentVo" property="studentNum" value="1" />
	  
	  <table>
	    <tr>
	      <td>학생이름</td>
	      <td><jsp:getProperty name="studentVo" property="name" /></td>
	    </tr>
	    <tr>
	      <td>학생나이</td>
	      <td><jsp:getProperty name="studentVo" property="age" /></td>
	    </tr>
	    <tr>
	      <td>학년</td>
	      <td><jsp:getProperty name="studentVo" property="grade" /></td>
	    </tr>
	    <tr>
	      <td>학번</td>
	      <td><jsp:getProperty name="studentVo" property="studentNum" /></td>
	    </tr>
	  </table>
	  
	  <hr>
	  <h2>단순표기</h2>
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