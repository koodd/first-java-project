<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
		   table,th,td{border:1px solid black;  border-collapse: collapse;}
		</style>
	</head>
	<body>
	    <h2>자유게시판</h2>
	    <table>
	     <thead>
	       <tr>
	         <th>번호</th>
	         <th>제목</th>
	         <th>작성자</th>
	         <th>조회수</th>
	       </tr>
	     </thead>
	     <tbody>
	       <!-- 반복시작 -->
	       <% for(int i=1;i<=9;i++){ %>   	
	       <tr>
	         <td><%=i %></td>
	         <td>게시판 제목입니다.<%=i %></td>
	         <td>홍길동<%=i %></td>
	         <td><%=100+i %></td>
	       </tr>
	       <%} %>
	       <!-- 반복 끝 -->
	       
	       
	     </tbody>
	    
	    
	    </table>
	  
	</body>
</html>