<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        ul, li {list-style: none;}
        .parent {width: 350px; background-color: #f7f9fa; border: 1px solid #dae1e6; padding: 16px 16px 12px 17px; margin: 0 auto; height: 145px;}
        p {color: grey; font-size: 12px;}
        .wrap, .u_act {overflow: hidden;}
        .left {float: left;}
        .right {float: right;}
        .wrap a{font-size: 12px;}
        .login {width:340px; margin: 0 auto; background-color: #19ce60; border: 1px solid #15c654; padding: 15px 0;}
        .login>a{font-size: 15px; font-weight: 900; color: white; text-decoration: none; width:100%;}

		.parent2 {width:350px; background-color: #f7f9fa; border: 1px solid #dae1e6; margin: 0 auto;}
        .profile {width: 25%;}
        .user {width: 50%;}
        .logout {width: 25%;}
        
        .nick {border-right: 1px solid #dae1e6; padding-right: 5px;}
        .u_act {width: 350px;}
        .u_act .act_list li {float: left; display:blacok; width:20%; text-align: center;}
    </style>
</head>
    
<body>
    <!-- 로그인 전 -->
    <%
       out.println("session_id의 값 : "+session.getAttribute("session_id")+"<br>");
       if(session.getAttribute("session_id") != null){
       //섹션이 success이면
    %>	   
    	<!-- 로그인 후 -->
	    <div class="parent">
	    	<div class="left">
	    		<a class="nick"><%=session.getAttribute("session_nickName") %>님</a>
	       	 	<a>내정보</a>
	        	<p><%=session.getAttribute("session_email") %></p>
	    	</div>
	        
	        <div class="logout left">
	            <button type="button"><a href="./logout.jsp">로그아웃</a></button>
	        </div>
	        <div class="u_act">
		        <ul class="act_list">
		            <li>알림</li>
		            <li>MY구독</li>
		            <li>메일</li>
		            <li>카페</li>
		            <li>블로그</li>
		        </ul>
	   		</div>
	    </div>   
     <%}else{%>
    	<div class="parent">
	        <p>네이버를 더 안전하고 편리하게 이용하세요</p>
	        <button type="button" class="login"><a href="./login.html">NAVER 로그인</a></button>
	        <div class="wrap">
	            <span class="left"><a>아이디, </a><a>비밀번호 찾기</a></span>
	            <span class="right"><a>회원가입</a></span>
	        </div>
	    </div>  
    <%}%>
</body>
</html>