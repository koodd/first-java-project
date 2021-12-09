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
		   String id = request.getParameter("id");
		   String pw = request.getParameter("pw");
		   String name = request.getParameter("name");
		   String email = request.getParameter("email");
		   String[] hobbys = request.getParameterValues("hobby");
		   String hobby="";
		   int result=0;
		   for(int i=0;i<hobbys.length;i++){
			   if(i==0){
				   hobby += hobbys[i];
			   }else{
				   hobby += ","+hobbys[i];
			   }
		   }
		   
		   MemberDao mDao = new MemberDao();
		   //패스워드 체크를 해서 패스워드가 일치하면 업데이트 시킴.
		   MemberDto mDto = mDao.selectMember(id);
		   if(!mDto.getPw().equals(pw)){
		   %>
		     <script type="text/javascript">
		       alert("패스워드가 일치하지 않습니다. 다시 입력하세요!");
		       location.href="modify.jsp";
		     </script>
		   
		   <% 	   
		   }else{
			   mDto = new MemberDto(id,pw,name,email,hobby);
			   // form데이터를 매개변수로 전달하고 결과값을 리턴받음
			   result = mDao.updateMember(mDto);
		   }
		   
	  %>
	  <script type="text/javascript">
	    var chk = "<%=result %>";
	    if(chk==1){
	    	alert("회원정보수정이 완료되었습니다.");
	    	location.href="index.jsp";
	    }
	  </script>
	
	</body>
</html>