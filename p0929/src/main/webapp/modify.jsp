<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<% request.setCharacterEncoding("utf-8"); %>
	  <h2>회원수정</h2>
	  <form action="formOk.jsp" method="post" name="form1">
	    <label>아이디</label>
	    <input type="text" id="id" name="id" value='<%=request.getParameter("id") %>'><br>
	    <label>패스워드</label>
	    <input type="text" id="pw" name="pw" value='<%=request.getParameter("pw") %>'><br>
	    <label>패스워드확인</label>
	    <input type="text" id="pw2" name="pw2"><br>
	    <label>이름</label>
	    <input type="text" id="name" name="name" value='<%=request.getParameter("name") %>'><br>
	    <label>취미</label> <!-- 골프,게임,조깅,수영 -->
	    <input type="checkbox" id="golf" name="hobby" value="골프" 
	    <%= (request.getParameter("hobby").contains("골프"))?"checked":""  %>
	    ><label for="golf">골프</label>
	    <input type="checkbox" id="game" name="hobby" value="게임" 
	    <%= (request.getParameter("hobby").contains("게임"))?"checked":""  %>
	    ><label for="game">게임</label>
	    <input type="checkbox" id="run" name="hobby" value="조깅" 
	    <%= (request.getParameter("hobby").contains("조깅"))?"checked":""  %>
	    ><label for="run">조깅</label>
	    <input type="checkbox" id="swim" name="hobby" value="수영"
	    <%= (request.getParameter("hobby").contains("수영"))?"checked":""  %>
	    ><label for="swim">수영</label><br>
	    <label>성별</label> <!-- 골프,게임,조깅,수영 -->
	    <input type="radio" id="male" name="gender" value="남자" 
	    <%= (request.getParameter("gender").equals("남자"))?"checked":"" %>><label for="male">남자</label>
	    <input type="radio" id="female" name="gender" value="여자"
	    <%= (request.getParameter("gender").equals("여자"))?"checked":"" %>><label for="female">여자</label><br>
	    <input type="submit" value="전송"><br>
	  
	  </form>
	
	</body>
</html>