<%@page import="com.site.ex.dao.MemberDao"%>
<%@page import="com.site.ex.dto.MemberDto"%>
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
		   request.setCharacterEncoding("utf-8");
	       int result=0;
		   String id = request.getParameter("id");
		   String pw = request.getParameter("pw");
		   
		   MemberDao mDao = new MemberDao();
		   MemberDto mDto=null;
		   mDto = new MemberDto(id,pw);
		   // form데이터를 매개변수로 전달하고 결과값을 리턴받음
		   result = mDao.updateMember2(mDto);
		   
	  %>
	  <script type="text/javascript">
	    var chk = "<%=result %>";
	    if(chk==1){
	    	alert("비밀번호수정이 완료되었습니다.");
	    	location.href="index.jsp";
	    }
	  </script>
	
	</body>
</html>