<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 다시 읽어오기</title>
	</head>
	<body>
	  <h2>쿠키 다시읽어오기, cookie1 삭제</h2>
	  <%
	     Cookie[] cookies = request.getCookies();
	     for(int i=0;i<cookies.length;i++){
	    	 out.println("쿠키 이름 : "+cookies[i].getName()+",");
	    	 out.println("쿠키 값 : "+cookies[i].getValue()+"<br>");
	     }
	     
	     //쿠키삭제하기 - cookie1,cookie2,cookie3
	     for(int i=0;i<cookies.length;i++){
	    	 //쿠키의 이름을 가져옴.
	    	 String str = cookies[i].getName();
	    	 if(str.equals("c_id")){
		    	 //쿠키시간을 0설정
	    		 cookies[i].setMaxAge(0); //쿠키 유효시간을 0으로 변경
		    	 response.addCookie(cookies[i]);
	    	 }
	     }
	  %>
	  
	  <!-- 쿠키 다시 삭제 -->
	  <a href="cookieDelete.jsp">쿠키확인</a>
	
	</body>
</html>