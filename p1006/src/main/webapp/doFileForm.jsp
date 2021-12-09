<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일업로드</title>
	</head>
	<body>
	  <%
	     String title="";
	     String content="";
	     String fileName1="";
	     String fileName2="";
	     //저장위치
	     String uploadPath = request.getRealPath("upload");
	     //파일업로드 용량제한
	     int size = 1024*1024*10; //1024b * 1024kb * 10mb
	     
	     //객체선언
	     MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	     title = multi.getParameter("title");
	     content = multi.getParameter("content");
	     fileName1 = multi.getFilesystemName("bfile");
	     
	  %>
	  <h2>파일업로드확인</h2>
	  <table>
	    <tr>
	      <td>제목</td>
	      <td><%=title %></td>
	    </tr>
	    <tr>
	      <td>내용</td>
	      <td><%=content %></td>
	    </tr>
	    <tr>
	      <td>파일이름</td>
	      <td><%=fileName1 %></td>
	    </tr>
	    <tr>
	      <td>파일링크</td>
	      <td><img src="upload/<%=fileName1 %>"></td>
	    </tr>
	  </table> 
	
	</body>
</html>