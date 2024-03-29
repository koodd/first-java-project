<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>해피홀팜</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    


	</head>

<body>

		<%@ include file="../base/header.jsp" %>
   
	

  <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
            <p>공지사항</p>
        </div>
        <!-- 게시판 삽입 -->



        <!--게시판 시작-->


        <div id="boardArea">
            <!--boardArea{-->
            <section class="b_table">
                <!--b_table{-->

                <div class="b_tr">
                    <!--b_tr{-->
                    <div class="b_th pboardnum">번호</div>
                    <div class="b_th pboardtitle">제목</div>
                    <div class="b_th pboarddate">등록일</div>
                    <div class="b_th pboardhit">조회</div>

                </div>
                  <c:forEach items="${map.list}" var="bDto" >
                <!--}b_tr-->
                <div class="b_tr">
                    <div class="b_td">${bDto.bn_no}</div>
                    <div class="b_td b_title"><a href="./board_public_view?bn_no=${bDto.bn_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}">${bDto.bn_title}</a></div>
                    <div class="b_td b_dates">${bDto.bn_date}</div>
                    <div class="b_td b_dates">${bDto.bn_hit}</div>
                </div>

					</c:forEach>


       

            </section>
            <!--}b_table-->


        </div>
        <!--}boardArea-->

        <!-- 게시판 삽입 -->
    </section>
   

	<ul class="page-num">
	
      <a href="board_public?page=1&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="first"></li></a>
      <c:if test="${map.nDto.page<=1}">
         <li class="prev"></li>
      </c:if>
      <c:if test="${map.nDto.page>1}">
         <a href="board_public?page=${map.nDto.page-1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><img src="../images/page_right3_new.gif" alt="이전"></a>
      </c:if>
      <c:forEach var="nowpage" begin="${map.nDto.startpage}" end="${map.nDto.endpage}">
         <li class="num">
           <c:if test="${map.nDto.page!=nowpage}">
             <a href="board_public?page=${nowpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
           </c:if>
           <c:if test="${map.nDto.page==nowpage}">
             <div>${nowpage}</div>
           </c:if>
         </li>
      </c:forEach>
      <c:if test="${map.nDto.page<map.nDto.maxpage}">
        <a href="board_public?page=${map.nDto.page+1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><img src="../images/page_right1_new.gif" alt="다음"></li></a>
      </c:if>
      <c:if test="${map.nDto.page>=map.nDto.maxpage}">
        <li class="next"></li>
      </c:if>
       <a href="board_public?page=${map.nDto.maxpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"></a>
   		 </ul>
        
        
     <!--    <div class="pageMove03">
            <ul class="pageNumber03">
                <li class="btn_next"><a href="#"><img src="../images/page_right3_new.gif" alt="이전"></a></li>
                <li class="first"><a href="#"><span class="current">1</span></a></li>

                <li class="btn_next"><a href="#"><img src="../images/page_right1_new.gif" alt="다음"></a></li>
            </ul>
        </div> -->
        
    <form action="board_public" name="search" method="get">
        <div class="nav">
            <div class="s_search">
                <div class="s_down">
                    <div id="search_box_type">
                  
                        <select name="category" id="category" style="border: none;">
                            <option value="bn_title">제목&nbsp;&nbsp;&nbsp;</option>
                            <option value="bn_content">내용&nbsp;&nbsp;&nbsp;</option>                    
                      </select>
                   
                    </div>
                </div>
                <div class="s_search_btn">
                    <input name="searchword" type="text" class="s_sch" id="searchword">
                    <button type="submit" style=""><img src="../images/btn_s_sch.gif"></button> 
               
                </div>
            </div>
        </div>
   </form> 
  



     


 <%@ include file="../base/footer.jsp" %>

	<link rel="stylesheet" href="../css/board.css">


   
</body>

</html>



