<%@page import="com.site.ex.dto.MemberDto"%>
<%@page import="com.site.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
	</head>
	<body>
	  <%
		  	 String id = request.getParameter("id");
		     out.println("id : "+id+"<br>");
		     MemberDao mDao = new MemberDao();
		     MemberDto mDto = mDao.selectMember(id);
	  %>
	  <h2>회원정보수정</h2>
	  <form action="doModify.jsp" method="post">
	    <label>아이디</label>
	    <span>id : <%=id %> </span>
	    <input type="hidden" name="id" value="<%=id %>"><br>
	    <label>비밀번호</label>
	    <input type="password" name="pw"><br>
	    <label>이름</label>
	    <input type="text" name="name" value="<%=mDto.getName() %>"><br>
	    <label>이메일</label>
	    <input type="text" name="email" value="<%=mDto.getEmail() %>"><br>
	    <label>취미</label><br>
	    <input type="checkbox" id="swim" name="hobby" value="swim" <%=(mDto.getHobby().contains("swim"))?"checked":"" %>><label for="swim">수영</label>
	    <input type="checkbox" id="run" name="hobby" value="run" <%=(mDto.getHobby().contains("run"))?"checked":"" %>><label for="run">조깅</label>
	    <input type="checkbox" id="game" name="hobby" value="game" <%=(mDto.getHobby().contains("game"))?"checked":"" %>><label for="game">게임</label>
	    <input type="checkbox" id="golf" name="hobby" value="golf" <%=(mDto.getHobby().contains("golf"))?"checked":"" %>><label for="golf">골프</label><br>
	    <br>
	    <input type="submit" value="저장">
	    <input type="reset" value="취소"><br>
	  
	  </form>
	
	</body>
</html>