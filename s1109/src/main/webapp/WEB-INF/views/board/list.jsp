<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<c:if test="${session_id ==null }">
  <script type="text/javascript">
     alert("로그인을 하셔야 서비스가 가능합니다.");
     history.back();
  </script>
</c:if>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/notice_list.css">
  <style type="text/css">
    a{text-decoration: none;}
    a:link{color:black;}
    a:visited{color:black;}
    a:hover{color:black;}
    a:active{color:black;}
  </style>
</head>
<body>
<section>
    <h1>NOTICE</h1>
    <div class="wrapper">
      <form action="list" name="search" method="post">
        <select name="category" id="category">
          <option value="all">전체</option>
          <option value="btitle">제목</option>
          <option value="bcontent">내용</option>
        </select>
        <div class="title">
          <input type="text" name="searchWord" id="searchWord" size="16">
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
      <c:forEach items="${map.list}" var="boardDto">
	      <tr>
	        <td><span class="table-notice">${boardDto.bid}</span></td>
	        <td class="table-title">
	          <c:forEach begin="1" end="${boardDto.bindent}">
	             ▶
	          </c:forEach>
	          <a href="./content_view/${boardDto.bid}/${map.nDto.page}/${map.nDto.category}/${map.nDto.searchWord}">${boardDto.btitle}</a>
	        </td>
	        <td>${boardDto.bname}</td>
	        <td>${boardDto.bdate}</td>
	        <td>${boardDto.bhit}</td>
	      </tr>
      </c:forEach>
      
    </table>

    <!-- 하단 넘버링 넣기 -->
    <ul class="page-num">
      <a href="list?page=1&category=${map.nDto.category}&searchWord=${map.nDto.searchWord}"><li class="first"></li></a>
      <c:if test="${map.nDto.page<=1}">
         <li class="prev"></li>
      </c:if>
      <c:if test="${map.nDto.page>1}">
         <a href="list?page=${map.nDto.page-1}&category=${map.nDto.category}&searchWord=${map.nDto.searchWord}"><li class="prev"></li></a>
      </c:if>
      <c:forEach var="nowPage" begin="${map.nDto.startPage}" end="${map.nDto.endPage}">
         <li class="num">
           <c:if test="${map.nDto.page!=nowPage}">
             <a href="list?page=${nowPage}&category=${map.nDto.category}&searchWord=${map.nDto.searchWord}"><div>${nowPage}</div></a>
           </c:if>
           <c:if test="${map.nDto.page==nowPage}">
             <div>${nowPage}</div>
           </c:if>
         </li>
      </c:forEach>
      <c:if test="${map.nDto.page<map.nDto.maxPage}">
        <a href="list?page=${map.nDto.page+1}&category=${map.nDto.category}&searchWord=${map.nDto.searchWord}"><li class="next"></li></a>
      </c:if>
      <c:if test="${map.nDto.page>=map.nDto.maxPage}">
        <li class="next"></li>
      </c:if>
       <a href="list?page=${map.nDto.maxPage}&category=${map.nDto.category}&searchWord=${map.nDto.searchWord}"><li class="last"></li></a>
    </ul>

    <a href="./write_view"><div class="write">쓰기</div></a>
  </section>

</body>
</html>