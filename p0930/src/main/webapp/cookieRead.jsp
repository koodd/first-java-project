<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키읽어오기</title>
	</head>
	<body>
	<h2>쿠키 cookie1 읽어오기, cookie2,cookie3추가 </h2>
	  <%
	     //쿠키 읽어오기
	     Cookie[] cookies = request.getCookies();
	     if(cookies != null && cookies.length>0){
		     //쿠키출력
	    	 for(int i=0;i<cookies.length;i++){
		    	 out.println("쿠키 이름 : "+ cookies[i].getName()+",");
		    	 out.println("쿠키 값 : "+  cookies[i].getValue()+"<br>");
		     }
	     }else{
	    	 out.println("저장된 쿠기가 없습니다.!<br>");
	     }
	     
	     //쿠키수정
	     Cookie cookie1 = new Cookie("c_id","bbb");
	     Cookie cookie2 = new Cookie("c_pw","1111");
	     Cookie cookie3 = new Cookie("c_nickName","nickAAA");
	     response.addCookie(cookie1); //쿠키저장
	     response.addCookie(cookie2);
	     response.addCookie(cookie3);
	  %>
	  <!-- 쿠키 다시 읽어오기 -->
	  <a href="cookieReroad.jsp">쿠키 다시읽어오기</a>
	</body>
</html>