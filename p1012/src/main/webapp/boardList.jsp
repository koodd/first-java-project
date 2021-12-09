<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<c:if test="${session_id==null}">
  <script type="text/javascript">
    alert("로그인을 하셔야 게시판메뉴에 접속가능합니다!");
    location.href="login.do";
  </script>
</c:if>
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
<section>
    <a href="index.do"><h1>NOTICE</h1></a>
    <div class="wrapper">
      <form action="search.do" name="search" method="post">
        <select name="category" id="category">
          <option value="all" ${category=='all'?'selected':''}>전체</option>
          <option value="title" ${category=='title'?'selected':''}>제목</option>
          <option value="content" ${category=='content'?'selected':''}>내용</option>
        </select>
        <div class="title">
          <input type="text" size="16" name="searchWord" value="${searchWord}">
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
      <!-- 내용부분 -->
      <c:forEach items="${list}" var="boardDto">
	      <tr>
	        <td><span class="table-notice">${boardDto.bid}</span></td>
	        <td class="table-title">
	        <c:forEach begin="1" end="${boardDto.bindent}" step="1">
	            <img src="images/reply.png" width="20px">
	        </c:forEach>
	        <a href="boardView.do?bid=${boardDto.bid}&page=${page}&category=${category}&searchWord=${searchWord}">${boardDto.btitle }</a>
	        </td>
	        <td>${boardDto.bname}</td>
	        <td>${boardDto.bdate}</td>
	        <td>${boardDto.bhit}</td>
	      </tr>
      </c:forEach>
      
      <!-- 내용 끝 -->
    </table>
    <!-- 하단넘버링 -->
    <ul class="page-num">
      <a href="boardList.do?page=1&category=${category}&searchWord=${searchWord}"><li class="first"></li></a>
      <c:if test="${page<=1}">
         <li class="prev"></li>
      </c:if>
      <c:if test="${page>1}">
        <a href="boardList.do?page=${page-1}&category=${category}&searchWord=${searchWord}"><li class="prev"></li></a>
      </c:if>
      <c:forEach var="pageNum" begin="${startpage}" end="${endpage}">
        <c:if test="${page==pageNum }">
           <li class="num"><div>${pageNum}</div></li>
        </c:if>
        <c:if test="${page != pageNum }">
           <a href="boardList.do?page=${pageNum}&category=${category}&searchWord=${searchWord}"><li class="num"><div>${pageNum}</div></li></a>
        </c:if>
      </c:forEach>
      <c:if test="${page>=maxpage }">
        <li class="next"></li>
      </c:if>
      <c:if test="${page<maxpage}">
        <a href="boardList.do?page=${page+1}&category=${category}&searchWord=${searchWord}"><li class="next"></li></a>
      </c:if>
      <a href="boardList.do?page=${maxpage}&category=${category}&searchWord=${searchWord}"><li class="last"></li></a>
    </ul>
    <!-- 하단넘버링 끝 -->
    <a href="boardWrite.do"><div class="write">쓰기</div></a>
  </section>

</body>
</html>