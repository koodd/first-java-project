<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../base/managerbase.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험 예약현황</title>

    <!-- fullcalendar -->
    <link rel="stylesheet" href="../calendar/css/main.css">
    <script src="../calendar/js/main.js"></script>
    <script src="../calendar/js/locales-all.min.js"></script>


    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_List.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body style="margin: 0 auto; width: 1200px;">
   <script src="./js/header.js"></script>
    <h2>체험예약 현황</h2>
    <hr>
    <div class="wrapper">
        <form action="/manager/man_exp_book" name="search" id="search" method="post">
            <input type="text" name="searchword" id="searchword" size="16" placeholder="예약자명 입력">
            <button class="searchbtn" type="submit">검색</button>
        </form>
    </div>
    <table class="exp_BookList_table">
        <colgroup>
            <col width="15%">
            <col width="15%">
            <col width="10%">
            <col width="15%">
            <col width="9%">
            <col width="18%">
            <col width="18%">
        </colgroup>
        <thead class="exp_Bookthead">
            <tr>
                <td>체험 예약 번호</td>
                <td>예약한 체험 명</td>
                <td>예약자</td>
                <td>예약자 연락처</td>
                <td>가격</td>
                <td>방문 날짜</td>
                <td>신청 예약 날짜</td>
            </tr>
        </thead>
	    <c:forEach items="${map.list}" var="expDto">
        	<tbody class="exp_Booktbody">
	            <tr>
	                <th>${expDto.er_no}</th>
	                <th>${expDto.e_name}</th>
	                <th>${expDto.u_name}</th>
	                <th>${expDto.u_phone}</th>
	                <th><fmt:formatNumber value="${expDto.py_price}" pattern="#,###"/> 원</th>
	                <th>${expDto.er_visitdate}</th>
	                <th>${expDto.er_resdate}</th>
	            </tr>
	        </tbody>
        </c:forEach>
    </table>

    <hr>  
    <!-- 페이징 넘버링 -->
	<!-- 하단 넘버링 넣기 -->
    <ul class="page-num">
    	<!-- 첫번째 페이지 -->
		<a href="man_exp_book?page=1&searchword=${map.nDto.searchword}"><li class="first"></li></a>
		<!-- 페이지 앞으로가기 -->
    	<c:if test="${map.nDto.page<=1}">
    		<li class="prev"></li>
    	</c:if>
    	<c:if test="${map.nDto.page>1}">
			<a href="man_exp_book?page=${map.nDto.page-1}&searchword=${map.nDto.searchword}"><li class="prev"></li></a>
    	</c:if>
    	
    	
    	
      <!-- 현재 페이지 -->
	<c:forEach var="nowpage" begin="${map.nDto.startpage}" end="${map.nDto.endpage}">
		<li class="num">
			<!-- 현재페이지면 링크 안걸리게 하기 -->
			<c:if test="${map.nDto.page!=nowpage}">
				<a href="man_exp_book?page=${nowpage}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
			</c:if>
			<c:if test="${map.nDto.page==nowpage}">
				<div>${nowpage}</div>
			</c:if>
		</li>
	</c:forEach>
      
      
      <!-- 페이지 뒤로가기 -->
      <c:if test="${map.nDto.page<map.nDto.maxpage}">
	      <a href="man_exp_book?page=${map.nDto.page+1}&searchword=${map.nDto.searchword}"><li class="next"></li></a>
      </c:if>
      <c:if test="${map.nDto.page>=map.nDto.maxpage}">
  	  	  <li class="next"></li>	
      </c:if>
      
      <!-- 마지막페이지 -->
      <a href="man_exp_book?page=${map.nDto.maxpage}&searchword=${map.nDto.searchword}"><li class="last"></li></a>
      
      
    </ul>
     
</body>
</html>