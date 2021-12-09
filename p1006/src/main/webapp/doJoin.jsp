<%@page import="com.site.ex.dao.MemberDao"%>
<%@page import="com.site.ex.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<body>
	<%
	   request.setCharacterEncoding("utf-8");
	   String id = request.getParameter("id");
	   String pw = request.getParameter("pw");
	   String name = request.getParameter("name");
	   String email = request.getParameter("email");
	   String[] hobbys = request.getParameterValues("hobby");
	   String hobby="";
	   for(int i=0;i<hobbys.length;i++){
		   if(i==0){
			   hobby += hobbys[i];
		   }else{
			   hobby += ","+hobbys[i];
		   }
	   }
	   
	   MemberDto mDto = new MemberDto(id,pw,name,email,hobby);
	   MemberDao mDao = new MemberDao();
	   // form데이터를 매개변수로 전달하고 결과값을 리턴받음
	   int result = mDao.insertMember(mDto);
	%>  
	<script type="text/javascript">
	  var chk = "<%=result%>"; 
	  if(chk==1){
		 //저장이 정상적으로 되었으면
		 alert("회원가입이 완료되었습니다.");
		 location.href="index.jsp";
	  }else{
		  alert("회원가입이 정상적으로 되지 않았습니다. 다시 입력하세요!");
		  location.href="join.html";
		  //window.history.back();
	  }
	
	</script>
	
	
	
	</body>
</html>