<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.site.ex.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/notice_list.css">
</head>
<body>
<%-- db에서 list에 담아 전달 받음. --%>
<%
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");    

    ArrayList<BoardDto> list = new ArrayList();
    for(int i=1;i<=10;i++){
    	list.add(new BoardDto(i,"게시판 제목"+i,"홍길동"+i,timestamp,100+i));
    }
%>


<section>
    <h1>NOTICE</h1>
    <div class="wrapper">
      <form action="/search" name="search" method="post">
        <select name="category" id="category">
          <option value="0">전체</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
        </select>

        <div class="title">
          <input type="text" size="16">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="15%">
        <col width="45%">
        <col width="15%">
        <col width="15%">
        <col width="10%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No.</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <!-- 내용부분 : list에 있는 데이터를 출력해보세요. -->
      <% for(BoardDto boardDto:list){ %>  	  
      <%-- <% for(int i=0;i<list.size();i++){ 
        	  BoardDto boardDto = new BoardDto();
        	  boardDto = list.get(i);
      %> --%>  	  
	      <tr>
	        <td><span class="table-notice"><%=boardDto.getNo() %></span></td>
	        <td class="table-title">
	        <a href="#"><%=boardDto.getTitle()%></a>
	        </td>
	        <td><%=boardDto.getName()%></td>
	        <!-- 2021-09-28 -->
	        <td><%= sdf.format(boardDto.getDate())%></td>
	        <td><%=boardDto.getHit()%></td>
	      </tr>
     <%} %>
     
      
    </table>

    <ul class="page-num">
      <li class="first"></li>
      <li class="prev"></li>
      <li class="num"><div>1</div></li>
      <li class="next"></li>
      <li class="last"></li>
    </ul>

    <a href="write_view.jsp"><div class="write">쓰기</div></a>
  </section>

</body>
</html>