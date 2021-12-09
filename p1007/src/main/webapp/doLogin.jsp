<%@page import="com.site.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 체크</title>
	</head>
	<body>
	  <h2>${param.id}</h2>
	  <h2>${param.pw}</h2>
	  <%
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    MemberDao mDao = new MemberDao();
	    // id,pw를 dao로 보내서 id,pw가 있는지 확인
	    int result = mDao.loginChk(id, pw);
	    if(result==1){
	       session.setAttribute("session_id", id);
	  %>  	
	    <script type="text/javascript">
	      alert("로그인 성공!");
	      location.href="index.jsp";
	    </script>
	  <%}else{ %>  
	    <script type="text/javascript">
	      alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 입력하세요!");
	      location.href="login.html";
	    </script>
	  <%}%>
	
	</body>
</html>