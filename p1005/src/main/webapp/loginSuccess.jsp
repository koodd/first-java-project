<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인성공</title>
		<style type="text/css">
		   div{ width:495px; margin: 0 auto;} 
		   table,th,td{border:1px solid black; border-collapse: collapse;}
		   table{ width:495px; margin: 0 auto; }
		</style>
	</head>
	<body>
	  <div>
		  <a href="login.html"><img src="images/success.jpg"></a>
	  </div>
	  <table>
	    <tr>
	      <td>아이디</td>
	      <td><%=request.getParameter("id") %></td>
	    </tr>
	    <tr>
	      <td>이름</td>
	      <td><%=request.getParameter("name") %></td>
	    </tr>
	  </table>
	
	</body>
</html>