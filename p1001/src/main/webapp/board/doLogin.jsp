<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	  <%
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    
	    //aaa,1111값은 db에서 검색해서 가져와야 함.
	    if(id.equals("aaa") && pw.equals("1111")){
	    	session.setAttribute("session_id", id);
	    	session.setAttribute("session_nickName", "쿳킷");
	    %>
		    <script type="text/javascript">
		       alert("로그인 되었습니다.");
		       location.href="./main.jsp";
		    </script>
	    <%}else{%>
		    <script type="text/javascript">
		       alert("아이디 또는 패스워드가 잘못되었습니다. 다시 입력해주세요.");
		       location.href="./login.jsp";
		    </script>
	    <%}%>
	
	</body>
</html>