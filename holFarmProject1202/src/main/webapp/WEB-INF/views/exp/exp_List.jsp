<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/header.jsp" %>
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
    <script type="text/javascript">
    	$(function(){
    		$("#expBtn").click(function(){
    			
    		
    			
    		});
    		
    	});
    </script>
</head>
<body style="margin: 0 auto; width: 1200px;">

    <script src="../js/header.js"></script>

    <h2>체험 프로그램</h2>
    <hr>
    <div class="wrapper">
        <form action="exp_List" name="search" id="search" method="post">
            <select name="category" id="category">
                <option value="all">전체</option>
                <option value="e_name">제목</option>
                <option value="e_details">내용</option>
            </select>
            <!-- searchWord에서 searchword로 수정 -->
            <input type="text" name="searchword" id="searchword" size="16">
            <button class="searchbtn" type="submit">검색</button>            
        </form>
        <!-- 이버튼은 농장주에게만 보임 -->
        
        <c:if test="${session_ucno==2}">
    	    <div>
        	    <a href="./exp_Reg"><button type="button" class="exp_reg" id="expBtn">체험 프로그램 등록하기</button></a>
	        </div>
        </c:if>
        
        
        <!-- 이버튼은 농장주에게만 보임 -->
    </div>

    <div class="exp_ListWrapper" >
    
  <!--        체험 프로그램 리스트 가져오기 -->

        <c:forEach items="${map.list}" var="expDto">
        <div class="exp_ListPost">
            <%-- <a href="./exp_View?e_no=${expDto.e_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><h3 class="e_name">${expDto.e_name}</h3></a><br> --%>
            <a href="./exp_View?e_no=${expDto.e_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><h3 class="e_name">${expDto.e_name}</h3></a><br>
            <img src="../upload/${expDto.e_thumb}" alt="농장체험테스트사진" style="width: 1200px; height: 600px"><br>
            <p>${expDto.e_details}</p>
            <div class="bottom_list">
                <div class="bottom_left">
                    체험 시작 날짜 :
                    <span>${expDto.e_startdate}</span>
                </div>
                <div class="bottom_right">
                    키워드 :
                    <span>${expDto.e_keyword}</span>
                </div>
            </div>
        </div>
        <hr>
        </c:forEach>

       <!-- 체험 프로그램 리스트 가져오기 
        <c:forEach items="${list}" var="totalDto">
        <div class="exp_ListPost">
            <a href="./exp_View?e_no=${totalDto.numberDto.e_no}&page=${totalDto.numberDto.page}&category=${totalDto.numberDto.category}&searchword=${totalDto.numberDto.searchword}"><h3 class="e_name">${totalDto.expDto.e_name}</h3></a><br>
            <img src="../upload/${totalDto.expDto.e_thumb}" alt="농장체험테스트사진"><br>
            <p>${totalDto.expDto.e_details}</p>
            <div class="bottom_list">
                <div class="bottom_left">
                    체험 시작 날짜 :
                    <span>${totalDto.expDto.e_startdate}</span>
                </div>
                <div class="bottom_right">
                    키워드 :
                    <span>${totalDto.expDto.e_keyword}</span>
                </div>
            </div>
        </div>
        <hr>
        </c:forEach>
        
         -->
    </div>
    


<!-- 페이징 넘버링 -->


	<!-- 하단 넘버링 넣기 -->
    <ul class="page-num">
    	<!-- 첫번째 페이지 -->
		<a href="exp_List?page=1&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="first"></li></a>
		<!-- 페이지 앞으로가기 -->
    	<c:if test="${map.nDto.page<=1}">
    		<li class="prev"></li>
    	</c:if>
    	<c:if test="${map.nDto.page>1}">
			<a href="exp_List?page=${map.nDto.page-1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="prev"></li></a>
    	</c:if>
    	
    	
    	
      <!-- 현재 페이지 -->
	<c:forEach var="nowpage" begin="${map.nDto.startpage}" end="${map.nDto.endpage}">
		<li class="num">
			<!-- 현재페이지면 링크 안걸리게 하기 -->
			<c:if test="${map.nDto.page!=nowpage}">
				<a href="exp_List?page=${nowpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
			</c:if>
			<c:if test="${map.nDto.page==nowpage}">
				<div>${nowpage}</div>
			</c:if>
		</li>
	</c:forEach>
      
      
      <!-- 페이지 뒤로가기 -->
      <c:if test="${map.nDto.page<map.nDto.maxpage}">
	      <a href="exp_List?page=${map.nDto.page+1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="next"></li></a>
      </c:if>
      <c:if test="${map.nDto.page>=map.nDto.maxpage}">
  	  	  <li class="next"></li>	
      </c:if>
      
      <!-- 마지막페이지 -->
      <a href="exp_List?page=${map.nDto.maxpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="last"></li></a>
      
      
    </ul>

<%@ include file="../base/footer.jsp" %>

</body>
</html>