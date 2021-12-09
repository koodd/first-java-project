<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<%-- <c:if test="${session_id ==null }">
  <script type="text/javascript">
     alert("로그인을 하셔야 서비스가 가능합니다.");
     history.back();
  </script>
</c:if> --%>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/notice_list.css">
  <style type="text/css">
    a{text-decoration: none;}
    a:link{color:black;}
    a:visited{color:black;}
    a:hover{color:black;}
    a:active{color:black;}
    img { width: 300px;}
  </style>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
      function apiBtn(){
    	  alert("공공데이터 가져오기");
    	  alert($("#searchNo").val());
    	  $.ajax({
   			 url:"./dataApi",
   	 		 type:"post",
   	 		 dataType:"json",  //xml일때는 xml로 변경
   	 		 data:{
   	 			 "pageNo":$("#searchNo").val()
   	 		 },
   	 		 success:function(data){   
   	 		     alert("갤러리 포토그래퍼 : "+data.response.body.items.item[0].galPhotographer);
   	 			 var arr = data.response.body.items.item;
   	 		     var chtml = "";
   	 			 for(var i in arr){
	    	         chtml += "<tr>";
	    	         chtml += "<td><span class='table-notice'>"+arr[i].galContentId+"</span></td>";
	    	         chtml += "<td class='table-title'>";
	    	         chtml += "<img src=\""+arr[i].galWebImageUrl+"\">";
	    	         chtml += "</td>";
	    	         chtml += "<td>"+arr[i].galTitle+"</td>";
	    	         chtml += "<td>"+arr[i].galPhotographer+"</td>";
	    	         chtml += "<td>"+arr[i].galCreatedtime+"</td>";
	    	         chtml += "</tr>";
   	 			 }

    	         $("#apiList").html(chtml); 
    	         
   	 		 },
   	 		 error:function(){
   	 			 alert("실패");
   	 		 }
    	});//ajax
      }//function
    </script>
</head>
<body>
<section>
    <h1>NOTICE</h1>
    <div class="wrapper">
      <form action="list" name="search" method="post">
        <select name="category" id="category" >
          <option value="all">전체</option>
          <option value="name">이름</option>
        </select>
        <div class="title">
          <input type="text" name="searchNo" id="searchNo" size="16" placeholder="원하는 페이지를 입력하세요.">
        </div>
        <button type="button" onclick="apiBtn()"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="15%">
        <col width="35%">
        <col width="15%">
        <col width="15%">
        <col width="15%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No.</th>
        <th>사진</th>
        <th>장소</th>
        <th>작가</th>
        <th>날짜</th>
      </tr>
      <!-- 내용부분 -->
      <tbody id="apiList">
	      <tr>
	        <td><span class="table-notice">번호입력</span></td>
	        <td class="table-title">
	          <a href="#">제목입력</a>
	        </td>
	        <td>작가이름</td>
	        <td>장소</td>
	        <td>날짜</td>
	      </tr>
      </tbody>
      
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