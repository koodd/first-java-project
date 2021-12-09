<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/read.css">
</head>
<body>
<%
   String bname="";
   String btitle="";
   String bcontent="";
   String bupload="";
   String bupload2="";
   //파일업로드 위치
   //String uploadPath = request.getRealPath("upload");
   String uploadPath = "c:/fileUpload";
   //파일업로드 최대용량 10m제한
   int size=1024*1024*10; 
   
   //파일업로드 객체선언
   MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
   bname = multi.getParameter("bname");
   btitle = multi.getParameter("btitle");
   bcontent = multi.getParameter("bcontent");
   bupload = multi.getFilesystemName("bupload");
   bupload2 = multi.getFilesystemName("bupload2");
%>


<section>
    <h1>NOTICE</h1>

    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">제목</th>
      </tr>
      <tr>
        <td colspan="3"><strong><%= btitle %></strong></td>
      </tr>
      <tr>
        <td>작성자 : <%= bname %></td>
        <td>조회수</td>
        <td>0</td>
      </tr>
      <tr>
        <td colspan="3" class="article"><%=bcontent%></td>
      </tr>
      <tr>
        <td colspan="3"><strong>파일이름</strong> <span class="separator">|</span> <%=bupload %></td>
      </tr>
      <tr>
        <td colspan="3"><strong>이미지</strong> <span class="separator">|</span> <img src="upload/<%=bupload %>"></td>
      </tr>
      <tr>
        <td colspan="3"><strong>파일이름2</strong> <span class="separator">|</span> <%=bupload2 %></td>
      </tr>
      <tr>
        <td colspan="3"><strong>이미지2</strong> <span class="separator">|</span> <img src="upload/<%=bupload2 %>"></td>
      </tr>
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span> [키즈잼] 2월 프로그램 안내</td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span> [키즈잼] 2020년 1분기 정기 휴관일 안내</td>
      </tr>
    </table>

    <a href=""><div class="list">목록</div></a>
    <a href=""><div class="list">삭제</div></a>
    <a href=""><div class="list">수정</div></a>
    <a href=""><div class="list">답변달기</div></a>
  </section>
</body>
</html>