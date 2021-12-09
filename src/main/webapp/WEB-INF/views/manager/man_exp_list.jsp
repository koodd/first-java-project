<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/managerbase.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험 프로그램 목록</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_List.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body style="margin: 0 auto; width: 1200px;">

    <script src="../js/header.js"></script>

    <h2>등록된 체험 프로그램</h2>
    <hr>
    <div class="wrapper">
        <form action="/manager/man_exp_list" name="search" id="search" method="post">
<!--             <select name="category" id="category">
                <option value="all">전체</option>
                <option value="u_name">농장주 명</option>
                <option value="e_name">체험 명</option>
            </select> -->
            <input type="text" name="searchword" id="searchword" size="16" placeholder="체험 명을 검색해주세요">
            <button class="searchbtn" type="submit">검색</button>            
        </form>
    </div>
	<span> * 체험 명을 누르시면 상세 페이지로 이동됩니다.</span>
    <table class="exp_BookList_table">
        <colgroup>
            <col width="20%">
            <col width="20%">
            <col width="20%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <thead class="exp_Bookthead">
            <tr>
                <th>체험 번호</th>
                <th><a>체험 명</a></th>
                <th>농장주 명</th>
                <th>농장주 연락처</th>
                <th>체험등록일</th>
            </tr>
        </thead>
        <tbody class="exp_Booktbody">
        <c:forEach items="${map.list}" var="expDto">
            <tr class="exp_Booktbody">
                <td>${expDto.e_no}</td>
                <td><a href="../exp/exp_View?e_no=${expDto.e_no}">${expDto.e_name}</a></td>
                <td>${expDto.u_name}</td>
                <td>${expDto.u_phone}</td>
                <td>${expDto.e_regidate}</td>
            </tr>
        </c:forEach>    
        </tbody>
    </table>
 <!-- 페이징 넘버링 -->


	<!-- 하단 넘버링 넣기 -->
    <ul class="page-num">
    	<!-- 첫번째 페이지 -->
		<a href="man_exp_list?page=1&searchword=${map.nDto.searchword}"><li class="first"></li></a>
		<!-- 페이지 앞으로가기 -->
     	<c:if test="${map.nDto.page<=1}">
    		<li class="prev"></li>
    	</c:if> 
    	<c:if test="${map.nDto.page>1}">
			<a href="man_exp_list?page=${map.nDto.page-1}&searchword=${map.nDto.searchword}"><li class="prev"></li></a>
    	</c:if>
      <!-- 현재 페이지 -->
		<c:forEach var="nowpage" begin="${map.nDto.startpage}" end="${map.nDto.endpage}">
			<li class="num">
				<!-- 현재페이지면 링크 안걸리게 하기 -->
				<c:if test="${map.nDto.page!=nowpage}">
					<a href="man_exp_list?page=${nowpage}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
				</c:if>
				<c:if test="${map.nDto.page==nowpage}">
					<div>${nowpage}</div>
				</c:if>
			</li>
		</c:forEach>
      
      
      <!-- 페이지 뒤로가기 -->
      <c:if test="${map.nDto.page<map.nDto.maxpage}">
	      <a href="man_exp_list?page=${map.nDto.page+1}&searchword=${map.nDto.searchword}"><li class="next"></li></a>
      </c:if>
      <c:if test="${map.nDto.page>=map.nDto.maxpage}">
  	  	  <li class="next"></li>	
      </c:if>
      
      <!-- 마지막페이지 -->
      <a href="man_exp_list?page=${map.nDto.maxpage}&searchword=${map.nDto.searchword}"><li class="last"></li></a>
      
      
    </ul>
    


</body>
</html>