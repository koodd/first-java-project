<%@page import="com.site.ex.dto.MemberDto"%>
<%@page import="com.site.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호수정</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		  function pwChk(){
			  alert("테스트");
			  alert($("#pw").val());
			  alert($("#pw2").val());
			  if(!($("#pw").val()==$("#pw2").val())){
				  alert("패스워드가 일치하지 않습니다. 다시 입력하세요!");
				  $("#pw2").val(""); //빈공백처리
				  $("#pw2").focus(); //pw2 input박스로 포커스 넘김
				  return false;
			  }else{
				  $("#frmPw").submit();
			  }
		  }
		</script>
	</head>
	<body>
	  <%
		  	 String id = request.getParameter("id");
		     out.println("id : "+id+"<br>");
		     MemberDao mDao = new MemberDao();
		     MemberDto mDto = mDao.selectMember(id);
	  %>
	  <h2>비밀번호수정</h2>
	  <form action="doPwModify.jsp" id="frmPw" method="post">
	    <label>아이디</label>
	    <span>: <%=id %> </span>
	    <input type="hidden" name="id" value="<%=id %>"><br>
	    <label>비밀번호</label>
	    <input type="password" id="pw" name="pw"><br>
	    <label>비밀번호확인</label>
	    <input type="password" id="pw2" name="pw2"><br>
	    <label>이름</label>
	    <span>: <%=mDto.getName() %> </span><br>
	    <br>
	    <input type="button" onclick="pwChk()" value="저장">
	    <input type="reset" value="취소"><br>
	  
	  </form>
	
	</body>
</html>