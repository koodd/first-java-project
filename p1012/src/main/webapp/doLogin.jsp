<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	<body>
	  <script type="text/javascript">
	    if(${checkLogin}==1){
	    	alert("로그인 성공!");
	    	location.href="index.do";
	    }else{
	    	alert("아이디 또는 패스워드가 일치하지 않습니다.");
	    	location.href="login.do";
	    }
	  </script>
	
	</body>
</html>