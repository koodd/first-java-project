<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@include file="../base/header.jsp" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		
		<link rel="stylesheet" href="../css/login.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#loginbutton").click(function(){
			    	  $.ajax({
			     		 url:"./login",
			     		 type:"post",
			     		 data:{
			     			 "u_id":$("#uid").val(),
			     			 "u_pw":$("#upw").val()
			     		 },
			     		 success:function(data){
			     			 if(data==1){
			     				 alert("로그인이 되었습니다");
			     				 location.href="../main";
			     			 }else{
			     				 alert("ID 또는 PW가 일치 하지 않습니다. 다시 입력하세요");
			     			 }
			     		 },
			     		 error:function(textStatus){
			     			 alert("error : "+textStatus);
			     		 }
			     	  });
				});
			});
		</script>
	</head>

	<body>
	
		<section>
		<div id="maindiv">
			<div id="logodiv">
				<img src="../images/logo.png" alt="" id="logopic">
			</div>
			<div id="id">
				<img src="../images/login_id.png" alt="" id="loginicon1">
				<input type="text" id="uid" placeholder="아이디">
			</div>
			<div id="pw">
				<img src="../images/login_pw.png" alt="" id="pwicon1">
				<input type="password" id="upw" placeholder="비밀번호">
			</div>
			<div id="loginbutton">
				<input type="button" id="ulogin" value="로그인">
			</div>
			<div id="regandsearch">
				<div id="reg2">
					<a href="#" id="reg1">회원가입</a>
				</div>
				<div id="search2">
					<a href="#" id="search1">아이디/비밀번호 찾기</a>
				</div>
			</div>
		</div>
		</section>
<%@include file="../base/footer.jsp" %>
	</body>

</html>