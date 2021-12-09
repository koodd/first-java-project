<%@page import="com.site.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	    <%-- <jsp:useBean id="mDto" class="com.site.ex.dto.MemberDto" />
	    <jsp:setProperty name="mDto"  property="*" /> --%>
		<%
		  /* String id = mDto.getId();
		  String pw = mDto.getPw(); */
		  //form데이터 값을 가져옴. 
		  String id = request.getParameter("id");
		  String pw = request.getParameter("pw");
		  
		  MemberDao mDao = new MemberDao();
		  int result = mDao.login(id, pw);
		%>
	 	<script type="text/javascript">
	 	   var chk = "<%=result%>";
	 	   //1 -> 성공,0 -> 아이디불일치,-1 -> 패스워드 불일치
	 	   if(chk==1){
	 		   <% session.setAttribute("session_id", id); %>
		 	   alert("로그인 되었습니다!");
		 	   location.href="index.jsp";
	 	   }else if(chk==0){
	 		   alert("아이디가 일치하지 않습니다. 다시 입력하세요!");
		 	   location.href="login.html";
	 	   }else{
	 		   alert("패스워드가 일치하지 않습니다. 다시 입력하세요!");
		 	   location.href="login.html";
	 	   }
	 	</script> 
	</body>
</html>