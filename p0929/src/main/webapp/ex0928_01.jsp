<%--지시자 --%> 
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제</title>
	</head>
	<body>
	  <h2>테스트화면</h2>
	  <%-- 주석 --%>
	  
	  <%-- 선언식 : 전역변수로 사용 --%>
	  <%! int a=0; %>
	  <%
	    int a=0;
	    for(a=0;a<10;a++){
	    	a += 1;
	    }
	    out.println(a);
	  %>
	  <hr>
	  <%-- 스크립트릿 --%>
	  <%
	    ArrayList list = new ArrayList();
	    a=5;
	    int b=10;
	    int sum = a+b;
	    out.println("a+b의 합 : "+sum);
	  %>
	  <hr>
	  
	  <table>
	    <tr>
	      <td>변수 a의 값</td>
	      <td><% out.println(a); %></td>
	    </tr>
	    <tr>
	      <td>변수 a의 값</td>
	      <%-- 표현식 --%>
	      <td><%= a+b %></td>
	    </tr>
	  
	  </table>
	  
	  
	  
	  
	  
	
	</body>
</html>